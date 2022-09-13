-- Universidade de Brasília - September 13 of 2022
-- Authors:	David Fanchic Chatelard - 18/0138863		
--			    Gabriel Tambara Rabelo - 18/0017021
--
-- Inserção de dados na linha 1064
--
-- General definitions
--

-- Determina se o InnoDB(motor de armazenamento do mySQL) faz checagem de chaves duplicadas (import é mais rápido)
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;

-- Determina se o servidor checa se uma tabela exista quando se define uma Foreign Key
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

-- ONLY_FULL_GROUP_BY : Exige queries que não gerem ambiguidade
-- STRICT_TRANS_TABLES : converte um valor inválido para o válido mais próximo para inserção
-- NO_ZERO_IN_DATE : não permite datas cujos dias e mês são nulos
-- NO_ZERO_DATE : não permite datas como 00-00-0000
-- ERROR_FOR_DIVISION_BY_ZERO
-- NO_ENGINE_SUBSTITUTION : controle automatico de substituicao do motor de armazenamento em criacoes/alteracoes de bancos que especificam motores desabilitados 
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Number` INT NOT NULL COMMENT 'Numero da pagina inicial referenciada no documento',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Topic` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Topic` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Topic` VARCHAR(64) NOT NULL COMMENT 'Nome/títutlo do item',
  `Description` VARCHAR(128) NULL COMMENT 'Descrição e detalhes sobre o tópico',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TitleOfResearcher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TitleOfResearcher` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TitleOfResearcher` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Title` VARCHAR(45) NOT NULL COMMENT 'Título do pesquisador',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProjectOfResearcher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ProjectOfResearcher` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ProjectOfResearcher` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Name` VARCHAR(45) NOT NULL COMMENT 'Nome/Título do projeto de pesquisa',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Researcher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Researcher` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Researcher` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `IsCommercialWorker` TINYINT NULL COMMENT 'Boolenado referente a ser um trabalhador empregado',
  `TitleOfResearcher_id` INT NOT NULL COMMENT 'Identificador do pesquisador',
  `ProjectOfResearcher_id` INT NOT NULL COMMENT 'Identificador do projeto de pesquisa',
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
  `id` INT NOT NULL COMMENT 'Identificador do item',
  `Occupation_id` INT NOT NULL COMMENT 'Identificador da ocupação',
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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Level` VARCHAR(45) NOT NULL COMMENT 'Nome/título da escolaridade',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MaritalStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MaritalStatus` ;

