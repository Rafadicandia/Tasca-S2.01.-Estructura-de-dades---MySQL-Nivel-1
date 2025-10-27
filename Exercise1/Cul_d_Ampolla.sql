-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema Cul_d_Ampolla
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cul_d_Ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cul_d_Ampolla` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
)
ENGINE = InnoDB;

USE `Cul_d_Ampolla` ;

-- -----------------------------------------------------
-- Table `Cul_d_Ampolla`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul_d_Ampolla`.`Address` (
  `idAddress` INT NOT NULL AUTO_INCREMENT,
  `Street` VARCHAR(45) NULL,
  `Number` VARCHAR(45) NULL,
  `Floor` VARCHAR(45) NULL,
  `Door` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `PostalCode` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  PRIMARY KEY (`idAddress`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_d_Ampolla`.`Emails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul_d_Ampolla`.`Emails` (
  `idEmails` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idEmails`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_d_Ampolla`.`PhoneNumbers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul_d_Ampolla`.`PhoneNumbers` (
  `idPhoneNumbers` INT NOT NULL AUTO_INCREMENT,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `FaxNumber` VARCHAR(45) NULL,
  UNIQUE INDEX `PhoneNumber_UNIQUE` (`PhoneNumber` ASC) VISIBLE,
  PRIMARY KEY (`idPhoneNumbers`),
  UNIQUE INDEX `FaxNumber_UNIQUE` (`FaxNumber` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_d_Ampolla`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul_d_Ampolla`.`Employees` (
  `idEmployee` INT NOT NULL AUTO_INCREMENT,
  `EmployeeName` VARCHAR(45) NULL,
  `EmployeeSurname` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmployee`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_d_Ampolla`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul_d_Ampolla`.`Clients` (
  `idClient` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(20) NOT NULL,
  `Surname` VARCHAR(20) NOT NULL,
  `RegisterDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsRecommended` TINYINT NOT NULL,
  `ClientWhoRecommended` VARCHAR(60) NULL DEFAULT NULL,
  `idAddress` INT NOT NULL,
  `idEmails` INT NOT NULL,
  `idPhoneNumbers` INT NOT NULL,
  `idEmployee` INT NOT NULL,
  INDEX `Name` (`Name` ASC) VISIBLE,
  INDEX `Surname` (`Surname` ASC) VISIBLE,
  PRIMARY KEY (`idClient`),
  INDEX `fk_Clients_Address1_idx` (`idAddress` ASC) VISIBLE,
  INDEX `fk_Clients_Emails1_idx` (`idEmails` ASC) VISIBLE,
  INDEX `fk_Clients_PhoneNumbers1_idx` (`idPhoneNumbers` ASC) VISIBLE,
  INDEX `fk_Clients_Employees1_idx` (`idEmployee` ASC) VISIBLE,
  CONSTRAINT `fk_Clients_Address1`
    FOREIGN KEY (`idAddress`)
    REFERENCES `Cul_d_Ampolla`.`Address` (`idAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clients_Emails1`
    FOREIGN KEY (`idEmails`)
    REFERENCES `Cul_d_Ampolla`.`Emails` (`idEmails`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clients_PhoneNumbers1`
    FOREIGN KEY (`idPhoneNumbers`)
    REFERENCES `Cul_d_Ampolla`.`PhoneNumbers` (`idPhoneNumbers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clients_Employees1`
    FOREIGN KEY (`idEmployee`)
    REFERENCES `Cul_d_Ampolla`.`Employees` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Cul_d_Ampolla`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul_d_Ampolla`.`Supplier` (
  `idSupplier` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(60) NOT NULL,
  `NIF` VARCHAR(10) NOT NULL,
  `PhoneNumbers_idPhoneNumbers` INT NOT NULL,
  `Address_idAddress` INT NOT NULL,
  PRIMARY KEY (`idSupplier`),
  INDEX `Name` (`Name` ASC) VISIBLE,
  INDEX `fk_Supplier_PhoneNumbers1_idx` (`PhoneNumbers_idPhoneNumbers` ASC) VISIBLE,
  INDEX `fk_Supplier_Address1_idx` (`Address_idAddress` ASC) VISIBLE,
  CONSTRAINT `fk_Supplier_PhoneNumbers1`
    FOREIGN KEY (`PhoneNumbers_idPhoneNumbers`)
    REFERENCES `Cul_d_Ampolla`.`PhoneNumbers` (`idPhoneNumbers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Supplier_Address1`
    FOREIGN KEY (`Address_idAddress`)
    REFERENCES `Cul_d_Ampolla`.`Address` (`idAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Cul_d_Ampolla`.`Glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul_d_Ampolla`.`Glasses` (
  `idGlasses` INT NOT NULL AUTO_INCREMENT,
  `Brand` VARCHAR(20) NOT NULL,
  `Graduation` VARCHAR(5) NOT NULL,
  `FrameType` VARCHAR(15) NOT NULL,
  `FrameColor` VARCHAR(10) NOT NULL,
  `GlassColor` VARCHAR(20) NOT NULL,
  `Price` DECIMAL(6) NOT NULL,
  `idSupplier` INT NOT NULL,
  PRIMARY KEY (`idGlasses`),
  INDEX `fk_Glasses_Supplier1_idx` (`idSupplier` ASC) VISIBLE,
  CONSTRAINT `fk_Glasses_Supplier1`
    FOREIGN KEY (`idSupplier`)
    REFERENCES `Cul_d_Ampolla`.`Supplier` (`idSupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Cul_d_Ampolla`.`Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul_d_Ampolla`.`Sales` (
  `idSales` INT NOT NULL AUTO_INCREMENT,
  `InboxNumber` INT NOT NULL,
  `SaleDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmployee` INT NOT NULL,
  `idClient` INT NOT NULL,
  `Glasses_idGlasses` INT NOT NULL,
  PRIMARY KEY (`idSales`),
  UNIQUE INDEX `InboxeNumber_UNIQUE` (`InboxNumber` ASC) VISIBLE,
  INDEX `fk_Sales_Employees1_idx` (`idEmployee` ASC) VISIBLE,
  INDEX `fk_Sales_Clients1_idx` (`idClient` ASC) VISIBLE,
  INDEX `fk_Sales_Glasses1_idx` (`Glasses_idGlasses` ASC) VISIBLE,
  CONSTRAINT `fk_Sales_Employees1`
    FOREIGN KEY (`idEmployee`)
    REFERENCES `Cul_d_Ampolla`.`Employees` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_Clients1`
    FOREIGN KEY (`idClient`)
    REFERENCES `Cul_d_Ampolla`.`Clients` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_Glasses1`
    FOREIGN KEY (`Glasses_idGlasses`)
    REFERENCES `Cul_d_Ampolla`.`Glasses` (`idGlasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
