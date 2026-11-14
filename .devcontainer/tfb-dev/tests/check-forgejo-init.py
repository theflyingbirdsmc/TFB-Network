"""Run with python3; requires Gradle, uses a fake Coder CLI and no registry access."""
import os
from pathlib import Path
import shutil
import subprocess
import tempfile


with tempfile.TemporaryDirectory(prefix="forgejo-init-") as directory:
    root = Path(directory)
    init_dir = root / "gradle-home/init.d"
    init_dir.mkdir(parents=True)
    shutil.copyfile(Path(__file__).resolve().parents[1] / "forgejo.init.gradle",
                    init_dir / "forgejo.init.gradle")
    (root / "settings.gradle").write_text("rootProject.name = 'auth-check'\ninclude 'child'\n")
    (root / "child").mkdir()
    (root / "build.gradle").write_text("""
allprojects {
    assert findProperty('TFB_REGISTRY_TOKEN') == System.getenv('EXPECTED_TOKEN')
}
""")
    (root / "coder").write_text("""#!/bin/sh
[ "$*" = 'external-auth access-token primary-forge' ] || exit 2
echo call >> "$FORGEJO_TEST_DIR/calls"
cat "$FORGEJO_TEST_DIR/token"
exit "${FORGEJO_TEST_EXIT:-0}"
""")
    (root / "coder").chmod(0o700)
    env = dict(os.environ, PATH=f"{root}:{os.environ['PATH']}",
               FORGEJO_TEST_DIR=str(root))
    env.pop("TFB_REGISTRY_TOKEN", None)
    env.pop("ORG_GRADLE_PROJECT_TFB_REGISTRY_TOKEN", None)

    def check(token, *, override=None, environment=None, fails=False, exit_code="0"):
        (root / "token").write_text(token)
        (root / "calls").write_text("")
        run_env = dict(env, EXPECTED_TOKEN=environment or override or token,
                       FORGEJO_TEST_EXIT=exit_code)
        if environment:
            run_env["TFB_REGISTRY_TOKEN"] = environment
        command = ["gradle", "-g", str(init_dir.parent), "--offline", "--console=plain",
                   "--no-configuration-cache", "help"]
        if override:
            command.append(f"-PTFB_REGISTRY_TOKEN={override}")
        result = subprocess.run(command, cwd=root, env=run_env, text=True,
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        assert (result.returncode != 0) == fails, result.stdout
        assert (root / "calls").read_text().count("call") == (0 if override or environment else 1)

    try:
        check("first-token")
        check("refreshed-token")  # Reuses the daemon, but must fetch again.
        check("unused", override="explicit-property")
        # Existing build scripts read the environment before the Gradle property.
        (root / "build.gradle").write_text("""
allprojects {
    assert (System.getenv('TFB_REGISTRY_TOKEN') ?: findProperty('TFB_REGISTRY_TOKEN')) == System.getenv('EXPECTED_TOKEN')
}
""")
        check("unused", environment="explicit-environment")
        check("", fails=True)
        check("invalid", fails=True, exit_code="1")
    finally:
        subprocess.run(["gradle", "-g", str(init_dir.parent), "--stop"],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

print("Passed: shared token, refresh, explicit overrides, empty token, CLI failure.")
