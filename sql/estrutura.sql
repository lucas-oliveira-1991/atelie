-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema atelie_v1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `atelie_v1` ;

-- -----------------------------------------------------
-- Schema atelie_v1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `atelie_v1` ;
USE `atelie_v1` ;

-- -----------------------------------------------------
-- Table `atelie_v1`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atelie_v1`.`estado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` TEXT NOT NULL,
  `uf` CHAR(2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atelie_v1`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atelie_v1`.`cidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` TEXT NOT NULL,
  `estado` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cidade_estado`
    FOREIGN KEY (`estado`)
    REFERENCES `atelie_v1`.`estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_cidade_estado_idx` ON `atelie_v1`.`cidade` (`estado` ASC);


-- -----------------------------------------------------
-- Table `atelie_v1`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atelie_v1`.`admin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` TEXT NOT NULL,
  `email` TEXT NOT NULL,
  `senha` LONGTEXT NOT NULL,
  `token_senha` LONGTEXT NULL,
  `data_cadastro` DATETIME NOT NULL,
  `ativo` TINYINT(1) NOT NULL DEFAULT "0",
  `cidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_admin_cidade1`
    FOREIGN KEY (`cidade`)
    REFERENCES `atelie_v1`.`cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_admin_cidade1_idx` ON `atelie_v1`.`admin` (`cidade` ASC);


-- -----------------------------------------------------
-- Table `atelie_v1`.`profissional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atelie_v1`.`profissional` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` TEXT NOT NULL,
  `email` TEXT NOT NULL,
  `senha` LONGTEXT NOT NULL,
  `token_senha` LONGTEXT NULL,
  `tipo_documento` TINYINT(1) NOT NULL,
  `documento` TEXT NULL,
  `foto_documento` LONGTEXT NULL,
  ` telefone` TEXT NULL,
  `celular` TEXT NULL,
  `cep` TEXT NOT NULL,
  `logadouro` TEXT NOT NULL,
  `numero` TEXT NOT NULL,
  `complemento` LONGTEXT NULL,
  `data_cadastro` DATETIME NOT NULL,
  `ativo` TINYINT(1) NOT NULL DEFAULT "0",
  `cidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_profissional_cidade1`
    FOREIGN KEY (`cidade`)
    REFERENCES `atelie_v1`.`cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_profissional_cidade1_idx` ON `atelie_v1`.`profissional` (`cidade` ASC);


-- -----------------------------------------------------
-- Table `atelie_v1`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atelie_v1`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` TEXT NOT NULL,
  `email` TEXT NOT NULL,
  `senha` LONGTEXT NOT NULL,
  `token_senha` LONGTEXT NULL,
  `foto` TEXT NULL,
  `telefone` TEXT NULL,
  `celular` TEXT NULL,
  `cep` TEXT NOT NULL,
  `logadouro` TEXT NOT NULL,
  `numero` TEXT NOT NULL,
  `complemento` LONGTEXT NULL,
  `ativo` TINYINT(1) NOT NULL DEFAULT "1",
  `data_cadastro` DATETIME NOT NULL,
  `cidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cliente_cidade1`
    FOREIGN KEY (`cidade`)
    REFERENCES `atelie_v1`.`cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_cliente_cidade1_idx` ON `atelie_v1`.`cliente` (`cidade` ASC);


-- -----------------------------------------------------
-- Table `atelie_v1`.`status_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atelie_v1`.`status_pagamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atelie_v1`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atelie_v1`.`categoria` (
  `id` INT NOT NULL,
  `nome` TEXT NOT NULL,
  `foto` LONGTEXT NULL,
  `ativo` TINYINT(1) NOT NULL DEFAULT "1",
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atelie_v1`.`sub_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atelie_v1`.`sub_categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` TEXT NOT NULL,
  `ativo` TINYINT(1) NOT NULL DEFAULT "1",
  `categoria` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_sub_categoria_categoria1`
    FOREIGN KEY (`categoria`)
    REFERENCES `atelie_v1`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_sub_categoria_categoria1_idx` ON `atelie_v1`.`sub_categoria` (`categoria` ASC);


