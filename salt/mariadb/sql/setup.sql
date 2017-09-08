--DROP DATABASE IF EXISTS `salt`;
--CREATE DATABASE IF NOT EXISTS `salt`;
--USE `salt`;
--DROP USER IF EXISTS 'events'@'%';
--CREATE USER 'events'@'%' IDENTIFIED BY 'N2F6jfBm';
--CREATE TABLE `salt`.`events` (
--  `id` INT NOT NULL AUTO_INCREMENT,
--  `time` DATETIME NOT NULL,
--  `tag` VARCHAR(255) NOT NULL,
--  `data` MEDIUMTEXT NOT NULL,
--  PRIMARY KEY (`id`));
--GRANT ALL PRIVILEGES ON `salt`.`events` TO 'events'@'%';

select * from events;