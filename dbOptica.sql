-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dboptica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dboptica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dboptica` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci ;
USE `dboptica` ;

-- -----------------------------------------------------
-- Table `dboptica`.`dtclients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dboptica`.`dtclients` (
  `idClient` INT(11) NOT NULL AUTO_INCREMENT,
  `nomClient` VARCHAR(45) NULL DEFAULT NULL,
  `carrer` VARCHAR(45) NULL DEFAULT NULL,
  `numero` SMALLINT(4) NULL DEFAULT NULL,
  `telf` INT(12) NULL DEFAULT NULL,
  `dataRegistre` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `idRecomendadoCliente` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci;


-- -----------------------------------------------------
-- Table `dboptica`.`dtempleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dboptica`.`dtempleats` (
  `idEmpleat` SMALLINT(4) NOT NULL,
  `nomEmpleat` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idEmpleat`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci;


-- -----------------------------------------------------
-- Table `dboptica`.`dtproveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dboptica`.`dtproveidor` (
  `idProveidor` INT(4) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `carrer` VARCHAR(145) NULL DEFAULT NULL,
  `num` SMALLINT(4) NULL DEFAULT NULL,
  `pis` VARCHAR(10) NULL DEFAULT NULL,
  `porta` VARCHAR(10) NULL DEFAULT NULL,
  `ciutat` VARCHAR(45) NULL DEFAULT NULL,
  `cp` SMALLINT(5) NULL DEFAULT NULL,
  `pais` VARCHAR(45) NULL DEFAULT NULL,
  `telefon` INT(11) NULL DEFAULT NULL,
  `fax` INT(11) NULL DEFAULT NULL,
  `nif` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`idProveidor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci;


-- -----------------------------------------------------
-- Table `dboptica`.`dtulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dboptica`.`dtulleres` (
  `idUlleres` INT(11) NOT NULL AUTO_INCREMENT,
  `idMarca` INT(11) NOT NULL,
  `graduacion` FLOAT NULL DEFAULT NULL,
  `idTipoMontura` INT(11) NULL DEFAULT NULL,
  `idColorVidre` INT(11) NULL DEFAULT NULL,
  `preu` FLOAT NULL DEFAULT NULL,
  `idProveidor` INT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`idUlleres`),
  INDEX `fk_prova_idx` (`idProveidor` ASC) ,
  CONSTRAINT `fk_ulleres_proveidor`
    FOREIGN KEY (`idProveidor`)
    REFERENCES `dboptica`.`dtproveidor` (`idProveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci;


-- -----------------------------------------------------
-- Table `dboptica`.`dtvendes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dboptica`.`dtvendes` (
  `idUlleres` INT(11) NOT NULL,
  `idEmpleat` SMALLINT(4) NOT NULL,
  `dataVenda` DATE NULL DEFAULT NULL,
  `idClient` INT(5) NOT NULL,
  PRIMARY KEY (`idUlleres`, `idEmpleat`, `idClient`),
  INDEX `fk_vendes_empleat_idx` (`idEmpleat` ASC),
  INDEX `fk_vendes_client_idx` (`idClient` ASC) ,
  CONSTRAINT `fk_vendes_client`
    FOREIGN KEY (`idClient`)
    REFERENCES `dboptica`.`dtclients` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendes_empleat`
    FOREIGN KEY (`idEmpleat`)
    REFERENCES `dboptica`.`dtempleats` (`idEmpleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendes_ulleres`
    FOREIGN KEY (`idUlleres`)
    REFERENCES `dboptica`.`dtulleres` (`idUlleres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
