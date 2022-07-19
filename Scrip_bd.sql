-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema proyecto_integrador_delta
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyecto_integrador_delta
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyecto_integrador_delta` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `proyecto_integrador_delta` ;

-- -----------------------------------------------------
-- Table `proyecto_integrador_delta`.`careers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_delta`.`careers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `cohor` INT NOT NULL,
  `description` TEXT NOT NULL,
  `photo` VARCHAR(45) NULL DEFAULT NULL,
  `working_day` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_integrador_delta`.`modules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_delta`.`modules` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `duration` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `modality` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_integrador_delta`.`careers_modules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_delta`.`careers_modules` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `career_id` INT NOT NULL,
  `module_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `careers_modules_careers_id_fkey_idx` (`career_id` ASC) VISIBLE,
  INDEX `careers_modules_module_id_fkey_idx` (`module_id` ASC) VISIBLE,
  CONSTRAINT `careers_modules_careers_id_fkey`
    FOREIGN KEY (`career_id`)
    REFERENCES `proyecto_integrador_delta`.`careers` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `careers_modules_module_id_fkey`
    FOREIGN KEY (`module_id`)
    REFERENCES `proyecto_integrador_delta`.`modules` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_integrador_delta`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_delta`.`cities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_integrador_delta`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_delta`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `document` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `cellphone` VARCHAR(45) NOT NULL,
  `photo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_integrador_delta`.`news`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_delta`.`news` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` TEXT NOT NULL,
  `description` TEXT NOT NULL,
  `photo` VARCHAR(45) NULL DEFAULT NULL,
  `date` DATE NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `news_users_id_fkey_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `news_users_id_fkey`
    FOREIGN KEY (`user_id`)
    REFERENCES `proyecto_integrador_delta`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_integrador_delta`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_delta`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_integrador_delta`.`the_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_delta`.`the_address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(60) NOT NULL,
  `city_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `the_address_cities_city_id_fkey_idx` (`city_id` ASC) VISIBLE,
  INDEX `the_address_users_user_id_fkey_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `the_address_cities_city_id_fkey`
    FOREIGN KEY (`city_id`)
    REFERENCES `proyecto_integrador_delta`.`cities` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `the_address_users_user_id_fkey`
    FOREIGN KEY (`user_id`)
    REFERENCES `proyecto_integrador_delta`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_integrador_delta`.`the_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_delta`.`the_groups` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(45) NOT NULL,
  `journey` VARCHAR(50) NOT NULL,
  `career_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `the_groups_careers_career_id_fkey_idx` (`career_id` ASC) VISIBLE,
  CONSTRAINT `the_groups_careers_career_id_fkey`
    FOREIGN KEY (`career_id`)
    REFERENCES `proyecto_integrador_delta`.`careers` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_integrador_delta`.`users_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_delta`.`users_groups` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `group_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `users_groups_the_groups_groups_id_fkey_idx` (`group_id` ASC) VISIBLE,
  INDEX `users_groups_users_user_id_fkey_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `users_groups_the_groups_groups_id_fkey`
    FOREIGN KEY (`group_id`)
    REFERENCES `proyecto_integrador_delta`.`the_groups` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `users_groups_users_user_id_fkey`
    FOREIGN KEY (`user_id`)
    REFERENCES `proyecto_integrador_delta`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_integrador_delta`.`users_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_integrador_delta`.`users_roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `users_roles_users_user_id_fkey_idx` (`user_id` ASC) VISIBLE,
  INDEX `users_roles_roles_role_id_fkey_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `users_roles_roles_role_id_fkey`
    FOREIGN KEY (`role_id`)
    REFERENCES `proyecto_integrador_delta`.`roles` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `users_roles_users_user_id_fkey`
    FOREIGN KEY (`user_id`)
    REFERENCES `proyecto_integrador_delta`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
