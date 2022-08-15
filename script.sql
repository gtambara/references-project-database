-- MySQL Script generated by MySQL Workbench
-- Mon Aug 15 19:08:38 2022
-- Model: New Model    Version: 1.0
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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`InitialPage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`InitialPage` ;

CREATE TABLE IF NOT EXISTS `mydb`.`InitialPage` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Number` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Topic` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Topic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Topic` VARCHAR(64) NOT NULL,
  `Description` VARCHAR(128) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TitleOfResearcher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TitleOfResearcher` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TitleOfResearcher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProjectOfResearcher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ProjectOfResearcher` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ProjectOfResearcher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Researcher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Researcher` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Researcher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `IsCommercialWorker` TINYINT NULL,
  `TitleOfResearcher_id` INT NOT NULL,
  `ProjectOfResearcher_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Researcher_TitleOfResearcher1_idx` (`TitleOfResearcher_id` ASC) VISIBLE,
  INDEX `fk_Researcher_ProjectOfResearcher1_idx` (`ProjectOfResearcher_id` ASC) VISIBLE,
  CONSTRAINT `fk_Researcher_TitleOfResearcher1`
    FOREIGN KEY (`TitleOfResearcher_id`)
    REFERENCES `mydb`.`TitleOfResearcher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Researcher_ProjectOfResearcher1`
    FOREIGN KEY (`ProjectOfResearcher_id`)
    REFERENCES `mydb`.`ProjectOfResearcher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Occupation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Occupation` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Occupation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ComercialEmployee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ComercialEmployee` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ComercialEmployee` (
  `id` INT NOT NULL,
  `Occupation_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ComercialEmployee_Occupation1_idx` (`Occupation_id` ASC) VISIBLE,
  CONSTRAINT `fk_ComercialEmployee_Occupation1`
    FOREIGN KEY (`Occupation_id`)
    REFERENCES `mydb`.`Occupation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Schooling`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Schooling` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Schooling` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Level` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MaritalStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MaritalStatus` ;

CREATE TABLE IF NOT EXISTS `mydb`.`MaritalStatus` (
  `id` INT NOT NULL,
  `MaritalStatus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gender`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Gender` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Gender` (
  `id` INT NOT NULL,
  `Gender` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Nationality`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Nationality` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Nationality` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Author` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Author` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ComercialEmployee_id` INT NULL,
  `Researcher_id` INT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `RG` VARCHAR(45) NOT NULL,
  `Schooling_id` INT NOT NULL,
  `MaritalStatus_id` INT NOT NULL,
  `Gender_id` INT NOT NULL,
  `Nationality_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  UNIQUE INDEX `RG_UNIQUE` (`RG` ASC) VISIBLE,
  INDEX `fk_Author_Researcher1_idx` (`Researcher_id` ASC) VISIBLE,
  INDEX `fk_Author_ComercialEmployee1_idx` (`ComercialEmployee_id` ASC) VISIBLE,
  INDEX `fk_Author_Schooling1_idx` (`Schooling_id` ASC) VISIBLE,
  INDEX `fk_Author_MaritalStatus1_idx` (`MaritalStatus_id` ASC) VISIBLE,
  INDEX `fk_Author_Gender1_idx` (`Gender_id` ASC) VISIBLE,
  INDEX `fk_Author_Nationality1_idx` (`Nationality_id` ASC) VISIBLE,
  CONSTRAINT `fk_Author_Researcher1`
    FOREIGN KEY (`Researcher_id`)
    REFERENCES `mydb`.`Researcher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Author_ComercialEmployee1`
    FOREIGN KEY (`ComercialEmployee_id`)
    REFERENCES `mydb`.`ComercialEmployee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Author_Schooling1`
    FOREIGN KEY (`Schooling_id`)
    REFERENCES `mydb`.`Schooling` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Author_MaritalStatus1`
    FOREIGN KEY (`MaritalStatus_id`)
    REFERENCES `mydb`.`MaritalStatus` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Author_Gender1`
    FOREIGN KEY (`Gender_id`)
    REFERENCES `mydb`.`Gender` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Author_Nationality1`
    FOREIGN KEY (`Nationality_id`)
    REFERENCES `mydb`.`Nationality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`WebAddress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`WebAddress` ;

CREATE TABLE IF NOT EXISTS `mydb`.`WebAddress` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `URL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Institution`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Institution` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Institution` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `WebAddress_id` INT NOT NULL,
  PRIMARY KEY (`id`, `WebAddress_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Institution_WebAddress1_idx` (`WebAddress_id` ASC) VISIBLE,
  CONSTRAINT `fk_Institution_WebAddress1`
    FOREIGN KEY (`WebAddress_id`)
    REFERENCES `mydb`.`WebAddress` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Journal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Journal` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Journal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(128) NOT NULL,
  `Abstract` VARCHAR(512) NOT NULL,
  `PublishDate` DATE NOT NULL,
  `InitialPage_id` INT NOT NULL,
  `Topic_id` INT NOT NULL,
  `Author_id` INT NOT NULL,
  `Institution_id` INT NOT NULL,
  PRIMARY KEY (`id`, `InitialPage_id`, `Author_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Journal_InitialPage1_idx` (`InitialPage_id` ASC) VISIBLE,
  INDEX `fk_Journal_Topic1_idx` (`Topic_id` ASC) VISIBLE,
  INDEX `fk_Journal_Author1_idx` (`Author_id` ASC) VISIBLE,
  INDEX `fk_Journal_Institution1_idx` (`Institution_id` ASC) VISIBLE,
  CONSTRAINT `fk_Journal_InitialPage1`
    FOREIGN KEY (`InitialPage_id`)
    REFERENCES `mydb`.`InitialPage` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Journal_Topic1`
    FOREIGN KEY (`Topic_id`)
    REFERENCES `mydb`.`Topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Journal_Author1`
    FOREIGN KEY (`Author_id`)
    REFERENCES `mydb`.`Author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Journal_Institution1`
    FOREIGN KEY (`Institution_id`)
    REFERENCES `mydb`.`Institution` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Keyword` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Keyword` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Keyword` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PublishingCompany`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PublishingCompany` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PublishingCompany` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `WebAddress_id` INT NOT NULL,
  PRIMARY KEY (`id`, `WebAddress_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Editor_WebAddress1_idx` (`WebAddress_id` ASC) VISIBLE,
  CONSTRAINT `fk_Editor_WebAddress1`
    FOREIGN KEY (`WebAddress_id`)
    REFERENCES `mydb`.`WebAddress` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Email`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Email` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Email` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `PublishingCompany_id` INT NULL,
  `Institution_id` INT NULL,
  `Author_id` INT NULL,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_Email_PublishingCompany1_idx` (`PublishingCompany_id` ASC) VISIBLE,
  INDEX `fk_Email_Institution1_idx` (`Institution_id` ASC) VISIBLE,
  INDEX `fk_Email_Author1_idx` (`Author_id` ASC) VISIBLE,
  CONSTRAINT `fk_Email_PublishingCompany1`
    FOREIGN KEY (`PublishingCompany_id`)
    REFERENCES `mydb`.`PublishingCompany` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Email_Institution1`
    FOREIGN KEY (`Institution_id`)
    REFERENCES `mydb`.`Institution` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Email_Author1`
    FOREIGN KEY (`Author_id`)
    REFERENCES `mydb`.`Author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PhoneCode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PhoneCode` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PhoneCode` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Code` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `Code_UNIQUE` (`Code` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Country` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Country` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FUStateProvince`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`FUStateProvince` ;

CREATE TABLE IF NOT EXISTS `mydb`.`FUStateProvince` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Country_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Country_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_FUStateProvince_Country1_idx` (`Country_id` ASC) VISIBLE,
  CONSTRAINT `fk_FUStateProvince_Country1`
    FOREIGN KEY (`Country_id`)
    REFERENCES `mydb`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`City`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`City` ;

CREATE TABLE IF NOT EXISTS `mydb`.`City` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `PhoneCode_id` INT NOT NULL,
  `FUStateProvince_id` INT NOT NULL,
  `FUStateProvince_Country_id` INT NOT NULL,
  PRIMARY KEY (`id`, `PhoneCode_id`, `FUStateProvince_id`, `FUStateProvince_Country_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_City_PhoneCode1_idx` (`PhoneCode_id` ASC) VISIBLE,
  INDEX `fk_City_FUStateProvince1_idx` (`FUStateProvince_id` ASC, `FUStateProvince_Country_id` ASC) VISIBLE,
  CONSTRAINT `fk_City_PhoneCode1`
    FOREIGN KEY (`PhoneCode_id`)
    REFERENCES `mydb`.`PhoneCode` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_City_FUStateProvince1`
    FOREIGN KEY (`FUStateProvince_id` , `FUStateProvince_Country_id`)
    REFERENCES `mydb`.`FUStateProvince` (`id` , `Country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Neighborhood`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Neighborhood` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Neighborhood` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Neighborhood` VARCHAR(45) NULL,
  `City_id` INT NOT NULL,
  `City_PhoneCode_id` INT NOT NULL,
  `City_FUStateProvince_id` INT NOT NULL,
  `City_FUStateProvince_Country_id` INT NOT NULL,
  PRIMARY KEY (`id`, `City_id`, `City_PhoneCode_id`, `City_FUStateProvince_id`, `City_FUStateProvince_Country_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Neighborhood_City1_idx` (`City_id` ASC, `City_PhoneCode_id` ASC, `City_FUStateProvince_id` ASC, `City_FUStateProvince_Country_id` ASC) VISIBLE,
  CONSTRAINT `fk_Neighborhood_City1`
    FOREIGN KEY (`City_id` , `City_PhoneCode_id` , `City_FUStateProvince_id` , `City_FUStateProvince_Country_id`)
    REFERENCES `mydb`.`City` (`id` , `PhoneCode_id` , `FUStateProvince_id` , `FUStateProvince_Country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AddressType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`AddressType` ;

CREATE TABLE IF NOT EXISTS `mydb`.`AddressType` (
  `id` INT NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Address` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Complement` VARCHAR(45) NULL,
  `Neighborhood_id` INT NOT NULL,
  `Neighborhood_City_id` INT NOT NULL,
  `Neighborhood_City_PhoneCode_id` INT NOT NULL,
  `Neighborhood_City_FUStateProvince_id` INT NOT NULL,
  `Neighborhood_City_FUStateProvince_Country_id` INT NOT NULL,
  `AddressType_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Neighborhood_id`, `Neighborhood_City_id`, `Neighborhood_City_PhoneCode_id`, `Neighborhood_City_FUStateProvince_id`, `Neighborhood_City_FUStateProvince_Country_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Address_Neighborhood1_idx` (`Neighborhood_id` ASC, `Neighborhood_City_id` ASC, `Neighborhood_City_PhoneCode_id` ASC, `Neighborhood_City_FUStateProvince_id` ASC, `Neighborhood_City_FUStateProvince_Country_id` ASC) VISIBLE,
  INDEX `fk_Address_AddressType1_idx` (`AddressType_id` ASC) VISIBLE,
  CONSTRAINT `fk_Address_Neighborhood1`
    FOREIGN KEY (`Neighborhood_id` , `Neighborhood_City_id` , `Neighborhood_City_PhoneCode_id` , `Neighborhood_City_FUStateProvince_id` , `Neighborhood_City_FUStateProvince_Country_id`)
    REFERENCES `mydb`.`Neighborhood` (`id` , `City_id` , `City_PhoneCode_id` , `City_FUStateProvince_id` , `City_FUStateProvince_Country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Address_AddressType1`
    FOREIGN KEY (`AddressType_id`)
    REFERENCES `mydb`.`AddressType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Event` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Date` DATE NOT NULL,
  `Address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Event_Address1_idx` (`Address_id` ASC) VISIBLE,
  CONSTRAINT `fk_Event_Address1`
    FOREIGN KEY (`Address_id`)
    REFERENCES `mydb`.`Address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Section` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Section` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NULL,
  `Number` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PhoneType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PhoneType` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PhoneType` (
  `id` INT NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PhoneNumber`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PhoneNumber` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PhoneNumber` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Number` VARCHAR(9) NOT NULL,
  `PhoneCode_id` INT NOT NULL,
  `PhoneType_id` INT NOT NULL,
  `Author_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_PhoneNumber_PhoneCode1_idx` (`PhoneCode_id` ASC) VISIBLE,
  INDEX `fk_PhoneNumber_PhoneType1_idx` (`PhoneType_id` ASC) VISIBLE,
  INDEX `fk_PhoneNumber_Author1_idx` (`Author_id` ASC) VISIBLE,
  CONSTRAINT `fk_PhoneNumber_PhoneCode1`
    FOREIGN KEY (`PhoneCode_id`)
    REFERENCES `mydb`.`PhoneCode` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PhoneNumber_PhoneType1`
    FOREIGN KEY (`PhoneType_id`)
    REFERENCES `mydb`.`PhoneType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PhoneNumber_Author1`
    FOREIGN KEY (`Author_id`)
    REFERENCES `mydb`.`Author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Article` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Article` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(128) NOT NULL,
  `Abstract` VARCHAR(512) NOT NULL,
  `PublishDate` DATE NOT NULL,
  `FromWeb` TINYINT NULL,
  `WebAddress_id` INT NOT NULL,
  `Topic_id` INT NOT NULL,
  `Author_id` INT NOT NULL,
  `Institution_id` INT NOT NULL,
  `Event_id` INT NOT NULL,
  PRIMARY KEY (`id`, `WebAddress_id`, `Author_id`, `Event_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Article_WebAddress1_idx` (`WebAddress_id` ASC) VISIBLE,
  INDEX `fk_Article_Topic1_idx` (`Topic_id` ASC) VISIBLE,
  INDEX `fk_Article_Author1_idx` (`Author_id` ASC) VISIBLE,
  INDEX `fk_Article_Institution1_idx` (`Institution_id` ASC) VISIBLE,
  INDEX `fk_Article_Event1_idx` (`Event_id` ASC) VISIBLE,
  CONSTRAINT `fk_Article_WebAddress1`
    FOREIGN KEY (`WebAddress_id`)
    REFERENCES `mydb`.`WebAddress` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Article_Topic1`
    FOREIGN KEY (`Topic_id`)
    REFERENCES `mydb`.`Topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Article_Author1`
    FOREIGN KEY (`Author_id`)
    REFERENCES `mydb`.`Author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Article_Institution1`
    FOREIGN KEY (`Institution_id`)
    REFERENCES `mydb`.`Institution` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Article_Event1`
    FOREIGN KEY (`Event_id`)
    REFERENCES `mydb`.`Event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Book` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(128) NOT NULL,
  `Abstract` VARCHAR(512) NOT NULL,
  `PublishDate` DATE NOT NULL,
  `InitialPage_id` INT NOT NULL,
  `Topic_id` INT NOT NULL,
  `Author_id` INT NOT NULL,
  `Institution_id` INT NOT NULL,
  PRIMARY KEY (`id`, `InitialPage_id`, `Author_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Book_InitialPage1_idx` (`InitialPage_id` ASC) VISIBLE,
  INDEX `fk_Book_Topic1_idx` (`Topic_id` ASC) VISIBLE,
  INDEX `fk_Book_Author1_idx` (`Author_id` ASC) VISIBLE,
  INDEX `fk_Book_Institution1_idx` (`Institution_id` ASC) VISIBLE,
  CONSTRAINT `fk_Book_InitialPage1`
    FOREIGN KEY (`InitialPage_id`)
    REFERENCES `mydb`.`InitialPage` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_Topic1`
    FOREIGN KEY (`Topic_id`)
    REFERENCES `mydb`.`Topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_Author1`
    FOREIGN KEY (`Author_id`)
    REFERENCES `mydb`.`Author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_Institution1`
    FOREIGN KEY (`Institution_id`)
    REFERENCES `mydb`.`Institution` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Thesis`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Thesis` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Thesis` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(128) NOT NULL,
  `Abstract` VARCHAR(512) NOT NULL,
  `PublishDate` DATE NOT NULL,
  `Topic_id` INT NOT NULL,
  `Author_id` INT NOT NULL,
  `Institution_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Author_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Thesis_Topic1_idx` (`Topic_id` ASC) VISIBLE,
  INDEX `fk_Thesis_Author1_idx` (`Author_id` ASC) VISIBLE,
  INDEX `fk_Thesis_Institution1_idx` (`Institution_id` ASC) VISIBLE,
  CONSTRAINT `fk_Thesis_Topic1`
    FOREIGN KEY (`Topic_id`)
    REFERENCES `mydb`.`Topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Thesis_Author1`
    FOREIGN KEY (`Author_id`)
    REFERENCES `mydb`.`Author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Thesis_Institution1`
    FOREIGN KEY (`Institution_id`)
    REFERENCES `mydb`.`Institution` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Edition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Edition` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Edition` (
  `id` INT NOT NULL,
  `Number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Thesis_Orienter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Thesis_Orienter` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Thesis_Orienter` (
  `Thesis_id` INT NOT NULL,
  `Author_id` INT NOT NULL,
  PRIMARY KEY (`Thesis_id`, `Author_id`),
  INDEX `fk_Thesis_has_Author_Author1_idx` (`Author_id` ASC) VISIBLE,
  INDEX `fk_Thesis_has_Author_Thesis1_idx` (`Thesis_id` ASC) VISIBLE,
  CONSTRAINT `fk_Thesis_has_Author_Thesis1`
    FOREIGN KEY (`Thesis_id`)
    REFERENCES `mydb`.`Thesis` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Thesis_has_Author_Author1`
    FOREIGN KEY (`Author_id`)
    REFERENCES `mydb`.`Author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Journal_has_Section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Journal_has_Section` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Journal_has_Section` (
  `Journal_id` INT NOT NULL,
  `Section_id` INT NOT NULL,
  PRIMARY KEY (`Journal_id`, `Section_id`),
  INDEX `fk_Journal_has_Section_Section1_idx` (`Section_id` ASC) VISIBLE,
  INDEX `fk_Journal_has_Section_Journal1_idx` (`Journal_id` ASC) VISIBLE,
  CONSTRAINT `fk_Journal_has_Section_Journal1`
    FOREIGN KEY (`Journal_id`)
    REFERENCES `mydb`.`Journal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Journal_has_Section_Section1`
    FOREIGN KEY (`Section_id`)
    REFERENCES `mydb`.`Section` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AccessDate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`AccessDate` ;

CREATE TABLE IF NOT EXISTS `mydb`.`AccessDate` (
  `id` INT NOT NULL,
  `AccessDate` VARCHAR(45) NULL,
  `Article_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_AccessDate_Article1_idx` (`Article_id` ASC) VISIBLE,
  CONSTRAINT `fk_AccessDate_Article1`
    FOREIGN KEY (`Article_id`)
    REFERENCES `mydb`.`Article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Book_has_Edition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Book_has_Edition` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Book_has_Edition` (
  `Book_id` INT NOT NULL,
  `Edition_id` INT NOT NULL,
  PRIMARY KEY (`Book_id`, `Edition_id`),
  INDEX `fk_Book_has_Edition_Edition1_idx` (`Edition_id` ASC) VISIBLE,
  INDEX `fk_Book_has_Edition_Book1_idx` (`Book_id` ASC) VISIBLE,
  CONSTRAINT `fk_Book_has_Edition_Book1`
    FOREIGN KEY (`Book_id`)
    REFERENCES `mydb`.`Book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_has_Edition_Edition1`
    FOREIGN KEY (`Edition_id`)
    REFERENCES `mydb`.`Edition` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Thesis_has_Section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Thesis_has_Section` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Thesis_has_Section` (
  `Thesis_id` INT NOT NULL,
  `Section_id` INT NOT NULL,
  PRIMARY KEY (`Thesis_id`, `Section_id`),
  INDEX `fk_Thesis_has_Section_Section1_idx` (`Section_id` ASC) VISIBLE,
  INDEX `fk_Thesis_has_Section_Thesis1_idx` (`Thesis_id` ASC) VISIBLE,
  CONSTRAINT `fk_Thesis_has_Section_Thesis1`
    FOREIGN KEY (`Thesis_id`)
    REFERENCES `mydb`.`Thesis` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Thesis_has_Section_Section1`
    FOREIGN KEY (`Section_id`)
    REFERENCES `mydb`.`Section` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Journal_has_Edition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Journal_has_Edition` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Journal_has_Edition` (
  `Journal_id` INT NOT NULL,
  `Edition_id` INT NOT NULL,
  PRIMARY KEY (`Journal_id`, `Edition_id`),
  INDEX `fk_Journal_has_Edition_Edition1_idx` (`Edition_id` ASC) VISIBLE,
  INDEX `fk_Journal_has_Edition_Journal1_idx` (`Journal_id` ASC) VISIBLE,
  CONSTRAINT `fk_Journal_has_Edition_Journal1`
    FOREIGN KEY (`Journal_id`)
    REFERENCES `mydb`.`Journal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Journal_has_Edition_Edition1`
    FOREIGN KEY (`Edition_id`)
    REFERENCES `mydb`.`Edition` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Journal_has_Keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Journal_has_Keyword` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Journal_has_Keyword` (
  `Journal_id` INT NOT NULL,
  `Keyword_id` INT NOT NULL,
  PRIMARY KEY (`Journal_id`, `Keyword_id`),
  INDEX `fk_Journal_has_Keyword_Keyword1_idx` (`Keyword_id` ASC) VISIBLE,
  INDEX `fk_Journal_has_Keyword_Journal1_idx` (`Journal_id` ASC) VISIBLE,
  CONSTRAINT `fk_Journal_has_Keyword_Journal1`
    FOREIGN KEY (`Journal_id`)
    REFERENCES `mydb`.`Journal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Journal_has_Keyword_Keyword1`
    FOREIGN KEY (`Keyword_id`)
    REFERENCES `mydb`.`Keyword` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Article_has_Keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Article_has_Keyword` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Article_has_Keyword` (
  `Article_id` INT NOT NULL,
  `Keyword_id` INT NOT NULL,
  PRIMARY KEY (`Article_id`, `Keyword_id`),
  INDEX `fk_Article_has_Keyword_Keyword1_idx` (`Keyword_id` ASC) VISIBLE,
  INDEX `fk_Article_has_Keyword_Article1_idx` (`Article_id` ASC) VISIBLE,
  CONSTRAINT `fk_Article_has_Keyword_Article1`
    FOREIGN KEY (`Article_id`)
    REFERENCES `mydb`.`Article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Article_has_Keyword_Keyword1`
    FOREIGN KEY (`Keyword_id`)
    REFERENCES `mydb`.`Keyword` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Book_has_Keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Book_has_Keyword` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Book_has_Keyword` (
  `Book_id` INT NOT NULL,
  `Keyword_id` INT NOT NULL,
  PRIMARY KEY (`Book_id`, `Keyword_id`),
  INDEX `fk_Book_has_Keyword_Keyword1_idx` (`Keyword_id` ASC) VISIBLE,
  INDEX `fk_Book_has_Keyword_Book1_idx` (`Book_id` ASC) VISIBLE,
  CONSTRAINT `fk_Book_has_Keyword_Book1`
    FOREIGN KEY (`Book_id`)
    REFERENCES `mydb`.`Book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_has_Keyword_Keyword1`
    FOREIGN KEY (`Keyword_id`)
    REFERENCES `mydb`.`Keyword` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Thesis_has_Keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Thesis_has_Keyword` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Thesis_has_Keyword` (
  `Thesis_id` INT NOT NULL,
  `Keyword_id` INT NOT NULL,
  PRIMARY KEY (`Thesis_id`, `Keyword_id`),
  INDEX `fk_Thesis_has_Keyword_Keyword1_idx` (`Keyword_id` ASC) VISIBLE,
  INDEX `fk_Thesis_has_Keyword_Thesis1_idx` (`Thesis_id` ASC) VISIBLE,
  CONSTRAINT `fk_Thesis_has_Keyword_Thesis1`
    FOREIGN KEY (`Thesis_id`)
    REFERENCES `mydb`.`Thesis` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Thesis_has_Keyword_Keyword1`
    FOREIGN KEY (`Keyword_id`)
    REFERENCES `mydb`.`Keyword` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Journal_has_PublishingCompany`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Journal_has_PublishingCompany` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Journal_has_PublishingCompany` (
  `Journal_id` INT NOT NULL,
  `PublishingCompany_id` INT NOT NULL,
  PRIMARY KEY (`Journal_id`, `PublishingCompany_id`),
  INDEX `fk_Journal_has_PublishingCompany_PublishingCompany1_idx` (`PublishingCompany_id` ASC) VISIBLE,
  INDEX `fk_Journal_has_PublishingCompany_Journal1_idx` (`Journal_id` ASC) VISIBLE,
  CONSTRAINT `fk_Journal_has_PublishingCompany_Journal1`
    FOREIGN KEY (`Journal_id`)
    REFERENCES `mydb`.`Journal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Journal_has_PublishingCompany_PublishingCompany1`
    FOREIGN KEY (`PublishingCompany_id`)
    REFERENCES `mydb`.`PublishingCompany` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Book_has_PublishingCompany`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Book_has_PublishingCompany` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Book_has_PublishingCompany` (
  `Book_id` INT NOT NULL,
  `PublishingCompany_id` INT NOT NULL,
  PRIMARY KEY (`Book_id`, `PublishingCompany_id`),
  INDEX `fk_Book_has_PublishingCompany_PublishingCompany1_idx` (`PublishingCompany_id` ASC) VISIBLE,
  INDEX `fk_Book_has_PublishingCompany_Book1_idx` (`Book_id` ASC) VISIBLE,
  CONSTRAINT `fk_Book_has_PublishingCompany_Book1`
    FOREIGN KEY (`Book_id`)
    REFERENCES `mydb`.`Book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_has_PublishingCompany_PublishingCompany1`
    FOREIGN KEY (`PublishingCompany_id`)
    REFERENCES `mydb`.`PublishingCompany` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Author_has_Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Author_has_Address` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Author_has_Address` (
  `Author_id` INT NOT NULL,
  `Address_id` INT NOT NULL,
  PRIMARY KEY (`Author_id`, `Address_id`),
  INDEX `fk_Author_has_Address_Address1_idx` (`Address_id` ASC) VISIBLE,
  INDEX `fk_Author_has_Address_Author1_idx` (`Author_id` ASC) VISIBLE,
  CONSTRAINT `fk_Author_has_Address_Author1`
    FOREIGN KEY (`Author_id`)
    REFERENCES `mydb`.`Author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Author_has_Address_Address1`
    FOREIGN KEY (`Address_id`)
    REFERENCES `mydb`.`Address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
