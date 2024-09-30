
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
    Maintenance_Staff,
    Parking_Permits;
    
    
### Data

INSERT INTO Leases (idLeases, Start_Date, End_Date, Rent_Amount, Security_Deposit, Status) VALUES
(1, '2023-01-01', '2023-12-31', 1200, 1000, 'Active'),
(2, '2023-02-01', '2023-12-31', 1500, 1200, 'Active'),
(3, '2023-03-01', '2024-02-28', 1000, 800, 'Active'),
(4, '2022-06-01', '2023-05-31', 2000, 1500, 'Inactive'),
(5, '2023-07-01', '2024-06-30', 1800, 1300, 'Active'),
(6, '2022-11-01', '2023-10-31', 1100, 950, 'Active'),
(7, '2023-08-01', '2024-07-31', 1300, 1000, 'Active'),
(8, '2023-09-01', '2024-08-31', 1700, 1100, 'Active'),
(9, '2023-05-01', '2024-04-30', 1400, 1050, 'Active'),
(10, '2023-10-01', '2024-09-30', 1600, 1250, 'Active');

INSERT INTO Buildings (idBuildings, Building_Name, Address, Total_Apartments) VALUES
(1, 'Oceanview', '123 Beach Road', 50),
(2, 'Sunset Towers', '456 Sunset Blvd', 40),
(3, 'Pine Apartments', '789 Pine St', 30),
(4, 'Maple Residences', '101 Maple Dr', 60),
(5, 'Seaside Villa', '102 Seaside Lane', 45),
(6, 'Hilltop Heights', '103 Hilltop Ave', 35),
(7, 'Cityscape Condos', '104 Cityscape Way', 25),
(8, 'Harbor Apartments', '105 Harbor Rd', 55),
(9, 'Lakeside Homes', '106 Lakeside Dr', 65),
(10, 'Riverside Flats', '107 Riverside Ave', 70);

INSERT INTO Apartment (idApartment, Room_Number, Number_Of_Bedrooms, Number_Of_Bathrooms, Rent, Availability, Leases_idLeases, Buildings_idBuildings) VALUES
(1, 101, 2, 1, 1200, 'Available', 1, 1),
(2, 202, 3, 2, 1500, 'Occupied', 2, 2),
(3, 303, 1, 1, 1000, 'Occupied', 3, 3),
(4, 404, 2, 2, 2000, 'Available', 4, 4),
(5, 505, 3, 2, 1800, 'Occupied', 5, 5),
(6, 606, 2, 1, 1100, 'Available', 6, 6),
(7, 707, 1, 1, 1300, 'Occupied', 7, 7),
(8, 808, 2, 2, 1700, 'Occupied', 8, 8),
(9, 909, 3, 2, 1400, 'Available', 9, 9),
(10, 1001, 1, 1, 1600, 'Occupied', 10, 10);

INSERT INTO `cs_pes30522`.`Contracts` (`idContracts`, `Signed_Date`, `Expiration_Date`, `Apartment_idApartment`)
VALUES
(1, '2023-01-01', '2024-01-01', 1),
(2, '2023-02-15', '2024-02-15', 2),
(3, '2023-03-10', '2024-03-10', 3),
(4, '2023-04-05', '2024-04-05', 4),
(5, '2023-05-20', '2024-05-20', 5),
(6, '2023-06-15', '2024-06-15', 6),
(7, '2023-07-25', '2024-07-25', 7),
(8, '2023-08-30', '2024-08-30', 8),
(9, '2023-09-10', '2024-09-10', 9),
(10, '2023-10-01', '2024-10-01', 10);

INSERT INTO Roommates (idRoommates, Shared_Lease, Apartment_idApartment) VALUES
(1, 'Yes', 1),
(2, 'Yes', 2),
(3, 'No', 3),
(4, 'Yes', 4),
(5, 'No', 5),
(6, 'Yes', 6),
(7, 'Yes', 7),
(8, 'No', 8),
(9, 'Yes', 9),
(10, 'Yes', 10);

