/*
    Domaćin je igrač u tablici game pod stranim ključem player1_id
    record state :  0 - nerješena igra
                    1 - pobjeda domaćina
                    2 - pobjeda gosta
*/

CREATE TABLE  `game_state` (
    `id`            INT             UNSIGNED    NOT NULL AUTO_INCREMENT,
    `state`         INT                         NOT NULL,
    `created_at`    TIMESTAMP                   DEFAULT CURRENT_TIMESTAMP NOT NULL,
    `updated_at`    TIMESTAMP                   DEFAULT CURRENT_TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at`    TIMESTAMP                   NULL,
    
    PRIMARY KEY (id),
    UNIQUE KEY gs_state (state)
);

DELIMITER //

CREATE TRIGGER delete_game_state
AFTER DELETE ON game_state
FOR EACH ROW
BEGIN
    UPDATE `game_state`
    SET `deleted_at` = CURRENT_TIMESTAMP
    WHERE `id` = id;
END //

DELIMITER ;