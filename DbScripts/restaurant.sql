CREATE DATABASE  IF NOT EXISTS `restaurant` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restaurant`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `staffId` int DEFAULT NULL,
  `clockIn` datetime DEFAULT NULL,
  `clockOut` datetime DEFAULT NULL,
  `day` date DEFAULT NULL,
  `isPresent` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (4,'2022-01-29 10:49:13',NULL,'2022-01-29','Y'),(NULL,NULL,'2022-01-29 13:42:20','2022-01-29','Y'),(4,'2022-01-30 11:47:43','2022-01-30 11:52:22','2022-01-30','Y'),(5,'2022-01-21 18:57:14',NULL,'2022-01-21','Y'),(5,NULL,NULL,'2022-01-21','N'),(5,NULL,NULL,'2022-01-21','N'),(5,NULL,NULL,'2022-01-22','N'),(5,NULL,NULL,'2022-01-23','N'),(5,NULL,NULL,'2022-01-24','N'),(5,NULL,NULL,'2022-01-25','N'),(5,NULL,NULL,'2022-01-26','N'),(5,NULL,NULL,'2022-01-27','N'),(5,NULL,NULL,'2022-01-28','N'),(5,NULL,NULL,'2022-01-29','N'),(5,NULL,NULL,'2022-01-30','N'),(5,'2022-01-31 13:52:15','2022-01-31 13:52:36','2022-01-31','Y'),(4,NULL,NULL,'2022-01-30','N'),(4,NULL,NULL,'2022-01-30','N'),(4,NULL,NULL,'2022-01-30','N'),(4,NULL,NULL,'2022-01-30','N'),(4,NULL,NULL,'2022-01-30','N'),(4,NULL,NULL,'2022-01-31','N'),(4,NULL,NULL,'2022-02-01','N'),(5,NULL,NULL,'2022-01-31','N'),(5,NULL,NULL,'2022-02-01','N'),(5,'2022-02-02 07:17:59','2022-02-02 07:18:01','2022-02-02','Y'),(4,NULL,NULL,'2022-02-01','N'),(4,NULL,NULL,'2022-02-01','N'),(4,NULL,NULL,'2022-02-01','N'),(4,NULL,NULL,'2022-02-02','N'),(4,NULL,NULL,'2022-02-03','N'),(4,NULL,NULL,'2022-02-04','N'),(5,NULL,NULL,'2022-02-02','N'),(5,NULL,NULL,'2022-02-03','N'),(5,NULL,NULL,'2022-02-04','N'),(6,'2022-02-05 06:13:34','2022-02-05 06:13:35','2022-02-05','Y'),(4,NULL,NULL,'2022-02-04','N'),(5,NULL,NULL,'2022-02-04','N'),(4,NULL,NULL,'2022-02-04','N'),(5,NULL,NULL,'2022-02-04','N'),(4,NULL,NULL,'2022-02-04','N'),(4,NULL,NULL,'2022-02-05','N'),(4,NULL,NULL,'2022-02-06','N'),(4,NULL,NULL,'2022-02-07','N'),(5,NULL,NULL,'2022-02-04','N'),(5,NULL,NULL,'2022-02-05','N'),(5,NULL,NULL,'2022-02-06','N'),(5,NULL,NULL,'2022-02-07','N'),(6,NULL,NULL,'2022-02-05','N'),(6,NULL,NULL,'2022-02-06','N'),(6,NULL,NULL,'2022-02-07','N'),(5,'2022-02-08 07:55:03','2022-02-08 07:55:13','2022-02-08','Y'),(4,NULL,NULL,'2022-02-07','N'),(4,NULL,NULL,'2022-02-08','N'),(4,NULL,NULL,'2022-02-09','N'),(4,NULL,NULL,'2022-02-10','N'),(4,NULL,NULL,'2022-02-11','N'),(4,NULL,NULL,'2022-02-12','N'),(4,NULL,NULL,'2022-02-13','N'),(4,NULL,NULL,'2022-02-14','N'),(4,NULL,NULL,'2022-02-15','N'),(4,NULL,NULL,'2022-02-16','N'),(4,NULL,NULL,'2022-02-17','N'),(4,NULL,NULL,'2022-02-18','N'),(4,NULL,NULL,'2022-02-19','N'),(4,NULL,NULL,'2022-02-20','N'),(5,NULL,NULL,'2022-02-08','N'),(5,NULL,NULL,'2022-02-09','N'),(5,NULL,NULL,'2022-02-10','N'),(5,NULL,NULL,'2022-02-11','N'),(5,NULL,NULL,'2022-02-12','N'),(5,NULL,NULL,'2022-02-13','N'),(5,NULL,NULL,'2022-02-14','N'),(5,NULL,NULL,'2022-02-15','N'),(5,NULL,NULL,'2022-02-16','N'),(5,NULL,NULL,'2022-02-17','N'),(5,NULL,NULL,'2022-02-18','N'),(5,NULL,NULL,'2022-02-19','N'),(5,NULL,NULL,'2022-02-20','N'),(6,NULL,NULL,'2022-02-07','N'),(6,NULL,NULL,'2022-02-08','N'),(6,NULL,NULL,'2022-02-09','N'),(6,NULL,NULL,'2022-02-10','N'),(6,NULL,NULL,'2022-02-11','N'),(6,NULL,NULL,'2022-02-12','N'),(6,NULL,NULL,'2022-02-13','N'),(6,NULL,NULL,'2022-02-14','N'),(6,NULL,NULL,'2022-02-15','N'),(6,NULL,NULL,'2022-02-16','N'),(6,NULL,NULL,'2022-02-17','N'),(6,NULL,NULL,'2022-02-18','N'),(6,NULL,NULL,'2022-02-19','N'),(6,NULL,NULL,'2022-02-20','N'),(4,NULL,NULL,'2022-02-20','N'),(5,NULL,NULL,'2022-02-20','N'),(6,NULL,NULL,'2022-02-20','N'),(6,'2022-02-21 07:58:35','2022-02-21 07:58:46','2022-02-21','Y'),(4,NULL,NULL,'2022-02-20','N'),(5,NULL,NULL,'2022-02-20','N'),(4,NULL,NULL,'2022-02-20','N'),(5,NULL,NULL,'2022-02-20','N'),(4,NULL,NULL,'2022-02-20','N'),(4,NULL,NULL,'2022-02-21','N'),(4,NULL,NULL,'2022-02-22','N'),(4,NULL,NULL,'2022-02-23','N'),(4,NULL,NULL,'2022-02-24','N'),(4,NULL,NULL,'2022-02-25','N'),(4,NULL,NULL,'2022-02-26','N'),(4,NULL,NULL,'2022-02-27','N'),(4,NULL,NULL,'2022-02-28','N'),(5,NULL,NULL,'2022-02-20','N'),(5,NULL,NULL,'2022-02-21','N'),(5,NULL,NULL,'2022-02-22','N'),(5,NULL,NULL,'2022-02-23','N'),(5,NULL,NULL,'2022-02-24','N'),(5,NULL,NULL,'2022-02-25','N'),(5,NULL,NULL,'2022-02-26','N'),(5,NULL,NULL,'2022-02-27','N'),(5,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-21','N'),(6,NULL,NULL,'2022-02-22','N'),(6,NULL,NULL,'2022-02-23','N'),(6,NULL,NULL,'2022-02-24','N'),(6,NULL,NULL,'2022-02-25','N'),(6,NULL,NULL,'2022-02-26','N'),(6,NULL,NULL,'2022-02-27','N'),(6,NULL,NULL,'2022-02-28','N'),(7,'2022-03-01 13:34:04',NULL,'2022-03-01','Y'),(4,NULL,NULL,'2022-02-28','N'),(5,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(4,NULL,NULL,'2022-02-28','N'),(5,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(4,NULL,NULL,'2022-02-28','N'),(5,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(5,'2022-03-01 13:40:43','2022-03-01 14:06:25','2022-03-01','Y'),(4,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(4,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(4,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(4,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(4,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(4,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(4,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(4,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(4,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(4,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(4,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(4,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(4,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N'),(4,NULL,NULL,'2022-02-28','N'),(6,NULL,NULL,'2022-02-28','N');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'test','test@customer.com','1234567890','admin');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaves` (
  `leaveId` int NOT NULL AUTO_INCREMENT,
  `staffId` int DEFAULT NULL,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`leaveId`),
  KEY `staffId` (`staffId`),
  CONSTRAINT `leaves_ibfk_1` FOREIGN KEY (`staffId`) REFERENCES `staff` (`staffId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves`
--

LOCK TABLES `leaves` WRITE;
/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
INSERT INTO `leaves` VALUES (1,4,'2022-01-29','2022-01-29','A','Covid'),(2,4,'2022-01-29','2022-01-29','R','Covid again'),(5,4,'2022-01-29','2022-01-29','A',NULL),(6,5,'2022-01-11','2022-02-02','A','Function'),(7,6,'2022-02-05','2022-02-10','R','Out of stattion'),(8,7,'2022-03-01','2022-03-09','P','Sick');
/*!40000 ALTER TABLE `leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `itemNo` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `isVeg` varchar(2) DEFAULT NULL,
  `isSpecial` varchar(2) DEFAULT NULL,
  `isTrending` varchar(2) DEFAULT NULL,
  `isAvailable` varchar(2) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`itemNo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (13,'Masala Dosa',50.00,'Y','N','N','Y','Spicy and Crispy'),(14,'Plain Dosa',40.00,'N','Y','N','Y','Crispy classic'),(15,'Idli',20.00,'Y','N','N','Y','spongy');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `orderNo` int DEFAULT NULL,
  `itemNo` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  KEY `orderNo` (`orderNo`),
  KEY `itemNo` (`itemNo`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderNo`) REFERENCES `orders` (`orderNo`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`itemNo`) REFERENCES `menu` (`itemNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (19,13,2),(19,14,1),(20,13,2),(20,15,1),(21,13,3),(21,14,1),(21,15,1),(22,13,1),(22,14,1);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderNo` int NOT NULL AUTO_INCREMENT,
  `customerId` int DEFAULT NULL,
  `cgst` decimal(8,2) DEFAULT NULL,
  `sgst` decimal(8,2) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `total` decimal(8,2) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `waitingTime` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`orderNo`),
  KEY `customerId` (`customerId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (19,1,3.50,3.50,147.00,140.00,'C',NULL,'2022-01-31 13:23:06','2022-01-31 13:23:06'),(20,1,3.00,3.00,126.00,120.00,'C',NULL,'2022-02-02 12:47:04','2022-02-02 12:49:39'),(21,1,5.25,5.25,220.50,210.00,'C',NULL,'2022-02-05 11:42:38','2022-02-21 14:20:55'),(22,1,2.25,2.25,94.50,90.00,'S',NULL,'2022-03-01 18:57:45','2022-03-01 19:18:02');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `roleId` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `workHrs` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Cheff',50000,9.00),(2,'Waiter',20000,10.00),(3,'Cashier',30000,10.00),(4,'Other',15000,10.00),(5,'Manager',NULL,10.00);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staffId` int NOT NULL AUTO_INCREMENT,
  `roleId` int DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `panNo` varchar(100) DEFAULT NULL,
  `aadharNo` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastLogin` datetime DEFAULT NULL,
  PRIMARY KEY (`staffId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`roleId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (4,1,'test1@staff.com','1234567890','admin','tfgybhn',NULL,NULL,'test1','2022-03-01 21:15:20'),(5,5,'manager@staff.com','1234567890','admin','dfxcghjb',NULL,NULL,'Shreekanth','2022-03-01 21:15:20'),(6,1,'cheff@staff.com','123456789','admin','dshbjdsn','2345678','456y7','Shubham','2022-03-01 21:15:20'),(7,3,'cashier@staff.com','123456789','admin','dfcghbj','2345678','345678','Dash','2022-03-01 21:15:20');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `add_missing_days` AFTER UPDATE ON `staff` FOR EACH ROW Begin
call insert_attendance_day(
curdate(),
New.staffId) ; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables` (
  `tableNo` int NOT NULL AUTO_INCREMENT,
  `staffId` int DEFAULT NULL,
  `customerId` int DEFAULT NULL,
  `isOccupied` varchar(2) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`tableNo`),
  KEY `staffId` (`staffId`),
  KEY `customerId` (`customerId`),
  CONSTRAINT `tables_ibfk_1` FOREIGN KEY (`staffId`) REFERENCES `staff` (`staffId`) ON DELETE SET NULL,
  CONSTRAINT `tables_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (1,4,NULL,'N',4),(2,4,NULL,'N',4),(3,4,NULL,'N',6),(4,4,NULL,'N',8),(5,4,NULL,'N',8),(6,4,1,'Y',2),(7,4,NULL,'N',2);
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'restaurant'
--

--
-- Dumping routines for database 'restaurant'
--
/*!50003 DROP PROCEDURE IF EXISTS `assign_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `assign_table`(IN p_customerId int,IN p_capacity int,Out p_tableNo int)
BEGIN
set p_tableNo  = (select tableNo from tables where capacity=p_capacity and isOccupied="N" limit 1);
update tables set isOccupied="Y", customerId = p_customerId where tableNo = p_tableNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `attendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `attendance`(
In p_staffId int,
In p_clockIn datetime,
In p_clockOut datetime,
In p_day date,
In p_isPresent varchar(2)
)
BEGIN

if((select count(*) from attendance where staffId=p_staffId and day=p_day)=0) 
then
INSERT INTO `restaurant`.`attendance`
(`staffId`,
`clockIn`,
`clockOut`,
`day`,
`isPresent`)
VALUES
(p_staffId,
p_clockIn,
p_clockOut,
p_day,
p_isPresent);

else
UPDATE `restaurant`.`attendance`
SET
`clockOut` = p_clockOut,
`isPresent` = p_isPresent
WHERE staffId = p_staffId and day=p_day;
end if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `attendance_summary_individual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `attendance_summary_individual`(
In p_staffId int,
In p_day date,
In p_from date,
In p_to date
)
BEGIN
select clockIn,clockOut from attendance where staffId=p_staffId and day=p_day;
select count(*) as total from attendance where day>p_from and day<=p_to and staffId=p_staffId; 
select count(*) as absent from attendance where day>p_from and day<=p_to and isPresent='N' and staffId=p_staffId;
select * from leaves where staffId=p_staffId order by leaveId desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cooking_staff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cooking_staff`()
BEGIN
select o.*,t.tableNo from orders o inner join tables t on o.customerId = t.customerId where o.status<>'C' order by create_date desc;

select m.name,oi.* from 
orderItem oi inner join menu m 
on m.itemNo = oi.itemNo 
inner join orders 
o on o.orderNo = oi.orderNo
 where o.status<>'C'
order by o.create_date desc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_invoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_invoice`(
In p_email varchar(50))
BEGIN

select * from orders where customerId=(select customerId from customer where email=p_email);

select oi.*,m.name,m.price,m.description from orderItem oi 
inner join orders o on oi.orderNo = o.orderNo
inner join menu m on oi.itemNo = m.itemNo
where o.customerId=(select customerId from customer where email=p_email);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_login`(
In p_email varchar(50),
In p_password varchar(200)
)
BEGIN
select customerId from customer where email=p_email and password=p_password limit 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_order`(
Out orderNo int,
In p_CustomerId varchar(50),
In p_cgst decimal(8,2),
In p_sgst decimal(8,2),
In p_amount decimal(8,2),
In p_total decimal(8,2),
In p_status varchar(2),
In p_waitingTime int
)
BEGIN
insert into Orders(customerId,cgst,sgst,total,amount,status,waitingTime,create_date,modify_date) values
(p_CustomerId,
p_cgst,p_sgst,p_total,p_amount,p_status,p_waitingTime,now(),now() ) ;
set orderNo = last_insert_id();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_order_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_order_item`(
In p_orderNo int,
In p_itemNo int,
In p_quantity int
)
BEGIN
insert into OrderItem(orderNo,itemNo,quantity) values
(p_orderNo,p_itemNo,p_quantity ) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_signup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_signup`(
In p_email varchar(50),
In p_password varchar(200),
In p_name varchar(50),
In p_phone varchar(50)
)
BEGIN
if( p_email not in (select email from customer))
then
insert into customer(name,email,phone,password) values (p_name,p_email,p_phone,p_password) ;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_table`(
In p_email varchar(50),
In p_capacity varchar(200)
)
BEGIN
update tables set isOccupied='Y', 
customerId=(select customerId from customer where email=p_email) 
where isOccupied='N'
limit 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_attendance_day` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_attendance_day`(In p_day date,In p_staffId int)
BEGIN
    DECLARE i date;
    set i= (select max(day) from attendance where staffId= p_staffId);
    
    WHILE i< p_day DO
        INSERT INTO attendance (staffId, day, isPresent) VALUES (p_staffId, i, 'N');
        SET i = i + INTERVAL 1 DAY;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `menu_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `menu_create`(
In p_name varchar(50),
In p_price decimal(6,2),
In p_isVeg varchar(2),
In p_isSpecial varchar(2),
In p_isTrending varchar(2),
In p_isAvailable varchar(2),
In p_description varchar(200)
)
BEGIN
INSERT INTO `restaurant`.`menu`
(
`name`,
`price`,
`isVeg`,
`isSpecial`,
`isTrending`,
`isAvailable`,
`description`)
VALUES
(
p_name,
p_price,
p_isVeg,
p_isSpecial,
p_isTrending,
p_isAvailable,
p_description);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `menu_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `menu_update`(
In p_itemNo int,
In p_name varchar(50),
In p_price decimal(6,2),
In p_isVeg varchar(2),
In p_isSpecial varchar(2),
In p_isTrending varchar(2),
In p_isAvailable varchar(2),
In p_description varchar(200)
)
BEGIN
UPDATE `restaurant`.`menu`
SET
`name` =p_name,
`price` = p_price,
`isVeg` = p_isVeg,
`isSpecial` = p_isSpecial,
`isTrending` = p_isTrending,
`isAvailable` = p_isAvailable,
`description` = p_description
WHERE `itemNo` = p_itemNo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `order_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `order_details`(IN p_orderNo int)
BEGIN
select * from orders  where orderNo=p_orderNo ;
select m.*,o.quantity from 
orderItem o inner join 
menu m on m.itemNo = o.itemNo
where o.orderNo=p_orderNo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `order_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `order_update`(
In p_status varchar(2),
In p_orderNo int
)
BEGIN

update orders set status=p_status , modify_date = now()
where orderNo= p_orderNo;

if(p_status='C')
then
update tables set isOccupied='N',customerId=null where customerId = (select customerId from orders where orderNo = p_orderNo);
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reports`(IN id int,In p_from date,In p_to date)
BEGIN

if(id=1)
then
select s.staffId,r.roleName,
(select count(*) from attendance a where day>p_from and day<=p_to and a.staffId = s.staffId) as total,
(select count(*) from attendance a where day>p_from and day<=p_to and a.staffId = s.staffId and isPresent='N') as absent
from staff s
inner join roles r on (s.roleId=r.roleId);

elseif(id=2)
then
select m.name,m.price,m.isVeg,sum(quantity) as 'Order Count',sum(quantity)*m.price as 'Amount' from menu m 
inner join orderitem oi on (m.itemNo=oi.itemNo) 
inner join orders o on (oi.orderNo=o.orderNo)
where create_date>=p_from and create_date<=p_to
group by m.itemNo;

elseif(id=3)
then
select o.orderNo,o.cgst,o.sgst,o.total,o.amount,o.create_date
from orders o
where o.create_date>=p_from and o.create_date<=p_to;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `staff_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `staff_login`(
In p_email varchar(50),
In p_password varchar(200)
)
BEGIN
select staffId,roleId from staff where email=p_email and password=p_password;
if((select count(*) from staff where email=p_email and password=p_password)>0)
then
update staff set lastLogin = now();
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `staff_signup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `staff_signup`(
In p_email varchar(50),
In p_password varchar(200),
In p_name varchar(50),
In p_phone varchar(50),
In p_address varchar(200),
In p_panNo varchar(50),
In p_aadharNo varchar(50),
In p_roleId int
)
BEGIN
if( p_email not in (select email from staff))
then
insert into staff(name,email,phone,password,address,roleId,panNo,aadharNo) 
values (p_name,p_email,p_phone,p_password,p_address,p_roleId,p_panNo,p_aadharNo) ;

elseif(p_email+''+p_password in (select email+''+password from staff))
then
update staff set name=p_name,phone=p_phone,address=p_address,roleId=p_roleId,panNo=p_panNo,
aadharNo=p_aadharNo where email=p_email;

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `staff_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `staff_update`(
in p_staffId int,
In p_email varchar(50),
In p_password varchar(200),
In p_name varchar(50),
In p_phone varchar(50),
In p_address varchar(200),
In p_panNo varchar(50),
In p_aadharNo varchar(50),
In p_roleId int
)
BEGIN

update staff set name=p_name,phone=p_phone,address=p_address,roleId=p_roleId,panNo=p_panNo,
aadharNo=p_aadharNo , email=p_email,password=p_password where staffId=p_staffId;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-01 21:23:47
