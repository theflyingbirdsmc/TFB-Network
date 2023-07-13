-- LUCKPERMS --
DROP USER IF EXISTS 'tfb_luckperms';
CREATE USER 'tfb_luckperms'@'%';
CREATE DATABASE IF NOT EXISTS s1_luckperms;
GRANT ALL ON s1_luckperms.* TO 'tfb_luckperms'@'%' IDENTIFIED BY 'uEJq!fjGM!62*&cmX*mBRhT9L2@SgX';

-- PLAN --
DROP USER IF EXISTS 'tfb_plan'; 
CREATE USER 'tfb_plan'@'%';
CREATE DATABASE IF NOT EXISTS s1_plan;
GRANT ALL ON s1_plan.* TO 'tfb_plan'@'%' IDENTIFIED BY '$Z@jJKSLcd7xUekU5qF&VW3#ndU&mm';

-- VOTINGPLUGIN --
DROP USER IF EXISTS 'tfb_votingplugin';
CREATE USER 'tfb_votingplugin'@'%';
CREATE DATABASE IF NOT EXISTS s1_votingplugin;
GRANT ALL ON s1_votingplugin.* TO 'tfb_votingplugin'@'%' IDENTIFIED BY '5wZw5@ySSE@zZSd4b#QFrPfsedwhzz';

-- GADGETSMENU --
DROP USER IF EXISTS 'u2_oeN5DZ9Msp';
CREATE USER 'u2_oeN5DZ9Msp'@'%';
CREATE DATABASE IF NOT EXISTS s2_gadgetsmenu;
GRANT ALL ON s2_gadgetsmenu.* TO 'u2_oeN5DZ9Msp'@'%' IDENTIFIED BY '^DqHSSNgoX.IQCre6=.x2.J4';

-- CHATCONTROLRED --
DROP USER IF EXISTS 'tfb_chatcontrolred';
CREATE USER 'tfb_chatcontrolred'@'%';
CREATE DATABASE IF NOT EXISTS s2_chatcontrolred;
GRANT ALL ON s2_chatcontrolred.* TO 'tfb_chatcontrolred'@'%' IDENTIFIED BY 'e&cqyYXtqjgfL!hEGMyFpqMi89!g9w';

-- PLOTSQUARED --
DROP USER IF EXISTS 'u5_DEXeIJnxSl';
CREATE USER 'u5_DEXeIJnxSl'@'%';
CREATE DATABASE IF NOT EXISTS s5_plotsquared;
GRANT ALL ON s5_plotsquared.* TO 'u5_DEXeIJnxSl'@'%' IDENTIFIED BY 'x2IQ^K4prZAW=^uTzpGMMG@u';

-- COREPROTECT --
DROP USER IF EXISTS 'u9_OuEs5LpxqL';
CREATE USER 'u9_OuEs5LpxqL'@'%';
CREATE DATABASE IF NOT EXISTS s9_coreprotect;
GRANT ALL ON s9_coreprotect.* TO 'u9_OuEs5LpxqL'@'%' IDENTIFIED BY '9l!C+mt2.4MvHb+BqnVkEU+f';
FLUSH PRIVILEGES;

-- PLAYERREFERALS --
DROP USER IF EXISTS 'u2_wdkOuuJO27';
CREATE USER 'u2_wdkOuuJO27'@'%';
CREATE DATABASE IF NOT EXISTS s2_playerreferals;
GRANT ALL ON s2_playerreferals.* TO 'u2_wdkOuuJO27'@'%' IDENTIFIED BY 'EDMgT5VOIaSa0TWw@b9LeuXW';
FLUSH PRIVILEGES;

-- HEXNICKS --
DROP USER IF EXISTS 'tfb_hexnicks';
CREATE USER 'tfb_hexnicks'@'%';
CREATE DATABASE IF NOT EXISTS s2_hexnicks;
GRANT ALL ON s2_hexnicks.* TO 'tfb_hexnicks'@'%' IDENTIFIED BY 'j77RqV*scJQ2RSjcx@nRNiXNU&Yow*';