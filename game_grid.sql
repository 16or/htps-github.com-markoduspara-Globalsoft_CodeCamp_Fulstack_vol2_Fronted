/*
    record n:       number of field
    record state :  0 - oxs
                    1 - ixs
*/

CREATE TABLE `game_grid` (
    `id`            INT             UNSIGNED    NOT NULL AUTO_INCREMENT,
    `game_id`       INT             UNSIGNED    NOT NULL,
    `n`             INT                         NULL,
    `state`         INT                         NULL,
    `created_at`    TIMESTAMP                   DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `updated_at`    TIMESTAMP                   DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`    TIMESTAMP                   NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (game_id) REFERENCES game(id),
    UNIQUE KEY (game_id,n)
);

DELIMITER //

CREATE TRIGGER delete_game_grid
AFTER DELETE ON game_grid
FOR EACH ROW
BEGIN
    UPDATE `game_grid`
    SET `deleted_at` = CURRENT_TIMESTAMP
    WHERE `id` = id;
END //

DELIMITER ;