INSERT INTO Student (idStudent, First_Name, Last_Name, Email, Phone, Gender, Leases_idLeases) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '123-456-7890', 'Female', 1),
(2, 'Bob', 'Smith', 'bob.smith@example.com', '123-456-7891', 'Male', 2),
(3, 'Charlie', 'Davis', 'charlie.davis@example.com', '123-456-7892', 'Male', 3),
(4, 'Diana', 'Morris', 'diana.morris@example.com', '123-456-7893', 'Female', 4),
(5, 'Eve', 'Taylor', 'eve.taylor@example.com', '123-456-7894', 'Female', 5),
(6, 'Frank', 'Miller', 'frank.miller@example.com', '123-456-7895', 'Male', 6),
(7, 'Grace', 'Wilson', 'grace.wilson@example.com', '123-456-7896', 'Female', 7),
(8, 'Henry', 'Anderson', 'henry.anderson@example.com', '123-456-7897', 'Male', 8),
(9, 'Ivy', 'Martinez', 'ivy.martinez@example.com', '123-456-7898', 'Female', 9),
(10, 'Jack', 'Parker', 'jack.parker@example.com', '123-456-7899', 'Male', 10);

INSERT INTO `Rent_Payments` (idRent_Payments, Payment_Date, Amount_Paid, Status, Leases_idLeases) VALUES
(1, '2023-01-05', 1200, 'Paid', 1),
(2, '2023-02-05', 1500, 'Paid', 2),
(3, '2023-03-05', 1000, 'Paid', 3),
(4, '2023-04-05', 2000, 'Paid', 4),
(5, '2023-05-05', 1800, 'Paid', 5),
(6, '2023-06-05', 1100, 'Paid', 6),
(7, '2023-07-05', 1300, 'Paid', 7),
(8, '2023-08-05', 1700, 'Paid', 8),
(9, '2023-09-05', 1400, 'Paid', 9),
(10, '2023-10-05', 1600, 'Paid', 10);

INSERT INTO Utilities (idUtilities, Cost_Per_Month, Apartment_idApartment) VALUES
(1, 150, 1),
(2, 200, 2),
(3, 100, 3),
(4, 250, 4),
(5, 180, 5),
(6, 130, 6),
(7, 160, 7),
(8, 220, 8),
(9, 140, 9),
(10, 200, 10);

INSERT INTO `Maintenance_Requests` (idMaintenance_Requests, Request_Date, Description, Status, Completion_Date, Student_idStudent) VALUES
(1, '2023-01-10', 'Fix the sink', 'Completed', '2023-01-15', 1),
(2, '2023-02-12', 'Replace the door lock', 'In Progress', NULL, 2),
(3, '2023-03-20', 'Paint the walls', 'Completed', '2023-03-25', 3),
(4, '2023-04-15', 'Repair the window', 'Pending', NULL, 4),
(5, '2023-05-18', 'Fix the heater', 'Completed', '2023-05-22', 5),
(6, '2023-06-22', 'Plumbing issue', 'In Progress', NULL, 6),
(7, '2023-07-28', 'Replace light bulbs', 'Completed', '2023-07-30', 7),
(8, '2023-08-05', 'Air conditioner repair', 'Pending', NULL, 8),
(9, '2023-09-10', 'Fix the fridge', 'Completed', '2023-09-15', 9),
(10, '2023-10-15', 'Floor repair', 'In Progress', NULL, 10);

INSERT INTO `cs_pes30522`.`Maintenance_Staff` (`idMaintenance_Staff`, `Name`, `Role`, `Buildings_idBuildings`)
VALUES
(1, 'John Doe', 'Plumber', 1),
(2, 'Jane Smith', 'Electrician', 2),
(3, 'Alice Johnson', 'Cleaner', 3),
(4, 'Bob Brown', 'Carpenter', 4),
(5, 'Charlie Green', 'Painter', 5),
(6, 'Eve White', 'Plumber', 6),
(7, 'Frank Black', 'Electrician', 7),
(8, 'Grace Yellow', 'Cleaner', 8),
(9, 'Hank Red', 'Carpenter', 9),
(10, 'Ivy Blue', 'Painter', 10);

INSERT INTO `cs_pes30522`.`Parking_Permits` (`idParking_Permits`, `License_Plate_Number`, `Apartment_idApartment`)
VALUES
(1, 'XYZ123', 1),
(2, 'ABC456', 2),
(3, 'DEF789', 3),
(4, 'GHI321', 4),
(5, 'JKL654', 5),
(6, 'MNO987', 6),
(7, 'PQR321', 7),
(8, 'STU654', 8),
(9, 'VWX987', 9),
(10, 'YZA123', 10);

INSERT INTO `cs_pes30522`.`Apartment_has_Maintenance_Requests` (`Apartment_idApartment`, `Maintenance_Requests_idMaintenance_Requests`)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
