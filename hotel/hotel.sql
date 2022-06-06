create schema if not exists HotelBooking;
use HotelBooking;

CREATE TABLE IF NOT EXISTS `HotelBooking`.`Hotel` (
  `HotelName` VARCHAR(45) NOT NULL,
  `HotelAddress` VARCHAR(45) NOT NULL,
  `Num_Rooms` INT NOT NULL,
  `HotelId` INT NOT NULL,
  PRIMARY KEY (`HotelId`),
  UNIQUE INDEX `HotelId_UNIQUE` (`HotelId` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `HotelBooking`.`Customer` (
  `CustomerId` INT NOT NULL,
  PRIMARY KEY (`CustomerId`),
  UNIQUE INDEX `CustomerId_UNIQUE` (`CustomerId` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `HotelBooking`.`NewCustomer` (
  `CustomerId` INT NOT NULL,
  `CustomerFirstName` VARCHAR(45) NOT NULL,
  `CustomerLastName` VARCHAR(45) NOT NULL,
  `CustomerAge` TINYINT(2) NULL,
  `CustomerAddress` VARCHAR(45) NOT NULL,
  `CustomerIDProof` VARCHAR(45) NOT NULL,
  `CustomerHotelID` INT NOT NULL,
  PRIMARY KEY (`CustomerId`),
  UNIQUE INDEX `CustomerIDProof_UNIQUE` (`CustomerIDProof` ASC) VISIBLE,
  INDEX `fk_NewCustomer_HotelID_idx` (`CustomerHotelID` ASC) VISIBLE,
  CONSTRAINT `fk_NewCustomer_HotelID`
    FOREIGN KEY (`CustomerHotelID`)
    REFERENCES `HotelBooking`.`Hotel` (`HotelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NewCustomer_CustomerID`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `HotelBooking`.`Customer` (`CustomerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `HotelBooking`.`LoyalCustomer` (
  `CustomerId` INT NOT NULL,
  `LoyalCustomerHotelId` INT NULL,
  PRIMARY KEY (`CustomerId`),
  UNIQUE INDEX `CustomerId_UNIQUE` (`CustomerId` ASC) VISIBLE,
  UNIQUE INDEX `LoyalCustomerHotelId_UNIQUE` (`LoyalCustomerHotelId` ASC) VISIBLE,
  CONSTRAINT `fk_LoyalCustomer_HotelID`
    FOREIGN KEY (`LoyalCustomerHotelId`)
    REFERENCES `HotelBooking`.`Hotel` (`HotelId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LoyalCustomer_CustomerID`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `HotelBooking`.`Customer` (`CustomerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;