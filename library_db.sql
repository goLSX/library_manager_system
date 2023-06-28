-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: library_db
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Temporary view structure for view `book_message`
--
CREATE DATABASE  IF NOT EXISTS `library_db`  DEFAULT CHARACTER SET utf8  DEFAULT ENCRYPTION='N' ;

USE `library_db`;

DROP TABLE IF EXISTS `book_message`;
/*!50001 DROP VIEW IF EXISTS `book_message`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `book_message` AS SELECT 
 1 AS `book_num`,
 1 AS `book_name`,
 1 AS `book_price`,
 1 AS `book_state`,
 1 AS `book_position`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_num` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(30) NOT NULL,
  `book_price` float NOT NULL,
  `book_state` varchar(10) NOT NULL DEFAULT '不可借',
  `book_position` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`book_num`),
  CONSTRAINT `books_check_price` CHECK ((`book_price` > 0)),
  CONSTRAINT `books_check_state` CHECK (((`book_state` = _utf8mb3'可借') or (`book_state` = _utf8mb3'不可借')))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'《当下的幸福》',16.62,'不可借',NULL),(2,'《算法设计》',19.45,'可借','二楼'),(3,'《编程珠玑》',21.71,'可借','二楼'),(4,'《黑客与画家》',16.19,'可借','三楼'),(5,'《重构》',80.78,'不可借',NULL),(6,'《深入理解计算机系统》',58.19,'不可借',NULL),(7,'《算法（第四版）》',48.08,'可借','五楼'),(8,'《C++ primer》',66.75,'不可借','四楼'),(9,'《Effective C++》',68.79,'可借','二楼'),(10,'《代码优化：有效使用内存》',33.26,'可借','五楼'),(11,'《重构》',80.78,'不可借',NULL),(12,'《Accelerated C++》',27.52,'可借','三楼'),(13,'《Unix网络编程》',20.57,'可借','一楼'),(14,'《异类：不一样的成功启示录》',75.55,'可借','三楼'),(15,'《计算机程序的构造与解释》',6.18,'可借','五楼'),(16,'《算法设计》',19.45,'可借','一楼'),(18,'《计算机程序设计艺术》',77.23,'可借','三楼'),(19,'《深入理解计算机系统》',58.19,'可借','四楼'),(20,'《设计模式》',47.56,'可借','五楼'),(21,'《领域驱动设计》',45.66,'不可借','四楼'),(22,'《UNIX 环境高级编程》',3.1,'可借','四楼'),(23,'《计算机程序的构造与解释》',6.18,'可借','五楼'),(24,'《计算机程序设计艺术》',77.23,'可借','三楼'),(25,'《C 语言接口与实现》',69.43,'可借','三楼'),(26,'《算法（第四版）》',48.08,'可借','五楼'),(27,'《算法导论》',26.31,'不可借','五楼'),(28,'《代码大全 》',25.5,'不可借','三楼'),(29,'《漫步华尔街》',64.03,'可借','五楼'),(30,'《当下的幸福》',16.62,'可借','二楼'),(31,'操作系统',65.01,'可借','三楼'),(32,'《呐喊》',16.19,'可借','四楼');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_books` BEFORE INSERT ON `books` FOR EACH ROW if new.book_position is not null 
					       then  set new.book_state='可借';
					   end if */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_books` BEFORE UPDATE ON `books` FOR EACH ROW if old.book_position is null and new.book_position is not null 
				then  set new.book_state='可借';
			end if */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `borrows`
--

DROP TABLE IF EXISTS `borrows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrows` (
  `borrow_rec_num` int NOT NULL AUTO_INCREMENT,
  `reader_name` varchar(20) DEFAULT NULL,
  `book_num` int DEFAULT NULL,
  `borrow_time` date NOT NULL,
  `transactor` varchar(20) DEFAULT NULL,
  `borrow_state` varchar(10) NOT NULL DEFAULT '待还',
  `borrow_duration` smallint NOT NULL DEFAULT '30',
  PRIMARY KEY (`borrow_rec_num`),
  KEY `borrows_fkey_reader` (`reader_name`),
  KEY `borrows_fkey_book` (`book_num`),
  KEY `borrows_fkey_transactor` (`transactor`),
  CONSTRAINT `borrows_fkey_book` FOREIGN KEY (`book_num`) REFERENCES `books` (`book_num`),
  CONSTRAINT `borrows_fkey_reader` FOREIGN KEY (`reader_name`) REFERENCES `readers` (`reader_name`),
  CONSTRAINT `borrows_fkey_transactor` FOREIGN KEY (`transactor`) REFERENCES `managers` (`manager_name`),
  CONSTRAINT `borrows_check_state` CHECK ((`borrow_state` in (_utf8mb4'待还',_utf8mb4'已还')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrows`
