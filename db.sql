-- Authors: Gabriel Tambara Rabelo
--          David Fanchic Chatelard
-- Date: 11 of August of 2022

---------------------- DESIGN ----------------------

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Topic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Topic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Topic` VARCHAR(64) NOT NULL,
  `Description` VARCHAR(128) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Institution`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Institution` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Document`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Document` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(128) NOT NULL,
  `Abstract` VARCHAR(512) NOT NULL,
  `Date` VARCHAR(45) NOT NULL,
  `Topic_id` INT NOT NULL,
  `Institution_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Topic_id`, `Institution_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Document_Topic1_idx` (`Topic_id` ASC) VISIBLE,
  INDEX `fk_Document_Institution1_idx` (`Institution_id` ASC) VISIBLE,
  CONSTRAINT `fk_Document_Topic1`
    FOREIGN KEY (`Topic_id`)
    REFERENCES `mydb`.`Topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Document_Institution1`
    FOREIGN KEY (`Institution_id`)
    REFERENCES `mydb`.`Institution` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Keyword`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Keyword` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Keyword` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Author` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Person_id` INT NOT NULL,
  `IsCommercialWorker` TINYINT NULL,
  PRIMARY KEY (`id`, `Person_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Author_Person1_idx` (`Person_id` ASC) VISIBLE,
  CONSTRAINT `fk_Author_Person1`
    FOREIGN KEY (`Person_id`)
    REFERENCES `mydb`.`Person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Email` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `Person_id` INT NULL,
  `Institution_id` INT NULL,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  PRIMARY KEY (`id`, `Person_id`, `Institution_id`),
  INDEX `fk_Email_Person1_idx` (`Person_id` ASC) VISIBLE,
  INDEX `fk_Email_Institution1_idx` (`Institution_id` ASC) VISIBLE,
  CONSTRAINT `fk_Email_Person1`
    FOREIGN KEY (`Person_id`)
    REFERENCES `mydb`.`Person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Email_Institution1`
    FOREIGN KEY (`Institution_id`)
    REFERENCES `mydb`.`Institution` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Researcher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Researcher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Author_id` INT NOT NULL,
  `Author_Person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Author_id`, `Author_Person_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Researcher_Author1_idx` (`Author_id` ASC, `Author_Person_id` ASC) VISIBLE,
  CONSTRAINT `fk_Researcher_Author1`
    FOREIGN KEY (`Author_id` , `Author_Person_id`)
    REFERENCES `mydb`.`Author` (`id` , `Person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TitleOfResearcher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TitleOfResearcher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NOT NULL,
  `Researcher_id` INT NOT NULL,
  `Researcher_Author_id` INT NOT NULL,
  `Researcher_Author_Person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Researcher_id`, `Researcher_Author_id`, `Researcher_Author_Person_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_TitleOfResearcher_Researcher1_idx` (`Researcher_id` ASC, `Researcher_Author_id` ASC, `Researcher_Author_Person_id` ASC) VISIBLE,
  CONSTRAINT `fk_TitleOfResearcher_Researcher1`
    FOREIGN KEY (`Researcher_id` , `Researcher_Author_id` , `Researcher_Author_Person_id`)
    REFERENCES `mydb`.`Researcher` (`id` , `Author_id` , `Author_Person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProjectOfResearcher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ProjectOfResearcher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Researcher_id` INT NOT NULL,
  `Researcher_Author_id` INT NOT NULL,
  `Researcher_Author_Person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Researcher_id`, `Researcher_Author_id`, `Researcher_Author_Person_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_ProjectOfResearcher_Researcher1_idx` (`Researcher_id` ASC, `Researcher_Author_id` ASC, `Researcher_Author_Person_id` ASC) VISIBLE,
  CONSTRAINT `fk_ProjectOfResearcher_Researcher1`
    FOREIGN KEY (`Researcher_id` , `Researcher_Author_id` , `Researcher_Author_Person_id`)
    REFERENCES `mydb`.`Researcher` (`id` , `Author_id` , `Author_Person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ComercialEmployee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ComercialEmployee` (
  `id` INT NOT NULL,
  `Author_id` INT NOT NULL,
  `Author_Person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Author_id`, `Author_Person_id`),
  INDEX `fk_ComercialEmployee_Author1_idx` (`Author_id` ASC, `Author_Person_id` ASC) VISIBLE,
  CONSTRAINT `fk_ComercialEmployee_Author1`
    FOREIGN KEY (`Author_id` , `Author_Person_id`)
    REFERENCES `mydb`.`Author` (`id` , `Person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Occupation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Occupation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Person_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Occupation_Person_idx` (`Person_id` ASC) VISIBLE,
  CONSTRAINT `fk_Occupation_Person`
    FOREIGN KEY (`Person_id`)
    REFERENCES `mydb`.`Person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orienter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orienter` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Person_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Orienter_Person1_idx` (`Person_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orienter_Person1`
    FOREIGN KEY (`Person_id`)
    REFERENCES `mydb`.`Person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Editor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Editor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Journal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Journal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Edition` VARCHAR(45) NOT NULL,
  `Editor_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Editor_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Journal_Editor1_idx` (`Editor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Journal_Editor1`
    FOREIGN KEY (`Editor_id`)
    REFERENCES `mydb`.`Editor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Article` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `FromWeb` TINYINT UNSIGNED NULL,
  `AccessDate` VARCHAR(45) NULL,
  `Event_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Event_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Article_Event1_idx` (`Event_id` ASC) VISIBLE,
  CONSTRAINT `fk_Article_Event1`
    FOREIGN KEY (`Event_id`)
    REFERENCES `mydb`.`Event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`WebAddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`WebAddress` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `URL` VARCHAR(45) NOT NULL,
  `Institution_id` INT NULL,
  `Article_id` INT NULL,
  `Editor_id` INT NULL,
  PRIMARY KEY (`id`, `Institution_id`, `Article_id`, `Editor_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_WebAddress_Institution1_idx` (`Institution_id` ASC) VISIBLE,
  INDEX `fk_WebAddress_Article1_idx` (`Article_id` ASC) VISIBLE,
  INDEX `fk_WebAddress_Editor1_idx` (`Editor_id` ASC) VISIBLE,
  CONSTRAINT `fk_WebAddress_Institution1`
    FOREIGN KEY (`Institution_id`)
    REFERENCES `mydb`.`Institution` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_WebAddress_Article1`
    FOREIGN KEY (`Article_id`)
    REFERENCES `mydb`.`Article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_WebAddress_Editor1`
    FOREIGN KEY (`Editor_id`)
    REFERENCES `mydb`.`Editor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Complement` VARCHAR(45) NULL,
  `Addressescol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Thesis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Thesis` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Orienter_id` INT NOT NULL,
  `Orienter_Person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Orienter_id`, `Orienter_Person_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Thesis_Orienter1_idx` (`Orienter_id` ASC, `Orienter_Person_id` ASC) VISIBLE,
  CONSTRAINT `fk_Thesis_Orienter1`
    FOREIGN KEY (`Orienter_id` , `Orienter_Person_id`)
    REFERENCES `mydb`.`Orienter` (`id` , `Person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Section` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NULL,
  `Number` INT NOT NULL,
  `Thesis_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Thesis_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Section_Thesis1_idx` (`Thesis_id` ASC) VISIBLE,
  CONSTRAINT `fk_Section_Thesis1`
    FOREIGN KEY (`Thesis_id`)
    REFERENCES `mydb`.`Thesis` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Edition` INT NOT NULL,
  `Editor_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Editor_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Book_Editor1_idx` (`Editor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Book_Editor1`
    FOREIGN KEY (`Editor_id`)
    REFERENCES `mydb`.`Editor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`InitialPage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`InitialPage` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Number` INT NOT NULL,
  `Journal_id` INT NOT NULL,
  `Book_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Journal_id`, `Book_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_InitialPage_Journal1_idx` (`Journal_id` ASC) VISIBLE,
  INDEX `fk_InitialPage_Book1_idx` (`Book_id` ASC) VISIBLE,
  CONSTRAINT `fk_InitialPage_Journal1`
    FOREIGN KEY (`Journal_id`)
    REFERENCES `mydb`.`Journal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_InitialPage_Book1`
    FOREIGN KEY (`Book_id`)
    REFERENCES `mydb`.`Book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Country` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Address_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Address_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Country_Address1_idx` (`Address_id` ASC) VISIBLE,
  CONSTRAINT `fk_Country_Address1`
    FOREIGN KEY (`Address_id`)
    REFERENCES `mydb`.`Address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FUStateProvince`
-- -----------------------------------------------------
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
-- Table `mydb`.`PhoneNumber`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PhoneNumber` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Number` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PhoneCode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PhoneCode` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Code` VARCHAR(2) NOT NULL,
  `PhoneNumber_id` INT NOT NULL,
  PRIMARY KEY (`id`, `PhoneNumber_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `Code_UNIQUE` (`Code` ASC) VISIBLE,
  INDEX `fk_PhoneCode_PhoneNumber1_idx` (`PhoneNumber_id` ASC) VISIBLE,
  CONSTRAINT `fk_PhoneCode_PhoneNumber1`
    FOREIGN KEY (`PhoneNumber_id`)
    REFERENCES `mydb`.`PhoneNumber` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`City`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`City` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `FUStateProvince_id` INT NOT NULL,
  `PhoneCode_id` INT NOT NULL,
  PRIMARY KEY (`id`, `FUStateProvince_id`, `PhoneCode_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_City_FUStateProvince1_idx` (`FUStateProvince_id` ASC) VISIBLE,
  INDEX `fk_City_PhoneCode1_idx` (`PhoneCode_id` ASC) VISIBLE,
  CONSTRAINT `fk_City_FUStateProvince1`
    FOREIGN KEY (`FUStateProvince_id`)
    REFERENCES `mydb`.`FUStateProvince` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_City_PhoneCode1`
    FOREIGN KEY (`PhoneCode_id`)
    REFERENCES `mydb`.`PhoneCode` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Street`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Street` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Street` VARCHAR(45) NULL,
  `City_id` INT NOT NULL,
  PRIMARY KEY (`id`, `City_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Street_City1_idx` (`City_id` ASC) VISIBLE,
  CONSTRAINT `fk_Street_City1`
    FOREIGN KEY (`City_id`)
    REFERENCES `mydb`.`City` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Schooling`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Schooling` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Level` VARCHAR(45) NOT NULL,
  `Person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Person_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Schooling_Person1_idx` (`Person_id` ASC) VISIBLE,
  CONSTRAINT `fk_Schooling_Person1`
    FOREIGN KEY (`Person_id`)
    REFERENCES `mydb`.`Person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Nationality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nationality` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Person_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Person_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Nationality_Person1_idx` (`Person_id` ASC) VISIBLE,
  CONSTRAINT `fk_Nationality_Person1`
    FOREIGN KEY (`Person_id`)
    REFERENCES `mydb`.`Person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Keyword_has_Document`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Keyword_has_Document` (
  `Keyword_id` INT NOT NULL,
  `Document_id` INT NOT NULL,
  PRIMARY KEY (`Keyword_id`, `Document_id`),
  INDEX `fk_Keyword_has_Document_Document1_idx` (`Document_id` ASC) VISIBLE,
  INDEX `fk_Keyword_has_Document_Keyword1_idx` (`Keyword_id` ASC) VISIBLE,
  CONSTRAINT `fk_Keyword_has_Document_Keyword1`
    FOREIGN KEY (`Keyword_id`)
    REFERENCES `mydb`.`Keyword` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Keyword_has_Document_Document1`
    FOREIGN KEY (`Document_id`)
    REFERENCES `mydb`.`Document` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Author_has_Document`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Author_has_Document` (
  `Author_id` INT NOT NULL,
  `Author_Person_id` INT NOT NULL,
  `Document_id` INT NOT NULL,
  `Document_Topic_id` INT NOT NULL,
  PRIMARY KEY (`Author_id`, `Author_Person_id`, `Document_id`, `Document_Topic_id`),
  INDEX `fk_Author_has_Document_Document1_idx` (`Document_id` ASC, `Document_Topic_id` ASC) VISIBLE,
  INDEX `fk_Author_has_Document_Author1_idx` (`Author_id` ASC, `Author_Person_id` ASC) VISIBLE,
  CONSTRAINT `fk_Author_has_Document_Author1`
    FOREIGN KEY (`Author_id` , `Author_Person_id`)
    REFERENCES `mydb`.`Author` (`id` , `Person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Author_has_Document_Document1`
    FOREIGN KEY (`Document_id` , `Document_Topic_id`)
    REFERENCES `mydb`.`Document` (`id` , `Topic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Event_has_Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Event_has_Address` (
  `Event_id` INT NOT NULL,
  `Address_id` INT NOT NULL,
  PRIMARY KEY (`Event_id`, `Address_id`),
  INDEX `fk_Event_has_Address_Address1_idx` (`Address_id` ASC) VISIBLE,
  INDEX `fk_Event_has_Address_Event1_idx` (`Event_id` ASC) VISIBLE,
  CONSTRAINT `fk_Event_has_Address_Event1`
    FOREIGN KEY (`Event_id`)
    REFERENCES `mydb`.`Event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_has_Address_Address1`
    FOREIGN KEY (`Address_id`)
    REFERENCES `mydb`.`Address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
