-- MySQL Script generated by MySQL Workbench
-- Wed Jul  5 18:08:45 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `OrderId` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NULL,
  `date` DATETIME NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`OrderId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `cname` VARCHAR(45) NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `phone` VARCHAR(15) NULL,
  `address1` VARCHAR(100) NULL,
  `address2` VARCHAR(100) NULL,
  `address3` VARCHAR(100) NULL,
  `zipcode` VARCHAR(10) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `Orders_OrderId` INT NOT NULL,
  PRIMARY KEY (`userId`, `Orders_OrderId`),
  INDEX `fk_User_Orders1_idx` (`Orders_OrderId` ASC),
  CONSTRAINT `fk_User_Orders1`
    FOREIGN KEY (`Orders_OrderId`)
    REFERENCES `mydb`.`Orders` (`OrderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Product` (
  `productId` INT NOT NULL AUTO_INCREMENT,
  `productName` VARCHAR(200) NULL,
  `inStock` INT NULL,
  `sPrice` DECIMAL(2) NULL,
  `bPrice` DECIMAL(2) NULL,
  `description` VARCHAR(100) NULL,
  `category` VARCHAR(45) NULL,
  PRIMARY KEY (`productId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrderToProducts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrderToProducts` (
  `Product_productId` INT NOT NULL,
  `Orders_OrderId` INT NOT NULL,
  `priceEach` DECIMAL(2) NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`Product_productId`, `Orders_OrderId`),
  INDEX `fk_Product_has_Orders_Orders1_idx` (`Orders_OrderId` ASC),
  INDEX `fk_Product_has_Orders_Product_idx` (`Product_productId` ASC),
  CONSTRAINT `fk_Product_has_Orders_Product`
    FOREIGN KEY (`Product_productId`)
    REFERENCES `mydb`.`Product` (`productId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_has_Orders_Orders1`
    FOREIGN KEY (`Orders_OrderId`)
    REFERENCES `mydb`.`Orders` (`OrderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
