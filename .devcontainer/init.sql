-- LUCKPERMS --
DROP USER IF EXISTS 'tfb_luckperms';
CREATE USER 'tfb_luckperms'@'%';
CREATE DATABASE IF NOT EXISTS tfb_network_luckperms;
GRANT ALL ON tfb_network_luckperms.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';

-- PLAN --
DROP USER IF EXISTS 'tfb_plan'; 
CREATE USER 'tfb_plan'@'%';
CREATE DATABASE IF NOT EXISTS tfb_network_plan;
GRANT ALL ON tfb_network_plan.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';

-- VOTINGPLUGIN --
DROP USER IF EXISTS 'tfb_votingplugin';
CREATE USER 'tfb_votingplugin'@'%';
CREATE DATABASE IF NOT EXISTS tfb_network_votingplugin;
GRANT ALL ON tfb_network_votingplugin.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';

-- GADGETSMENU --
DROP USER IF EXISTS 'tfb_gadgetsmenu';
CREATE USER 'tfb_gadgetsmenu'@'%';
CREATE DATABASE IF NOT EXISTS tfb_network_gadgetsmenu;
GRANT ALL ON tfb_network_gadgetsmenu.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';

-- CHATCONTROLRED --
DROP USER IF EXISTS 'tfb_chatcontrolred';
CREATE USER 'tfb_chatcontrolred'@'%';
CREATE DATABASE IF NOT EXISTS tfb_network_chatcontrolred;
GRANT ALL ON tfb_network_chatcontrolred.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';

-- PLOTSQUARED --
DROP USER IF EXISTS 'tfb_plotsquared';
CREATE USER 'tfb_plotsquared'@'%';
CREATE DATABASE IF NOT EXISTS plotsquared;
GRANT ALL ON plotsquared.* TO 'tfb_plotsquared'@'%' IDENTIFIED BY 'kBk4x@oQq8ehZ8jF*3mUn&3HMrBz@f';

-- COREPROTECT --
DROP USER IF EXISTS 'tfb_coreprotect';
CREATE USER 'tfb_coreprotect'@'%';
CREATE DATABASE IF NOT EXISTS coreprotect;
GRANT ALL ON coreprotect.* TO 'tfb_coreprotect'@'%' IDENTIFIED BY 'J$ca$cXuj!HQEijVEjh69KuTYC998E';
FLUSH PRIVILEGES;

-- PLAYERREFERALS --
DROP USER IF EXISTS 'tfb_playerreferrals';
CREATE USER 'tfb_playerreferrals'@'%';
CREATE DATABASE IF NOT EXISTS tfb_network_playerreferals;
GRANT ALL ON tfb_network_playerreferals.* TO 'tfb_network'@'%' IDENTIFIED BY 'ifFfF4cUeEYVXCZ4a5494sjVS8oBZL';
FLUSH PRIVILEGES;

-- HEXNICKS --
DROP USER IF EXISTS 'tfb_hexnicks';
CREATE USER 'tfb_hexnicks'@'%';
CREATE DATABASE IF NOT EXISTS hexnicks;
GRANT ALL ON hexnicks.* TO 'tfb_hexnicks'@'%' IDENTIFIED BY 'j77RqV*scJQ2RSjcx@nRNiXNU&Yow*';

-- PARKOUR --
DROP USER IF EXISTS 'tfb_parkour';
CREATE USER 'tfb_parkour'@'%';
CREATE DATABASE IF NOT EXISTS parkour;
GRANT ALL ON parkour.* TO 'tfb_parkour'@'%' IDENTIFIED BY 'MqGR6uD4SFPXTmK6uweVMCZ7pkTTfi';