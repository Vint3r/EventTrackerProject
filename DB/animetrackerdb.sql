-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema animetrackerdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `animetrackerdb` ;

-- -----------------------------------------------------
-- Schema animetrackerdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `animetrackerdb` DEFAULT CHARACTER SET utf8 ;
USE `animetrackerdb` ;

-- -----------------------------------------------------
-- Table `day_aired`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `day_aired` ;

CREATE TABLE IF NOT EXISTS `day_aired` (
  `id` INT NOT NULL,
  `day` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `season`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `season` ;

CREATE TABLE IF NOT EXISTS `season` (
  `id` INT NOT NULL,
  `season` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anime`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `anime` ;

CREATE TABLE IF NOT EXISTS `anime` (
  `id` INT NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `description` TEXT(9999) NULL,
  `simulcast` TINYINT NULL DEFAULT 0,
  `interested_in` TINYINT NULL DEFAULT 0,
  `day_aired_id` INT NOT NULL,
  `season_id` INT NOT NULL,
  `release_year` VARCHAR(45) NULL,
  `image_url` TEXT(9999) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_anime_day_aired_idx` (`day_aired_id` ASC),
  INDEX `fk_anime_season1_idx` (`season_id` ASC),
  CONSTRAINT `fk_anime_day_aired`
    FOREIGN KEY (`day_aired_id`)
    REFERENCES `day_aired` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_anime_season1`
    FOREIGN KEY (`season_id`)
    REFERENCES `season` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL,
  `category` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anime_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `anime_category` ;

CREATE TABLE IF NOT EXISTS `anime_category` (
  `category_id` INT NOT NULL,
  `anime_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `anime_id`),
  INDEX `fk_category_has_anime_anime1_idx` (`anime_id` ASC),
  INDEX `fk_category_has_anime_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_category_has_anime_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_anime_anime1`
    FOREIGN KEY (`anime_id`)
    REFERENCES `anime` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS animeuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'animeuser'@'localhost' IDENTIFIED BY 'animeuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'animeuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
