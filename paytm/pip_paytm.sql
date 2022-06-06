create schema if not exists paytm;
use Paytm;

CREATE TABLE IF NOT EXISTS `Paytm`.`Customer` (
  `CustomerId` INT NOT NULL,
  `CustomerFirstName` VARCHAR(45) NOT NULL,
  `CustomerLastName` VARCHAR(45) NOT NULL,
  `CustomerAge` INT NOT NULL,
  `CustomerGender` ENUM("Male", "Female", "Transgender") NOT NULL,
  `CustomerDOB` DATE NOT NULL,
  `CustomerAddress` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerId`),
  UNIQUE INDEX `CustomerId_UNIQUE` (`CustomerId` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Paytm`.`Account` (
  `AccountNumber` INT NOT NULL,
  `AccountCustomerId` INT NOT NULL,
  `AccountBranchCode` VARCHAR(45) NOT NULL,
  `AccountName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AccountNumber`),
  UNIQUE INDEX `AccountNumber_UNIQUE` (`AccountNumber` ASC) VISIBLE,
  INDEX `fk_Account_CustomerID_idx` (`AccountCustomerId` ASC) VISIBLE,
  INDEX `fk_Account_BranchID_idx` (`AccountBranchCode` ASC) VISIBLE,
  CONSTRAINT `fk_Account_CustomerID`
    FOREIGN KEY (`AccountCustomerId`)
    REFERENCES `Paytm`.`Customer` (`CustomerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Account_BranchID`
    FOREIGN KEY (`AccountBranchCode`)
    REFERENCES `Paytm`.`Branch` (`BranchIFSC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Paytm`.`Branch` (
  `BranchCode` INT NOT NULL,
  `BranchIFSC` VARCHAR(45) NOT NULL,
  `BranchName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BranchCode`),
  UNIQUE INDEX `BranchIFSC_UNIQUE` (`BranchIFSC` ASC) VISIBLE,
  UNIQUE INDEX `BranchCode_UNIQUE` (`BranchCode` ASC) VISIBLE,
  UNIQUE INDEX `BranchName_UNIQUE` (`BranchName` ASC) VISIBLE)
ENGINE = InnoDB;