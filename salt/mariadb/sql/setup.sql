USE salt;

DROP TABLE IF EXISTS `events`;

CREATE TABLE `salt`.`events` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`id`));

#CREATE TABLE `salt`.`events` (
#  `id` INT NOT NULL AUTO_INCREMENT,
#  `_stamp` DATETIME NOT NULL,
#  `cmd` VARCHAR(45) NOT NULL,
#  `fun` VARCHAR(45) NOT NULL,
#  `fun_args` VARCHAR(45) NOT NULL,
#  `minion_id` VARCHAR(45) NOT NULL,
#  `jid` VARCHAR(45) NOT NULL,
#  `retcode` INT NOT NULL,
#  `return` TINYINT NOT NULL,
# `success` TINYINT NOT NULL,
#  PRIMARY KEY (`id`));
  

select * from events;

#Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'JSON NOT NULL,   PRIMARY KEY (`id`))' at line 3


