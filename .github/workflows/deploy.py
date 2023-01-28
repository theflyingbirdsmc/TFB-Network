import os
import paramiko
import subprocess

ssh_client = paramiko.SSHClient()
ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

file_path = os.environ['FILE_PATHS'].split(" ")
# file_path = ['TFB-Creative/plugins/Plan/config.yml', 'TFB-Lobby/build.gradle']

print(str(file_path))
root_path = "/home/runner/work/TFB-Network/TFB-Network/"
# root_path = "/home/container/TFB/" # Use in container

SFTP_TFB_PASSWORD = os.environ['SFTP_TFB_PASSWORD']
SFTP_TFB_FLAMECORD_USERNAME = os.environ['SFTP_TFB_FLAMECORD_USERNAME']
SFTP_TFB_LOBBY_USERNAME = os.environ['SFTP_TFB_LOBBY_USERNAME']
SFTP_TFB_VANILLA_USERNAME = os.environ['SFTP_TFB_VANILLA_USERNAME']
SFTP_TFB_FACTIONS_USERNAME = os.environ['SFTP_TFB_FACTIONS_USERNAME']
SFTP_TFB_PARKOUR_USERNAME = os.environ['SFTP_TFB_PARKOUR_USERNAME']
SFTP_TFB_CREATIVE_USERNAME = os.environ['SFTP_TFB_CREATIVE_USERNAME']
SFTP_TFB_CUSTOMSMP_USERNAME = os.environ['SFTP_TFB_CUSTOMSMP_USERNAME']

server_sftpusernames = {
    "TFB-Flamecord": SFTP_TFB_FLAMECORD_USERNAME,
    "TFB-Lobby": SFTP_TFB_LOBBY_USERNAME,
    "TFB-Vanilla": SFTP_TFB_VANILLA_USERNAME,
    "TFB-Factions": SFTP_TFB_FACTIONS_USERNAME,
    "TFB-Parkour": SFTP_TFB_PARKOUR_USERNAME,
    "TFB-Creative": SFTP_TFB_CREATIVE_USERNAME,
    "TFB-CustomSMP": SFTP_TFB_CUSTOMSMP_USERNAME
}
for file in file_path:
    for server, username in server_sftpusernames.items():
        if server in file:
            remotePath = file[file.find('/'):]
            # print("I'm + " + server_sftpusernames[server] + "for the server " + server)
            ssh_client.connect(hostname='germany01.theflyingbirds.net', username=server_sftpusernames[server], password=SFTP_TFB_PASSWORD, port=2022, allow_agent=False)
            sftp = ssh_client.open_sftp()
            sftp.put(root_path + file, remotePath)
            print(remotePath)

            if "build.gradle" in file:
                localPath = file.split('/')[0]
                # print(remotePath)
                downloadLocalPlugins = subprocess.check_output('gradle plugins -p ' + root_path + localPath, shell=True)
                print(downloadLocalPlugins.decode("utf-8"))

                listLocalPlugins = os.listdir(root_path + localPath + "/plugins/")

                # print("LOCAL: " + str(listLocalPlugins))
                live_plugins = sftp.listdir("plugins")

                # print(str(live_plugins))
                for iter in live_plugins:
                    if iter.endswith(".jar"):
                        print("Deleting " + iter)
                        sftp.remove("plugins/"+iter)

                for iter in listLocalPlugins:
                    if iter.endswith(".jar"):
                        print("Uploading " + root_path + localPath + "/plugins/" + iter)
                        thisRemotePath = 'plugins/' + iter
                        sftp.put(root_path + localPath + '/plugins/' + iter, thisRemotePath)

                downloadServer = subprocess.check_output('gradle server -p ' + root_path + localPath, shell=True)
                sftp.remove("server.jar")
                sftp.put(root_path + localPath + "/server.jar", "server.jar")