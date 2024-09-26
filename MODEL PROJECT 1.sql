-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Leases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Leases` (
  `idLeases` INT NOT NULL,
  `Start_Date` DATE NULL,
  `End_Date` DATE NULL,
  `Rent_Amount` INT NULL,
  `Security_Deposit` INT NULL,
  `Status` VARCHAR(45) NULL,
  PRIMARY KEY (`idLeases`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Student` (
  `idStudent` INT NOT NULL,
  `First_Name` VARCHAR(45) NULL,
  `Last_Name` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  `Gender` VARCHAR(45) NULL,
  `Leases_idLeases` INT NOT NULL,
  PRIMARY KEY (`idStudent`),
  INDEX `fk_Student_Leases_idx` (`Leases_idLeases` ASC) VISIBLE,
  CONSTRAINT `fk_Student_Leases`
    FOREIGN KEY (`Leases_idLeases`)
    REFERENCES `mydb`.`Leases` (`idLeases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Buildings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Buildings` (
  `idBuildings` INT NOT NULL,
  `Building_Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Total_Apartments` INT NULL,
  PRIMARY KEY (`idBuildings`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Apartment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Apartment` (
  `idApartment` INT NOT NULL,
  `Room_Number` INT NULL,
  `Number_Of_Bedrooms` INT NULL,
  `Number_Of_Bathrooms` INT NULL,
  `Rent` INT NULL,
  `Availability` VARCHAR(45) NULL,
  `Leases_idLeases` INT NOT NULL,
  `Buildings_idBuildings` INT NOT NULL,
  PRIMARY KEY (`idApartment`),
  INDEX `fk_Apartment_Leases1_idx` (`Leases_idLeases` ASC) VISIBLE,
  INDEX `fk_Apartment_Buildings1_idx` (`Buildings_idBuildings` ASC) VISIBLE,
  CONSTRAINT `fk_Apartment_Leases1`
    FOREIGN KEY (`Leases_idLeases`)
    REFERENCES `mydb`.`Leases` (`idLeases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apartment_Buildings1`
    FOREIGN KEY (`Buildings_idBuildings`)
    REFERENCES `mydb`.`Buildings` (`idBuildings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rent Payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rent Payments` (
  `idRent Payments` INT NOT NULL,
  `Payment_Date` DATE NULL,
  `Amount_Paid` INT NULL,
  `Status` VARCHAR(45) NULL,
  `Leases_idLeases` INT NOT NULL,
  PRIMARY KEY (`idRent Payments`),
  INDEX `fk_Rent Payments_Leases1_idx` (`Leases_idLeases` ASC) VISIBLE,
  CONSTRAINT `fk_Rent Payments_Leases1`
    FOREIGN KEY (`Leases_idLeases`)
    REFERENCES `mydb`.`Leases` (`idLeases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Maintenance Requests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Maintenance Requests` (
  `idMaintenance_Requests` INT NOT NULL,
  `Request_Date` DATE NULL,
  `Description` VARCHAR(200) NULL,
  `Status` VARCHAR(45) NULL,
  `Completion_Date` DATE NULL,
  `Student_idStudent` INT NOT NULL,
  PRIMARY KEY (`idMaintenance_Requests`),
  INDEX `fk_Maintenance Requests_Student1_idx` (`Student_idStudent` ASC) VISIBLE,
  CONSTRAINT `fk_Maintenance Requests_Student1`
    FOREIGN KEY (`Student_idStudent`)
    REFERENCES `mydb`.`Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Roommates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Roommates` (
  `idRoommates` INT NOT NULL,
  `Shared_Lease` VARCHAR(45) NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idRoommates`),
  INDEX `fk_Roommates_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Roommates_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `mydb`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Utilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Utilities` (
  `idUtilities` INT NOT NULL,
  `Cost_Per_Month` INT NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idUtilities`),
  INDEX `fk_Utilities_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Utilities_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `mydb`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Contracts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Contracts` (
  `idContracts` INT NOT NULL,
  `Signed_Date` DATE NULL,
  `Expiration_Date` DATE NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idContracts`),
  INDEX `fk_Contracts_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Contracts_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `mydb`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Furniture Inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Furniture Inventory` (
  `idFurniture_Inventory` INT NOT NULL,
  `Furniture_Type` VARCHAR(45) NULL,
  `Quantity` INT NULL,
  `Condition` VARCHAR(45) NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idFurniture_Inventory`),
  INDEX `fk_Furniture Inventory_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Furniture Inventory_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `mydb`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Parking Permits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Parking Permits` (
  `idParking_Permits` INT NOT NULL,
  `License_Plate_Number` VARCHAR(45) NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idParking_Permits`),
  INDEX `fk_Parking Permits_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Parking Permits_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `mydb`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Maintenance Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Maintenance Staff` (
  `idMaintenance_Staff` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Role` VARCHAR(45) NULL,
  `Buildings_idBuildings` INT NOT NULL,
  PRIMARY KEY (`idMaintenance_Staff`),
  INDEX `fk_Maintenance Staff_Buildings1_idx` (`Buildings_idBuildings` ASC) VISIBLE,
  CONSTRAINT `fk_Maintenance Staff_Buildings1`
    FOREIGN KEY (`Buildings_idBuildings`)
    REFERENCES `mydb`.`Buildings` (`idBuildings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Apartment_has_Maintenance Requests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Apartment_has_Maintenance Requests` (
  `Apartment_idApartment` INT NOT NULL,
  `Maintenance Requests_idMaintenance_Requests` INT NOT NULL,
  PRIMARY KEY (`Apartment_idApartment`, `Maintenance Requests_idMaintenance_Requests`),
  INDEX `fk_Apartment_has_Maintenance Requests_Maintenance Requests1_idx` (`Maintenance Requests_idMaintenance_Requests` ASC) VISIBLE,
  INDEX `fk_Apartment_has_Maintenance Requests_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Apartment_has_Maintenance Requests_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `mydb`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apartment_has_Maintenance Requests_Maintenance Requests1`
    FOREIGN KEY (`Maintenance Requests_idMaintenance_Requests`)
    REFERENCES `mydb`.`Maintenance Requests` (`idMaintenance_Requests`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
