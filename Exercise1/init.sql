-- MySQL dump 10.13  Distrib 9.4.0, for macos15 (x86_64)
--
-- Host: localhost    Database: Cul_d_Ampolla
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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `idAddress` int NOT NULL AUTO_INCREMENT,
  `Street` varchar(45) DEFAULT NULL,
  `Number` varchar(45) DEFAULT NULL,
  `Floor` varchar(45) DEFAULT NULL,
  `Door` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `PostalCode` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,'Carrer Major','10','1','A','Barcelona','08001','España'),(2,'Avinguda Diagonal','450','2','B','Barcelona','08002','España'),(3,'Rambla Catalunya','5',NULL,NULL,'Barcelona','08007','España'),(4,'Carrer del Sol','22',NULL,NULL,'Terrassa','08221','España'),(5,'Plaça Universitat','3','Bajo','1','Barcelona','08007','España');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clients` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `RegisterDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsRecommended` tinyint NOT NULL,
  `ClientWhoRecommended` varchar(60) DEFAULT NULL,
  `idAddress` int NOT NULL,
  `idEmails` int NOT NULL,
  `idPhoneNumbers` int NOT NULL,
  `idEmployee` int NOT NULL,
  PRIMARY KEY (`idClient`),
  KEY `Name` (`Name`),
  KEY `Surname` (`Surname`),
  KEY `fk_Clients_Address1_idx` (`idAddress`),
  KEY `fk_Clients_Emails1_idx` (`idEmails`),
  KEY `fk_Clients_PhoneNumbers1_idx` (`idPhoneNumbers`),
  KEY `fk_Clients_Employees1_idx` (`idEmployee`),
  CONSTRAINT `fk_Clients_Address1` FOREIGN KEY (`idAddress`) REFERENCES `Address` (`idAddress`),
  CONSTRAINT `fk_Clients_Emails1` FOREIGN KEY (`idEmails`) REFERENCES `Emails` (`idEmails`),
  CONSTRAINT `fk_Clients_Employees1` FOREIGN KEY (`idEmployee`) REFERENCES `Employees` (`idEmployee`),
  CONSTRAINT `fk_Clients_PhoneNumbers1` FOREIGN KEY (`idPhoneNumbers`) REFERENCES `PhoneNumbers` (`idPhoneNumbers`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES (1,'Pedro','García','2025-10-22 20:41:44',0,NULL,1,1,1,1),(2,'Ana','López','2025-10-22 20:41:44',1,'Marta Vila',2,2,2,2),(3,'Marta','Vila','2025-10-22 20:41:44',0,NULL,5,5,5,1);
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Emails`
--

