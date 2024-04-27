/*
    record n:       dimension of game
*/

CREATE TABLE `game` (
    `id`            INT             UNSIGNED    NOT NULL AUTO_INCREMENT,
    `player1_id`    INT             UNSIGNED    NOT NULL,
    `player2_id`    INT             UNSIGNED    NOT NULL,
    `gs_id`         INT             UNSIGNED    NOT NULL,
    `n`             INT                         NULL,
    `created_at`    TIMESTAMP                   DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `updated_at`    TIMESTAMP                   DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`    TIMESTAMP                   NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (player1_id) REFERENCES user (id),
    FOREIGN KEY (player2_id) REFERENCES user (id),
    FOREIGN KEY (gs_id) REFERENCES game_state (id)
);

DELIMITER //

CREATE TRIGGER delete_game
AFTER DELETE ON game
FOR EACH ROW
BEGIN
    UPDATE `game`
    SET `deleted_at` = CURRENT_TIMESTAMP
    WHERE `id` = OLD.id;
END //

DELIMITER ;