--

LOCK TABLES `borrows` WRITE;
/*!40000 ALTER TABLE `borrows` DISABLE KEYS */;
INSERT INTO `borrows` VALUES (1,'cjialun55',19,'2022-12-04','zhiyuanl','已还',30),(2,'ziyish',5,'2022-12-24','jiehong8','已还',30),(3,'yuning7',13,'2022-12-12','wazhen','已还',30),(4,'lush',27,'2022-12-21','yunxip','待还',30),(5,'yuan1',28,'2022-12-10','jiehong8','待还',30),(6,'yuning7',6,'2022-12-17','yunxip','已还',30),(7,'lr515',8,'2022-12-12','zhenglu1126','待还',30),(8,'luc',12,'2022-12-02','yunxip','已还',30),(9,'lr515',11,'2022-12-10','yunxip','已还',30),(10,'AB',21,'2023-01-02','18','待还',45);
/*!40000 ALTER TABLE `borrows` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_borrows` AFTER INSERT ON `borrows` FOR EACH ROW update books set book_state='不可借'
				where new.book_num = books.book_num */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `manager_message`
--

DROP TABLE IF EXISTS `manager_message`;
/*!50001 DROP VIEW IF EXISTS `manager_message`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `manager_message` AS SELECT 
 1 AS `manager_name`,
 1 AS `name`,
 1 AS `id_num`,
 1 AS `age`,
 1 AS `phone_num`,
 1 AS `entry_time`,
 1 AS `work_position`,
 1 AS `state`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `manager_name` varchar(20) NOT NULL,
  `password` varchar(35) NOT NULL,
  `name` varchar(10) NOT NULL,
  `id_num` varchar(20) DEFAULT NULL,
  `phone_num` varchar(15) DEFAULT NULL,
  `entry_time` date NOT NULL,
  `work_position` varchar(20) NOT NULL,
  `state` varchar(5) DEFAULT '正常',
  PRIMARY KEY (`manager_name`),
  UNIQUE KEY `id_num` (`id_num`),
  CONSTRAINT `managers_check_id` CHECK (((char_length(`id_num`) = 15) or (char_length(`id_num`) = 18))),
  CONSTRAINT `managers_check_phone` CHECK (((`phone_num` is null) or (char_length(`phone_num`) = 11))),
  CONSTRAINT `managers_check_state` CHECK (((`state` = _utf8mb4'正常') or (`state` = _utf8mb4'注销')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES ('1234','fcea920f7412b5da7be0cf42b8c93759','abc123','489635200001014556','16588635422','2022-01-01','三楼','正常'),('18','e10adc3949ba59abbe56e057f20f883e','abcd','445201200011234455','16633458853','2021-03-07','一楼','正常'),('jiehong8','teSbW3QdqGTleGVfUcfX6EHkYKU3Ugx1','徐杰宏','440103200303073091','39409240601','2020-11-02','四楼','正常'),('wazhen','e10adc3949ba59abbe56e057f20f883e','王震南','420602199504036416','56184859131','2020-09-08','一楼','正常'),('yunxip','Xj6RnMBOEJdDK7WSSU4wQ68vrJrBtmNE','潘云熙','130102199502073866','15911379748','2022-11-08','四楼','正常'),('zhenglu1126','cLK52sw1hkJIaKX9SWg0DN2y7LpZCL7W','郑璐','420602199504038817','73660123315','2022-07-13','一楼','正常'),('zhiyuanl','0Od6PWceTn8TAPaqPpUswvxnV6kCtE8B','龙致远','13010219950207958X','60724080592','2021-07-24','二楼','正常');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `opinion_result_message`
--

DROP TABLE IF EXISTS `opinion_result_message`;
/*!50001 DROP VIEW IF EXISTS `opinion_result_message`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `opinion_result_message` AS SELECT 
 1 AS `opinion_rec_num`,
 1 AS `reader_name`,
 1 AS `opinion`,
 1 AS `submit_time`,
 1 AS `state`,
 1 AS `result`,
 1 AS `transactor`,
 1 AS `finish_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `opinion_results`
--

DROP TABLE IF EXISTS `opinion_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opinion_results` (
  `opinion_rec_num` int NOT NULL,
  `result` varchar(100) NOT NULL,
  `transactor` varchar(20) DEFAULT NULL,
  `finish_time` date NOT NULL,
  PRIMARY KEY (`opinion_rec_num`),
  KEY `opinion_results_fkey_transactor` (`transactor`),
  CONSTRAINT `opinion_results_fkey_rec_num` FOREIGN KEY (`opinion_rec_num`) REFERENCES `opinions` (`opinion_rec_num`),
  CONSTRAINT `opinion_results_fkey_transactor` FOREIGN KEY (`transactor`) REFERENCES `managers` (`manager_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinion_results`
--

LOCK TABLES `opinion_results` WRITE;
/*!40000 ALTER TABLE `opinion_results` DISABLE KEYS */;
INSERT INTO `opinion_results` VALUES (1,'4136 cf10as1df3av313as10c.asd1as','18','2023-01-04'),(2,'as asds 02d0sad0a 4c 6 df0g12c ','18','2023-01-04'),(3,'fXgdJXJbF5ph6k00od0Sagsfy9BYwdVE07OHohoEGPaL4TNyDtQ3UvnuWX2Q','yunxip','2023-01-01'),(6,'MN8tugBamU68sxoX4z0mgP86IXaOPmWh0oKvG3yozoX93Sv5ac2NCJxwRqGv','zhiyuanl','2023-01-03'),(9,'yTDC7wLWkr66OtjHvwW8xpmCUfBmEUSCU0WvIHSC5byd4Z8pChIcErCnRMBj','zhenglu1126','2023-01-04'),(10,'sd10 3f.0 df01adf1c as20 asf','18','2023-01-04'),(11,'6145svd d1 23sd1 10. .0g 3sdf sde1 1g sd0 1sd  01s dc 00 102cv v 1xcv 0c102.vcxv cv 10.cv 10 c ','wazhen','2023-01-05');
/*!40000 ALTER TABLE `opinion_results` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_opinion_results` AFTER INSERT ON `opinion_results` FOR EACH ROW update opinions set state='处理完成'
				where new.opinion_rec_num = opinions.opinion_rec_num */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `opinions`
