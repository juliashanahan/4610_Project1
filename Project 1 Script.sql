-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cs_bag15552
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cs_bag15552
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cs_bag15552` DEFAULT CHARACTER SET utf8 ;
USE `cs_bag15552` ;

-- -----------------------------------------------------
-- Table `cs_bag15552`.`Buildings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Buildings` (
  `idBuildings` INT NOT NULL,
  `Building_Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Total_Apartments` INT NULL,
  PRIMARY KEY (`idBuildings`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Apartment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Apartment` (
  `idApartment` INT NOT NULL,
  `Room_Number` INT NULL,
  `Number_Of_Bedrooms` INT NULL,
  `Number_Of_Bathrooms` INT NULL,
  `Rent` INT NULL,
  `Availability` VARCHAR(45) NULL,
  `Buildings_idBuildings` INT NOT NULL,
  PRIMARY KEY (`idApartment`),
  INDEX `fk_Apartment_Buildings1_idx` (`Buildings_idBuildings` ASC) VISIBLE,
  CONSTRAINT `fk_Apartment_Buildings1`
    FOREIGN KEY (`Buildings_idBuildings`)
    REFERENCES `cs_bag15552`.`Buildings` (`idBuildings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Leases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Leases` (
  `idLeases` INT NOT NULL,
  `Start_Date` DATE NULL,
  `End_Date` DATE NULL,
  `Rent_Amount` INT NULL,
  `Security_Deposit` INT NULL,
  `Status` VARCHAR(45) NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idLeases`),
  INDEX `fk_Leases_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Leases_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `cs_bag15552`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Student` (
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
    REFERENCES `cs_bag15552`.`Leases` (`idLeases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Rent_Payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Rent_Payments` (
  `idRent Payments` INT NOT NULL,
  `Payment_Date` DATE NULL,
  `Amount_Paid` INT NULL,
  `Status` VARCHAR(45) NULL,
  `Leases_idLeases` INT NOT NULL,
  PRIMARY KEY (`idRent Payments`),
  INDEX `fk_Rent Payments_Leases1_idx` (`Leases_idLeases` ASC) VISIBLE,
  CONSTRAINT `fk_Rent Payments_Leases1`
    FOREIGN KEY (`Leases_idLeases`)
    REFERENCES `cs_bag15552`.`Leases` (`idLeases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Maintenance_Requests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Maintenance_Requests` (
  `idMaintenance_Requests` INT NOT NULL,
  `Request_Date` DATE NULL,
  `Description` VARCHAR(200) NULL,
  `Status` VARCHAR(45) NULL,
  `Completion_Date` DATE NULL,
  PRIMARY KEY (`idMaintenance_Requests`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Utilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Utilities` (
  `idUtilities` INT NOT NULL,
  `Cost_Per_Month` INT NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idUtilities`),
  INDEX `fk_Utilities_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Utilities_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `cs_bag15552`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Furniture_Inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Furniture_Inventory` (
  `idFurniture_Inventory` INT NOT NULL,
  `Furniture_Type` VARCHAR(45) NULL,
  `Quantity` INT NULL,
  `Condition` VARCHAR(45) NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idFurniture_Inventory`),
  INDEX `fk_Furniture Inventory_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Furniture Inventory_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `cs_bag15552`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Parking_Permits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Parking_Permits` (
  `idParking_Permits` INT NOT NULL,
  `License_Plate_Number` VARCHAR(45) NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idParking_Permits`),
  INDEX `fk_Parking Permits_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Parking Permits_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `cs_bag15552`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Maintenance_Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Maintenance_Staff` (
  `idMaintenance_Staff` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Role` VARCHAR(45) NULL,
  `Buildings_idBuildings` INT NOT NULL,
  PRIMARY KEY (`idMaintenance_Staff`),
  INDEX `fk_Maintenance Staff_Buildings1_idx` (`Buildings_idBuildings` ASC) VISIBLE,
  CONSTRAINT `fk_Maintenance Staff_Buildings1`
    FOREIGN KEY (`Buildings_idBuildings`)
    REFERENCES `cs_bag15552`.`Buildings` (`idBuildings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Student_has_Maintenance_Requests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Student_has_Maintenance_Requests` (
  `Student_idStudent` INT NOT NULL,
  `Maintenance_Requests_idMaintenance_Requests` INT NOT NULL,
  PRIMARY KEY (`Student_idStudent`, `Maintenance_Requests_idMaintenance_Requests`),
  INDEX `fk_Student_has_Maintenance_Requests_Maintenance_Requests1_idx` (`Maintenance_Requests_idMaintenance_Requests` ASC) VISIBLE,
  INDEX `fk_Student_has_Maintenance_Requests_Student1_idx` (`Student_idStudent` ASC) VISIBLE,
  CONSTRAINT `fk_Student_has_Maintenance_Requests_Student1`
    FOREIGN KEY (`Student_idStudent`)
    REFERENCES `cs_bag15552`.`Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_Maintenance_Requests_Maintenance_Requests1`
    FOREIGN KEY (`Maintenance_Requests_idMaintenance_Requests`)
    REFERENCES `cs_bag15552`.`Maintenance_Requests` (`idMaintenance_Requests`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Insert Data into `Buildings`
INSERT INTO `cs_bag15552`.`Buildings` (`idBuildings`, `Building_Name`, `Address`, `Total_Apartments`) VALUES
(1, 'Sunrise Apartments', '123 Maple Street', 50),
(2, 'Oakwood Towers', '456 Oak Avenue', 75),
(3, 'Pinecrest Residence', '789 Pine Road', 60);

-- Insert Data into `Apartment`
INSERT INTO `cs_bag15552`.`Apartment` (`idApartment`, `Room_Number`, `Number_Of_Bedrooms`, `Number_Of_Bathrooms`, `Rent`, `Availability`, `Buildings_idBuildings`) VALUES
(1, 101, 2, 1, 1200, 'Available', 1),
(2, 102, 3, 2, 1300, 'Occupied', 1),
(3, 201, 1, 1, 1100, 'Available', 2),
(4, 202, 2, 2, 1250, 'Occupied', 2),
(5, 301, 2, 1, 1400, 'Available', 3),
(6, 302, 1, 1, 1100, 'Occupied', 3),
(7, 303, 3, 2, 1500, 'Available', 1),
(8, 304, 2, 2, 1600, 'Occupied', 1),
(9, 305, 1, 1, 1200, 'Available', 2),
(10, 306, 2, 1, 1300, 'Occupied', 2),
(11, 307, 3, 2, 1450, 'Available', 3),
(12, 308, 1, 1, 1100, 'Occupied', 3),
(13, 309, 2, 2, 1550, 'Available', 1),
(14, 310, 3, 2, 1650, 'Occupied', 1),
(15, 311, 1, 1, 1150, 'Available', 2),
(16, 312, 2, 2, 1350, 'Occupied', 2),
(17, 313, 3, 2, 1700, 'Available', 3),
(18, 314, 1, 1, 1200, 'Occupied', 3),
(19, 315, 2, 1, 1300, 'Available', 1),
(20, 316, 3, 2, 1500, 'Occupied', 1);

-- Insert Data into `Leases`
INSERT INTO `cs_bag15552`.`Leases` (`idLeases`, `Start_Date`, `End_Date`, `Rent_Amount`, `Security_Deposit`, `Status`, `Apartment_idApartment`) VALUES
(1, '2023-01-01', '2024-01-01', 1200, 600, 'Active', 1),
(2, '2023-02-01', '2024-02-01', 1300, 650, 'Active', 2),
(3, '2023-03-01', '2024-03-01', 1100, 550, 'Active', 3),
(4, '2023-04-01', '2024-04-01', 1250, 625, 'Active', 4),
(5, '2023-05-01', '2024-05-01', 1400, 700, 'Active', 5),
(6, '2023-06-01', '2024-06-01', 1100, 550, 'Active', 6),
(7, '2023-07-01', '2024-07-01', 1500, 750, 'Active', 7),
(8, '2023-08-01', '2024-08-01', 1600, 800, 'Active', 8),
(9, '2023-09-01', '2024-09-01', 1200, 600, 'Active', 9),
(10, '2023-10-01', '2024-10-01', 1300, 650, 'Active', 10),
(11, '2023-01-01', '2024-01-01', 1450, 725, 'Active', 11),
(12, '2023-02-01', '2024-02-01', 1100, 550, 'Active', 12),
(13, '2023-03-01', '2024-03-01', 1550, 775, 'Active', 13),
(14, '2023-04-01', '2024-04-01', 1650, 825, 'Active', 14),
(15, '2023-05-01', '2024-05-01', 1150, 575, 'Active', 15),
(16, '2023-06-01', '2024-06-01', 1350, 675, 'Active', 16),
(17, '2023-07-01', '2024-07-01', 1700, 850, 'Active', 17),
(18, '2023-08-01', '2024-08-01', 1200, 600, 'Active', 18),
(19, '2023-09-01', '2024-09-01', 1300, 650, 'Active', 19),
(20, '2023-10-01', '2024-10-01', 1500, 750, 'Active', 20);

-- Insert Data into `Student`
INSERT INTO `cs_bag15552`.`Student` (`idStudent`, `First_Name`, `Last_Name`, `Email`, `Phone`, `Gender`, `Leases_idLeases`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-0101', 'Male', 1),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-0102', 'Female', 2),
(3, 'Mike', 'Brown', 'mike.brown@example.com', '555-0103', 'Male', 3),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '555-0104', 'Female', 4),
(5, 'Chris', 'Johnson', 'chris.johnson@example.com', '555-0105', 'Male', 5),
(6, 'Pat', 'Wilson', 'pat.wilson@example.com', '555-0106', 'Non-binary', 6),
(7, 'Taylor', 'Garcia', 'taylor.garcia@example.com', '555-0107', 'Female', 7),
(8, 'Morgan', 'Martinez', 'morgan.martinez@example.com', '555-0108', 'Male', 8),
(9, 'Jordan', 'Hernandez', 'jordan.hernandez@example.com', '555-0109', 'Non-binary', 9),
(10, 'Riley', 'Lopez', 'riley.lopez@example.com', '555-0110', 'Female', 10),
(11, 'Alex', 'Wright', 'alex.wright@example.com', '555-0111', 'Male', 11),
(12, 'Sam', 'Miller', 'sam.miller@example.com', '555-0112', 'Female', 12),
(13, 'Jamie', 'Green', 'jamie.green@example.com', '555-0113', 'Non-binary', 13),
(14, 'Taylor', 'Hughes', 'taylor.hughes@example.com', '555-0114', 'Male', 14),
(15, 'Casey', 'White', 'casey.white@example.com', '555-0115', 'Female', 15),
(16, 'Drew', 'Harris', 'drew.harris@example.com', '555-0116', 'Male', 16),
(17, 'Jesse', 'Clark', 'jesse.clark@example.com', '555-0117', 'Non-binary', 17),
(18, 'Dana', 'Moore', 'dana.moore@example.com', '555-0118', 'Female', 18),
(19, 'Charlie', 'Rivera', 'charlie.rivera@example.com', '555-0119', 'Male', 19),
(20, 'Casey', 'Patterson', 'casey.patterson@example.com', '555-0120', 'Female', 20);

-- Insert Data into `Rent_Payments`
INSERT INTO `cs_bag15552`.`Rent_Payments` (`idRent Payments`, `Payment_Date`, `Amount_Paid`, `Status`, `Leases_idLeases`) VALUES
(1, '2023-01-05', 1200, 'Paid', 1),
(2, '2023-02-05', 1300, 'Paid', 2),
(3, '2023-03-05', 1100, 'Pending', 3),
(4, '2023-04-05', 1250, 'Paid', 4),
(5, '2023-05-05', 1400, 'Late', 5),
(6, '2023-06-05', 1100, 'Paid', 6),
(7, '2023-07-05', 1500, 'Pending', 7),
(8, '2023-08-05', 1600, 'Paid', 8),
(9, '2023-09-05', 1200, 'Paid', 9),
(10, '2023-10-05', 1300, 'Late', 10),
(11, '2023-01-05', 1450, 'Paid', 11),
(12, '2023-02-05', 1100, 'Paid', 12),
(13, '2023-03-05', 1550, 'Pending', 13),
(14, '2023-04-05', 1650, 'Paid', 14),
(15, '2023-05-05', 1150, 'Late', 15),
(16, '2023-06-05', 1350, 'Paid', 16),
(17, '2023-07-05', 1700, 'Pending', 17),
(18, '2023-08-05', 1200, 'Paid', 18),
(19, '2023-09-05', 1300, 'Paid', 19),
(20, '2023-10-05', 1500, 'Late', 20);

-- Insert Data into `Maintenance_Requests`
INSERT INTO `cs_bag15552`.`Maintenance_Requests` (`idMaintenance_Requests`, `Request_Date`, `Description`, `Status`, `Completion_Date`) VALUES
(1, '2023-01-10', 'Leaky faucet in kitchen', 'Completed', '2023-01-15'),
(2, '2023-02-12', 'Broken window in bedroom', 'In Progress', NULL),
(3, '2023-03-14', 'Heating system malfunction', 'Completed', '2023-03-20'),
(4, '2023-04-16', 'Electrical issues in living room', 'Pending', NULL),
(5, '2023-05-18', 'Clogged bathroom drain', 'Completed', '2023-05-22'),
(6, '2023-06-20', 'Pest control needed in kitchen', 'In Progress', NULL),
(7, '2023-07-22', 'Air conditioner not working', 'Completed', '2023-07-30'),
(8, '2023-08-24', 'Broken door lock', 'Pending', NULL),
(9, '2023-09-26', 'Roof leakage', 'In Progress', NULL),
(10, '2023-10-28', 'Water heater replacement', 'Completed', '2023-11-05'),
(11, '2023-01-15', 'Leaky toilet', 'Completed', '2023-01-20'),
(12, '2023-02-18', 'Broken dishwasher', 'In Progress', NULL),
(13, '2023-03-20', 'Cracked wall in hallway', 'Completed', '2023-03-27'),
(14, '2023-04-22', 'No hot water in bathroom', 'Pending', NULL),
(15, '2023-05-25', 'Blown fuse', 'Completed', '2023-05-28'),
(16, '2023-06-27', 'Termite infestation', 'In Progress', NULL),
(17, '2023-07-29', 'Broken stove', 'Completed', '2023-08-02'),
(18, '2023-08-31', 'Roof tiles missing', 'Pending', NULL),
(19, '2023-09-30', 'Leaking fridge', 'In Progress', NULL),
(20, '2023-10-29', 'Broken shower head', 'Completed', '2023-11-06');

-- Insert Data into `Utilities`
INSERT INTO `cs_bag15552`.`Utilities` (`idUtilities`, `Cost_Per_Month`, `Apartment_idApartment`) VALUES
(1, 150, 1),
(2, 200, 2),
(3, 175, 3),
(4, 160, 4),
(5, 180, 5),
(6, 150, 6),
(7, 200, 7),
(8, 175, 8),
(9, 160, 9),
(10, 180, 10),
(11, 190, 11),
(12, 160, 12),
(13, 180, 13),
(14, 210, 14),
(15, 170, 15),
(16, 200, 16),
(17, 220, 17),
(18, 160, 18),
(19, 180, 19),
(20, 200, 20);

-- Insert Data into `Furniture_Inventory`
INSERT INTO `cs_bag15552`.`Furniture_Inventory` (`idFurniture_Inventory`, `Furniture_Type`, `Quantity`, `Condition`, `Apartment_idApartment`) VALUES
(1, 'Bed', 1, 'Good', 1),
(2, 'Desk', 1, 'Good', 1),
(3, 'Chair', 2, 'Fair', 1),
(4, 'Sofa', 1, 'Good', 2),
(5, 'Table', 1, 'Fair', 2),
(6, 'Bed', 1, 'Good', 3),
(7, 'Desk', 1, 'Good', 3),
(8, 'Chair', 2, 'Fair', 3),
(9, 'Sofa', 1, 'Good', 4),
(10, 'Table', 1, 'Fair', 4),
(11, 'Chair', 4, 'Good', 5),
(12, 'Bed', 1, 'Good', 6),
(13, 'Desk', 1, 'Fair', 6),
(14, 'Table', 1, 'Good', 7),
(15, 'Chair', 2, 'Good', 7),
(16, 'Sofa', 1, 'Fair', 8),
(17, 'Desk', 1, 'Good', 9),
(18, 'Bed', 1, 'Good', 10),
(19, 'Sofa', 1, 'Fair', 11),
(20, 'Table', 1, 'Good', 12);

-- Insert Data into `Parking_Permits`
INSERT INTO `cs_bag15552`.`Parking_Permits` (`idParking_Permits`, `License_Plate_Number`, `Apartment_idApartment`) VALUES
(1, 'ABC-1234', 1),
(2, 'XYZ-5678', 2),
(3, 'LMN-9101', 3),
(4, 'DEF-2345', 4),
(5, 'GHI-3456', 5),
(6, 'JKL-4567', 6),
(7, 'MNO-5678', 7),
(8, 'PQR-6789', 8),
(9, 'STU-7890', 9),
(10, 'VWX-8901', 10),
(11, 'ABC-1111', 11),
(12, 'XYZ-2222', 12),
(13, 'LMN-3333', 13),
(14, 'DEF-4444', 14),
(15, 'GHI-5555', 15),
(16, 'JKL-6666', 16),
(17, 'MNO-7777', 17),
(18, 'PQR-8888', 18),
(19, 'STU-9999', 19),
(20, 'VWX-0000', 20);

-- Insert Data into `Maintenance_Staff`
INSERT INTO `cs_bag15552`.`Maintenance_Staff` (`idMaintenance_Staff`, `Name`, `Role`, `Buildings_idBuildings`) VALUES
(1, 'John Doe', 'Plumber', 1),
(2, 'Jane Smith', 'Electrician', 1),
(3, 'Mike Brown', 'Handyman', 2),
(4, 'Emily Davis', 'Supervisor', 2),
(5, 'Chris Johnson', 'Technician', 3),
(6, 'Pat Wilson', 'Manager', 3),
(7, 'Taylor Garcia', 'Electrician', 1),
(8, 'Morgan Martinez', 'Janitor', 1),
(9, 'Jordan Hernandez', 'Worker', 2),
(10, 'Riley Lopez', 'Technician', 2),
(11, 'Alex Wright', 'Cleaner', 3),
(12, 'Sam Miller', 'Carpenter', 3),
(13, 'Jamie Green', 'Painter', 1),
(14, 'Taylor Hughes', 'Technician', 1),
(15, 'Casey White', 'Supervisor', 2),
(16, 'Drew Harris', 'Worker', 2),
(17, 'Jesse Clark', 'Electrician', 3),
(18, 'Dana Moore', 'Handyman', 3),
(19, 'Charlie Rivera', 'Plumber', 1),
(20, 'Casey Patterson', 'Manager', 1);

-- Insert Data into `Student_has_Maintenance_Requests`
INSERT INTO `cs_bag15552`.`Student_has_Maintenance_Requests` (`Student_idStudent`, `Maintenance_Requests_idMaintenance_Requests`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- TP_Q1
SELECT *  
FROM Maintenance_Requests  
WHERE Status = 'Pending';  

-- TP_Q2
SELECT *  
FROM Student 
JOIN Rent_Payments ON Student.Leases_idLeases = Rent_Payments.Leases_idLeases
WHERE Status = 'Late';  

-- TP_Q3
SELECT First_Name, Last_Name, (Rent_Amount * 12) AS `Total_Rent`  
FROM Student  
JOIN Leases ON Leases_idLeases = idLeases;  

-- TP_Q4
select Student.First_Name, Student.Last_Name, Leases.Start_Date
from Student
join Leases  on Student.Leases_idLeases = Leases.idLeases
where Leases.Status = 'Active';

-- TP_Q5
select Apartment.Room_Number, Apartment.Number_Of_Bedrooms, Apartment.Number_Of_Bathrooms,
Apartment.Rent, Buildings.Building_Name
from Apartment
join Buildings on Apartment.Buildings_idBuildings = Buildings.idBuildings
where Apartment.Availability = 'Available';

-- TP_Q6
select Room_Number, idApartment, Furniture_Type, Quantity, Furniture_Inventory.Condition
from Furniture_Inventory
join Apartment on Apartment.idApartment = Furniture_Inventory.Apartment_idApartment
order by idApartment, Furniture_Type;

-- TP_Q7
SELECT Apartment.Room_Number, Apartment.Number_Of_Bedrooms, AVG(Cost_Per_Month) AS 'avg Utilities'
FROM Apartment
JOIN Utilities ON Apartment.idApartment = Utilities.Apartment_idApartment
GROUP BY Apartment.Room_Number, Apartment.Number_Of_Bedrooms
HAVING AVG(Cost_Per_Month)>100;


-- TP_Q8
SELECT   
    Student.First_Name,  
    Student.Last_Name,  
    Student.Email,  
    Rent_Payments.Payment_Date,  
    Rent_Payments.Amount_Paid,  
    Rent_Payments.Status AS Payment_Status,  
    Leases.Rent_Amount AS Rent_Amount  
FROM   
    Student AS Student  
    JOIN Leases AS Leases ON Student.Leases_idLeases = Leases.idLeases  
    JOIN Rent_Payments AS Rent_Payments ON Leases.idLeases = Rent_Payments.Leases_idLeases  
WHERE   
    Rent_Payments.Status = 'Paid';  

-- TP_Q9
SELECT Apartment.Room_Number, Apartment.Number_Of_Bedrooms, Apartment.Number_Of_Bathrooms, Apartment.Rent, 
Buildings.Building_Name
FROM Apartment
JOIN Buildings ON Apartment.Buildings_idBuildings = Buildings.idBuildings
WHERE Apartment.Number_Of_Bedrooms > 2;

-- TP_Q10
SELECT Apartment.Room_Number, Apartment.Number_Of_Bedrooms, Apartment.Rent, Buildings.Building_Name
FROM Apartment
JOIN Buildings ON Apartment.Buildings_idBuildings = Buildings.idBuildings
ORDER BY Apartment.Rent ASC
LIMIT 5;

