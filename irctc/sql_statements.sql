CREATE TABLE IF NOT EXISTS `irctc`.`Train` (
  `TrainNumber` INT NOT NULL,
  `TrainName` VARCHAR(45) NOT NULL,
  `TrainSource` VARCHAR(45) NOT NULL,
  `TrainDestination` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TrainNumber`),
  UNIQUE INDEX `TrainNumber_UNIQUE` (`TrainNumber` ASC) VISIBLE,
  UNIQUE INDEX `TrainName_UNIQUE` (`TrainName` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `irctc`.`UnReservedTicket` (
  `UnReservedTicketId` INT NOT NULL,
  `UnReservedCustomerID` INT NOT NULL,
  PRIMARY KEY (`UnReservedTicketId`),
  UNIQUE INDEX `UnReservedTicketId_UNIQUE` (`UnReservedTicketId` ASC) VISIBLE,
  INDEX `fk_UnReservedTicket_CustomerID_idx` (`UnReservedCustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_UnReservedTicket_CustomerID`
    FOREIGN KEY (`UnReservedCustomerID`)
    REFERENCES `irctc`.`Customer` (`CustomerID`),
  CONSTRAINT `fk_UnReservedTicket_TicketID`
    FOREIGN KEY (`UnReservedTicketId`)
    REFERENCES `irctc`.`Ticket` (`TicketId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `irctc`.`ReservedTicket` (
  `TrainNumber` INT NOT NULL,
  `SeatNumberAndCoach` VARCHAR(45) NOT NULL,
  `ReservedTicketCustomerId` INT NOT NULL,
  `ReservedTicketPrice` DECIMAL(10,0) NOT NULL,
  `ReservedTicketId` INT NOT NULL,
  PRIMARY KEY (`ReservedTicketId`),
  UNIQUE INDEX `SeatNumberAndCoach_UNIQUE` (`SeatNumberAndCoach` ASC) VISIBLE,
  UNIQUE INDEX `ReservedTicketCustomerId_UNIQUE` (`ReservedTicketCustomerId` ASC) VISIBLE,
  UNIQUE INDEX `ReservedTicketId_UNIQUE` (`ReservedTicketId` ASC) VISIBLE,
  INDEX `fk_ReservedTicket_TrainNumber` (`TrainNumber` ASC) VISIBLE,
  CONSTRAINT `fk_ReservedTicket_CustomerID`
    FOREIGN KEY (`ReservedTicketCustomerId`)
    REFERENCES `irctc`.`Customer` (`CustomerID`),
  CONSTRAINT `fk_ReservedTicket_TicketID`
    FOREIGN KEY (`ReservedTicketId`)
    REFERENCES `irctc`.`Ticket` (`TicketId`),
  CONSTRAINT `fk_ReservedTicket_TrainNumber`
    FOREIGN KEY (`TrainNumber`)
    REFERENCES `irctc`.`Train` (`TrainNumber`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `irctc`.`Customer` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(45) NOT NULL,
  `CustomerAge` TINYINT NOT NULL,
  `CustomerGender` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `CustomerID_UNIQUE` (`CustomerID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci


CREATE TABLE IF NOT EXISTS `irctc`.`Ticket` (
  `TicketId` INT NOT NULL AUTO_INCREMENT,
  `TicketCustomerId` INT NOT NULL,
  PRIMARY KEY (`TicketId`),
  UNIQUE INDEX `TicketId_UNIQUE` (`TicketId` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
