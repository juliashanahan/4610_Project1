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
-- Table `cs_bag15552`.`Leases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Leases` (
  `idLeases` INT NOT NULL,
  `Start_Date` DATE NULL,
  `End_Date` DATE NULL,
  `Rent_Amount` INT NULL,
  `Security_Deposit` INT NULL,
  `Status` VARCHAR(45) NULL,
  PRIMARY KEY (`idLeases`))
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
  `Leases_idLeases` INT NOT NULL,
  `Buildings_idBuildings` INT NOT NULL,
  PRIMARY KEY (`idApartment`),
  INDEX `fk_Apartment_Leases1_idx` (`Leases_idLeases` ASC) VISIBLE,
  INDEX `fk_Apartment_Buildings1_idx` (`Buildings_idBuildings` ASC) VISIBLE,
  CONSTRAINT `fk_Apartment_Leases1`
    FOREIGN KEY (`Leases_idLeases`)
    REFERENCES `cs_bag15552`.`Leases` (`idLeases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apartment_Buildings1`
    FOREIGN KEY (`Buildings_idBuildings`)
    REFERENCES `cs_bag15552`.`Buildings` (`idBuildings`)
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
  `Student_idStudent` INT NOT NULL,
  PRIMARY KEY (`idMaintenance_Requests`),
  INDEX `fk_Maintenance Requests_Student1_idx` (`Student_idStudent` ASC) VISIBLE,
  CONSTRAINT `fk_Maintenance Requests_Student1`
    FOREIGN KEY (`Student_idStudent`)
    REFERENCES `cs_bag15552`.`Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Roommates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Roommates` (
  `idRoommates` INT NOT NULL,
  `Shared_Lease` VARCHAR(45) NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idRoommates`),
  INDEX `fk_Roommates_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Roommates_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `cs_bag15552`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
-- Table `cs_bag15552`.`Contracts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Contracts` (
  `idContracts` INT NOT NULL,
  `Signed_Date` DATE NULL,
  `Expiration_Date` DATE NULL,
  `Apartment_idApartment` INT NOT NULL,
  PRIMARY KEY (`idContracts`),
  INDEX `fk_Contracts_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Contracts_Apartment1`
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
-- Table `cs_bag15552`.`Apartment_has_Maintenance Requests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Apartment_has_Maintenance Requests` (
  `Apartment_idApartment` INT NOT NULL,
  `Maintenance Requests_idMaintenance_Requests` INT NOT NULL,
  PRIMARY KEY (`Apartment_idApartment`, `Maintenance Requests_idMaintenance_Requests`),
  INDEX `fk_Apartment_has_Maintenance Requests_Maintenance Requests1_idx` (`Maintenance Requests_idMaintenance_Requests` ASC) VISIBLE,
  INDEX `fk_Apartment_has_Maintenance Requests_Apartment1_idx` (`Apartment_idApartment` ASC) VISIBLE,
  CONSTRAINT `fk_Apartment_has_Maintenance Requests_Apartment1`
    FOREIGN KEY (`Apartment_idApartment`)
    REFERENCES `cs_bag15552`.`Apartment` (`idApartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Apartment_has_Maintenance Requests_Maintenance Requests1`
    FOREIGN KEY (`Maintenance Requests_idMaintenance_Requests`)
    REFERENCES `cs_bag15552`.`Maintenance_Requests` (`idMaintenance_Requests`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- -----------------------------------------------------  
-- Insert Data into `cs_bag15552`.`Leases`  
-- -----------------------------------------------------  
INSERT INTO `cs_bag15552`.`Leases` (`idLeases`, `Start_Date`, `End_Date`, `Rent_Amount`, `Security_Deposit`, `Status`) VALUES  
(1, '2023-01-01', '2024-01-01', 1200, 600, 'Active'),  
(2, '2023-02-01', '2024-02-01', 1300, 650, 'Active'),  
(3, '2023-03-01', '2024-03-01', 1100, 550, 'Active'),  
(4, '2023-04-01', '2024-04-01', 1250, 625, 'Active'),  
(5, '2023-05-01', '2024-05-01', 1400, 700, 'Active'),  
(6, '2023-06-01', '2024-06-01', 1100, 550, 'Active'),  
(7, '2023-07-01', '2024-07-01', 1150, 575, 'Active'),  
(8, '2023-08-01', '2024-08-01', 1250, 625, 'Active'),  
(9, '2023-09-01', '2024-09-01', 1350, 675, 'Active'),  
(10, '2023-10-01', '2024-10-01', 1550, 775, 'Active');  

-- -----------------------------------------------------  
-- Insert Data into `cs_bag15552`.`Buildings`  
-- -----------------------------------------------------  
INSERT INTO `cs_bag15552`.`Buildings` (`idBuildings`, `Building_Name`, `Address`, `Total_Apartments`) VALUES  
(1, 'Sunrise Apartments', '123 Maple Street', 50),  
(2, 'Oakwood Towers', '456 Oak Avenue', 75),  
(3, 'Pinecrest Residence', '789 Pine Road', 60),  
(4, 'Lakeside Villas', '321 Lakeview Blvd', 40),  
(5, 'Cedar Heights', '654 Cedar Lane', 55),  
(6, 'Maple Leaf Condos', '987 Maple Drive', 65),  
(7, 'Willow Brook', '135 Willow Way', 45),  
(8, 'Birchwood Flats', '246 Birch Street', 70),  
(9, 'Elm Grove', '579 Elm Avenue', 80),  
(10, 'Aspen Park', '864 Aspen Road', 35);  

-- -----------------------------------------------------  
-- Insert Data into `cs_bag15552`.`Apartment`  
-- -----------------------------------------------------  
INSERT INTO `cs_bag15552`.`Apartment` (`idApartment`, `Room_Number`, `Number_Of_Bedrooms`, `Number_Of_Bathrooms`, `Rent`, `Availability`, `Leases_idLeases`, `Buildings_idBuildings`) VALUES  
(1, 101, 2, 1, 1200, 'Available', 1, 1),  
(2, 102, 3, 2, 1300, 'Occupied', 2, 1),  
(3, 201, 1, 1, 1100, 'Available', 3, 2),  
(4, 202, 2, 2, 1250, 'Occupied', 4, 2),  
(5, 301, 2, 1, 1400, 'Available', 5, 3),  
(6, 302, 1, 1, 1100, 'Occupied', 6, 3),  
(7, 401, 1, 1, 1150, 'Available', 7, 4),  
(8, 402, 2, 2, 1250, 'Occupied', 8, 4),  
(9, 501, 3, 2, 1350, 'Available', 9, 5),  
(10, 502, 2, 1, 1550, 'Occupied', 10, 5);  

-- -----------------------------------------------------  
-- Insert Data into `cs_bag15552`.`Student`  
-- -----------------------------------------------------  
INSERT INTO `cs_bag15552`.`Student` (`idStudent`, `First_Name`, `Last_Name`, `Email`, `Phone`, `Gender`, `Leases_idLeases`) VALUES  
(1, 'John', 'Doe', 'john.doe@example.com', '555-0100', 'Male', 1),  
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-0101', 'Female', 2),  
(3, 'Mike', 'Brown', 'mike.brown@example.com', '555-0102', 'Male', 3),  
(4, 'Emily', 'Davis', 'emily.davis@example.com', '555-0103', 'Female', 4),  
(5, 'Chris', 'Johnson', 'chris.johnson@example.com', '555-0104', 'Male', 5),  
(6, 'Pat', 'Wilson', 'pat.wilson@example.com', '555-0105', 'Non-binary', 6),  
(7, 'Taylor', 'Garcia', 'taylor.garcia@example.com', '555-0106', 'Female', 7),  
(8, 'Morgan', 'Martinez', 'morgan.martinez@example.com', '555-0107', 'Male', 8),  
(9, 'Jordan', 'Hernandez', 'jordan.hernandez@example.com', '555-0108', 'Non-binary', 9),  
(10, 'Riley', 'Lopez', 'riley.lopez@example.com', '555-0109', 'Female', 10);  

-- -----------------------------------------------------  
-- Insert Data into `cs_bag15552`.`Rent_Payments`  
-- -----------------------------------------------------  
INSERT INTO `cs_bag15552`.`Rent_Payments` (`idRent Payments`, `Payment_Date`, `Amount_Paid`, `Status`, `Leases_idLeases`) VALUES  
(1, '2023-01-05', 1200, 'Paid', 1),  
(2, '2023-02-05', 1300, 'Paid', 2),  
(3, '2023-03-05', 1100, 'Pending', 3),  
(4, '2023-04-05', 1250, 'Paid', 4),  
(5, '2023-05-05', 1400, 'Late', 5),  
(6, '2023-06-05', 1100, 'Paid', 6),  
(7, '2023-07-05', 1150, 'Pending', 7),  
(8, '2023-08-05', 1250, 'Paid', 8),  
(9, '2023-09-05', 1350, 'Paid', 9),  
(10, '2023-10-05', 1550, 'Late', 10);  

-- -----------------------------------------------------  
-- Insert Data into `cs_bag15552`.`Maintenance_Requests`  
-- -----------------------------------------------------  
INSERT INTO `cs_bag15552`.`Maintenance_Requests` (`idMaintenance_Requests`, `Request_Date`, `Description`, `Status`, `Completion_Date`, `Student_idStudent`) VALUES  
(1, '2023-01-10', 'Leaky faucet in kitchen', 'Completed', '2023-01-15', 1),  
(2, '2023-02-12', 'Broken window in bedroom', 'In Progress', NULL, 2),  
(3, '2023-03-14', 'Heating system malfunction', 'Completed', '2023-03-20', 3),  
(4, '2023-04-16', 'Electrical issues in living room', 'Pending', NULL, 4),  
(5, '2023-05-18', 'Clogged bathroom drain', 'Completed', '2023-05-22', 5),  
(6, '2023-06-20', 'Pest control needed in kitchen', 'In Progress', NULL, 6),  
(7, '2023-07-22', 'Air conditioner not working', 'Completed', '2023-07-30', 7),  
(8, '2023-08-24', 'Broken door lock', 'Pending', NULL, 8),  
(9, '2023-09-26', 'Roof leakage', 'In Progress', NULL, 9),  
(10, '2023-10-28', 'Water heater replacement', 'Completed', '2023-11-05', 10);  

-- -----------------------------------------------------  
-- Insert Data into `cs_bag15552`.`Furniture_Inventory`  
-- -----------------------------------------------------  
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
(10, 'Table', 1, 'Fair', 4);  

-- -----------------------------------------------------  
-- Insert Data into `cs_bag15552`.`Parking_Permits`  
-- -----------------------------------------------------  
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
(10, 'VWX-8901', 10);  

-- -----------------------------------------------------  
-- Insert Data into `cs_bag15552`.`Utilities`  
-- -----------------------------------------------------  
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
(10, 180, 10);  

-- -----------------------------------------------------  
-- Insert Data into `cs_bag15552`.`Roommates`  
-- -----------------------------------------------------  
INSERT INTO `cs_bag15552`.`Roommates` (`idRoommates`, `Shared_Lease`, `Apartment_idApartment`) VALUES  
(1, 'Yes', 1),  
(2, 'No', 1),  
(3, 'Yes', 2),  
(4, 'No', 2),  
(5, 'Yes', 3),  
(6, 'No', 3),  
(7, 'Yes', 4),  
(8, 'No', 4),  
(9, 'Yes', 5),  
(10, 'No', 5);  

-- -----------------------------------------------------  
-- Insert Data into `cs_bag15552`.`Maintenance_Staff`  
-- -----------------------------------------------------  
INSERT INTO `cs_bag15552`.`Maintenance_Staff` (`idMaintenance_Staff`, `Name`, `Role`, `Buildings_idBuildings`) VALUES  
(1, 'John Doe', 'Plumber', 1),  
(2, 'Jane Smith', 'Electrician', 2),  
(3, 'Mike Brown', 'Handyman', 3),  
(4, 'Emily Davis', 'Supervisor', 4),  
(5, 'Chris Johnson', 'Technician', 5),  
(6, 'Pat Wilson', 'Manager', 6),  
(7, 'Taylor Garcia', 'Electrician', 7),  
(8, 'Morgan Martinez', 'Janitor', 8),  
(9, 'Jordan Hernandez', 'Worker', 9),  
(10, 'Riley Lopez', 'Technician', 10);  

-- -----------------------------------------------------  
-- Insert Data into `cs_bag15552`.`Contracts`  
-- -----------------------------------------------------  
INSERT INTO `cs_bag15552`.`Contracts` (`idContracts`, `Signed_Date`, `Expiration_Date`, `Apartment_idApartment`) VALUES  
(1, '2023-01-01', '2024-01-01', 1),  
(2, '2023-02-01', '2024-02-01', 2),  
(3, '2023-03-01', '2024-03-01', 3),  
(4, '2023-04-01', '2024-04-01', 4),  
(5, '2023-05-01', '2024-05-01', 5),  
(6, '2023-06-01', '2024-06-01', 6),  
(7, '2023-07-01', '2024-07-01', 7),  
(8, '2023-08-01', '2024-08-01', 8),  
(9, '2023-09-01', '2024-09-01', 9),  
(10, '2023-10-01', '2024-10-01', 10);  

-- -----------------------------------------------------  
-- Insert Data into `cs_bag15552`.`Apartment_has_Maintenance Requests`  
-- -----------------------------------------------------  
INSERT INTO `cs_bag15552`.`Apartment_has_Maintenance Requests` (`Apartment_idApartment`, `Maintenance Requests_idMaintenance_Requests`) VALUES  
(1, 1),  
(1, 2),  
(2, 3),  
(2, 4),  
(3, 5),  
(4, 6),  
(4, 7),  
(5, 8),  
(6, 9),  
(7, 10);

# Query to Find Pending Maintenance Requests
SELECT *  
FROM Maintenance_Requests  
WHERE Status = 'Pending';  

# Query to find Overdue Rent Payments
SELECT *  
FROM Student 
JOIN Rent_Payments ON Student.Leases_idLeases = Rent_Payments.Leases_idLeases
WHERE Status = 'Late';  

# Query to Total Rent per Student for the year
SELECT First_Name, Last_Name, (Rent_Amount * 12) AS `Total_Rent`  
FROM Student  
JOIN Leases ON Leases_idLeases = idLeases;  

# Query to Find Students with Active Students
select Student.First_Name, Student.Last_Name, Leases.Start_Date
from Student
join Leases  on Student.Leases_idLeases = Leases.idLeases
where Leases.Status = 'Active';

# Query to List Apartments Available for Rent:
select Apartment.Room_Number, Apartment.Number_Of_Bedrooms, Apartment.Number_Of_Bathrooms,
Apartment.Rent, Buildings.Building_Name
from Apartment
join Buildings on Apartment.Buildings_idBuildings = Buildings.idBuildings
where Apartment.Availability = 'Available';

# Query to List Furniture Inventory per Apartment:
select Room_Number, idApartment, Furniture_Type, Quantity, Furniture_Inventory.Condition
from Furniture_Inventory
join Apartment on Apartment.idApartment = Furniture_Inventory.Apartment_idApartment
order by idApartment, Furniture_Type;

SELECT Apartment.Room_Number, Apartment.Number_Of_Bedrooms, AVG(Cost_Per_Month) AS 'avg Utilities'
FROM Apartment
JOIN Utilities ON Apartment.idApartment = Utilities.idApartment
GROUP BY Apartment.Room_Number, Apartment.Number_Of_Bedrooms
HAVING AVG(Cost_Per_Month)>100;

select Room_Number, Condition from Apartment join Furniture_Inventory
on Apartment.idApartment = Furniture_Inventory.idApartment
group by Apartment.Room_Number
having Condition = 'Poor';

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
