CREATE TABLE `user` (
    `id`            INT             UNSIGNED    NOT NULL AUTO_INCREMENT,
    `username`      varchar(64)                 NOT NULL,
    `password`      varchar(255)                NOT NULL,
    `created_at`    TIMESTAMP                   DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `updated_at`    TIMESTAMP                   DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`    TIMESTAMP                   NULL,
    
    PRIMARY KEY (id),
    UNIQUE KEY uk_name (username)
);

DELIMITER //

CREATE TRIGGER delete_user
AFTER DELETE ON user
FOR EACH ROW
BEGIN
    UPDATE `user`
    SET `deleted_at` = CURRENT_TIMESTAMP
    WHERE `id` = id;
END //

DELIMITER ;