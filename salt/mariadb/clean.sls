salt_database:
    mysql_database.present:
        - name: salt

events:
    mysql_user.present:
        - host: %
        - password: N2F6jfBm

events_table:
    mysql_query.run:
        - database: salt
        - query_file: |
            CREATE TABLE `salt`.`events` (
            `id` INT NOT NULL AUTO_INCREMENT,
            `time` DATETIME NOT NULL,
            `tag` VARCHAR(255) NOT NULL,
            `data` MEDIUMTEXT NOT NULL,
            PRIMARY KEY (`id`));
        - output: grain
        - grain: sugar_mysql_clean_out

events_salt:
    mysql_grants.present:
        - grant: all privileges
        - database: salt.*
        - user: events