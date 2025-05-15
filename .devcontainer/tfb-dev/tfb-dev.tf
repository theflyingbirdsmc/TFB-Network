# TFB Dev
terraform {
  required_providers {
    coder = {
      source = "coder/coder"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "coder" {
}

data "coder_parameter" "repository" {
  name         = "repository"
  display_name = "Github repository"
  description  = "The server repository from TFB's Github (must exist prior to creating workspaces)"
  default      = "https://github.com/theflyingbirdsmc/language-server"
  mutable      =  false
  icon         = "/icon/github.svg"
  type         = "string"
}

data "coder_parameter" "cpu" {
  name         = "cpu"
  display_name = "CPU"
  description  = "The number of CPU cores"
  default      = "2"
  icon         = "/icon/memory.svg"
  mutable      = true
  option {
    name  = "2 Cores"
    value = "2"
  }
  option {
    name  = "4 Cores"
    value = "4"
  }
}

data "coder_parameter" "memory" {
  name         = "memory"
  display_name = "Memory"
  description  = "The amount of memory in GB"
  default      = "4"
  icon         = "/icon/memory.svg"
  mutable      = true
  option {
    name  = "2 GB"
    value = "2"
  }
  option {
    name  = "4 GB"
    value = "4"
  }
}

data "coder_parameter" "home_disk_size" {
  name         = "home_disk_size"
  display_name = "Home disk size"
  description  = "The size of the home disk in GB"
  default      = "10"
  type         = "number"
  icon         = "/emojis/1f4be.png"
  mutable      = false
  validation {
    min = 1
    max = 99999
  }
}

provider "kubernetes" {
  # Authenticate via ~/.kube/config or a Coder-specific ServiceAccount, depending on admin preferences
  config_path = null
}

data "coder_workspace" "me" {}
data "coder_workspace_owner" "me" {}

resource "coder_agent" "main" {
  os             = "linux"
  arch           = "amd64"
  startup_script = <<-EOT
    set -e

    # Install the latest code-server.
    # Append "--version x.x.x" to install a specific version of code-server.
    curl -fsSL https://code-server.dev/install.sh | sh -s -- --method=standalone --prefix=/tmp/code-server

    # Start code-server in the background.
    /tmp/code-server/bin/code-server --auth none --port 13337 >/tmp/code-server.log 2>&1 &
  EOT
  env = {
    GIT_AUTHOR_NAME     = "${data.coder_workspace_owner.me.name}"
    GIT_COMMITTER_NAME  = "${data.coder_workspace_owner.me.name}"
    GIT_AUTHOR_EMAIL    = "${data.coder_workspace_owner.me.email}"
    GIT_COMMITTER_EMAIL = "${data.coder_workspace_owner.me.email}"
  }
  # The following metadata blocks are optional. They are used to display
  # information about your workspace in the dashboard. You can remove them
  # if you don't want to display any information.
  # For basic resources, you can use the `coder stat` command.
  # If you need more control, you can write your own script.
  metadata {
    display_name = "CPU Usage"
    key          = "0_cpu_usage"
    script       = "coder stat cpu"
    interval     = 10
    timeout      = 1
  }

  metadata {
    display_name = "RAM Usage"
    key          = "1_ram_usage"
    script       = "coder stat mem"
    interval     = 10
    timeout      = 1
  }

  metadata {
    display_name = "Home Disk"
    key          = "3_home_disk"
    script       = "coder stat disk --path $${HOME}"
    interval     = 60
    timeout      = 1
  }

  metadata {
    display_name = "CPU Usage (Host)"
    key          = "4_cpu_usage_host"
    script       = "coder stat cpu --host"
    interval     = 10
    timeout      = 1
  }

  metadata {
    display_name = "Memory Usage (Host)"
    key          = "5_mem_usage_host"
    script       = "coder stat mem --host"
    interval     = 10
    timeout      = 1
  }

  metadata {
    display_name = "Load Average (Host)"
    key          = "6_load_host"
    # get load avg scaled by number of cores
    script   = <<EOT
      echo "`cat /proc/loadavg | awk '{ print $1 }'` `nproc`" | awk '{ printf "%0.2f", $1/$2 }'
    EOT
    interval = 60
    timeout  = 1
  }
}

# code-server
resource "coder_app" "code-server" {
  agent_id     = coder_agent.main.id
  slug         = "code-server"
  display_name = "code-server"
  icon         = "/icon/code.svg"
  url          = "http://localhost:13337?folder=/home/coder"
  subdomain    = false
  share        = "owner"

  healthcheck {
    url       = "http://localhost:13337/healthz"
    interval  = 3
    threshold = 10
  }
}

resource "kubernetes_persistent_volume_claim" "home" {
  metadata {
    name      = "coder-${lower(data.coder_workspace_owner.me.name)}-${lower(data.coder_workspace.me.name)}-home"
    namespace = "coder-${lower(data.coder_workspace_owner.me.name)}"
    labels = {
      "app.kubernetes.io/name"     = "coder-pvc"
      "app.kubernetes.io/instance" = "coder-pvc-${lower(data.coder_workspace_owner.me.name)}-${lower(data.coder_workspace.me.name)}"
      "app.kubernetes.io/part-of"  = "coder"
      //Coder-specific labels.
      "com.coder.resource"       = "true"
      "com.coder.workspace.id"   = data.coder_workspace.me.id
      "com.coder.workspace.name" = data.coder_workspace.me.name
      "com.coder.user.id"        = data.coder_workspace_owner.me.id
      "com.coder.user.username"  = data.coder_workspace_owner.me.name
    }
    annotations = {
      "com.coder.user.email" = data.coder_workspace_owner.me.email
    }
  }
  wait_until_bound = false
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "${data.coder_parameter.home_disk_size.value}Gi"
      }
    }
  }
}
resource "kubernetes_config_map" "hosts_config" {
  # Add this block to ignore changes if the resource already exists
  # count = data.coder_parameter.has_tfb_dev_workspace.value ? 0 : 1 // Should not create database if already exist
  # lifecycle {
  #   ignore_changes = all
  # }

  metadata {
    name      = "hosts-config"
    namespace = "coder-${lower(data.coder_workspace_owner.me.name)}"
  }

  data = {
    "hosts" = <<-EOT
      127.0.0.1 mc.theflyingbirds.net
      127.0.0.1 ${lower(data.coder_workspace.me.name)}
      127.0.0.1 lobby danish-survival creative cs-tmm parkour
    EOT
  }
}

