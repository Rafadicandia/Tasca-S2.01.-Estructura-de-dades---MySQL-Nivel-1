-- MySQL dump 10.13  Distrib 9.4.0, for macos15 (x86_64)
--
-- Host: localhost    Database: Restaurant
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Branch`
--

DROP TABLE IF EXISTS `Branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Branch` (
  `idBranch` int NOT NULL AUTO_INCREMENT,
  `Address` varchar(45) NOT NULL,
  `PostalCode` varchar(45) NOT NULL,
  `Province_id` int NOT NULL,
  `Site_id` int NOT NULL,
  `Employee_id` int NOT NULL,
  `Order_id` int NOT NULL,
  PRIMARY KEY (`idBranch`),
  KEY `fk_Branch_Province1_idx` (`Province_id`),
  KEY `fk_Branch_Site1_idx` (`Site_id`),
  KEY `fk_Branch_Employee1_idx` (`Employee_id`),
  KEY `fk_Branch_Order1_idx` (`Order_id`),
  CONSTRAINT `fk_Branch_Employee1` FOREIGN KEY (`Employee_id`) REFERENCES `Employee` (`idEmployee`),
  CONSTRAINT `fk_Branch_Order1` FOREIGN KEY (`Order_id`) REFERENCES `Order` (`idOrder`),
  CONSTRAINT `fk_Branch_Province1` FOREIGN KEY (`Province_id`) REFERENCES `Province` (`idProvince`),
  CONSTRAINT `fk_Branch_Site1` FOREIGN KEY (`Site_id`) REFERENCES `Site` (`idSite`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branch`
--

