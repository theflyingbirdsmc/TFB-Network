-- LUCKPERMS --
DROP USER IF EXISTS 'tfb_network';
CREATE USER 'tfb_network'@'%';
CREATE DATABASE IF NOT EXISTS tfb_network_luckperms;
GRANT ALL ON tfb_network_luckperms.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';

-- PLAN --
DROP USER IF EXISTS 'tfb_network'; 
CREATE USER 'tfb_network'@'%';
CREATE DATABASE IF NOT EXISTS tfb_network_plan;
GRANT ALL ON tfb_network_plan.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';

-- VOTINGPLUGIN --
DROP USER IF EXISTS 'tfb_network';
CREATE USER 'tfb_network'@'%';
CREATE DATABASE IF NOT EXISTS tfb_network_votingplugin;
GRANT ALL ON tfb_network_votingplugin.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';

-- GADGETSMENU --
DROP USER IF EXISTS 'tfb_network';
CREATE USER 'tfb_network'@'%';
CREATE DATABASE IF NOT EXISTS tfb_network_gadgetsmenu;
GRANT ALL ON tfb_network_gadgetsmenu.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';

-- CHATCONTROLRED --
DROP USER IF EXISTS 'tfb_network';
CREATE USER 'tfb_network'@'%';
CREATE DATABASE IF NOT EXISTS tfb_network_chatcontrol;
GRANT ALL ON tfb_network_chatcontrol.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';

-- PLOTSQUARED --
DROP USER IF EXISTS 'tfb_network';
CREATE USER 'tfb_network'@'%';
CREATE DATABASE IF NOT EXISTS plotsquared;
GRANT ALL ON plotsquared.* TO 'tfb_network'@'%' IDENTIFIED BY 'kBk4x@oQq8ehZ8jF*3mUn&3HMrBz@f';

-- COREPROTECT --
DROP USER IF EXISTS 'tfb_network';
CREATE USER 'tfb_network'@'%';
CREATE DATABASE IF NOT EXISTS coreprotect;
GRANT ALL ON coreprotect.* TO 'tfb_coreprotect'@'%' IDENTIFIED BY 'J$ca$cXuj!HQEijVEjh69KuTYC998E';
FLUSH PRIVILEGES;

-- PLAYERREFERALS --
DROP USER IF EXISTS 'tfb_network';
CREATE USER 'tfb_network'@'%';
CREATE DATABASE IF NOT EXISTS tfb_network_playerreferals;
GRANT ALL ON tfb_network_playerreferals.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';
FLUSH PRIVILEGES;

-- HEXNICKS --
DROP USER IF EXISTS 'tfb_network';
CREATE USER 'tfb_network'@'%';
CREATE DATABASE IF NOT EXISTS tfb_network_hexnicks;
GRANT ALL ON tfb_network_hexnicks.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';

-- PARKOUR --
DROP USER IF EXISTS 'tfb_network';
CREATE USER 'tfb_network'@'%';
CREATE DATABASE IF NOT EXISTS parkour;
GRANT ALL ON parkour.* TO 'tfb_parkour'@'%' IDENTIFIED BY 'MqGR6uD4SFPXTmK6uweVMCZ7pkTTfi';

CREATE USER 'tfb_network'@'%';
CREATE DATABASE IF NOT EXISTS cs_tmm_coreprotect;
CREATE DATABASE IF NOT EXISTS cs_tmm_mcmmo;
CREATE DATABASE IF NOT EXISTS cs_tmm_griefdefender;
CREATE DATABASE IF NOT EXISTS cs_tmm_discordsrv;
GRANT ALL ON tfb_network_chatcontrol.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';
GRANT ALL ON tfb_network_gadgetsmenu.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';
GRANT ALL ON tfb_network_luckperms.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';
GRANT ALL ON tfb_network_plan.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYXCZ4a5494sjVS8oBZL';
GRANT ALL ON tfb_network_playerreferals.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';
GRANT ALL ON tfb_network_hexnicks.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';
GRANT ALL ON tfb_network_votingplugin.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';


CREATE USER 'cs_tmm'@'%';
GRANT ALL ON cs_tmm_coreprotect.* TO 'cs_tmm'@'%' IDENTIFIED BY 'WaLFY@^9!yc8Kg*y^DPt6urL6MS$HV';
GRANT ALL ON cs_tmm_griefdefender.* TO 'cs_tmm'@'%' IDENTIFIED BY 'WaLFY@^9!yc8Kg*y^DPt6urL6MS$HV';
GRANT ALL ON cs_tmm_discordsrv.* TO 'cs_tmm'@'%' IDENTIFIED BY 'WaLFY@^9!yc8Kg*y^DPt6urL6MS$HV';
GRANT ALL ON cs_tmm_mcmmo.* TO 'cs_tmm'@'%' IDENTIFIED BY 'WaLFY@^9!yc8Kg*y^DPt6urL6MS$HV';