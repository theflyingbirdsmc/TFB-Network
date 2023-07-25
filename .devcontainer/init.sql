-- LUCKPERMS --
DROP USER IF EXISTS 'tfb_luckperms';
CREATE USER 'tfb_luckperms'@'%';
CREATE DATABASE IF NOT EXISTS luckperms;
GRANT ALL ON luckperms.* TO 'tfb_luckperms'@'%' IDENTIFIED BY 'uEJq!fjGM!62*&cmX*mBRhT9L2@SgX';

-- PLAN --
DROP USER IF EXISTS 'tfb_plan'; 
CREATE USER 'tfb_plan'@'%';
CREATE DATABASE IF NOT EXISTS plan;
GRANT ALL ON plan.* TO 'tfb_plan'@'%' IDENTIFIED BY '$Z@jJKSLcd7xUekU5qF&VW3#ndU&mm';

-- VOTINGPLUGIN --
DROP USER IF EXISTS 'tfb_votingplugin';
CREATE USER 'tfb_votingplugin'@'%';
CREATE DATABASE IF NOT EXISTS votingplugin;
GRANT ALL ON votingplugin.* TO 'tfb_votingplugin'@'%' IDENTIFIED BY '5wZw5@ySSE@zZSd4b#QFrPfsedwhzz';

-- GADGETSMENU --
DROP USER IF EXISTS 'tfb_gadgetsmenu';
CREATE USER 'tfb_gadgetsmenu'@'%';
CREATE DATABASE IF NOT EXISTS gadgetsmenu;
GRANT ALL ON gadgetsmenu.* TO 'tfb_gadgetsmenu'@'%' IDENTIFIED BY 'vF53CRgmZt*@8y6y3f#ku&L*d4*fj^';

-- CHATCONTROLRED --
DROP USER IF EXISTS 'tfb_chatcontrolred';
CREATE USER 'tfb_chatcontrolred'@'%';
CREATE DATABASE IF NOT EXISTS chatcontrolred;
GRANT ALL ON chatcontrolred.* TO 'tfb_chatcontrolred'@'%' IDENTIFIED BY 'e&cqyYXtqjgfL!hEGMyFpqMi89!g9w';

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
CREATE DATABASE IF NOT EXISTS playerreferals;
GRANT ALL ON playerreferals.* TO 'tfb_playerreferrals'@'%' IDENTIFIED BY 'bxmJaWd#264#aT6JW$UQaQAmq3hbYd';
FLUSH PRIVILEGES;

-- HEXNICKS --
DROP USER IF EXISTS 'tfb_hexnicks';
CREATE USER 'tfb_hexnicks'@'%';
CREATE DATABASE IF NOT EXISTS hexnicks;
GRANT ALL ON hexnicks.* TO 'tfb_hexnicks'@'%' IDENTIFIED BY 'j77RqV*scJQ2RSjcx@nRNiXNU&Yow*';