LOCK TABLES `Branch` WRITE;
/*!40000 ALTER TABLE `Branch` DISABLE KEYS */;
INSERT INTO `Branch` VALUES (1,'Rambla de Cataluña 50','08007',1,1,1,1002),(2,'Gran Vía 12','28013',3,2,2,1003);
/*!40000 ALTER TABLE `Branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoryPizza`
--

DROP TABLE IF EXISTS `CategoryPizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CategoryPizza` (
  `idCategoryPizza` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Pizza_idPizza` int NOT NULL,
  PRIMARY KEY (`idCategoryPizza`),
  KEY `fk_CategoryPizza_Pizza1_idx` (`Pizza_idPizza`),
  CONSTRAINT `fk_CategoryPizza_Pizza1` FOREIGN KEY (`Pizza_idPizza`) REFERENCES `Pizza` (`idPizza`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoryPizza`
--

LOCK TABLES `CategoryPizza` WRITE;
/*!40000 ALTER TABLE `CategoryPizza` DISABLE KEYS */;
INSERT INTO `CategoryPizza` VALUES (101,'Clásica',1),(102,'Especial',2),(103,'Tropical',3);
/*!40000 ALTER TABLE `CategoryPizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `idCustomer` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `PostalCode` varchar(45) NOT NULL,
  `Province_id` int NOT NULL,
  `Site_id` int NOT NULL,
  `PhoneNumber` varchar(45) NOT NULL,
  PRIMARY KEY (`idCustomer`),
  KEY `fk_Customer_Province1_idx` (`Province_id`),
  KEY `fk_Customer_Site1_idx` (`Site_id`),
  CONSTRAINT `fk_Customer_Province1` FOREIGN KEY (`Province_id`) REFERENCES `Province` (`idProvince`),
  CONSTRAINT `fk_Customer_Site1` FOREIGN KEY (`Site_id`) REFERENCES `Site` (`idSite`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Elena','Vázquez','C/ Diagonal 30','08008',1,1,'600111222'),(2,'David','Peralta','Paseo de la Castellana 50','28001',3,2,'655333444'),(3,'Sofía','García','C/ Tetuán 1','41001',4,3,'677888999');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Drinks`
--

DROP TABLE IF EXISTS `Drinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Drinks` (
  `idDrinks` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Image` blob,
  `Price` decimal(5,0) NOT NULL,
  PRIMARY KEY (`idDrinks`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drinks`
--

LOCK TABLES `Drinks` WRITE;
/*!40000 ALTER TABLE `Drinks` DISABLE KEYS */;
INSERT INTO `Drinks` VALUES (1,'Coca Cola Zero','330ml lata',NULL,2),(2,'Agua con gas','500ml botella',NULL,1),(3,'Cerveza Lager','330ml artesana',NULL,3);
/*!40000 ALTER TABLE `Drinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `idEmployee` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `NIF` varchar(45) DEFAULT NULL,
  `Chef` binary(2) NOT NULL,
  `Delivery` binary(2) NOT NULL,
  PRIMARY KEY (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Marta','Rubio','11111111A',_binary '\0',_binary '\0\0'),(2,'Pablo','López','22222222B',_binary '\0\0',_binary '\0'),(3,'Raúl','Jiménez','33333333C',_binary '\0',_binary '\0\0');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hamburguer`
--

DROP TABLE IF EXISTS `Hamburguer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hamburguer` (
  `idHamburguer` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Image` blob,
  `Price` varchar(45) NOT NULL,
  PRIMARY KEY (`idHamburguer`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hamburguer`
--

LOCK TABLES `Hamburguer` WRITE;
/*!40000 ALTER TABLE `Hamburguer` DISABLE KEYS */;
INSERT INTO `Hamburguer` VALUES (1,'Doble Cheese','Doble carne y queso fundido, cebolla caramelizada.',NULL,'12'),(2,'Pollo Crispy','Pechuga de pollo crujiente y salsa de miel mostaza.',NULL,'10'),(3,'Veggie Burger','Hamburguesa de lentejas y aguacate.',NULL,'9');
/*!40000 ALTER TABLE `Hamburguer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `idOrder` int NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TakeAway` binary(2) NOT NULL,
  `Quantity` int NOT NULL,
  `TotalPrice` decimal(5,0) NOT NULL,
  `Customer_id` int NOT NULL,
  `Drinks_id` int DEFAULT NULL,
  `Pizza_id` int DEFAULT NULL,
  `Hamburguer_id` int DEFAULT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `fk_Order_Customer1_idx` (`Customer_id`),
  KEY `fk_Order_Drinks1_idx` (`Drinks_id`),
  KEY `fk_Order_Pizza1_idx` (`Pizza_id`),
  KEY `fk_Order_Hamburguer1_idx` (`Hamburguer_id`),
  CONSTRAINT `fk_Order_Customer1` FOREIGN KEY (`Customer_id`) REFERENCES `Customer` (`idCustomer`),
  CONSTRAINT `fk_Order_Drinks1` FOREIGN KEY (`Drinks_id`) REFERENCES `Drinks` (`idDrinks`),
  CONSTRAINT `fk_Order_Hamburguer1` FOREIGN KEY (`Hamburguer_id`) REFERENCES `Hamburguer` (`idHamburguer`),
  CONSTRAINT `fk_Order_Pizza1` FOREIGN KEY (`Pizza_id`) REFERENCES `Pizza` (`idPizza`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1002,'2025-10-27 12:16:44',_binary '\0',2,24,2,NULL,NULL,1),(1003,'2025-10-27 12:21:37',_binary '\0\0',4,8,3,1,NULL,NULL);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pizza`
--

DROP TABLE IF EXISTS `Pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pizza` (
  `idPizza` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(45) NOT NULL,
  `Image` blob,
  `Price` decimal(5,0) NOT NULL,
  PRIMARY KEY (`idPizza`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pizza`
--

LOCK TABLES `Pizza` WRITE;
/*!40000 ALTER TABLE `Pizza` DISABLE KEYS */;
INSERT INTO `Pizza` VALUES (1,'Prosciutto','Jamón y champiñones.',NULL,11),(2,'Vegana','Verduras de temporada, sin queso.',NULL,14),(3,'Hawaiana','Jamón cocido y piña.',NULL,12);
/*!40000 ALTER TABLE `Pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Province`
--

DROP TABLE IF EXISTS `Province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Province` (
  `idProvince` int NOT NULL AUTO_INCREMENT,
  `Province` varchar(45) DEFAULT NULL,
  `Site_idSite` int NOT NULL,
  PRIMARY KEY (`idProvince`),
  KEY `fk_Province_Site_idx` (`Site_idSite`),
  CONSTRAINT `fk_Province_Site` FOREIGN KEY (`Site_idSite`) REFERENCES `Site` (`idSite`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Province`
--

LOCK TABLES `Province` WRITE;
/*!40000 ALTER TABLE `Province` DISABLE KEYS */;
INSERT INTO `Province` VALUES (1,'Barcelona',1),(2,'Girona',1),(3,'Madrid',2),(4,'Sevilla',3);
/*!40000 ALTER TABLE `Province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Site`
--

DROP TABLE IF EXISTS `Site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Site` (
  `idSite` int NOT NULL AUTO_INCREMENT,
  `Site` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSite`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Site`
--

LOCK TABLES `Site` WRITE;
/*!40000 ALTER TABLE `Site` DISABLE KEYS */;
INSERT INTO `Site` VALUES (1,'Barcelona'),(2,'Madrid'),(3,'Sevilla');
/*!40000 ALTER TABLE `Site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TakeAwayOrder`
--

DROP TABLE IF EXISTS `TakeAwayOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TakeAwayOrder` (
  `idTakeAwayOrder` int NOT NULL AUTO_INCREMENT,
  `DeliveryArrivalTime` datetime DEFAULT NULL,
  `Order_id` int NOT NULL,
  `Employee_id` int NOT NULL,
  PRIMARY KEY (`idTakeAwayOrder`),
  KEY `fk_TakeAwayOrder_Order1_idx` (`Order_id`),
  KEY `fk_TakeAwayOrder_Employee1_idx` (`Employee_id`),
  CONSTRAINT `fk_TakeAwayOrder_Employee1` FOREIGN KEY (`Employee_id`) REFERENCES `Employee` (`idEmployee`),
  CONSTRAINT `fk_TakeAwayOrder_Order1` FOREIGN KEY (`Order_id`) REFERENCES `Order` (`idOrder`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TakeAwayOrder`
--

LOCK TABLES `TakeAwayOrder` WRITE;
/*!40000 ALTER TABLE `TakeAwayOrder` DISABLE KEYS */;
INSERT INTO `TakeAwayOrder` VALUES (501,'2025-10-27 12:51:58',1002,2);
/*!40000 ALTER TABLE `TakeAwayOrder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-28 12:21:37