--

DROP TABLE IF EXISTS `opinions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opinions` (
  `opinion_rec_num` int NOT NULL AUTO_INCREMENT,
  `reader_name` varchar(20) DEFAULT NULL,
  `opinion` varchar(100) NOT NULL,
  `submit_time` date NOT NULL,
  `state` varchar(10) DEFAULT '待处理',
  PRIMARY KEY (`opinion_rec_num`),
  KEY `opinions_fkey_reader` (`reader_name`),
  CONSTRAINT `opinions_fkey_reader` FOREIGN KEY (`reader_name`) REFERENCES `readers` (`reader_name`),
  CONSTRAINT `opinions_check_state` CHECK (((`state` = _utf8mb4'待处理') or (`state` = _utf8mb4'处理完成')))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinions`
--

LOCK TABLES `opinions` WRITE;
/*!40000 ALTER TABLE `opinions` DISABLE KEYS */;
INSERT INTO `opinions` VALUES (1,'ziyish','9ITzcnraFAL8rCfZVIU4lDrCMLqfo9OUu31p5rOpZaxUTHyWoY0Gb2SWodb2AJiwfbJnKe5PPjqm7tKn','2022-12-20','处理完成'),(2,'ziyish','CKqRZ6KToF8BqKLE0gmjLubJW5JT1uPUGVk1KRvHVwnoYINCqvQvFil5vM3u9SezB05mON9zN7LwvtCG','2022-12-22','处理完成'),(3,'lush','fDE82l95BM0tLi93iXLrDX9yJyzN5fGstn6q2jFG3Lqo9z32xUFhbT0YlZD5f59oSsYz9Y8KE2ijicmh','2022-12-31','处理完成'),(4,'yuning7','g3eHvNHhfMz4XhkVT2UchCghAtxFxBaCvOlAlJugXJroAlbK1IaCFXODV274TDxhBypEApQyI3scSFOw','2022-12-31','待处理'),(5,'ziyish','oWu1KpCEo9iiiBFGIvxinLSArreWA01MgU1VAnIiwgav8k8YQRwMonDCgqojACub0vD832OVQFWQuSaL','2022-12-31','待处理'),(6,'luc','yuUxkxkwgHfrEACZS6Zb6SmBZvsYu9rUak1N12KFIFhz8KiXDheGEd9l2nyzFZKFz2lZ4ndWbsN3YT6L','2022-12-28','处理完成'),(7,'yuning7','3dKvpNasZhexZ5ZNzRUWtnG0D0WPZP9Z2V2WfeMneKl7zJ2Q34tvR6UFZHo9GMOHvay4WkaQgGPqSshv','2022-12-25','待处理'),(8,'guolu','OccH9KoArK3MYuPStdqeprtpavNMgGHPOFm3wf7Pq7nj6tgyboCasrDgIXOlwfhRE9SAvt8igTMeMykI','2022-12-24','待处理'),(9,'lr515','7tgsv32sAccvBKdCdaQjzFe6OxZKpWH1VS7aOP30AsqZXPJiuhLEXglcFjaFpbwYWn5cArwYzFnJrhPB','2022-12-31','处理完成'),(10,'luc','5jxBA08Wv20nKLvOAdUHzAAqfi9H7z6TYgTxQVEHdeuE2XgxqRPYHhc3oKk45rl8sx4cW58ihhmahM5M','2022-12-23','处理完成'),(11,'AB','s65dfas0d a0f5asd104 5as47d ad6ad3assd','2023-01-04','处理完成'),(12,'AB','c f010 0sdf0 1356s1 0sd 10 s103s. 10 v10cs.gcv cfvg10r 0. 2631x 10c5236','2023-01-05','待处理');
/*!40000 ALTER TABLE `opinions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `reader_message`
--

DROP TABLE IF EXISTS `reader_message`;
/*!50001 DROP VIEW IF EXISTS `reader_message`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reader_message` AS SELECT 
 1 AS `reader_name`,
 1 AS `name`,
 1 AS `id_num`,
 1 AS `age`,
 1 AS `phone_num`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `readers`
--

DROP TABLE IF EXISTS `readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readers` (
  `reader_name` varchar(20) NOT NULL,
  `password` varchar(35) NOT NULL,
  `name` varchar(10) NOT NULL,
  `id_num` varchar(20) DEFAULT NULL,
  `phone_num` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`reader_name`),
  UNIQUE KEY `id_num` (`id_num`),
  CONSTRAINT `readers_check_id` CHECK (((char_length(`id_num`) = 15) or (char_length(`id_num`) = 18))),
  CONSTRAINT `readers_check_phone` CHECK (((`phone_num` is null) or (char_length(`phone_num`) = 11)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readers`
--

LOCK TABLES `readers` WRITE;
/*!40000 ALTER TABLE `readers` DISABLE KEYS */;
INSERT INTO `readers` VALUES ('AB','e10adc3949ba59abbe56e057f20f883e','李牟','445655199912301244','14522369851'),('cjialun55','Lyoc1eJ4pZBITkHPBLoo0PLF0LA8qr54','曹嘉伦','140105199903071715','76407427366'),('guolu','Fz0G7IGWPEDvachK5IJ3NE3JqpefWU8h','郭璐','350102199909025912','29480779795'),('lr515','ZMvmnFpwRukStCKcWAB1k6Z0YVZKvWFU','龙睿','340102200303071029','33118073444'),('luc','Fo9Ot1g0mnIyTfMkzyAcVeXpYCsL0lk4','蔡璐','340102200303070341','62451637210'),('lush','qOVKerSwgltTK74rxJ56a2nb0PfldCU9','邵璐','460105200106077102','16442207827'),('yuan1','b4mXwuC7iR8o3zXzdvKp2TDTD351O2mI','袁秀英','460105200106071309','72818853170'),('yuning7','pELKr2a1l938GmScD0rrHy0a79l2Hdvl','林宇宁','340102200303078327','18418855323'),('ziyish','svtIVhsbdR46XUZPzsKvVELwB58q1lxG','石子异','350102199909022615','75068365716');
/*!40000 ALTER TABLE `readers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `return_message`
--

DROP TABLE IF EXISTS `return_message`;
/*!50001 DROP VIEW IF EXISTS `return_message`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `return_message` AS SELECT 
 1 AS `borrow_rec_num`,
 1 AS `reader_name`,
 1 AS `book_num`,
 1 AS `book_name`,
 1 AS `borrow_time`,
 1 AS `borrow_transactor`,
 1 AS `borrow_state`,
 1 AS `return_time`,
 1 AS `borrow_duration`,
 1 AS `return_transactor`,
 1 AS `fee`,
 1 AS `kind`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returns` (
  `borrow_rec_num` int NOT NULL,
  `return_time` date NOT NULL,
  `transactor` varchar(20) DEFAULT NULL,
  `fee` float DEFAULT NULL,
  `kind` varchar(5) DEFAULT '正常',
  PRIMARY KEY (`borrow_rec_num`),
  KEY `returns_fkey_transactor` (`transactor`),
  CONSTRAINT `returns_fkey_rec_num` FOREIGN KEY (`borrow_rec_num`) REFERENCES `borrows` (`borrow_rec_num`),
  CONSTRAINT `returns_fkey_transactor` FOREIGN KEY (`transactor`) REFERENCES `managers` (`manager_name`),
  CONSTRAINT `returns_check_kind` CHECK ((`kind` in (_utf8mb4'正常',_utf8mb4'丢失')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
INSERT INTO `returns` VALUES (1,'2023-01-04','18',0.1,'正常'),(2,'2023-01-04','18',80.78,'丢失'),(3,'2023-01-04','18',NULL,'正常'),(6,'2023-01-04','wazhen',58.19,'丢失'),(8,'2023-01-03','yunxip',0.2,'正常'),(9,'2023-01-05','wazhen',80.78,'丢失');
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'library_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `check_manager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_manager`(in manager_name_in varchar(20), 
in password_in varchar(35),
out result varchar(5))
begin
		set result = '错误';
    if password_in = 
		(select password from managers where binary manager_name = manager_name_in)
		then  set result = '正确';
			if '注销' = (select state from managers where binary manager_name = manager_name_in)
			then  set result = '注销';
			end if;
		end if;
		select result;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_manager_sigh_up` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_manager_sigh_up`(in manager_name_in varchar(20), 
in  id_num_in varchar(20) ,
out result varchar(10))
begin
    select exists(select * from managers where binary manager_name = manager_name_in) into result;
		if result = '1' then  set result = '用户名已存在';
		select result;
		commit;
		end if;
		select exists(select * from managers where id_num = id_num_in) into result;
		if result = '1' then set result = '身份证号已被注册';
		end if;
		if result = '0' then select 'OK';
		else select result;
		end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_reader` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_reader`(in reader_name_in varchar(20), 
in password_in varchar(35),
out result varchar(5))
begin
    if password_in = 
		(select password from readers where binary reader_name = reader_name_in)
		then  set result = '正确';
		else set result = '错误';
		end if;
		select result;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_reader_sigh_up` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_reader_sigh_up`(in reader_name_in varchar(20), 
in  id_num_in varchar(20) ,
out result varchar(10))
begin
    select exists(select * from readers where binary reader_name = reader_name_in) into result;
		if result = '1' then  set result = '用户名已存在';
		select result;
		commit;
		end if;
		select exists(select * from readers where id_num = id_num_in) into result;
		if result = '1' then set result = '身份证号已被注册';
		end if;
		if result = '0' then select 'OK';
		else select result;
		end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_book`(in book_num_in int,
out result varchar(10))
begin 
		 select exists(select * from book_message where  book_num = book_num_in) into result;
			 if result = '0' then  set result = '图书不存在';
			 select result;
			 commit;
			 end if;
		update book_message set book_state = '不可借',book_position = null
		where book_num = book_num_in;
		   select '成功';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_manager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_manager`(in manager_name_in varchar(30))
begin 
		  update managers set state = '注销'
			where binary manager_name = manager_name_in;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `extend_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `extend_time`(in book_num_in int ,
out result varchar(5))
begin declare latetime smallint;
			declare result varchar(5) default '成功'; 
			declare borrow_rec_num_in int;
			set borrow_rec_num_in = 
			(select borrow_rec_num from borrows where borrow_state = '待还' and book_num = book_num_in);
			
      select datediff(CURDATE() , borrow_time) - borrow_duration into latetime
			   from borrows where borrow_rec_num = borrow_rec_num_in;
			if latetime > 0  then set result = '超期';	
			else  update borrows set borrow_duration = borrow_duration + 15
						where borrow_rec_num = borrow_rec_num_in;
		  end if;   
			select result;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_book`(in book_name_in varchar(30),
in book_price_in float,
in book_position_in varchar(30))
begin 
    insert into book_message(book_name,book_price,book_position) values
		(book_name_in,book_price_in,book_position_in);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_borrow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_borrow`(in reader_name_in varchar(20),
in book_num_in int,
in transactor_in varchar(20),
in borrow_time_in date,
out result varchar(10))
begin 
       select exists(select * from reader_message where binary reader_name = reader_name_in) into result;
			 if result = '0' then  set result = '读者不存在';
			 select result;
			 commit;
			 end if;
			 select exists(select * from book_message where  book_num = book_num_in) into result;
			 if result = '0' then  set result = '图书不存在';
			 select result;
			 commit;
			 end if;
			 select book_state into result from book_message where  book_num = book_num_in ;
			 if result = '不可借' then  select result;
			 commit;
			 end if;
			 insert into borrows(reader_name,book_num,borrow_time,transactor) 
			 values (reader_name_in,book_num_in,borrow_time_in,transactor_in);
		   select '成功';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_manager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_manager`(in manager_name_in varchar(20),
in  password_in varchar(35) ,
in   name_in varchar(10) ,
in  id_num_in varchar(20) ,
in  phone_num_in varchar(15),
in entry_time_in date ,
in work_position_in varchar(20))
begin insert into managers
    (manager_name,password,name,id_num,phone_num,entry_time, work_position) values
		(manager_name_in,password_in,name_in,id_num_in,phone_num_in,entry_time_in ,  
		 work_position_in);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_opinion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_opinion`(in reader_name_in varchar(20),
in opinion_in varchar(100),
in submit_time_in date)
begin insert into opinions
    (reader_name,opinion,submit_time) values
		(reader_name_in,opinion_in,submit_time_in);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_opinion_result` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_opinion_result`(in opinion_rec_num_in int,
in result_in varchar(100),
in transactor_in varchar(20),
in finish_time_in date)
begin 
    insert into opinion_results(opinion_rec_num,result,transactor,finish_time) 
		values (opinion_rec_num_in,result_in,transactor_in,finish_time_in);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_reader` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_reader`(in reader_name_in varchar(20),
in  password varchar(35) ,
in   name varchar(10) ,
in  id_num varchar(20) ,
in  phone_num varchar(15))
begin insert into readers values(reader_name_in,password,name,id_num,phone_num);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_return` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_return`(in borrow_rec_num_in int,
in return_time_in date,
in transactor_in varchar(20),
in kind_in varchar(5),
out fee_out float)
begin 
		declare price float;
		DECLARE latetime SMALLINT ;
		declare fee_out float default null;
		declare book_num_temp int;
		declare borrow_time_temp date;
		declare borrow_duration_temp smallint;
		
		SELECT book_num ,borrow_time ,borrow_duration INTO
		 book_num_temp,borrow_time_temp,borrow_duration_temp
		FROM borrows WHERE borrow_rec_num = borrow_rec_num_in ;
		
		SELECT book_price into price FROM books WHERE book_num = book_num_temp;
		
	  SET latetime = datediff(return_time_in , borrow_time_temp) - borrow_duration_temp;
	
	  UPDATE borrows SET borrow_state = '已还' WHERE borrow_rec_num = borrow_rec_num_in;
		IF kind_in = '正常' THEN UPDATE books SET book_state = '可借' WHERE
			                       book_num = book_num_temp;
														 IF latetime > 0 THEN SET fee_out = 0.1 * latetime;
														 END IF;
		ELSE UPDATE books SET book_position = NULL WHERE book_num = book_num_temp;
	                    set fee_out = price;
		end if;									
    insert into returns(borrow_rec_num,return_time,transactor,fee,kind) 
		values (borrow_rec_num_in,return_time_in,transactor_in,fee_out,kind_in);
		select fee_out;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_book_by_num` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_book_by_num`(in book_num_in int)
begin 
		 select * from book_message where book_num = book_num_in;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_book_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_book_message`(in book_name_in varchar(30))
begin 
select * from book_message where book_name like CONCAT('%',book_name_in,'%');
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_borrow_by_booknum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_borrow_by_booknum`(in book_num_in int)
begin 
		  select * from return_message where borrow_state = '待还' and 
			book_num = book_num_in limit 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_manager_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_manager_message`(in manager_name_in varchar(20))
begin select * from manager_message where binary manager_name = manager_name_in;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_opinion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_opinion`(in opinion_rec_num_in  int)
begin 
		select opinion,state  from opinion_result_message where opinion_rec_num = opinion_rec_num_in;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_opinion_result_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_opinion_result_message`(in reader_name_in varchar(20))
begin 
		  select * from opinion_result_message where binary reader_name
       = reader_name_in order by submit_time desc  limit 10;	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pending_opinion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pending_opinion`()
begin 
		  select * from opinions where state = '待处理' order by submit_time limit 10;	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_reader_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_reader_message`(in reader_name_in varchar(20))
begin  
select * from reader_message where binary reader_name = reader_name_in;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_return_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_return_message`(in reader_name_in varchar(20))
begin 
		  select * from return_message where binary reader_name
       = reader_name_in order by borrow_time desc  limit 10;	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_book` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_book`(in book_num_in int,
in book_name_in varchar(30),
in book_price_in float,
in book_state_in varchar(10),
in book_position_in varchar(30))
begin 
		  update book_message set book_name = book_name_in ,book_price = book_price_in,
			 book_state = book_state_in,book_position = book_position_in
			 where book_num = book_num_in;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_manager_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_manager_message`(in manager_name_in varchar(20),
in name_in varchar(10),
in id_num_in varchar(20),
in phone_num_in varchar(15))
begin 
		  update manager_message set name = name_in , id_num = id_num_in ,
			 phone_num = phone_num_in where binary manager_name = manager_name_in;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_manager_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_manager_password`(in manager_name_in varchar(20),
in password_in varchar(35))
begin 
		  update managers set password = password_in where binary manager_name = manager_name_in;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_manager_work` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_manager_work`(in manager_name_in varchar(20),
in work_position_in varchar(20),
in state_in varchar(5))
begin 
		  update managers set work_position = work_position_in ,state = state_in
			 where binary manager_name = manager_name_in;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_reader_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_reader_message`(in reader_name_in varchar(20),
in name_in varchar(10),
in id_num_in varchar(20),
in phone_num_in varchar(15))
begin 
		  update reader_message set name = name_in , id_num = id_num_in ,
			 phone_num = phone_num_in where binary reader_name = reader_name_in;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_reader_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_reader_password`(in reader_name_in varchar(20),
in password_in varchar(35))
begin 
		  update readers set password = password_in where binary reader_name = reader_name_in;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `book_message`
--

/*!50001 DROP VIEW IF EXISTS `book_message`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `book_message` AS select `books`.`book_num` AS `book_num`,`books`.`book_name` AS `book_name`,`books`.`book_price` AS `book_price`,`books`.`book_state` AS `book_state`,`books`.`book_position` AS `book_position` from `books` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `manager_message`
--

/*!50001 DROP VIEW IF EXISTS `manager_message`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `manager_message` AS select `managers`.`manager_name` AS `manager_name`,`managers`.`name` AS `name`,`managers`.`id_num` AS `id_num`,((substr(now(),1,4) - substr(`managers`.`id_num`,7,4)) - ((substr(`managers`.`id_num`,11,4) - date_format(now(),'%m%d')) > 0)) AS `age`,`managers`.`phone_num` AS `phone_num`,`managers`.`entry_time` AS `entry_time`,`managers`.`work_position` AS `work_position`,`managers`.`state` AS `state` from `managers` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `opinion_result_message`
--

/*!50001 DROP VIEW IF EXISTS `opinion_result_message`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `opinion_result_message` AS select `opinions`.`opinion_rec_num` AS `opinion_rec_num`,`opinions`.`reader_name` AS `reader_name`,`opinions`.`opinion` AS `opinion`,`opinions`.`submit_time` AS `submit_time`,`opinions`.`state` AS `state`,`opinion_results`.`result` AS `result`,`opinion_results`.`transactor` AS `transactor`,`opinion_results`.`finish_time` AS `finish_time` from (`opinions` left join `opinion_results` on((`opinions`.`opinion_rec_num` = `opinion_results`.`opinion_rec_num`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reader_message`
--

/*!50001 DROP VIEW IF EXISTS `reader_message`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reader_message` AS select `readers`.`reader_name` AS `reader_name`,`readers`.`name` AS `name`,`readers`.`id_num` AS `id_num`,((substr(now(),1,4) - substr(`readers`.`id_num`,7,4)) - ((substr(`readers`.`id_num`,11,4) - date_format(now(),'%m%d')) > 0)) AS `age`,`readers`.`phone_num` AS `phone_num` from `readers` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `return_message`
--

/*!50001 DROP VIEW IF EXISTS `return_message`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `return_message` AS select `borrows`.`borrow_rec_num` AS `borrow_rec_num`,`borrows`.`reader_name` AS `reader_name`,`borrows`.`book_num` AS `book_num`,`books`.`book_name` AS `book_name`,`borrows`.`borrow_time` AS `borrow_time`,`borrows`.`transactor` AS `borrow_transactor`,`borrows`.`borrow_state` AS `borrow_state`,`returns`.`return_time` AS `return_time`,`borrows`.`borrow_duration` AS `borrow_duration`,`returns`.`transactor` AS `return_transactor`,`returns`.`fee` AS `fee`,`returns`.`kind` AS `kind` from ((`borrows` left join `books` on((`borrows`.`book_num` = `books`.`book_num`))) left join `returns` on((`borrows`.`borrow_rec_num` = `returns`.`borrow_rec_num`))) */;
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

-- Dump completed on 2023-01-13 12:47:02