resource "kubernetes_service" "tfb_cs_tmm_db" {
  metadata {
    name = "tfb-cs-tmm-db"
    namespace = "coder-${lower(data.coder_workspace_owner.me.name)}"
  }
  spec {
    type = "ExternalName"
    external_name = "${kubernetes_service.mariadb_service.metadata.0.name}.coder-${lower(data.coder_workspace_owner.me.name)}.svc.cluster.local"
  }
}

resource "kubernetes_service" "tfb_danish_survival_db" {
  metadata {
    name = "tfb-danish-survival-db"
    namespace = "coder-${lower(data.coder_workspace_owner.me.name)}"
  }
  spec {
    type = "ExternalName"
    external_name = "${kubernetes_service.mariadb_service.metadata.0.name}.coder-${lower(data.coder_workspace_owner.me.name)}.svc.cluster.local"
  }
}

resource "kubernetes_service" "tfb_parkour_db" {
  metadata {
    name = "tfb-parkour-db"
    namespace = "coder-${lower(data.coder_workspace_owner.me.name)}"
  }
  spec {
    type = "ExternalName"
    external_name = "${kubernetes_service.mariadb_service.metadata.0.name}.coder-${lower(data.coder_workspace_owner.me.name)}.svc.cluster.local"
  }
}

resource "kubernetes_deployment" "tfb-network-db" {
  count = data.coder_workspace.me.start_count
  depends_on = [
    kubernetes_persistent_volume_claim.home
  ]
  wait_for_rollout = false
  metadata {
    name      = "tfb-network-db"
    namespace = "coder-${lower(data.coder_workspace_owner.me.name)}"
    labels = {
      "app.kubernetes.io/name"     = "coder-workspace"
      "app.kubernetes.io/instance" = "coder-workspace-${data.coder_workspace.me.id}"
      "app.kubernetes.io/part-of"  = "coder"
      "com.coder.resource"         = "true"
      "com.coder.workspace.id"     = data.coder_workspace.me.id
      "com.coder.workspace.name"   = data.coder_workspace.me.name
      "com.coder.user.id"          = data.coder_workspace_owner.me.id
      "com.coder.user.username"    = data.coder_workspace_owner.me.name
    }
    annotations = {
      "com.coder.user.email" = data.coder_workspace_owner.me.email
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        "app.kubernetes.io/name"     = "coder-workspace"
        "app.kubernetes.io/instance" = "coder-workspace-${data.coder_workspace.me.id}"
        "app.kubernetes.io/part-of"  = "coder"
        "com.coder.resource"         = "true"
        "com.coder.workspace.id"     = data.coder_workspace.me.id
        "com.coder.workspace.name"   = data.coder_workspace.me.name
        "com.coder.user.id"          = data.coder_workspace_owner.me.id
        "com.coder.user.username"    = data.coder_workspace_owner.me.name
      }
    }
    strategy {
      type = "Recreate"
    }

    template {
      metadata {
        labels = {
          "app.kubernetes.io/name"     = "coder-workspace"
          "app.kubernetes.io/instance" = "coder-workspace-${data.coder_workspace.me.id}"
          "app.kubernetes.io/part-of"  = "coder"
          "com.coder.resource"         = "true"
          "com.coder.workspace.id"     = data.coder_workspace.me.id
          "com.coder.workspace.name"   = data.coder_workspace.me.name
          "com.coder.user.id"          = data.coder_workspace_owner.me.id
          "com.coder.user.username"    = data.coder_workspace_owner.me.name
        }
      }
      spec {
        security_context {
          run_as_user     = 1000
          fs_group        = 1000
          run_as_non_root = true
        }
        image_pull_secrets {
        name = "regcred"
        }

        container {
          name              = "tfb-network-db"
          image             = "mariadb:11.1.2-jammy"
          image_pull_policy = "Always"
          command           = ["sh", "-c", coder_agent.main.init_script]
          port {
            container_port = 3306
          }
          security_context {
            run_as_user = "1000"
          }
          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "TFBPassword123!"
          }
          resources {
            requests = {
              "cpu"    = "250m"
              "memory" = "512Mi"
            }
            limits = {
              "cpu"    = "${data.coder_parameter.cpu.value}"
              "memory" = "${data.coder_parameter.memory.value}Gi"
            }
          }
          volume_mount {
            name       = "database-init"
            mount_path = "/docker-entrypoint-initdb.d"
          }
        }

        volume {
          name = "database-init"
          config_map {
            name = kubernetes_config_map.database_init.metadata[0].name
          }
        }

        affinity {
          // This affinity attempts to spread out all workspace pods evenly across
          // nodes.
          pod_anti_affinity {
            preferred_during_scheduling_ignored_during_execution {
              weight = 1
              pod_affinity_term {
                topology_key = "kubernetes.io/hostname"
                label_selector {
                  match_expressions {
                    key      = "app.kubernetes.io/name"
                    operator = "In"
                    values   = ["coder-workspace"]
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_config_map" "database_init" {
  # count = data.coder_parameter.has_tfb_dev_workspace.value ? 0 : 1 // Should not create database if already exist
  # Add this block to ignore changes if the resource already exists
  # lifecycle {
  #   ignore_changes = all
  # }
  metadata {
    name      = "database-init"
    namespace = "coder-${lower(data.coder_workspace_owner.me.name)}"
  }

  data = {
    "init.sql" = <<-EOT
      -- Create a default database for initial selection
      CREATE DATABASE IF NOT EXISTS default_db;
      -- Select the default database
      USE default_db;

      DELIMITER //

      CREATE PROCEDURE grant_privileges_for_prefix(
          IN db_prefix VARCHAR(255)
      )
      BEGIN
        DECLARE done INT DEFAULT FALSE;
        DECLARE db_name VARCHAR(255);
        DECLARE cur CURSOR FOR 
          SELECT SCHEMA_NAME 
          FROM INFORMATION_SCHEMA.SCHEMATA 
          WHERE SCHEMA_NAME LIKE CONCAT(db_prefix, '%');
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

        OPEN cur;

        read_loop: LOOP
          FETCH cur INTO db_name;
          IF done THEN
            LEAVE read_loop;
          END IF;
          SET @grant_sql = CONCAT('GRANT ALL ON ', db_name, '.* TO \'', db_prefix, '\'@\'%\'');
          PREPARE stmt FROM @grant_sql;
          EXECUTE stmt;
          DEALLOCATE PREPARE stmt;
        END LOOP;

        CLOSE cur;
      END //

      DELIMITER ;

      SET GLOBAL max_connections = 5000;

      -- DANISH SURVIVAL --
      CREATE USER 'tfb_danish_survival'@'%' IDENTIFIED BY 'EhR3su7tKALaSpz#8V$MhF^8cs@7c*';
      CREATE DATABASE IF NOT EXISTS tfb_danish_survival_mcmmo;
      CREATE DATABASE IF NOT EXISTS tfb_danish_survival_griefdefender;
      CREATE DATABASE IF NOT EXISTS tfb_danish_survival_coreprotect;
      CALL grant_privileges_for_prefix('tfb_danish_survival');

      -- PARKOUR --
      CREATE USER 'tfb_parkour'@'%' IDENTIFIED BY 'WaLFY@^9!yc8Kg*y^DPt6urL6MS$HV';
      CREATE DATABASE IF NOT EXISTS tfb_parkour_parkour;
      CALL grant_privileges_for_prefix('tfb_parkour');

      -- COMMUNITY SERVER TMM --
      CREATE USER 'tfb_cs_tmm'@'%' IDENTIFIED BY 'WaLFY@^9!yc8Kg*y^DPt6urL6MS$HV';
      CREATE DATABASE IF NOT EXISTS tfb_cs_tmm_mcmmo;
      CREATE DATABASE IF NOT EXISTS tfb_cs_tmm_griefdefender;
      CREATE DATABASE IF NOT EXISTS tfb_cs_tmm_coreprotect;
      CREATE DATABASE IF NOT EXISTS tfb_cs_tmm_discordsrv;
      CALL grant_privileges_for_prefix('tfb_cs_tmm');

      -- TFB NETWORK PLUGINS --
      CREATE USER 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';
      CREATE DATABASE IF NOT EXISTS tfb_network_plan;
      CREATE DATABASE IF NOT EXISTS tfb_network_luckperms;
      CREATE DATABASE IF NOT EXISTS tfb_network_chatcontrolred;
      CREATE DATABASE IF NOT EXISTS tfb_network_gadgetsmenu;
      CREATE DATABASE IF NOT EXISTS tfb_network_hexnicks;
      CREATE DATABASE IF NOT EXISTS tfb_network_votingplugin;
      CREATE DATABASE IF NOT EXISTS tfb_network_streamingmodule;
      CALL grant_privileges_for_prefix('tfb_network');
    EOT
  }
}

resource "kubernetes_service" "mariadb_service" {
  # count = data.coder_parameter.has_tfb_dev_workspace.value ? 0 : 1 // Should not create database if already exist
  # Add this block to ignore changes if the resource already exists
  # lifecycle {
  #   ignore_changes = all
  # }
  metadata {
    name      = "tfb-network-db"
    namespace = "coder-${lower(data.coder_workspace_owner.me.name)}"
    labels = {
      app = "tfb-network-db"
    }
  }

  spec {
    selector = {
      "app.kubernetes.io/name"     = "tfb-network-db"
      "app.kubernetes.io/instance" = "tfb-network-db"
      "app.kubernetes.io/part-of"  = "coder"
    }

    port {
      name       = "mysql"
      port       = 3306
      target_port = 3306
      protocol   = "TCP"
    }

    session_affinity = "None"
    type             = "ClusterIP"
  }
}

resource "kubernetes_deployment" "main" {
  count = data.coder_workspace.me.start_count
  depends_on = [
    kubernetes_persistent_volume_claim.home
  ]
  wait_for_rollout = false
  metadata {
    name      = "tfb-dev"
    namespace = "coder-${lower(data.coder_workspace_owner.me.name)}"
    labels = {
      "app.kubernetes.io/name"     = "coder-workspace"
      "app.kubernetes.io/instance" = "coder-workspace-${data.coder_workspace.me.id}"
      "app.kubernetes.io/part-of"  = "coder"
      "com.coder.resource"         = "true"
      "com.coder.workspace.id"     = data.coder_workspace.me.id
      "com.coder.workspace.name"   = data.coder_workspace.me.name
      "com.coder.user.id"          = data.coder_workspace_owner.me.id
      "com.coder.user.username"    = data.coder_workspace_owner.me.name
    }
    annotations = {
      "com.coder.user.email" = data.coder_workspace_owner.me.email
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        "app.kubernetes.io/name"     = "coder-workspace"
        "app.kubernetes.io/instance" = "coder-workspace-${data.coder_workspace.me.id}"
        "app.kubernetes.io/part-of"  = "coder"
        "com.coder.resource"         = "true"
        "com.coder.workspace.id"     = data.coder_workspace.me.id
        "com.coder.workspace.name"   = data.coder_workspace.me.name
        "com.coder.user.id"          = data.coder_workspace_owner.me.id
        "com.coder.user.username"    = data.coder_workspace_owner.me.name
      }
    }
    strategy {
      type = "Recreate"
    }

    template {
      metadata {
        labels = {
          "app.kubernetes.io/name"     = "coder-workspace"
          "app.kubernetes.io/instance" = "coder-workspace-${data.coder_workspace.me.id}"
          "app.kubernetes.io/part-of"  = "coder"
          "com.coder.resource"         = "true"
          "com.coder.workspace.id"     = data.coder_workspace.me.id
          "com.coder.workspace.name"   = data.coder_workspace.me.name
          "com.coder.user.id"          = data.coder_workspace_owner.me.id
          "com.coder.user.username"    = data.coder_workspace_owner.me.name
        }
      }
      spec {
        security_context {
          run_as_user     = 1000
          fs_group        = 1000
          run_as_non_root = true
        }
        image_pull_secrets {
        name = "regcred"
        }

        container {
          name              = "tfb-dev"
          image             = "docker.theflyingbirds.net/tfb-services/tfb-dev:latest"
          image_pull_policy = "Always"
          command           = ["sh", "-c", coder_agent.main.init_script]
        port {
            protocol = "UDP"
            container_port = 19132
        }
        port {
            protocol = "TCP"
            container_port = 25565
        }
        port {
            protocol = "UDP"
            container_port = 30001
        }
          security_context {
            run_as_user = "1000"
          }
          env {
            name  = "CODER_AGENT_TOKEN"
            value = coder_agent.main.token
          }
          resources {
            requests = {
              "cpu"    = "250m"
              "memory" = "512Mi"
            }
            limits = {
              "cpu"    = "${data.coder_parameter.cpu.value}"
              "memory" = "${data.coder_parameter.memory.value}Gi"
            }
          }
          volume_mount {
            mount_path = "/home/coder"
            name       = "home"
            read_only  = false
          }
          # Add this new volume mount for /etc/hosts
          volume_mount {
            name      = "custom-etc-hosts"
            mount_path = "/etc/hosts"
            sub_path   = "hosts"
            read_only  = true
          }
        }

        volume {
          name = "home"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.home.metadata.0.name
            read_only  = false
          }
        }
        volume {
          name = "custom-etc-hosts"
          config_map {
            name = kubernetes_config_map.hosts_config.metadata[0].name
          }
        }

        affinity {
          // This affinity attempts to spread out all workspace pods evenly across
          // nodes.
          pod_anti_affinity {
            preferred_during_scheduling_ignored_during_execution {
              weight = 1
              pod_affinity_term {
                topology_key = "kubernetes.io/hostname"
                label_selector {
                  match_expressions {
                    key      = "app.kubernetes.io/name"
                    operator = "In"
                    values   = ["coder-workspace"]
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
