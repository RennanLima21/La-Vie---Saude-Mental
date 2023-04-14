-- MySQL Script generated by MySQL Workbench
-- Thu Apr 13 04:14:44 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ClínicaLaVie
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ClínicaLaVie
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ClínicaLaVie` DEFAULT CHARACTER SET utf8 ;
USE `ClínicaLaVie` ;

-- -----------------------------------------------------
-- Table `ClínicaLaVie`.`PSICÓLOGOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClínicaLaVie`.`PSICÓLOGOS` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(200) NOT NULL,
  `EMail` VARCHAR(150) NOT NULL,
  `Senha` VARCHAR(150) NOT NULL,
  `Apresentacao` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClínicaLaVie`.`PACIENTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClínicaLaVie`.`PACIENTES` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(200) NOT NULL,
  `EMail` VARCHAR(150) NOT NULL,
  `Idade` DATE NOT NULL,
  `Telefone` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ClínicaLaVie`.`ATENDIMENTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ClínicaLaVie`.`ATENDIMENTOS` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `PACIENTES_ID` INT NOT NULL,
  `PSICÓLOGOS_ID` INT NOT NULL,
  `Data_Atendimento` DATETIME(6) NOT NULL,
  `Observacao` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`ID`, `PACIENTES_ID`, `PSICÓLOGOS_ID`),
  INDEX `fk_ATENDIMENTOS_PACIENTES1_idx` (`PACIENTES_ID` ASC) VISIBLE,
  INDEX `fk_ATENDIMENTOS_PSICÓLOGOS1_idx` (`PSICÓLOGOS_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ATENDIMENTOS_PACIENTES1`
    FOREIGN KEY (`PACIENTES_ID`)
    REFERENCES `ClínicaLaVie`.`PACIENTES` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ATENDIMENTOS_PSICÓLOGOS1`
    FOREIGN KEY (`PSICÓLOGOS_ID`)
    REFERENCES `ClínicaLaVie`.`PSICÓLOGOS` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
