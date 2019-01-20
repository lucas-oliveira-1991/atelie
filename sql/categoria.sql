    START TRANSACTION;
    USE `atelie_v1`;

    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (1, 'Cabeleireiro', 1, '11.png');
    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (2, 'Massagem', 1, '5.png');
    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (3, 'Barbeiro', 1, '0.png');
    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (4, 'Limpeza', 1, '10.png');
    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (5, 'Estética', 1, '9.png');
    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (6, 'Spa da Unha', 1, '2.png');
    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (7, 'Mãos e Unhas', 0, '3.png');
    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (8, 'Estética Facial', 1, '1.png');
    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (9, 'Sobrancelhas', 0, '6.png');
    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (10, 'Podologia', 1, '12.png');
    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (11, 'Capilar', 0, '7.png');
    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (12, 'Estética Corporal', 1, '5.png');
    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (13, 'Maquiagem', 0, '10.png');
    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (14, 'Depilação', 1, '8.png');
    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (15, 'Nova categoria', 1, '0.png');
    INSERT INTO `atelie_v1`.`categoria` (id, nome, ativo, foto) VALUES (16, 'Boca Loca', 1, '0.png');

    COMMIT;