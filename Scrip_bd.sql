-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema proyecto_integrador_sql_delta
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyecto_integrador_sql_delta
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyecto_integrador_sql_delta` DEFAULT CHARACTER SET utf8 ;
USE `proyecto_integrador_sql_delta` ;

-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_delta`.`modules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_delta`.`modules` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `duration` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `modality` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_delta`.`careers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_delta`.`careers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `cohor` INT NOT NULL,
  `description` TEXT NOT NULL,
  `photo` VARCHAR(45) NULL,
  `working_day` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_delta`.`careers_modules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_delta`.`careers_modules` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `career_id` INT NOT NULL,
  `module_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `careers_modules_modules_fkey_idx` (`module_id` ASC) VISIBLE,
  INDEX `careers_modules_careers_fkey_idx` (`career_id` ASC) VISIBLE,
  CONSTRAINT `careers_modules_modules_fkey`
    FOREIGN KEY (`module_id`)
    REFERENCES `proyecto_integrador_sql_delta`.`modules` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `careers_modules_careers_fkey`
    FOREIGN KEY (`career_id`)
    REFERENCES `proyecto_integrador_sql_delta`.`careers` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_delta`.`the_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_delta`.`the_groups` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(45) NOT NULL,
  `journey` VARCHAR(50) NOT NULL,
  `career_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `groups_careers_fkey_idx` (`career_id` ASC) VISIBLE,
  CONSTRAINT `groups_careers_fkey`
    FOREIGN KEY (`career_id`)
    REFERENCES `proyecto_integrador_sql_delta`.`careers` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_delta`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_delta`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `document` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `cellphone` VARCHAR(45) NOT NULL,
  `photo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_delta`.`users_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_delta`.`users_groups` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `group_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `users_groups_groups_fkey_idx` (`group_id` ASC) VISIBLE,
  INDEX `users_groups_users_fkey_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `users_groups_groups_fkey`
    FOREIGN KEY (`group_id`)
    REFERENCES `proyecto_integrador_sql_delta`.`groups` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `users_groups_users_fkey`
    FOREIGN KEY (`user_id`)
    REFERENCES `proyecto_integrador_sql_delta`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_delta`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_delta`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_delta`.`users_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_delta`.`users_roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `users_roles_users_fkey_idx` (`user_id` ASC) VISIBLE,
  INDEX `users_roles_roles_fkey_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `users_roles_users_fkey`
    FOREIGN KEY (`user_id`)
    REFERENCES `proyecto_integrador_sql_delta`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `users_roles_roles_fkey`
    FOREIGN KEY (`role_id`)
    REFERENCES `proyecto_integrador_sql_delta`.`roles` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_delta`.`news`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_delta`.`news` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` TEXT NOT NULL,
  `description` TEXT NOT NULL,
  `photo` VARCHAR(45) NULL,
  `date` DATE NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `news_users_fkey_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `news_users_fkey`
    FOREIGN KEY (`user_id`)
    REFERENCES `proyecto_integrador_sql_delta`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_delta`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_delta`.`cities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_integrador_sql_delta`.`the_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_sql_delta`.`the_address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(60) NOT NULL,
  `city_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `address_cities_fkey_idx` (`city_id` ASC) VISIBLE,
  INDEX `address_users_fkey_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `address_cities_fkey`
    FOREIGN KEY (`city_id`)
    REFERENCES `proyecto_integrador_sql_delta`.`cities` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `address_users_fkey`
    FOREIGN KEY (`user_id`)
    REFERENCES `proyecto_integrador_sql_delta`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
