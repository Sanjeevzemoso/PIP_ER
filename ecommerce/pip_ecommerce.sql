create schema if not exists Ecommerce;
use Ecommerce;

CREATE TABLE IF NOT EXISTS `Ecommerce`.`Customer` (
  `CustomerId` INT NOT NULL,
  `CustomerFirstName` VARCHAR(45) NOT NULL,
  `CustomerLastName` VARCHAR(45) NOT NULL,
  `CustomerStreet` VARCHAR(45) NOT NULL,
  `CustomerCity` VARCHAR(45) NOT NULL,
  `CustomerState` VARCHAR(45) NOT NULL,
  `CustomerZipCode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerId`),
  UNIQUE INDEX `CustomerId_UNIQUE` (`CustomerId` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Ecommerce`.`Order` (
  `OrderId` INT NOT NULL,
  `OrderCustomerId` INT NOT NULL,
  `OrderDate` DATETIME NOT NULL,
  PRIMARY KEY (`OrderId`),
  UNIQUE INDEX `OrderId_UNIQUE` (`OrderId` ASC) VISIBLE,
  INDEX `fk_Order_CustomerID_idx` (`OrderCustomerId` ASC) VISIBLE,
  CONSTRAINT `fk_Order_CustomerID`
    FOREIGN KEY (`OrderCustomerId`)
    REFERENCES `Ecommerce`.`Customer` (`CustomerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Ecommerce`.`Items` (
  `ItemsId` INT NOT NULL,
  `ItemsName` VARCHAR(45) NOT NULL,
  `ItemsQuantity` INT NOT NULL,
  `ItemsPrice` DECIMAL NOT NULL,
  `ItemsOrderID` INT NOT NULL,
  `ItemsSupplierID` INT NOT NULL,
  PRIMARY KEY (`ItemsId`),
  UNIQUE INDEX `ItemsId_UNIQUE` (`ItemsId` ASC) VISIBLE,
  INDEX `fk_Items_OrderID_idx` (`ItemsOrderID` ASC) VISIBLE,
  INDEX `fk_Items_SupplierID_idx` (`ItemsSupplierID` ASC) VISIBLE,
  CONSTRAINT `fk_Items_OrderID`
    FOREIGN KEY (`ItemsOrderID`)
    REFERENCES `Ecommerce`.`Order` (`OrderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Items_SupplierID`
    FOREIGN KEY (`ItemsSupplierID`)
    REFERENCES `Ecommerce`.`Supplier` (`SupplierId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Ecommerce`.`Supplier` (
  `SupplierId` INT NOT NULL,
  `SupplierName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SupplierId`),
  UNIQUE INDEX `SupplierId_UNIQUE` (`SupplierId` ASC) VISIBLE)
ENGINE = InnoDB;