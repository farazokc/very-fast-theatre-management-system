CREATE DATABASE  IF NOT EXISTS `veryfast_tms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `veryfast_tms`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: veryfast_tms
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `Email` varchar(30) NOT NULL,
  `Pass` varchar(20) NOT NULL,
  `AccountName` varchar(25) NOT NULL,
  `DOB` date NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Type` varchar(10) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('abdul.hadi@vftms.com','passwordNice','Abdul Hadi','1998-11-03','1','Manager'),('bigboyadmin@vftms.com','mushkilTareen','Kamran Akmal','1995-12-12','1','CEO'),('ilikemovies@vftms.com','simplePass','Rana Sanaullah','2000-09-05','1','Manager'),('meriiddaldo@vftms.com','merapassword','mera nam','2011-06-09','0310-1234566','Customer'),('moviewatcheruwu@vftms.com','justintime','Justin Yaegar','1999-01-06','1','Customer');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `BranchID` int NOT NULL,
  `Area` varchar(20) NOT NULL,
  `City` varchar(20) NOT NULL,
  PRIMARY KEY (`BranchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Gulistan-e-Johar','Karachi'),(2,'Gulshan-e-Iqbal','Karachi'),(3,'North Nazimabad','Karachi'),(4,'Saddar','Lahore'),(5,'Defence','Lahore');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema` (
  `CinemaID` int NOT NULL,
  `CinemaName` varchar(25) NOT NULL,
  `NoOfSeats` int NOT NULL,
  `BranchID` int NOT NULL,
  `TypeID` int NOT NULL,
  PRIMARY KEY (`CinemaID`),
  KEY `BranchID5` (`BranchID`),
  KEY `TypeID5` (`TypeID`),
  CONSTRAINT `BranchID5` FOREIGN KEY (`BranchID`) REFERENCES `branch` (`BranchID`),
  CONSTRAINT `TypeID5` FOREIGN KEY (`TypeID`) REFERENCES `typedetails` (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'Royal',30,1,3),(2,'Open Air',50,1,2),(3,'Cinema A',40,2,1),(4,'Cinema B',40,2,1),(5,'Cinema C',40,2,1),(6,'Cinema A',40,3,1),(7,'Cinema B',40,3,1),(8,'Royal',30,4,3),(9,'Cinema A',40,4,1),(10,'Cinema A',40,5,1),(11,'Cinema B',40,5,1);
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `GuestID` int NOT NULL,
  `GuestEmail` varchar(30) NOT NULL,
  `GuestName` varchar(25) NOT NULL,
  `GuestDOB` date NOT NULL,
  `GuestPhone` varchar(12) NOT NULL,
  PRIMARY KEY (`GuestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (1,'imaguest@guestmail.com','Khubani Chacha','1998-11-03','1'),(2,'imaginedragons@guestmail.com','Simba','1999-12-04','1'),(3,'aaloobhaloo@gmail.com','Fat Bear','2001-02-13','1');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `RecordID` varchar(20) NOT NULL,
  `ScheduleID` int NOT NULL,
  `SeatID` int NOT NULL,
  `Email` varchar(30) NOT NULL,
  `GuestID` int DEFAULT NULL,
  `Price` int DEFAULT NULL,
  PRIMARY KEY (`RecordID`),
  KEY `email_idx` (`Email`),
  KEY `ScheduleID_idx` (`ScheduleID`),
  KEY `SeatID_idx` (`SeatID`),
  KEY `GuestID_idx` (`GuestID`),
  CONSTRAINT `Email` FOREIGN KEY (`Email`) REFERENCES `account` (`Email`),
  CONSTRAINT `GuestID` FOREIGN KEY (`GuestID`) REFERENCES `guest` (`GuestID`),
  CONSTRAINT `ScheduleID` FOREIGN KEY (`ScheduleID`) REFERENCES `schedule` (`ScheduleID`),
  CONSTRAINT `SeatID` FOREIGN KEY (`SeatID`) REFERENCES `seat` (`SeatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES ('E-Ticket5200',5,200,'moviewatcheruwu@vftms.com',NULL,1200),('E-Ticket7305',7,305,'moviewatcheruwu@vftms.com',NULL,800),('E-Ticket9408',9,408,'meriiddaldo@vftms.com',NULL,800);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `manager_details_view`
--

DROP TABLE IF EXISTS `manager_details_view`;
/*!50001 DROP VIEW IF EXISTS `manager_details_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `manager_details_view` AS SELECT 
 1 AS `recordID`,
 1 AS `scheduleID`,
 1 AS `seatID`,
 1 AS `Email`,
 1 AS `guestID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `MovieID` int NOT NULL,
  `MovieName` varchar(30) NOT NULL,
  `Genre` varchar(10) NOT NULL,
  `Link` varchar(45) NOT NULL,
  `Duration` decimal(2,1) NOT NULL,
  `MainChar` varchar(20) NOT NULL,
  `Description` longtext NOT NULL,
  PRIMARY KEY (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'The Legend of Maula Jatt','Drama','https://www.youtube.com/embed/pEWqOAcYgpQ',2.0,'Hamza Abbasi','A fierce prizefighter with a tortured past seeks vengeance against the most feared warrior in the Kingdom of Punjab.'),(2,'Black Panther: Wakanda Forever','Action','https://www.youtube.com/embed/_Z3QKkl1WyM',2.5,'Letitia Wright','A sequel that will continue to explore the world of Wakanda and all the characters introduced in the 2018 film.'),(3,'Zarrar','Adventure','https://www.youtube.com/embed/xbZcsP_wlUU',2.0,'Shaan Shahid','A man on a mission to end corruption and solve this seemingly endless cycle of threats to the country.');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `ReservationID` varchar(20) GENERATED ALWAYS AS (concat(_utf8mb4'E-Ticket',`ScheduleID`,`SeatID`)) STORED NOT NULL,
  `ScheduleID` int NOT NULL,
  `SeatID` int NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `GuestID` int DEFAULT NULL,
  PRIMARY KEY (`ReservationID`),
  KEY `ScheduleID_idx` (`ScheduleID`),
  KEY `SeatID_idx` (`SeatID`),
  KEY `Email_idx` (`Email`),
  KEY `GuestID_idx` (`GuestID`),
  KEY `ScheduleID_idx2` (`ScheduleID`),
  KEY `SeatID_idx2` (`SeatID`),
  KEY `Email_idx2` (`Email`),
  KEY `GuestID_idx2` (`GuestID`),
  CONSTRAINT `Email2` FOREIGN KEY (`Email`) REFERENCES `account` (`Email`),
  CONSTRAINT `GuestID2` FOREIGN KEY (`GuestID`) REFERENCES `guest` (`GuestID`),
  CONSTRAINT `ScheduleID2` FOREIGN KEY (`ScheduleID`) REFERENCES `schedule` (`ScheduleID`),
  CONSTRAINT `SeatID2` FOREIGN KEY (`SeatID`) REFERENCES `seat` (`SeatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` (`ScheduleID`, `SeatID`, `Email`, `GuestID`) VALUES ,1,3,NULL,3),,1,3,NULL,3),1,4,NULL,3),,1,3,NULL,3),1,4,NULL,3),3,103,NULL,3),,1,3,NULL,3),1,4,NULL,3),3,103,NULL,3),3,104,NULL,3),,1,3,NULL,3),1,4,NULL,3),3,103,NULL,3),3,104,NULL,3),5,200,'moviewatcheruwu@vftms.com',NULL),,1,3,NULL,3),1,4,NULL,3),3,103,NULL,3),3,104,NULL,3),5,200,'moviewatcheruwu@vftms.com',NULL),5,201,'bigboyadmin@vftms.com',NULL),,1,3,NULL,3),1,4,NULL,3),3,103,NULL,3),3,104,NULL,3),5,200,'moviewatcheruwu@vftms.com',NULL),5,201,'bigboyadmin@vftms.com',NULL),5,208,NULL,3),,1,3,NULL,3),1,4,NULL,3),3,103,NULL,3),3,104,NULL,3),5,200,'moviewatcheruwu@vftms.com',NULL),5,201,'bigboyadmin@vftms.com',NULL),5,208,NULL,3),5,211,NULL,3),,1,3,NULL,3),1,4,NULL,3),3,103,NULL,3),3,104,NULL,3),5,200,'moviewatcheruwu@vftms.com',NULL),5,201,'bigboyadmin@vftms.com',NULL),5,208,NULL,3),5,211,NULL,3),8,309,'moviewatcheruwu@vftms.com',NULL),,1,3,NULL,3),1,4,NULL,3),3,103,NULL,3),3,104,NULL,3),5,200,'moviewatcheruwu@vftms.com',NULL),5,201,'bigboyadmin@vftms.com',NULL),5,208,NULL,3),5,211,NULL,3),8,309,'moviewatcheruwu@vftms.com',NULL),8,310,NULL,1),,1,3,NULL,3),1,4,NULL,3),3,103,NULL,3),3,104,NULL,3),5,200,'moviewatcheruwu@vftms.com',NULL),5,201,'bigboyadmin@vftms.com',NULL),5,208,NULL,3),5,211,NULL,3),8,309,'moviewatcheruwu@vftms.com',NULL),8,310,NULL,1),8,312,NULL,3),,1,3,NULL,3),1,4,NULL,3),3,103,NULL,3),3,104,NULL,3),5,200,'moviewatcheruwu@vftms.com',NULL),5,201,'bigboyadmin@vftms.com',NULL),5,208,NULL,3),5,211,NULL,3),8,309,'moviewatcheruwu@vftms.com',NULL),8,310,NULL,1),8,312,NULL,3),8,313,NULL,3),,1,3,NULL,3),1,4,NULL,3),3,103,NULL,3),3,104,NULL,3),5,200,'moviewatcheruwu@vftms.com',NULL),5,201,'bigboyadmin@vftms.com',NULL),5,208,NULL,3),5,211,NULL,3),8,309,'moviewatcheruwu@vftms.com',NULL),8,310,NULL,1),8,312,NULL,3),8,313,NULL,3),9,407,'meriiddaldo@vftms.com',NULL),,1,3,NULL,3),1,4,NULL,3),3,103,NULL,3),3,104,NULL,3),5,200,'moviewatcheruwu@vftms.com',NULL),5,201,'bigboyadmin@vftms.com',NULL),5,208,NULL,3),5,211,NULL,3),8,309,'moviewatcheruwu@vftms.com',NULL),8,310,NULL,1),8,312,NULL,3),8,313,NULL,3),9,407,'meriiddaldo@vftms.com',NULL),9,412,NULL,2);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `putToHistory` AFTER UPDATE ON `reservation` FOR EACH ROW BEGIN
set @y = (SELECT getTime(new.reservationID) FROM reservation where reservationid=new.reservationID);
if(@y< curtime()) Then
INSERT INTO history
Values (new.reservationID, new.scheduleID, new.seatID, new.Email, new.guestID, @y);
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `Email` varchar(30) NOT NULL,
  `MovieID` int NOT NULL,
  `Stars` int NOT NULL,
  `Text` longtext,
  PRIMARY KEY (`Email`,`MovieID`),
  KEY `MovieID3` (`MovieID`),
  CONSTRAINT `Email3` FOREIGN KEY (`Email`) REFERENCES `account` (`Email`),
  CONSTRAINT `MovieID3` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('meriiddaldo@vftms.com',1,5,'i am very sleepy'),('moviewatcheruwu@vftms.com',1,3,'lahore da lawa akhter pawa'),('moviewatcheruwu@vftms.com',2,3,'hello dude');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `ScheduleID` int NOT NULL,
  `CinemaID` int NOT NULL,
  `MovieID` int NOT NULL,
  `Time` time NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`ScheduleID`),
  KEY `CinemaID4` (`CinemaID`),
  KEY `MovieID4` (`MovieID`),
  CONSTRAINT `CinemaID4` FOREIGN KEY (`CinemaID`) REFERENCES `cinema` (`CinemaID`),
  CONSTRAINT `MovieID4` FOREIGN KEY (`MovieID`) REFERENCES `movie` (`MovieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,1,1,'13:00:00','2022-12-06'),(2,1,2,'16:00:00','2022-12-06'),(3,2,2,'13:00:00','2022-12-06'),(4,2,3,'16:00:00','2022-12-06'),(5,3,1,'13:00:00','2022-12-06'),(6,3,3,'16:00:00','2022-12-06'),(7,4,2,'13:00:00','2022-12-06'),(8,4,3,'16:00:00','2022-12-06'),(9,5,1,'13:00:00','2022-12-06'),(10,5,2,'16:00:00','2022-12-06'),(11,6,1,'13:00:00','2022-12-06'),(12,6,3,'16:00:00','2022-12-06'),(13,7,2,'13:00:00','2022-12-06'),(14,7,3,'16:00:00','2022-12-06'),(15,8,1,'13:00:00','2022-12-06'),(16,8,2,'16:00:00','2022-12-06'),(17,8,3,'19:00:00','2022-12-06'),(18,9,3,'13:00:00','2022-12-06'),(19,10,1,'13:00:00','2022-12-06'),(20,10,2,'16:00:00','2022-12-06'),(21,11,2,'13:00:00','2022-12-06'),(22,11,3,'16:00:00','2022-12-06');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `SeatID` int NOT NULL,
  `Row` char(1) NOT NULL,
  `Column` char(1) NOT NULL,
  `CinemaID` int NOT NULL,
  PRIMARY KEY (`SeatID`),
  KEY `CinemaID6` (`CinemaID`),
  CONSTRAINT `CinemaID6` FOREIGN KEY (`CinemaID`) REFERENCES `cinema` (`CinemaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (0,'0','A',1),(1,'1','A',1),(2,'2','A',1),(3,'3','A',1),(4,'4','A',1),(5,'5','A',1),(6,'6','A',1),(7,'7','A',1),(8,'8','A',1),(9,'9','A',1),(10,'0','B',1),(11,'1','B',1),(12,'2','B',1),(13,'3','B',1),(14,'4','B',1),(15,'5','B',1),(16,'6','B',1),(17,'7','B',1),(18,'8','B',1),(19,'9','B',1),(20,'0','C',1),(21,'1','C',1),(22,'2','C',1),(23,'3','C',1),(24,'4','C',1),(25,'5','C',1),(26,'6','C',1),(27,'7','C',1),(28,'8','C',1),(29,'9','C',1),(100,'0','A',2),(101,'1','A',2),(102,'2','A',2),(103,'3','A',2),(104,'4','A',2),(105,'5','A',2),(106,'6','A',2),(107,'7','A',2),(108,'8','A',2),(109,'9','A',2),(110,'0','B',2),(111,'1','B',2),(112,'2','B',2),(113,'3','B',2),(114,'4','B',2),(115,'5','B',2),(116,'6','B',2),(117,'7','B',2),(118,'8','B',2),(119,'9','B',2),(120,'0','C',2),(121,'1','C',2),(122,'2','C',2),(123,'3','C',2),(124,'4','C',2),(125,'5','C',2),(126,'6','C',2),(127,'7','C',2),(128,'8','C',2),(129,'9','C',2),(130,'0','D',2),(131,'1','D',2),(132,'2','D',2),(133,'3','D',2),(134,'4','D',2),(135,'5','D',2),(136,'6','D',2),(137,'7','D',2),(138,'8','D',2),(139,'9','D',2),(140,'0','E',2),(141,'1','E',2),(142,'2','E',2),(143,'3','E',2),(144,'4','E',2),(145,'5','E',2),(146,'6','E',2),(147,'7','E',2),(148,'8','E',2),(149,'9','E',2),(200,'0','A',3),(201,'1','A',3),(202,'2','A',3),(203,'3','A',3),(204,'4','A',3),(205,'5','A',3),(206,'6','A',3),(207,'7','A',3),(208,'8','A',3),(209,'9','A',3),(210,'0','B',3),(211,'1','B',3),(212,'2','B',3),(213,'3','B',3),(214,'4','B',3),(215,'5','B',3),(216,'6','B',3),(217,'7','B',3),(218,'8','B',3),(219,'9','B',3),(220,'0','C',3),(221,'1','C',3),(222,'2','C',3),(223,'3','C',3),(224,'4','C',3),(225,'5','C',3),(226,'6','C',3),(227,'7','C',3),(228,'8','C',3),(229,'9','C',3),(230,'0','D',3),(231,'1','D',3),(232,'2','D',3),(233,'3','D',3),(234,'4','D',3),(235,'5','D',3),(236,'6','D',3),(237,'7','D',3),(238,'8','D',3),(239,'9','D',3),(300,'0','A',4),(301,'1','A',4),(302,'2','A',4),(303,'3','A',4),(304,'4','A',4),(305,'5','A',4),(306,'6','A',4),(307,'7','A',4),(308,'8','A',4),(309,'9','A',4),(310,'0','B',4),(311,'1','B',4),(312,'2','B',4),(313,'3','B',4),(314,'4','B',4),(315,'5','B',4),(316,'6','B',4),(317,'7','B',4),(318,'8','B',4),(319,'9','B',4),(320,'0','C',4),(321,'1','C',4),(322,'2','C',4),(323,'3','C',4),(324,'4','C',4),(325,'5','C',4),(326,'6','C',4),(327,'7','C',4),(328,'8','C',4),(329,'9','C',4),(330,'0','D',4),(331,'1','D',4),(332,'2','D',4),(333,'3','D',4),(334,'4','D',4),(335,'5','D',4),(336,'6','D',4),(337,'7','D',4),(338,'8','D',4),(339,'9','D',4),(400,'0','A',5),(401,'1','A',5),(402,'2','A',5),(403,'3','A',5),(404,'4','A',5),(405,'5','A',5),(406,'6','A',5),(407,'7','A',5),(408,'8','A',5),(409,'9','A',5),(410,'0','B',5),(411,'1','B',5),(412,'2','B',5),(413,'3','B',5),(414,'4','B',5),(415,'5','B',5),(416,'6','B',5),(417,'7','B',5),(418,'8','B',5),(419,'9','B',5),(420,'0','C',5),(421,'1','C',5),(422,'2','C',5),(423,'3','C',5),(424,'4','C',5),(425,'5','C',5),(426,'6','C',5),(427,'7','C',5),(428,'8','C',5),(429,'9','C',5),(430,'0','D',5),(431,'1','D',5),(432,'2','D',5),(433,'3','D',5),(434,'4','D',5),(435,'5','D',5),(436,'6','D',5),(437,'7','D',5),(438,'8','D',5),(439,'9','D',5),(500,'0','A',6),(501,'1','A',6),(502,'2','A',6),(503,'3','A',6),(504,'4','A',6),(505,'5','A',6),(506,'6','A',6),(507,'7','A',6),(508,'8','A',6),(509,'9','A',6),(510,'0','B',6),(511,'1','B',6),(512,'2','B',6),(513,'3','B',6),(514,'4','B',6),(515,'5','B',6),(516,'6','B',6),(517,'7','B',6),(518,'8','B',6),(519,'9','B',6),(520,'0','C',6),(521,'1','C',6),(522,'2','C',6),(523,'3','C',6),(524,'4','C',6),(525,'5','C',6),(526,'6','C',6),(527,'7','C',6),(528,'8','C',6),(529,'9','C',6),(530,'0','D',6),(531,'1','D',6),(532,'2','D',6),(533,'3','D',6),(534,'4','D',6),(535,'5','D',6),(536,'6','D',6),(537,'7','D',6),(538,'8','D',6),(539,'9','D',6),(600,'0','A',7),(601,'1','A',7),(602,'2','A',7),(603,'3','A',7),(604,'4','A',7),(605,'5','A',7),(606,'6','A',7),(607,'7','A',7),(608,'8','A',7),(609,'9','A',7),(610,'0','B',7),(611,'1','B',7),(612,'2','B',7),(613,'3','B',7),(614,'4','B',7),(615,'5','B',7),(616,'6','B',7),(617,'7','B',7),(618,'8','B',7),(619,'9','B',7),(620,'0','C',7),(621,'1','C',7),(622,'2','C',7),(623,'3','C',7),(624,'4','C',7),(625,'5','C',7),(626,'6','C',7),(627,'7','C',7),(628,'8','C',7),(629,'9','C',7),(630,'0','D',7),(631,'1','D',7),(632,'2','D',7),(633,'3','D',7),(634,'4','D',7),(635,'5','D',7),(636,'6','D',7),(637,'7','D',7),(638,'8','D',7),(639,'9','D',7),(700,'0','A',8),(701,'1','A',8),(702,'2','A',8),(703,'3','A',8),(704,'4','A',8),(705,'5','A',8),(706,'6','A',8),(707,'7','A',8),(708,'8','A',8),(709,'9','A',8),(710,'0','B',8),(711,'1','B',8),(712,'2','B',8),(713,'3','B',8),(714,'4','B',8),(715,'5','B',8),(716,'6','B',8),(717,'7','B',8),(718,'8','B',8),(719,'9','B',8),(720,'0','C',8),(721,'1','C',8),(722,'2','C',8),(723,'3','C',8),(724,'4','C',8),(725,'5','C',8),(726,'6','C',8),(727,'7','C',8),(728,'8','C',8),(729,'9','C',8),(800,'0','A',9),(801,'1','A',9),(802,'2','A',9),(803,'3','A',9),(804,'4','A',9),(805,'5','A',9),(806,'6','A',9),(807,'7','A',9),(808,'8','A',9),(809,'9','A',9),(810,'0','B',9),(811,'1','B',9),(812,'2','B',9),(813,'3','B',9),(814,'4','B',9),(815,'5','B',9),(816,'6','B',9),(817,'7','B',9),(818,'8','B',9),(819,'9','B',9),(820,'0','C',9),(821,'1','C',9),(822,'2','C',9),(823,'3','C',9),(824,'4','C',9),(825,'5','C',9),(826,'6','C',9),(827,'7','C',9),(828,'8','C',9),(829,'9','C',9),(830,'0','D',9),(831,'1','D',9),(832,'2','D',9),(833,'3','D',9),(834,'4','D',9),(835,'5','D',9),(836,'6','D',9),(837,'7','D',9),(838,'8','D',9),(839,'9','D',9),(900,'0','A',10),(901,'1','A',10),(902,'2','A',10),(903,'3','A',10),(904,'4','A',10),(905,'5','A',10),(906,'6','A',10),(907,'7','A',10),(908,'8','A',10),(909,'9','A',10),(910,'0','B',10),(911,'1','B',10),(912,'2','B',10),(913,'3','B',10),(914,'4','B',10),(915,'5','B',10),(916,'6','B',10),(917,'7','B',10),(918,'8','B',10),(919,'9','B',10),(920,'0','C',10),(921,'1','C',10),(922,'2','C',10),(923,'3','C',10),(924,'4','C',10),(925,'5','C',10),(926,'6','C',10),(927,'7','C',10),(928,'8','C',10),(929,'9','C',10),(930,'0','D',10),(931,'1','D',10),(932,'2','D',10),(933,'3','D',10),(934,'4','D',10),(935,'5','D',10),(936,'6','D',10),(937,'7','D',10),(938,'8','D',10),(939,'9','D',10),(1000,'0','A',11),(1001,'1','A',11),(1002,'2','A',11),(1003,'3','A',11),(1004,'4','A',11),(1005,'5','A',11),(1006,'6','A',11),(1007,'7','A',11),(1008,'8','A',11),(1009,'9','A',11),(1010,'0','B',11),(1011,'1','B',11),(1012,'2','B',11),(1013,'3','B',11),(1014,'4','B',11),(1015,'5','B',11),(1016,'6','B',11),(1017,'7','B',11),(1018,'8','B',11),(1019,'9','B',11),(1020,'0','C',11),(1021,'1','C',11),(1022,'2','C',11),(1023,'3','C',11),(1024,'4','C',11),(1025,'5','C',11),(1026,'6','C',11),(1027,'7','C',11),(1028,'8','C',11),(1029,'9','C',11),(1030,'0','D',11),(1031,'1','D',11),(1032,'2','D',11),(1033,'3','D',11),(1034,'4','D',11),(1035,'5','D',11),(1036,'6','D',11),(1037,'7','D',11),(1038,'8','D',11),(1039,'9','D',11);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typedetails`
--

DROP TABLE IF EXISTS `typedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typedetails` (
  `TypeID` int NOT NULL,
  `Type` varchar(10) NOT NULL,
  `Price` int NOT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typedetails`
--

LOCK TABLES `typedetails` WRITE;
/*!40000 ALTER TABLE `typedetails` DISABLE KEYS */;
INSERT INTO `typedetails` VALUES (1,'Silver',800),(2,'Gold',1000),(3,'Luxury',1200);
/*!40000 ALTER TABLE `typedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'veryfast_tms'
--

--
-- Dumping routines for database 'veryfast_tms'
--
/*!50003 DROP FUNCTION IF EXISTS `getTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getTime`(resID varchar(20)) RETURNS datetime
    DETERMINISTIC
begin
set @y = (Select cast(concat(sc.Date, ' ', sc.Time) as datetime) from reservation r, schedule sc where r.scheduleID=sc.ScheduleID and r.reservationID=resID);
return @y;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `hello` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `hello`(s CHAR(20)) RETURNS char(50) CHARSET utf8mb4
    DETERMINISTIC
RETURN CONCAT('Hello, ',s,'!') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dorepeat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dorepeat`(p1 INT)
BEGIN
SET @x = 0;
REPEAT SET @x = @x + 1; UNTIL @x > p1 END REPEAT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fillSeats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fillSeats`(cinID int, seats int)
BEGIN
SET @y = (cinID-1)*100;
REPEAT 
INSERT INTO `veryfast_tms`.`seat` (`SeatID`, `Row`, `Column`, `CinemaID`) VALUES (@y, MOD(@y,10), 'A', cinID);
SET @y = @y + 1; UNTIL @y > (cinID-1)*100+seats-1 END REPEAT;
SET @y = (cinID-1)*100;
REPEAT 
UPDATE `veryfast_tms`.`seat` SET `Column` = 'B' WHERE (`SeatID` REGEXP '1.$');
UPDATE `veryfast_tms`.`seat` SET `Column` = 'C' WHERE (`SeatID` REGEXP '2.$');
UPDATE `veryfast_tms`.`seat` SET `Column` = 'D' WHERE (`SeatID` REGEXP '3.$');
UPDATE `veryfast_tms`.`seat` SET `Column` = 'E' WHERE (`SeatID` REGEXP '4.$');
UPDATE `veryfast_tms`.`seat` SET `Column` = 'F' WHERE (`SeatID` REGEXP '5.$');
SET @y = @y + 1; UNTIL @y > (cinID-1)*100+seats-1 END REPEAT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `manager_details_view`
--

/*!50001 DROP VIEW IF EXISTS `manager_details_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `manager_details_view` AS select `history`.`RecordID` AS `recordID`,`history`.`ScheduleID` AS `scheduleID`,`history`.`SeatID` AS `seatID`,`history`.`Email` AS `Email`,`history`.`GuestID` AS `guestID` from `history` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-07  5:21:47
