-- MySQL Script generated by MySQL Workbench
-- Sat Jan 30 15:47:43 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ChittyAccounts
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ChittyAccounts
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ChittyAccounts` DEFAULT CHARACTER SET utf8 ;
USE `ChittyAccounts` ;

-- -----------------------------------------------------
-- Table `ChittyAccounts`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChittyAccounts`.`Users` (
  `UserId` INT NOT NULL AUTO_INCREMENT,
  `UserName` VARCHAR(45) NOT NULL,
  `UserNameVerified` TINYINT(1) NOT NULL,
  `UserPassword` VARCHAR(64) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `MiddleName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Town` VARCHAR(25) NOT NULL,
  `State` VARCHAR(25) NOT NULL,
  `Country` VARCHAR(25) NOT NULL,
  `PostCode` VARCHAR(25) NULL,
  `Phone 1` VARCHAR(15) NULL,
  `Phone 2` VARCHAR(15) NULL,
  `IDType` VARCHAR(15) NULL,
  `AddressProofType` VARCHAR(15) NULL,
  `IDRef` VARCHAR(15) NULL,
  `AddressRef` VARCHAR(15) NULL,
  `IdVirified` TINYINT(1) NULL,
  `UserType` INT NOT NULL COMMENT 'Admin, Standard User, Manager etc',
  `OverDraftLimit` INT NOT NULL COMMENT 'if User accont can go negative and the limit\n',
  `Stayanonymous` TINYINT(1) NULL,
  `AnonymusName` VARCHAR(45) NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE INDEX `UserName_UNIQUE` (`UserName` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ChittyAccounts`.`Chitties`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChittyAccounts`.`Chitties` (
  `ChittyID` INT NOT NULL AUTO_INCREMENT,
  `ChittyName` VARCHAR(45) NOT NULL,
  `ChittyStatus` INT NOT NULL COMMENT '01 Not Started, 01 Active, 02  Closed',
  `OpeningDate` DATETIME NOT NULL,
  `ClosingDate` DATETIME NOT NULL,
  `Term` INT NOT NULL COMMENT 'The number of times the auction or similar activity occurs ',
  `TermUnit` INT NOT NULL COMMENT 'Like Monthly, Weekly, Daily etc',
  `RemainingTerm` INT NOT NULL COMMENT 'Number of terms left to complete the chitty',
  PRIMARY KEY (`ChittyID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ChittyAccounts`.`UserAccounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChittyAccounts`.`UserAccounts` (
  `UserID` INT NOT NULL,
  `AccountID` INT NOT NULL,
  `CreditInterestRate` DOUBLE NOT NULL,
  `CreditInterestTerm` INT NOT NULL,
  `CreditInterestCalculationTerm` INT NULL,
  `DebitInterestRate` DOUBLE NOT NULL,
  `DebtInterestTerm` INT NULL,
  `DebtInterestCalculationTerm` INT NULL,
  `AccStatus` INT NOT NULL COMMENT '01 Not Started, 01 Active, 02  Closed',
  `OpeningDate` DATETIME NOT NULL,
  `ClosingDate` DATETIME NOT NULL,
  PRIMARY KEY (`UserID`, `AccountID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ChittyAccounts`.`Accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChittyAccounts`.`Accounts` (
  `AccID` INT NOT NULL AUTO_INCREMENT,
  `AccName` VARCHAR(45) NOT NULL,
  `DefaultCreditInterestRate` DOUBLE NOT NULL,
  `CreditInterestTerm` INT NOT NULL,
  `DefaultCreditInterestCalculationTerm` INT NULL,
  `DefaultDebitInterestRate` DOUBLE NOT NULL,
  `DefaultDebtInterestTerm` INT NULL,
  `DefaultDebtInterestCalculationTerm` INT NULL),
  PRIMARY KEY(`AccID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ChittyAccounts`.`ChittyUsers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChittyAccounts`.`ChittyUsers` (
  `UserId` INT NOT NULL,
  `ChittyID` INT NOT NULL,
  `LatePaymentFee` INT NULL,
  PRIMARY KEY (`UserId`, `ChittyID`),
  INDEX `ChittyID_idx` (`ChittyID` ASC),
  CONSTRAINT `UserID`
    FOREIGN KEY (`UserId`)
    REFERENCES `ChittyAccounts`.`Users` (`UserId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ChittyID`
    FOREIGN KEY (`ChittyID`)
    REFERENCES `ChittyAccounts`.`Chitties` (`ChittyID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ChittyAccounts`.`ChittyTransactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChittyAccounts`.`ChittyTransactions` (
  `ChittyTransactionID` INT NOT NULL AUTO_INCREMENT,
  `ChittyNo` INT NOT NULL,
  `UserID` INT NULL,
  `ChtyTermNo` INT NULL,
  `Date` DATETIME NULL,
  `Amount` DOUBLE NULL,
  `Description` VARCHAR(50) NULL,
  `TransRefence` VARCHAR(50) NULL COMMENT 'Reference from actual Bank transaction',
  `TransStatus` INT NULL COMMENT 'If Transaction Pending or Cleared',
  `ClearanceDate` DATETIME NULL,
  `PaymentMethod` INT NULL,
  PRIMARY KEY (`ChittyTransactionID`),
  UNIQUE INDEX `ChittyTransactionID_UNIQUE` (`ChittyTransactionID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ChittyAccounts`.`ChittyAuctions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChittyAccounts`.`ChittyAuctions` (
  `ChittyID` INT NOT NULL,
  `ChtyTermNo` INT NULL,
  `AuctionDate` DATETIME NULL,
  `WinnerID` INT NULL,
  `WinningAmt` INT NULL,
  `PaymentDate` DATETIME NULL,
  PRIMARY KEY (`ChittyID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ChittyAccounts`.`AccountTransactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChittyAccounts`.`AccountTransactions` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ChittyAccounts`.`Banks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChittyAccounts`.`Banks` (
  `BankID` INT NOT NULL AUTO_INCREMENT,
  `IBAN` VARCHAR(20) NULL,
  `Bank Name` VARCHAR(50) NULL,
  `AccName` VARCHAR(50) NULL,
  PRIMARY KEY (`BankID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ChittyAccounts`.`BankUsers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ChittyAccounts`.`BankUsers` (
  `BankID` INT NOT NULL,
  `UserID` INT NULL,
  PRIMARY KEY (`BankID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