DROP TABLE IF EXISTS `Emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Emails` (
  `idEmails` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(255) NOT NULL,
  PRIMARY KEY (`idEmails`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Emails`
--

LOCK TABLES `Emails` WRITE;
/*!40000 ALTER TABLE `Emails` DISABLE KEYS */;
INSERT INTO `Emails` VALUES (1,'cliente1@mail.com'),(2,'cliente2@mail.com'),(5,'cliente3@mail.com'),(4,'empleado1@mail.com'),(3,'proveedorA@mail.com');
/*!40000 ALTER TABLE `Emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employees` (
  `idEmployee` int NOT NULL AUTO_INCREMENT,
  `EmployeeName` varchar(45) DEFAULT NULL,
  `EmployeeSurname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES (1,'Laura','Giménez'),(2,'Marc','Puig');
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Glasses`
--

DROP TABLE IF EXISTS `Glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Glasses` (
  `idGlasses` int NOT NULL AUTO_INCREMENT,
  `Brand` varchar(20) NOT NULL,
  `Graduation` varchar(5) NOT NULL,
  `FrameType` varchar(15) NOT NULL,
  `FrameColor` varchar(10) NOT NULL,
  `GlassColor` varchar(20) NOT NULL,
  `Price` decimal(6,0) NOT NULL,
  `idSupplier` int NOT NULL,
  PRIMARY KEY (`idGlasses`),
  KEY `fk_Glasses_Supplier1_idx` (`idSupplier`),
  CONSTRAINT `fk_Glasses_Supplier1` FOREIGN KEY (`idSupplier`) REFERENCES `Supplier` (`idSupplier`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Glasses`
--

LOCK TABLES `Glasses` WRITE;
/*!40000 ALTER TABLE `Glasses` DISABLE KEYS */;
INSERT INTO `Glasses` VALUES (1,'RayBan','1.50','Pasta','Negro','Transparente',90,1),(2,'Oakley','-3.25','Metal','Gris','Azul',159,2),(3,'Prada','0.00','Aire','Marrón','Oscuro',121,2),(4,'Carrera','2.00','Pasta','Rojo','Transparente',75,2),(5,'Gucci','-5.50','Metal','Dorado','Verde',210,2);
/*!40000 ALTER TABLE `Glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhoneNumbers`
--

DROP TABLE IF EXISTS `PhoneNumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PhoneNumbers` (
  `idPhoneNumbers` int NOT NULL AUTO_INCREMENT,
  `PhoneNumber` varchar(45) NOT NULL,
  `FaxNumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPhoneNumbers`),
  UNIQUE KEY `PhoneNumber_UNIQUE` (`PhoneNumber`),
  UNIQUE KEY `FaxNumber_UNIQUE` (`FaxNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhoneNumbers`
--

LOCK TABLES `PhoneNumbers` WRITE;
/*!40000 ALTER TABLE `PhoneNumbers` DISABLE KEYS */;
INSERT INTO `PhoneNumbers` VALUES (1,'600111222',NULL),(2,'600333444',NULL),(3,'931002003','931002004'),(4,'600555666',NULL),(5,'600777888',NULL);
/*!40000 ALTER TABLE `PhoneNumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sales` (
  `idSales` int NOT NULL AUTO_INCREMENT,
  `InboxNumber` int NOT NULL,
  `SaleDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmployee` int NOT NULL,
  `idClient` int NOT NULL,
  `Glasses_idGlasses` int NOT NULL,
  PRIMARY KEY (`idSales`),
  UNIQUE KEY `InboxeNumber_UNIQUE` (`InboxNumber`),
  KEY `fk_Sales_Employees1_idx` (`idEmployee`),
  KEY `fk_Sales_Clients1_idx` (`idClient`),
  KEY `fk_Sales_Glasses1_idx` (`Glasses_idGlasses`),
  CONSTRAINT `fk_Sales_Clients1` FOREIGN KEY (`idClient`) REFERENCES `Clients` (`idClient`),
  CONSTRAINT `fk_Sales_Employees1` FOREIGN KEY (`idEmployee`) REFERENCES `Employees` (`idEmployee`),
  CONSTRAINT `fk_Sales_Glasses1` FOREIGN KEY (`Glasses_idGlasses`) REFERENCES `Glasses` (`idGlasses`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales`
--

LOCK TABLES `Sales` WRITE;
/*!40000 ALTER TABLE `Sales` DISABLE KEYS */;
INSERT INTO `Sales` VALUES (1,1001,'2025-10-22 21:07:55',1,1,0),(10,1010,'2024-01-15 10:30:00',1,1,4),(11,1011,'2024-02-20 11:45:00',2,2,3),(12,1012,'2024-03-05 14:00:00',1,3,2),(13,1013,'2024-04-10 09:00:00',1,1,5),(14,1014,'2024-05-25 16:30:00',2,2,1),(15,1015,'2024-06-18 12:00:00',1,3,4),(16,1016,'2024-07-01 10:00:00',2,1,2),(17,1017,'2024-08-15 17:00:00',2,2,5),(18,1018,'2024-09-30 13:30:00',1,3,1),(19,1019,'2024-10-05 09:45:00',1,1,3),(20,1020,'2024-11-22 15:00:00',2,2,4),(21,1021,'2024-12-12 11:00:00',1,3,5);
/*!40000 ALTER TABLE `Sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplier` (
  `idSupplier` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(60) NOT NULL,
  `NIF` varchar(10) NOT NULL,
  `PhoneNumbers_idPhoneNumbers` int NOT NULL,
  `Address_idAddress` int NOT NULL,
  PRIMARY KEY (`idSupplier`),
  KEY `Name` (`Name`),
  KEY `fk_Supplier_PhoneNumbers1_idx` (`PhoneNumbers_idPhoneNumbers`),
  KEY `fk_Supplier_Address1_idx` (`Address_idAddress`),
  CONSTRAINT `fk_Supplier_Address1` FOREIGN KEY (`Address_idAddress`) REFERENCES `Address` (`idAddress`),
  CONSTRAINT `fk_Supplier_PhoneNumbers1` FOREIGN KEY (`PhoneNumbers_idPhoneNumbers`) REFERENCES `PhoneNumbers` (`idPhoneNumbers`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES (1,'Lentes Ópticas S.A.','A1234567Z',3,3),(2,'Hola mundo gafas','H9373464K',4,4);
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-28 11:20:16
