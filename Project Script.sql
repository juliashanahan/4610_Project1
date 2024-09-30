
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cs_pes30522
-- -----------------------------------------------------
use cs_pes30522;
-- -----------------------------------------------------
-- Schema cs_pes30522
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cs_pes30522` DEFAULT CHARACTER SET utf8 ;
USE `cs_pes30522` ;

-- -----------------------------------------------------
-- Table `cs_pes30522`.`Leases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_pes30522`.`Leases` (
  `idLeases` INT NOT NULL,
  `Start_Date` DATE NULL,
  `End_Date` DATE NULL,
  `Rent_Amount` INT NULL,
  `Security_Deposit` INT NULL,
  `Status` VARCHAR(45) NULL,
  PRIMARY KEY (`idLeases`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_pes30522`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_pes30522`.`Student` (
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
    REFERENCES `cs_pes30522`.`Leases` (`idLeases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_pes30522`.`Buildings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_pes30522`.`Buildings` (
  `idBuildings` INT NOT NULL,
  `Building_Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Total_Apartments` INT NULL,
  PRIMARY KEY (`idBuildings`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_pes30522`.`Apartment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_pes30522`.`Apartment` (
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
    REFERENCES `cs_pes30522`.`Leases` (`idLeases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apartment_Buildings1`
    FOREIGN KEY (`Buildings_idBuildings`)
    REFERENCES `cs_pes30522`.`Buildings` (`idBuildings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_pes30522`.`Rent_Payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_pes30522`.`Rent_Payments` (
  `idRent_Payments` INT NOT NULL,
  `Payment_Date` DATE NULL,
  `Amount_Paid` INT NULL,
  `Status` VARCHAR(45) NULL,
  `Leases_idLeases` INT NOT NULL,
  PRIMARY KEY (`idRent_Payments`),
  INDEX `fk_Rent_Payments_Leases1_idx` (`Leases_idLeases` ASC) VISIBLE,
  CONSTRAINT `fk_Rent_Payments_Leases1`
    FOREIGN KEY (`Leases_idLeases`)
    REFERENCES `cs_pes30522`.`Leases` (`idLeases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_pes30522`.`Maintenance_Requests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_pes30522`.`Maintenance_Requests` (
  `idMaintenance_Requests` INT NOT NULL,
  `Request_Date` DATE NULL,
  `Description` VARCHAR(200) NULL,
  `Status` VARCHAR(45) NULL,
  `Completion_Date` DATE NULL,
  `Student_idStudent` INT NOT NULL,
  PRIMARY KEY (`idMaintenance_Requests`),
  INDEX `fk_Maintenance_Requests_Student1_idx` (`Student_idStudent` ASC) VISIBLE,
  CONSTRAINT `fk_Maintenance_Requests_Student1`
    FOREIGN KEY (`Student_idStudent`)
    REFERENCES `cs_pes30522`.`Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_pes30522`.`Roommates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_pes30522`.`Roommates` (
  `idRoommates` INT NOT NULL,
  `Shared_Lease` VARCHAR(45) NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idRoommates`),
  INDEX `fk_Roommates_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Roommates_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `cs_pes30522`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_pes30522`.`Utilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_pes30522`.`Utilities` (
  `idUtilities` INT NOT NULL,
  `Cost_Per_Month` INT NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idUtilities`),
  INDEX `fk_Utilities_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Utilities_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `cs_pes30522`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_pes30522`.`Contracts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_pes30522`.`Contracts` (
  `idContracts` INT NOT NULL,
  `Signed_Date` DATE NULL,
  `Expiration_Date` DATE NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idContracts`),
  INDEX `fk_Contracts_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Contracts_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `cs_pes30522`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_pes30522`.`Furniture_Inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_pes30522`.`Furniture_Inventory` (
  `idFurniture_Inventory` INT NOT NULL,
  `Furniture_Type` VARCHAR(45) NULL,
  `Quantity` INT NULL,
  `Condition` VARCHAR(45) NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idFurniture_Inventory`),
  INDEX `fk_Furniture_Inventory_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Furniture_Inventory_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `cs_pes30522`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_pes30522`.`Parking_Permits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_pes30522`.`Parking_Permits` (
  `idParking_Permits` INT NOT NULL,
  `License_Plate_Number` VARCHAR(45) NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idParking_Permits`),
  INDEX `fk_Parking Permits_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Parking_Permits_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `cs_pes30522`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_pes30522`.`Maintenance_Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_pes30522`.`Maintenance_Staff` (
  `idMaintenance_Staff` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Role` VARCHAR(45) NULL,
  `Buildings_idBuildings` INT NOT NULL,
  PRIMARY KEY (`idMaintenance_Staff`),
  INDEX `fk_Maintenance Staff_Buildings1_idx` (`Buildings_idBuildings` ASC) VISIBLE,
  CONSTRAINT `fk_Maintenance_Staff_Buildings1`
    FOREIGN KEY (`Buildings_idBuildings`)
    REFERENCES `cs_pes30522`.`Buildings` (`idBuildings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_pes30522`.`Apartment_has_Maintenance_Requests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_pes30522`.`Apartment_has_Maintenance_Requests` (
  `Apartment_idApartment` INT NOT NULL,
  `Maintenance_Requests_idMaintenance_Requests` INT NOT NULL,
  PRIMARY KEY (`Apartment_idApartment`, `Maintenance_Requests_idMaintenance_Requests`),
  INDEX `fk_Apartment_has_Maintenance_Requests_Maintenance Requests1_idx` (`Maintenance_Requests_idMaintenance_Requests` ASC) VISIBLE,
  INDEX `fk_Apartment_has_Maintenance_Requests_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Apartment_has_Maintenance_Requests_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `cs_pes30522`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apartment_has_Maintenance_Requests_Maintenance_Requests1`
    FOREIGN KEY (`Maintenance_Requests_idMaintenance_Requests`)
    REFERENCES `cs_pes30522`.`Maintenance Requests` (`idMaintenance_Requests`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


select * from Apartment, 
	Leases, 
    Contracts, 
    Buildings, 
    Roommates,
    Student,
    Rent_Payments,
    Utilities,
    Apartment_has_Maintenance_Requests,
    Maintenance_Requests,
    Parking_Permits;
