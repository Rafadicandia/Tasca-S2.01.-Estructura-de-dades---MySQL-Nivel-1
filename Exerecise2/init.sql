SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Restaurant
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Restaurant` DEFAULT CHARACTER SET utf8mb3 ;
USE `Restaurant` ;

-- ------------------ CREACIÓN DE TABLAS ------------------

-- Table `Restaurant`.`Province`
CREATE TABLE IF NOT EXISTS `Restaurant`.`Province` (
  `idProvince` INT NOT NULL AUTO_INCREMENT,
  `Province` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idProvince`))
ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARACTER SET = utf8mb3;

-- Table `Restaurant`.`Site`
CREATE TABLE IF NOT EXISTS `Restaurant`.`Site` (
  `idSite` INT NOT NULL AUTO_INCREMENT,
  `Site` VARCHAR(45) NULL DEFAULT NULL,
  `Province_idProvince` INT NOT NULL,
  PRIMARY KEY (`idSite`),
  INDEX `fk_Site_Province1_idx` (`Province_idProvince` ASC) VISIBLE,
  CONSTRAINT `fk_Site_Province1`
    FOREIGN KEY (`Province_idProvince`)
    REFERENCES `Restaurant`.`Province` (`idProvince`)
    ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARACTER SET = utf8mb3;

-- Table `Restaurant`.`Branch`
CREATE TABLE IF NOT EXISTS `Restaurant`.`Branch` (
  `idBranch` INT NOT NULL AUTO_INCREMENT,
  `Address` VARCHAR(45) NOT NULL,
  `PostalCode` VARCHAR(45) NOT NULL,
  `Site_id` INT NOT NULL,
  PRIMARY KEY (`idBranch`),
  INDEX `fk_Branch_Site1_idx` (`Site_id` ASC) VISIBLE,
  CONSTRAINT `fk_Branch_Site1`
    FOREIGN KEY (`Site_id`)
    REFERENCES `Restaurant`.`Site` (`idSite`))
ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARACTER SET = utf8mb3;

-- Table `Restaurant`.`CategoryPizza`
CREATE TABLE IF NOT EXISTS `Restaurant`.`CategoryPizza` (
  `idCategoryPizza` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoryPizza`))
ENGINE = InnoDB AUTO_INCREMENT = 104 DEFAULT CHARACTER SET = utf8mb3;

-- Table `Restaurant`.`Customer`
CREATE TABLE IF NOT EXISTS `Restaurant`.`Customer` (
  `idCustomer` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `PostalCode` VARCHAR(45) NOT NULL,
  `Site_id` INT NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCustomer`),
  INDEX `fk_Customer_Site1_idx` (`Site_id` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Site1`
    FOREIGN KEY (`Site_id`)
    REFERENCES `Restaurant`.`Site` (`idSite`))
ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARACTER SET = utf8mb3;

-- Table `Restaurant`.`Employee`
CREATE TABLE IF NOT EXISTS `Restaurant`.`Employee` (
  `idEmployee` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(45) NULL DEFAULT NULL,
  `Rol` ENUM("Cook", "Deliverey") NULL,
  `Branch_idBranch` INT NOT NULL,
  PRIMARY KEY (`idEmployee`),
  INDEX `fk_Employee_Branch1_idx` (`Branch_idBranch` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Branch1`
    FOREIGN KEY (`Branch_idBranch`)
    REFERENCES `Restaurant`.`Branch` (`idBranch`)
    ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARACTER SET = utf8mb3;

-- Table `Restaurant`.`Order`
CREATE TABLE IF NOT EXISTS `Restaurant`.`Order` (
  `idOrder` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TakeAway` BINARY(2) NOT NULL,
  `TotalPrice` DECIMAL(5,0) NOT NULL,
  `Type` ENUM("Delivery", "Pickup") NOT NULL,
  `Branch_idBranch` INT NOT NULL,
  `Employee_idEmployee` INT NULL,
  `ArrivalTime` DATETIME NULL,
  `Customer_idCustomer` INT NOT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `fk_Order_Branch1_idx` (`Branch_idBranch` ASC) VISIBLE,
  INDEX `fk_Order_Employee1_idx` (`Employee_idEmployee` ASC) VISIBLE,
  INDEX `fk_Order_Customer1_idx` (`Customer_idCustomer` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Branch1`
    FOREIGN KEY (`Branch_idBranch`)
    REFERENCES `Restaurant`.`Branch` (`idBranch`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Employee1`
    FOREIGN KEY (`Employee_idEmployee`)
    REFERENCES `Restaurant`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Customer1`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `Restaurant`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB AUTO_INCREMENT = 1004 DEFAULT CHARACTER SET = utf8mb3;

-- Table `Restaurant`.`Product`
CREATE TABLE IF NOT EXISTS `Restaurant`.`Product` (
  `idProduct` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `Image` BLOB NULL DEFAULT NULL,
  `Price` DECIMAL(5,0) NOT NULL,
  `Type` ENUM("Pizza", "Burguer", "Drink") NOT NULL,
  `CategoryPizza_idCategoryPizza` INT NULL,
  PRIMARY KEY (`idProduct`),
  INDEX `fk_Product_CategoryPizza1_idx` (`CategoryPizza_idCategoryPizza` ASC) VISIBLE,
  CONSTRAINT `fk_Product_CategoryPizza1`
    FOREIGN KEY (`CategoryPizza_idCategoryPizza`)
    REFERENCES `Restaurant`.`CategoryPizza` (`idCategoryPizza`)
    ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARACTER SET = utf8mb3;

-- Table `Restaurant`.`OrderLine`
CREATE TABLE IF NOT EXISTS `Restaurant`.`OrderLine` (
  `idOrderLine` INT NOT NULL AUTO_INCREMENT,
  `Product_idProduct` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `Unit_Price` DECIMAL(5) NOT NULL,
  `Order_idOrder` INT NOT NULL,
  PRIMARY KEY (`idOrderLine`),
  INDEX `fk_OrderLine_Product1_idx` (`Product_idProduct` ASC) VISIBLE,
  INDEX `fk_OrderLine_Order1_idx` (`Order_idOrder` ASC) VISIBLE,
  CONSTRAINT `fk_OrderLine_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `Restaurant`.`Product` (`idProduct`)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderLine_Order1`
    FOREIGN KEY (`Order_idOrder`)
    REFERENCES `Restaurant`.`Order` (`idOrder`)
    ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- ------------------ INSERCIÓN DE DATOS ------------------

USE `Restaurant`;

-- Deshabilitar temporalmente la comprobación de claves foráneas
SET FOREIGN_KEY_CHECKS = 0;

-- ------------------ 1. GEOGRAFÍA, CATEGORÍAS Y PRODUCTOS ------------------

-- TABLA: Province
INSERT INTO Province (idProvince, Province) VALUES
(1, 'Barcelona'),
(2, 'Madrid'),
(3, 'Valencia');

-- TABLA: Site - Depende de Province
INSERT INTO Site (idSite, Site, Province_idProvince) VALUES
(10, 'Barcelona Ciudad', 1),
(20, 'Hospitalet', 1),
(30, 'Madrid Centro', 2);

-- TABLA: Branch - Depende de Site
INSERT INTO Branch (idBranch, Address, PostalCode, Site_id) VALUES
(100, 'C/ Falsa 10', '08001', 10),
(101, 'Av. Diagonal 20', '08901', 20),
(102, 'Pza. Mayor 5', '28005', 30);

-- TABLA: CategoryPizza
INSERT INTO CategoryPizza (idCategoryPizza, Name) VALUES
(1, 'Clásica'),
(2, 'Gourmet'),
(3, 'Vegetal');

-- TABLA: Product - Depende de CategoryPizza (opcional)
INSERT INTO Product (idProduct, Name, Description, Price, Type, CategoryPizza_idCategoryPizza) VALUES
(1001, 'Margarita', 'Tomate y mozzarella', 9, 'Pizza', 1),
(1002, 'Cabra', 'Queso de cabra y cebolla', 12, 'Pizza', 2),
(2001, 'Doble Beef', 'Doble carne, bacon', 11, 'Burguer', NULL),
(2002, 'Chicken Grill', 'Pechuga a la plancha', 9, 'Burguer', NULL),
(3001, 'Agua 50cl', 'Botella de agua mineral', 2, 'Drink', NULL),
(3002, 'Cola 33cl', 'Bebida de cola', 3, 'Drink', NULL);

-- ------------------ 2. CLIENTES Y EMPLEADOS ------------------

-- TABLA: Customer - Depende de Site
INSERT INTO Customer (idCustomer, Name, LastName, Address, PostalCode, Site_id, PhoneNumber) VALUES
(1, 'Elena', 'Ruiz', 'C/ Mar 1', '08002', 10, '600111222'),
(2, 'Javier', 'Sanz', 'C/ Sol 5', '28001', 30, '655333444');

-- TABLA: Employee - Depende de Branch
INSERT INTO Employee (idEmployee, Name, LastName, NIF, Rol, Branch_idBranch) VALUES
(1, 'Marta', 'Gómez', '40000000A', 'Cook', 100),
(2, 'Pablo', 'Vidal', '40000001B', 'Deliverey', 100),
(3, 'Raúl', 'Blanco', '40000002C', 'Cook', 102);

-- ------------------ 3. PEDIDOS ------------------

-- TABLA: Order - Depende de Branch, Customer y Employee (opcional)
INSERT INTO `Order` (idOrder, TakeAway, TotalPrice, Type, Branch_idBranch, Customer_idCustomer, Employee_idEmployee, ArrivalTime) VALUES
(5001, b'0', 15, 'Pickup', 100, 1, NULL, NULL),
(5002, b'1', 24, 'Delivery', 102, 2, NULL, DATE_ADD(NOW(), INTERVAL 30 MINUTE)),
(5003, b'1', 12, 'Delivery', 100, 1, 2, DATE_ADD(NOW(), INTERVAL 45 MINUTE));

-- TABLA: OrderLine - Depende de Product y Order
INSERT INTO OrderLine (idOrderLine, Product_idProduct, Quantity, Unit_Price, Order_idOrder) VALUES
(1, 1001, 1, 9, 5001), -- Margarita (9)
(2, 3002, 2, 3, 5001), -- Cola (2 * 3 = 6). Total Pedido 5001: 15
(3, 2001, 2, 11, 5002), -- Doble Beef (2 * 11 = 22)
(4, 3001, 1, 2, 5002), -- Agua (2). Total Pedido 5002: 24
(5, 1002, 1, 12, 5003); -- Cabra (12). Total Pedido 5003: 12

-- Habilitar de nuevo la comprobación de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;