create schema if not exists IMDB;
use IMDB;

CREATE TABLE IF NOT EXISTS `IMDB`.`Movie` (
  `MovieID` INT NOT NULL,
  `MovieName` VARCHAR(45) NOT NULL,
  `MovieDuration` INT NOT NULL,
  PRIMARY KEY (`MovieID`),
  UNIQUE INDEX `MovieID_UNIQUE` (`MovieID` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `IMDB`.`TVSeries` (
  `TVSeriesID` INT NOT NULL,
  `TVSeriesName` VARCHAR(45) NOT NULL,
  `TVSeriesEpisodes` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TVSeriesID`),
  UNIQUE INDEX `TVSeriesID_UNIQUE` (`TVSeriesID` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `IMDB`.`Actors` (
  `ActorsId` INT NOT NULL,
  `ActorsName` VARCHAR(45) NOT NULL,
  `ActorsMovieId` INT NOT NULL,
  `ActorsTVSeriesId` INT NOT NULL,
  PRIMARY KEY (`ActorsId`),
  UNIQUE INDEX `ActorsId_UNIQUE` (`ActorsId` ASC) VISIBLE,
  INDEX `fk_Actors_MovieID_idx` (`ActorsMovieId` ASC) VISIBLE,
  INDEX `fk_Actors_TVSeriesID_idx` (`ActorsTVSeriesId` ASC) VISIBLE,
  CONSTRAINT `fk_Actors_MovieID`
    FOREIGN KEY (`ActorsMovieId`)
    REFERENCES `IMDB`.`Movie` (`MovieID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actors_TVSeriesID`
    FOREIGN KEY (`ActorsTVSeriesId`)
    REFERENCES `IMDB`.`TVSeries` (`TVSeriesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;