CREATE TABLE IF NOT EXISTS `mydb`.`MaritalStatus` (
  `id` INT NOT NULL COMMENT 'Identificador do item',
  `MaritalStatus` VARCHAR(45) NOT NULL COMMENT 'Nome do estado civil',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gender`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Gender` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Gender` (
  `id` INT NOT NULL COMMENT 'Identificador do item',
  `Gender` VARCHAR(45) NOT NULL COMMENT 'Gênero da pessoa',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Country` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Country` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Name` VARCHAR(45) NOT NULL COMMENT 'Nome do país',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FUStateProvince`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`FUStateProvince` ;

CREATE TABLE IF NOT EXISTS `mydb`.`FUStateProvince` (
  `id` INT NOT NULL COMMENT 'Identificador do item',
  `Name` VARCHAR(45) NULL COMMENT 'Nome do estado/província',
  `Country_id` INT NOT NULL COMMENT 'Identificador do país',
  PRIMARY KEY (`id`),
  INDEX `fk_FUStateProvince_Country1_idx` (`Country_id` ASC) VISIBLE,
  CONSTRAINT `fk_FUStateProvince_Country1`
    FOREIGN KEY (`Country_id`)
    REFERENCES `mydb`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PhoneCode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PhoneCode` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PhoneCode` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Code` VARCHAR(5) NOT NULL COMMENT 'Número do código de telefone',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `Code_UNIQUE` (`Code` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`City`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`City` ;

CREATE TABLE IF NOT EXISTS `mydb`.`City` (
  `id` INT NOT NULL COMMENT 'Identificador do item',
  `Name` VARCHAR(45) NULL COMMENT 'Nome da cidade',
  `FUStateProvince_id` INT NOT NULL COMMENT 'Identificador do estado/província',
  `PhoneCode_id` INT NOT NULL COMMENT 'Identificador do codigo de telefone',
  PRIMARY KEY (`id`),
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
-- Table `mydb`.`Author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Author` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Author` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `ComercialEmployee_id` INT NULL COMMENT 'Identificador do empregado',
  `Researcher_id` INT NULL COMMENT 'Identificador do pesquisador',
  `Name` VARCHAR(45) NOT NULL COMMENT 'Nome do autor',
  `CPF` VARCHAR(11) NOT NULL COMMENT 'Cadastro de pessoa física (CPF)',
  `RG` VARCHAR(45) NOT NULL COMMENT 'Registro geral (RG)',
  `Schooling_id` INT NOT NULL COMMENT 'Identificador da escolaridade',
  `MaritalStatus_id` INT NOT NULL COMMENT 'Identificador do estado civil',
  `Gender_id` INT NOT NULL COMMENT 'Identificador do genero',
  `Naturality_City_id` INT NOT NULL COMMENT 'Naturalidade do autor',
  `Nationality_Country_id` INT NOT NULL COMMENT 'Nacionalidade do autor',
  PRIMARY KEY (`id`, `Naturality_City_id`, `Nationality_Country_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  UNIQUE INDEX `RG_UNIQUE` (`RG` ASC) VISIBLE,
  INDEX `fk_Author_Researcher1_idx` (`Researcher_id` ASC) VISIBLE,
  INDEX `fk_Author_ComercialEmployee1_idx` (`ComercialEmployee_id` ASC) VISIBLE,
  INDEX `fk_Author_Schooling1_idx` (`Schooling_id` ASC) VISIBLE,
  INDEX `fk_Author_MaritalStatus1_idx` (`MaritalStatus_id` ASC) VISIBLE,
  INDEX `fk_Author_Gender1_idx` (`Gender_id` ASC) VISIBLE,
  INDEX `fk_Author_City1_idx` (`Naturality_City_id` ASC) VISIBLE,
  INDEX `fk_Author_Country1_idx` (`Nationality_Country_id` ASC) VISIBLE,
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
  CONSTRAINT `fk_Author_City1`
    FOREIGN KEY (`Naturality_City_id`)
    REFERENCES `mydb`.`City` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Author_Country1`
    FOREIGN KEY (`Nationality_Country_id`)
    REFERENCES `mydb`.`Country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`WebAddress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`WebAddress` ;

CREATE TABLE IF NOT EXISTS `mydb`.`WebAddress` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `URL` VARCHAR(45) NOT NULL COMMENT 'Endereço Web, ou seja, a  URL',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Institution`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Institution` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Institution` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Name` VARCHAR(45) NOT NULL COMMENT 'Nome/títutlo do item',
  `WebAddress_id` INT NOT NULL COMMENT 'Identificador do endereçoWeb',
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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Title` VARCHAR(128) NOT NULL COMMENT 'Nome/títutlo do item',
  `Abstract` VARCHAR(512) NOT NULL COMMENT 'Resumo do conteúdo da revista d e até 512 caracteres',
  `PublishDate` DATE NOT NULL COMMENT 'Data de publicação da revista',
  `InitialPage_id` INT NOT NULL COMMENT 'Identificador da página',
  `Topic_id` INT NOT NULL COMMENT 'Identificador do topico',
  `Author_id` INT NOT NULL COMMENT 'Identificador do autor',
  `Institution_id` INT NOT NULL COMMENT 'Identificador da instituição',
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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Keyword` VARCHAR(64) NOT NULL COMMENT 'Nome/títutlo do item',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PublishingCompany`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PublishingCompany` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PublishingCompany` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Name` VARCHAR(45) NOT NULL COMMENT 'Nome/títutlo do item',
  `WebAddress_id` INT NOT NULL COMMENT 'Identificador do endereçoWeb',
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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `email` VARCHAR(45) NOT NULL COMMENT 'Email de máximo 45 caracteres',
  `PublishingCompany_id` INT NULL COMMENT 'Identificador da editora',
  `Institution_id` INT NULL COMMENT 'Identificador da instituição',
  `Author_id` INT NULL COMMENT 'Identificador do autor',
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
-- Table `mydb`.`AddressType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`AddressType` ;

CREATE TABLE IF NOT EXISTS `mydb`.`AddressType` (
  `id` INT NOT NULL COMMENT 'Identificador do item',
  `Description` VARCHAR(45) NOT NULL COMMENT 'Nome do tipo de endereço',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Neighborhood`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Neighborhood` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Neighborhood` (
  `id` INT NOT NULL COMMENT 'Identificador do item',
  `Name` VARCHAR(45) NULL COMMENT 'Nome da rua/bairro',
  `City_id` INT NOT NULL COMMENT 'Identificador da cidade',
  PRIMARY KEY (`id`),
  INDEX `fk_Neighborhood_City1_idx` (`City_id` ASC) VISIBLE,
  CONSTRAINT `fk_Neighborhood_City1`
    FOREIGN KEY (`City_id`)
    REFERENCES `mydb`.`City` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Address` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Complement` VARCHAR(45) NULL COMMENT 'Complemento do endereço',
  `AddressType_id` INT NOT NULL COMMENT 'Identificador do endereço',
  `Neighborhood_id` INT NOT NULL COMMENT 'Identificador da rua/bairro',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Address_AddressType1_idx` (`AddressType_id` ASC) VISIBLE,
  INDEX `fk_Address_Neighborhood1_idx` (`Neighborhood_id` ASC) VISIBLE,
  CONSTRAINT `fk_Address_AddressType1`
    FOREIGN KEY (`AddressType_id`)
    REFERENCES `mydb`.`AddressType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Address_Neighborhood1`
    FOREIGN KEY (`Neighborhood_id`)
    REFERENCES `mydb`.`Neighborhood` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Event` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Event` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Name` VARCHAR(45) NOT NULL COMMENT 'Nome/títutlo do item',
  `Date` DATE NOT NULL COMMENT 'Data em que ocorreu o evento',
  `Address_id` INT NOT NULL COMMENT 'Identificador do endereço',
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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Title` VARCHAR(45) NULL COMMENT 'Nome/títutlo do item',
  `Number` INT NOT NULL COMMENT 'Numero da seção referenciada',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PhoneType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PhoneType` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PhoneType` (
  `id` INT NOT NULL COMMENT 'Identificador do item',
  `Description` VARCHAR(45) NOT NULL COMMENT 'Título do tipo de número',
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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Title` VARCHAR(128) NOT NULL COMMENT 'Nome/títutlo do item',
  `Abstract` VARCHAR(512) NOT NULL COMMENT 'Resumo do artigo, contendo até 128 caracteres',
  `PublishDate` DATE NOT NULL COMMENT 'Datat de publicação do artigo',
  `FromWeb` TINYINT NULL COMMENT 'Boolenado referente à obtenção do artigo pela internet',
  `WebAddress_id` INT NULL COMMENT 'Endenreço da internet no qual o artigo foi obtido',
  `Topic_id` INT NOT NULL COMMENT 'Identificador do topico',
  `Author_id` INT NOT NULL COMMENT 'Identificador do autor',
  `Institution_id` INT NOT NULL COMMENT 'Identificador da instituição',
  `Event_id` INT NOT NULL COMMENT 'Identificador do evento',
  PRIMARY KEY (`id`, `Author_id`, `Event_id`),
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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Title` VARCHAR(128) NOT NULL COMMENT 'Nome/títutlo do item',
  `Abstract` VARCHAR(512) NOT NULL COMMENT 'Resumo do conteúdo do livro de até 512 caracteres',
  `PublishDate` DATE NOT NULL COMMENT 'Data de publicação do livro',
  `InitialPage_id` INT NOT NULL COMMENT 'Identificador do item',
  `Topic_id` INT NOT NULL,
  `Author_id` INT NOT NULL COMMENT 'Identificador do item',
  `Institution_id` INT NOT NULL COMMENT 'Identificador do item',
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
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do item',
  `Title` VARCHAR(128) NOT NULL COMMENT 'Nome/títutlo do item',
  `Abstract` VARCHAR(512) NOT NULL COMMENT 'Resumo do conteúdo da dissertação/tése',
  `PublishDate` DATE NOT NULL COMMENT 'Data de publicação do documento',
  `Topic_id` INT NOT NULL COMMENT 'Identificador do item',
  `Author_id` INT NOT NULL COMMENT 'Identificador do autor',
  `Institution_id` INT NOT NULL COMMENT 'Identificador da  instituição',
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
  `id` INT NOT NULL COMMENT 'Identificador do item',
  `Number` VARCHAR(45) NOT NULL COMMENT 'Número da edição do documento',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Thesis_Orienter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Thesis_Orienter` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Thesis_Orienter` (
  `Thesis_id` INT NOT NULL COMMENT 'Identificador da tese',
  `Author_id` INT NOT NULL COMMENT 'Identificador do autor',
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
  `Journal_id` INT NOT NULL COMMENT 'Identificador da revista',
  `Section_id` INT NOT NULL COMMENT 'Identificador da seção',
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
  `id` INT NOT NULL COMMENT 'Identificador do item',
  `AccessDate` VARCHAR(45) NULL COMMENT 'Data de acesso do artigo',
  `Article_id` INT NOT NULL COMMENT 'Identificador do artigo',
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
  `Book_id` INT NOT NULL COMMENT 'Identificador do livro',
  `Edition_id` INT NOT NULL COMMENT 'Identificador da edição',
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
  `Thesis_id` INT NOT NULL COMMENT 'Identificador da tese',
  `Section_id` INT NOT NULL COMMENT 'Identificador da seção',
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
  `Journal_id` INT NOT NULL COMMENT 'Identificador da revista',
  `Edition_id` INT NOT NULL COMMENT 'Identificador da edição',
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
  `Journal_id` INT NOT NULL COMMENT 'Identificador da revista',
  `Keyword_id` INT NOT NULL COMMENT 'Identificador da palavra-chave',
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
  `Article_id` INT NOT NULL COMMENT 'Identificador do artigo',
  `Keyword_id` INT NOT NULL COMMENT 'Identificador da palavra-chave',
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
  `Book_id` INT NOT NULL COMMENT 'Identificador do livro',
  `Keyword_id` INT NOT NULL COMMENT 'Identificador da palavra-chave',
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
  `Thesis_id` INT NOT NULL COMMENT 'Identificador da tese',
  `Keyword_id` INT NOT NULL COMMENT 'Identificador da palavra-chave',
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
  `Journal_id` INT NOT NULL COMMENT 'Identificador da revista',
  `PublishingCompany_id` INT NOT NULL COMMENT 'Identificador da editora',
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
  `Book_id` INT NOT NULL COMMENT 'Identificador do livro',
  `PublishingCompany_id` INT NOT NULL COMMENT 'Identificador da editora',
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
  `Author_id` INT NOT NULL COMMENT 'Identificador do autor',
  `Address_id` INT NOT NULL COMMENT 'Identificador do endereço',
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

-- -----------------------------------------------------
-- Data insertion
-- -----------------------------------------------------

-- Inserting into InitialPage
insert into InitialPage(id, Number) Values(1, 10);
insert into InitialPage(id, Number) Values(2, 20);
insert into InitialPage(id, Number) Values(3, 30);
insert into InitialPage(id, Number) Values(4, 40);
insert into InitialPage(id, Number) Values(5, 50);

-- Inserting into Topic
insert into Topic(id, Topic, Description) Values(1, "DataBases", "Description of different types of data bases.");
insert into Topic(id, Topic, Description) Values(2, "Operational System", "Description of different types of operational systems.");
insert into Topic(id, Topic, Description) Values(3, "Real Time Systems", "Description of different types of real time systems.");
insert into Topic(id, Topic, Description) Values(4, "Electric Circuits", "Description of different types of electric circuits.");
insert into Topic(id, Topic, Description) Values(5, "Buildings", "Description of different types of buildings.");

-- Inserting into TitleOfResearcher
insert into TitleOfResearcher(id, Title) Values(1, "Senior Researcher");
insert into TitleOfResearcher(id, Title) Values(2, "Junior Associate Researcher");
insert into TitleOfResearcher(id, Title) Values(3, "Associate Researcher");
insert into TitleOfResearcher(id, Title) Values(4, "Senior Associate Researcher");
insert into TitleOfResearcher(id, Title) Values(5, "Post-doc Research Fellow");

-- Inserting into ProjectOfResearcher
insert into ProjectOfResearcher(id, Name) Values(1, "Research of NoSQL DataBases");
insert into ProjectOfResearcher(id, Name) Values(2, "Research of Unix OS");
insert into ProjectOfResearcher(id, Name) Values(3, "Research of Plane Control Systems");
insert into ProjectOfResearcher(id, Name) Values(4, "Research of Three Phases Circuits");
insert into ProjectOfResearcher(id, Name) Values(5, "Research of Buildings Architectures");

-- Inserting into Researcher
insert into Researcher(id, IsCommercialWorker, TitleOfResearcher_id, ProjectOfResearcher_id) Values(1, 0, 1, 1);
insert into Researcher(id, IsCommercialWorker, TitleOfResearcher_id, ProjectOfResearcher_id) Values(2, 0, 2, 2);
insert into Researcher(id, IsCommercialWorker, TitleOfResearcher_id, ProjectOfResearcher_id) Values(3, 0, 3, 3);
insert into Researcher(id, IsCommercialWorker, TitleOfResearcher_id, ProjectOfResearcher_id) Values(4, 1, 4, 4);
insert into Researcher(id, IsCommercialWorker, TitleOfResearcher_id, ProjectOfResearcher_id) Values(5, 1, 5, 5);

-- Inserting into Occupation
insert into Occupation(id, Name) Values(1, "Teacher");
insert into Occupation(id, Name) Values(2, "Engineer");
insert into Occupation(id, Name) Values(3, "Software Developer");
insert into Occupation(id, Name) Values(4, "Lawyer");
insert into Occupation(id, Name) Values(5, "Judge");

-- Inserting into ComercialEmployee
insert into ComercialEmployee(id, Occupation_id) Values(1, 1);
insert into ComercialEmployee(id, Occupation_id) Values(2, 2);
insert into ComercialEmployee(id, Occupation_id) Values(3, 3);
insert into ComercialEmployee(id, Occupation_id) Values(4, 4);
insert into ComercialEmployee(id, Occupation_id) Values(5, 5);

-- Inserting into Schooling
insert into Schooling(id, Level) Values(1, "Finished High School");
insert into Schooling(id, Level) Values(2, "Associate");
insert into Schooling(id, Level) Values(3, "Bachelor");
insert into Schooling(id, Level) Values(4, "Master");
insert into Schooling(id, Level) Values(5, "Research Doctorate");

-- Inserting into MaritalStatus
insert into MaritalStatus(id, MaritalStatus) Values(1, "Single");
insert into MaritalStatus(id, MaritalStatus) Values(2, "Married");
insert into MaritalStatus(id, MaritalStatus) Values(3, "Widowed");
insert into MaritalStatus(id, MaritalStatus) Values(4, "Divorced");
insert into MaritalStatus(id, MaritalStatus) Values(5, "Separated");

-- Inserting into Gender
insert into Gender(id, Gender) Values(1, "Male");
insert into Gender(id, Gender) Values(2, "Female");
insert into Gender(id, Gender) Values(3, "Intersex");
insert into Gender(id, Gender) Values(4, "Trans");
insert into Gender(id, Gender) Values(5, "Non-Conforming");

-- Inserting into AddressType
insert into AddressType(id, Description) Values(1, "Residential");
insert into AddressType(id, Description) Values(2, "Commercial");

-- Inserting into Country
insert into Country(id, Name) Values(1, "Brazil");
insert into Country(id, Name) Values(2, "France");
insert into Country(id, Name) Values(3, "USA");
insert into Country(id, Name) Values(4, "Spain");
insert into Country(id, Name) Values(5, "Italy");

-- Inserting into FUStateProvince
insert into FUStateProvince(id, Name, Country_id) Values(1, "DF", 1);
insert into FUStateProvince(id, Name, Country_id) Values(2, "Ile-de-France", 2);
insert into FUStateProvince(id, Name, Country_id) Values(3, "California", 3);
insert into FUStateProvince(id, Name, Country_id) Values(4, "Navarre", 4);
insert into FUStateProvince(id, Name, Country_id) Values(5, "Kingdom of Naples", 5);

-- Inserting into PhoneCode
insert into PhoneCode(id, Code) Values(1, "61");
insert into PhoneCode(id, Code) Values(2, "33");
insert into PhoneCode(id, Code) Values(3, "415");
insert into PhoneCode(id, Code) Values(4, "93");
insert into PhoneCode(id, Code) Values(5, "39");

-- Inserting into City
insert into City(id, Name, PhoneCode_id, FUStateProvince_id) Values(1, "Brasilia", 1, 1);
insert into City(id, Name, PhoneCode_id, FUStateProvince_id) Values(2, "Paris", 2, 2);
insert into City(id, Name, PhoneCode_id, FUStateProvince_id) Values(3, "San Francisco", 3, 3);
insert into City(id, Name, PhoneCode_id, FUStateProvince_id) Values(4, "Barcelona", 4, 4);
insert into City(id, Name, PhoneCode_id, FUStateProvince_id) Values(5, "Venice", 5, 5);

-- Inserting into Neighborhood
insert into Neighborhood(id, Name, City_id) Values(1, "North Wing", 1);
insert into Neighborhood(id, Name, City_id) Values(2, "11th Arrondissement", 2);
insert into Neighborhood(id, Name, City_id) Values(3, "Mission District", 3);
insert into Neighborhood(id, Name, City_id) Values(4, "Retiro", 4);
insert into Neighborhood(id, Name, City_id) Values(5, "Cannaregio", 5);

-- Inserting into Address
insert into Address(id, Complement, Neighborhood_id, AddressType_id) Values(1, "SQN 411 Bloco E Apt 604", 1, 1);
insert into Address(id, Complement, Neighborhood_id, AddressType_id) Values(2, "Building Sacre Coeur Apt 205", 2, 2);
insert into Address(id, Complement, Neighborhood_id, AddressType_id) Values(3, "Sanchez Street 619", 3, 1);
insert into Address(id, Complement, Neighborhood_id, AddressType_id) Values(4, "Building Montana Apt 501", 4, 2);
insert into Address(id, Complement, Neighborhood_id, AddressType_id) Values(5, "Building Concrata Apt 306", 5, 1);


-- Inserting into Author
insert into Author(id, ComercialEmployee_id, Researcher_id, Name, CPF, RG, Schooling_id, MaritalStatus_id, Gender_id, Naturality_City_id, Nationality_Country_id) Values(1, 1, 1, "Gabriel", "12345678900", "1234567", 1, 1, 1, 1, 1);
insert into Author(id, ComercialEmployee_id, Researcher_id, Name, CPF, RG, Schooling_id, MaritalStatus_id, Gender_id, Naturality_City_id, Nationality_Country_id) Values(2, 2, 2, "Marcos", "00987654321", "7654321", 2, 2, 2, 2, 2);
insert into Author(id, Researcher_id, Name, CPF, RG, Schooling_id, MaritalStatus_id, Gender_id, Naturality_City_id, Nationality_Country_id) Values(3, 3, "Luis", "12365498700", "1236457", 3, 3, 3, 3, 3);
insert into Author(id, ComercialEmployee_id, Researcher_id, Name, CPF, RG, Schooling_id, MaritalStatus_id, Gender_id, Naturality_City_id, Nationality_Country_id) Values(4, 4, 4, "Alexandre", "00987456123", "3124567", 4, 4, 4, 4, 4);
insert into Author(id, Researcher_id, Name, CPF, RG, Schooling_id, MaritalStatus_id, Gender_id, Naturality_City_id, Nationality_Country_id) Values(5, 5, "Emanuel", "13264597800", "2136457", 5, 5, 5, 5, 5);

-- Inserting into WebAddress
insert into WebAddress(id, URL) Values(1, "www.youtube.com");
insert into WebAddress(id, URL) Values(2, "www.wikipedia.com");
insert into WebAddress(id, URL) Values(3, "www.stackexchange.com");
insert into WebAddress(id, URL) Values(4, "www.uol.com.br");
insert into WebAddress(id, URL) Values(5, "www.google.com");

-- Inserting into Institution
insert into Institution(id, Name, WebAddress_id) Values(1, "UnB", 1);
insert into Institution(id, Name, WebAddress_id) Values(2, "CeuB", 2);
insert into Institution(id, Name, WebAddress_id) Values(3, "UFRJ", 3);
insert into Institution(id, Name, WebAddress_id) Values(4, "UFMG", 4);
insert into Institution(id, Name, WebAddress_id) Values(5, "MIT", 5);

-- Inserting into Journal
insert into Journal(id, Title, Abstract, PublishDate, InitialPage_id, Topic_id, Author_id, Institution_id) Values(1, "Analysis of SQL DataBases", "A short analysis of different types of SQL data bases used in the industry.", "2022-05-10", 1, 1, 1, 1);
insert into Journal(id, Title, Abstract, PublishDate, InitialPage_id, Topic_id, Author_id, Institution_id) Values(2, "Analysis of Operational Systems", "A short analysis of different types of operational systems used in the industry.", "2022-06-11", 2, 2, 2, 2);
insert into Journal(id, Title, Abstract, PublishDate, InitialPage_id, Topic_id, Author_id, Institution_id) Values(3, "Analysis of CPUs", "A short analysis of different types of CPUs used in the industry.", "2022-07-12", 3, 3, 3, 3);
insert into Journal(id, Title, Abstract, PublishDate, InitialPage_id, Topic_id, Author_id, Institution_id) Values(4, "Analysis of Real Time Systems", "A short analysis of different types of real time systems used in the industry.", "2022-08-13", 4, 4, 4, 4);
insert into Journal(id, Title, Abstract, PublishDate, InitialPage_id, Topic_id, Author_id, Institution_id) Values(5, "Analysis of NoSQL DataBases", "A short analysis of different types of NoSQL data bases used in the industry.", "2022-09-14", 5, 5, 5, 5);

-- Inserting into Keyword
insert into keyword(id, Keyword) Values(1, "SQL");
insert into keyword(id, Keyword) Values(2, "Linux");
insert into keyword(id, Keyword) Values(3, "AMD");
insert into keyword(id, Keyword) Values(4, "Deadline");
insert into keyword(id, Keyword) Values(5, "NoSQL");

-- Inserting into PublishingCompany
insert into PublishingCompany(id, Name, WebAddress_id) Values(1, "Magazine1", 1);
insert into PublishingCompany(id, Name, WebAddress_id) Values(2, "Magazine2", 2);
insert into PublishingCompany(id, Name, WebAddress_id) Values(3, "Magazine3", 3);
insert into PublishingCompany(id, Name, WebAddress_id) Values(4, "Magazine4", 4);
insert into PublishingCompany(id, Name, WebAddress_id) Values(5, "Magazine5", 5);

-- Inserting into Email
insert into Email(id, email, PublishingCompany_id, Institution_id, Author_id) Values(1, "gabriel@gmail.com", 1, 1, 1);
insert into Email(id, email, PublishingCompany_id, Institution_id, Author_id) Values(2, "marcos@gmail.com", 2, 2, 2);
insert into Email(id, email, PublishingCompany_id, Institution_id, Author_id) Values(3, "luis@gmail.com", 3, 3, 3);
insert into Email(id, email, PublishingCompany_id, Institution_id, Author_id) Values(4, "alexandre@gmail.com", 4, 4, 4);
insert into Email(id, email, PublishingCompany_id, Institution_id, Author_id) Values(5, "emanuel@gmail.com", 5, 5, 5);

-- Inserting into Event
insert into Event(id, Name, Date, Address_id) Values(1, "Congress of Brazil", "2022-08-15", 1);
insert into Event(id, Name, Date, Address_id) Values(2, "Congress of France", "2021-07-14", 2);
insert into Event(id, Name, Date, Address_id) Values(3, "Congress of USA", "2020-06-13", 3);
insert into Event(id, Name, Date, Address_id) Values(4, "Congress of Spain", "2019-05-12", 4);
insert into Event(id, Name, Date, Address_id) Values(5, "Congress Italy", "2018-04-11", 5);

-- Inserting into Section
insert into Section(id, Title, Number) Values(1, "Data Analysis", 1);
insert into Section(id, Title, Number) Values(2, "NoSQL Databases", 2);
insert into Section(id, Title, Number) Values(3, "Big Data", 3);
insert into Section(id, Title, Number) Values(4, "GitHub", 4);
insert into Section(id, Title, Number) Values(5, "Ubuntu", 5);

-- Inserting into PhoneType
insert into PhoneType(id, Description) Values(1, "Mobile");
insert into PhoneType(id, Description) Values(2, "Landline");

-- Inserting into PhoneNumber
insert into PhoneNumber(id, Number, PhoneCode_id, PhoneType_id, Author_id) Values(1, "8120-1474", 1, 1, 1);
insert into PhoneNumber(id, Number, PhoneCode_id, PhoneType_id, Author_id) Values(2, "8304-2368", 2, 2, 2);
insert into PhoneNumber(id, Number, PhoneCode_id, PhoneType_id, Author_id) Values(3, "8681-5908", 3, 1, 3);
insert into PhoneNumber(id, Number, PhoneCode_id, PhoneType_id, Author_id) Values(4, "9296-7831", 4, 2, 4);
insert into PhoneNumber(id, Number, PhoneCode_id, PhoneType_id, Author_id) Values(5, "9340-6794", 5, 1, 5);

-- Inserting into Article
insert into Article(id, Title, Abstract, PublishDate, FromWeb, WebAddress_id, Topic_id, Author_id, Institution_id, Event_id) Values(1, "Title 1", "A short abstract 1.", "2022-01-01", 1, 1, 1, 1, 1, 1);
insert into Article(id, Title, Abstract, PublishDate, FromWeb, WebAddress_id, Topic_id, Author_id, Institution_id, Event_id) Values(2, "Title 2", "A short abstract 2.", "2022-02-02", 1, 2, 2, 2, 2, 2);
insert into Article(id, Title, Abstract, PublishDate, FromWeb, WebAddress_id, Topic_id, Author_id, Institution_id, Event_id) Values(3, "Title 3", "A short abstract 3.", "2022-03-03", 1, 3, 3, 3, 3, 3);
insert into Article(id, Title, Abstract, PublishDate, FromWeb, WebAddress_id, Topic_id, Author_id, Institution_id, Event_id) Values(4, "Title 4", "A short abstract 4.", "2022-04-04", 1, 4, 4, 4, 4, 4);
insert into Article(id, Title, Abstract, PublishDate, FromWeb, WebAddress_id, Topic_id, Author_id, Institution_id, Event_id) Values(5, "Title 5", "A short abstract 5.", "2022-05-05", 1, 5, 5, 5, 5, 5);

-- Inserting into Book
insert into Book(id, Title, Abstract, PublishDate, InitialPage_id, Topic_id, Author_id, Institution_id) Values(1, "Book1", "Book 1 abstract.", "2020-01-01", 1, 1, 1, 1);
insert into Book(id, Title, Abstract, PublishDate, InitialPage_id, Topic_id, Author_id, Institution_id) Values(2, "Book2", "Book 2 abstract.", "2020-02-02", 2, 2, 2, 2);
insert into Book(id, Title, Abstract, PublishDate, InitialPage_id, Topic_id, Author_id, Institution_id) Values(3, "Book3", "Book 3 abstract.", "2020-03-03", 3, 3, 3, 3);
insert into Book(id, Title, Abstract, PublishDate, InitialPage_id, Topic_id, Author_id, Institution_id) Values(4, "Book4", "Book 4 abstract.", "2020-04-04", 4, 4, 4, 4);
insert into Book(id, Title, Abstract, PublishDate, InitialPage_id, Topic_id, Author_id, Institution_id) Values(5, "Book5", "Book 5 abstract.", "2020-05-05", 5, 5, 5, 5);

-- Inserting into Thesis
insert into Thesis(id, Title, Abstract, PublishDate, Topic_id, Author_id, Institution_id) Values(1, "Thesis1", "Abstract of Thesis 1.", "2022-01-01", 1, 1, 1);
insert into Thesis(id, Title, Abstract, PublishDate, Topic_id, Author_id, Institution_id) Values(2, "Thesis2", "Abstract of Thesis 2.", "2022-02-02", 2, 2, 2);
insert into Thesis(id, Title, Abstract, PublishDate, Topic_id, Author_id, Institution_id) Values(3, "Thesis3", "Abstract of Thesis 3.", "2022-03-03", 3, 3, 3);
insert into Thesis(id, Title, Abstract, PublishDate, Topic_id, Author_id, Institution_id) Values(4, "Thesis4", "Abstract of Thesis 4.", "2022-04-04", 4, 4, 4);
insert into Thesis(id, Title, Abstract, PublishDate, Topic_id, Author_id, Institution_id) Values(5, "Thesis5", "Abstract of Thesis 5.", "2022-05-05", 5, 5, 5);

-- Inserting into Edition
insert into Edition(id, Number) Values(1, "First Edition");
insert into Edition(id, Number) Values(2, "Second Edition");
insert into Edition(id, Number) Values(3, "Third Edition");
insert into Edition(id, Number) Values(4, "Fourth Edition");
insert into Edition(id, Number) Values(5, "Fifth Edition");

-- Inserting into Thesis_Orienter
insert into Thesis_Orienter(Thesis_id, Author_id) Values(1, 1);
insert into Thesis_Orienter(Thesis_id, Author_id) Values(2, 2);
insert into Thesis_Orienter(Thesis_id, Author_id) Values(3, 3);
insert into Thesis_Orienter(Thesis_id, Author_id) Values(4, 4);
insert into Thesis_Orienter(Thesis_id, Author_id) Values(5, 5);

-- Inserting into Journal_has_Section
insert into Journal_has_Section(Journal_id, Section_id) Values(1, 1);
insert into Journal_has_Section(Journal_id, Section_id) Values(2, 2);
insert into Journal_has_Section(Journal_id, Section_id) Values(3, 3);
insert into Journal_has_Section(Journal_id, Section_id) Values(4, 4);
insert into Journal_has_Section(Journal_id, Section_id) Values(5, 5);

-- Inserting into AccessDate
insert into AccessDate(id, AccessDate, Article_id) Values(1, "2020-03-22", 1);
insert into AccessDate(id, AccessDate, Article_id) Values(2, "2019-02-13", 2);
insert into AccessDate(id, AccessDate, Article_id) Values(3, "2020-12-03", 3);
insert into AccessDate(id, AccessDate, Article_id) Values(4, "2018-04-04", 4);
insert into AccessDate(id, AccessDate, Article_id) Values(5, "2003-05-18", 5);

-- Inserting into Book_has_Edition
insert into Book_has_Edition(Book_id, Edition_id) Values(1, 1);
insert into Book_has_Edition(Book_id, Edition_id) Values(2, 2);
insert into Book_has_Edition(Book_id, Edition_id) Values(3, 3);
insert into Book_has_Edition(Book_id, Edition_id) Values(4, 4);
insert into Book_has_Edition(Book_id, Edition_id) Values(5, 5);

-- Inserting into Thesis_has_Section
insert into Thesis_has_Section(Thesis_id, Section_id) Values(1, 1);
insert into Thesis_has_Section(Thesis_id, Section_id) Values(2, 2);
insert into Thesis_has_Section(Thesis_id, Section_id) Values(3, 3);
insert into Thesis_has_Section(Thesis_id, Section_id) Values(4, 4);
insert into Thesis_has_Section(Thesis_id, Section_id) Values(5, 5);

-- Inserting into Journal_has_Edition
insert into Journal_has_Edition(Journal_id, Edition_id) Values(1, 1);
insert into Journal_has_Edition(Journal_id, Edition_id) Values(2, 2);
insert into Journal_has_Edition(Journal_id, Edition_id) Values(3, 3);
insert into Journal_has_Edition(Journal_id, Edition_id) Values(4, 4);
insert into Journal_has_Edition(Journal_id, Edition_id) Values(5, 5);

-- Inserting into Journal_has_Keyword
insert into Journal_has_Keyword(Journal_id, Keyword_id) Values(1, 1);
insert into Journal_has_Keyword(Journal_id, Keyword_id) Values(2, 2);
insert into Journal_has_Keyword(Journal_id, Keyword_id) Values(3, 3);
insert into Journal_has_Keyword(Journal_id, Keyword_id) Values(4, 4);
insert into Journal_has_Keyword(Journal_id, Keyword_id) Values(5, 5);

-- Inserting into Article_has_Keyword
insert into Article_has_Keyword(Article_id, Keyword_id) Values(1, 1);
insert into Article_has_Keyword(Article_id, Keyword_id) Values(2, 2);
insert into Article_has_Keyword(Article_id, Keyword_id) Values(3, 3);
insert into Article_has_Keyword(Article_id, Keyword_id) Values(4, 4);
insert into Article_has_Keyword(Article_id, Keyword_id) Values(5, 5);

-- Inserting into Book_has_Keyword
insert into Book_has_Keyword(Book_id, Keyword_id) Values(1, 1);
insert into Book_has_Keyword(Book_id, Keyword_id) Values(2, 2);
insert into Book_has_Keyword(Book_id, Keyword_id) Values(3, 3);
insert into Book_has_Keyword(Book_id, Keyword_id) Values(4, 4);
insert into Book_has_Keyword(Book_id, Keyword_id) Values(5, 5);

-- Inserting into Thesis_has_Keyword
insert into Thesis_has_Keyword(Thesis_id, Keyword_id) Values(1, 1);
insert into Thesis_has_Keyword(Thesis_id, Keyword_id) Values(2, 2);
insert into Thesis_has_Keyword(Thesis_id, Keyword_id) Values(3, 3);
insert into Thesis_has_Keyword(Thesis_id, Keyword_id) Values(4, 4);
insert into Thesis_has_Keyword(Thesis_id, Keyword_id) Values(5, 5);

-- Inserting into Journal_has_PublishingCompany
insert into Journal_has_PublishingCompany(Journal_id, PublishingCompany_id) Values(1, 1);
insert into Journal_has_PublishingCompany(Journal_id, PublishingCompany_id) Values(2, 2);
insert into Journal_has_PublishingCompany(Journal_id, PublishingCompany_id) Values(3, 3);
insert into Journal_has_PublishingCompany(Journal_id, PublishingCompany_id) Values(4, 4);
insert into Journal_has_PublishingCompany(Journal_id, PublishingCompany_id) Values(5, 5);

-- Inserting into Book_has_PublishingCompany
insert into Book_has_PublishingCompany(Book_id, PublishingCompany_id) Values(1, 1);
insert into Book_has_PublishingCompany(Book_id, PublishingCompany_id) Values(2, 2);
insert into Book_has_PublishingCompany(Book_id, PublishingCompany_id) Values(3, 3);
insert into Book_has_PublishingCompany(Book_id, PublishingCompany_id) Values(4, 4);
insert into Book_has_PublishingCompany(Book_id, PublishingCompany_id) Values(5, 5);

-- Inserting into Author_has_Address
insert into Author_has_Address(Author_id, Address_id) Values(1, 1);
insert into Author_has_Address(Author_id, Address_id) Values(2, 2);
insert into Author_has_Address(Author_id, Address_id) Values(3, 3);
insert into Author_has_Address(Author_id, Address_id) Values(4, 4);
insert into Author_has_Address(Author_id, Address_id) Values(5, 5);