-- -----------------------------------------------------
-- Table `atelie_v1`.`sub_categoria_profissional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atelie_v1`.`sub_categoria_profissional` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `preco` FLOAT NOT NULL,
  `sub_categoria` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_sub_categoria_profissional_sub_categoria1`
    FOREIGN KEY (`sub_categoria`)
    REFERENCES `atelie_v1`.`sub_categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_sub_categoria_profissional_sub_categoria1_idx` ON `atelie_v1`.`sub_categoria_profissional` (`sub_categoria` ASC);


-- -----------------------------------------------------
-- Table `atelie_v1`.`tipo_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atelie_v1`.`tipo_pagamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atelie_v1`.`status_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atelie_v1`.`status_servico` (
  `id` INT NOT NULL,
  `nome` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atelie_v1`.`servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atelie_v1`.`servicos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_agendamento` DATETIME NOT NULL,
  `data_confirmado_cliente` DATETIME NULL,
  `data_confirmado_profissional` DATETIME NULL,
  `valor_pago` FLOAT NULL,
  `confirma_finalizado` TINYINT(1) NOT NULL DEFAULT "0",
  `profissional` INT NOT NULL,
  `cliente` INT NOT NULL,
  `status_pagamento` INT NOT NULL,
  `sub_categoria_profissional` INT UNSIGNED NOT NULL,
  `tipo_pagamento` INT NOT NULL,
  `status_servico` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_servicos_profissional1`
    FOREIGN KEY (`profissional`)
    REFERENCES `atelie_v1`.`profissional` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicos_cliente1`
    FOREIGN KEY (`cliente`)
    REFERENCES `atelie_v1`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicos_status_pagamento1`
    FOREIGN KEY (`status_pagamento`)
    REFERENCES `atelie_v1`.`status_pagamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicos_sub_categoria_profissional1`
    FOREIGN KEY (`sub_categoria_profissional`)
    REFERENCES `atelie_v1`.`sub_categoria_profissional` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicos_tipo_pagamento1`
    FOREIGN KEY (`tipo_pagamento`)
    REFERENCES `atelie_v1`.`tipo_pagamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicos_status_servico1`
    FOREIGN KEY (`status_servico`)
    REFERENCES `atelie_v1`.`status_servico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_servicos_profissional1_idx` ON `atelie_v1`.`servicos` (`profissional` ASC);

CREATE INDEX `fk_servicos_cliente1_idx` ON `atelie_v1`.`servicos` (`cliente` ASC);

CREATE INDEX `fk_servicos_status_pagamento1_idx` ON `atelie_v1`.`servicos` (`status_pagamento` ASC);

CREATE INDEX `fk_servicos_sub_categoria_profissional1_idx` ON `atelie_v1`.`servicos` (`sub_categoria_profissional` ASC);

CREATE INDEX `fk_servicos_tipo_pagamento1_idx` ON `atelie_v1`.`servicos` (`tipo_pagamento` ASC);

CREATE INDEX `fk_servicos_status_servico1_idx` ON `atelie_v1`.`servicos` (`status_servico` ASC);


-- -----------------------------------------------------
-- Table `atelie_v1`.`status_adiantamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atelie_v1`.`status_adiantamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `atelie_v1`.`adiantamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `atelie_v1`.`adiantamento` (
  `id` INT NOT NULL,
  `taxa` FLOAT NOT NULL,
  `servicos` INT NOT NULL,
  `status_adiantamento` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_adiantamento_servicos1`
    FOREIGN KEY (`servicos`)
    REFERENCES `atelie_v1`.`servicos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_adiantamento_status_adiantamento1`
    FOREIGN KEY (`status_adiantamento`)
    REFERENCES `atelie_v1`.`status_adiantamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_adiantamento_servicos1_idx` ON `atelie_v1`.`adiantamento` (`servicos` ASC);

CREATE INDEX `fk_adiantamento_status_adiantamento1_idx` ON `atelie_v1`.`adiantamento` (`status_adiantamento` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `atelie_v1`.`status_pagamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `atelie_v1`;
INSERT INTO `atelie_v1`.`status_pagamento` (`id`, `nome`) VALUES (DEFAULT, 'Aguardando pagamento');
INSERT INTO `atelie_v1`.`status_pagamento` (`id`, `nome`) VALUES (DEFAULT, 'Pagamento efetuado');
INSERT INTO `atelie_v1`.`status_pagamento` (`id`, `nome`) VALUES (DEFAULT, 'Pagamento recusado');

COMMIT;


-- -----------------------------------------------------
-- Data for table `atelie_v1`.`tipo_pagamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `atelie_v1`;
INSERT INTO `atelie_v1`.`tipo_pagamento` (`id`, `nome`) VALUES (1, 'Dinheiro');
INSERT INTO `atelie_v1`.`tipo_pagamento` (`id`, `nome`) VALUES (2, 'Débito');
INSERT INTO `atelie_v1`.`tipo_pagamento` (`id`, `nome`) VALUES (3, 'Crédito');

COMMIT;


-- -----------------------------------------------------
-- Data for table `atelie_v1`.`status_servico`
-- -----------------------------------------------------
START TRANSACTION;
USE `atelie_v1`;
INSERT INTO `atelie_v1`.`status_servico` (`id`, `nome`) VALUES (1, 'Agendado');
INSERT INTO `atelie_v1`.`status_servico` (`id`, `nome`) VALUES (2, 'Confirmado');
INSERT INTO `atelie_v1`.`status_servico` (`id`, `nome`) VALUES (3, 'Finalizado');
INSERT INTO `atelie_v1`.`status_servico` (`id`, `nome`) VALUES (4, 'Recusado');

COMMIT;


-- -----------------------------------------------------
-- Data for table `atelie_v1`.`status_adiantamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `atelie_v1`;
INSERT INTO `atelie_v1`.`status_adiantamento` (`id`, `nome`) VALUES (1, 'Solicitado');
INSERT INTO `atelie_v1`.`status_adiantamento` (`id`, `nome`) VALUES (2, 'Aprovado');
INSERT INTO `atelie_v1`.`status_adiantamento` (`id`, `nome`) VALUES (3, 'Pago');
INSERT INTO `atelie_v1`.`status_adiantamento` (`id`, `nome`) VALUES (4, 'Recusado');

COMMIT;

