-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nume` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prenume` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Joane K.','Rowling'),(2,'Stephen','Kings'),(3,'Lev','Tolstoi'),(4,'Ion','Creanga'),(5,'Mark','Twain'),(6,'Naomi','Novik'),(7,'Anton','Holban'),(8,'Dante','Alighieri'),(9,'Immanuel','Kant'),(10,'Nicolae','Dabija'),(11,'Mihail','Sadoveanu');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autori_carte`
--

DROP TABLE IF EXISTS `autori_carte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autori_carte` (
  `id_carte` int NOT NULL,
  `id_autor` int NOT NULL,
  KEY `fk_carte_to_autori` (`id_carte`),
  KEY `fk_autor_to_autori` (`id_autor`),
  CONSTRAINT `fk_autor_to_autori` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_carte_to_autori` FOREIGN KEY (`id_carte`) REFERENCES `carte` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autori_carte`
--

LOCK TABLES `autori_carte` WRITE;
/*!40000 ALTER TABLE `autori_carte` DISABLE KEYS */;
INSERT INTO `autori_carte` VALUES (4,1),(4,1),(5,2),(6,1),(7,2),(5,2),(6,1),(7,2),(11,4),(11,4),(33,1),(34,1),(35,1),(36,1),(37,1),(38,5),(39,5),(41,6),(42,6),(43,7),(47,8),(44,8),(48,8),(49,9),(50,10),(51,11);
/*!40000 ALTER TABLE `autori_carte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carte`
--

DROP TABLE IF EXISTS `carte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carte` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titlu_carte` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `isbn` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cover` varchar(200) NOT NULL,
  `id_editura` int NOT NULL,
  `data_publicarii` date NOT NULL DEFAULT '2020-04-04',
  `stoc` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_carte_editura` (`id_editura`),
  CONSTRAINT `fk_carte_editura` FOREIGN KEY (`id_editura`) REFERENCES `editura` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carte`
--

LOCK TABLES `carte` WRITE;
/*!40000 ALTER TABLE `carte` DISABLE KEYS */;
INSERT INTO `carte` VALUES (4,'Harry Potter și Camera Secretelor','9786060865926','harry-potter-si-camera-secretelor.jpg',1,'2013-05-20',14),(5,'Orasul bantuit','9786065794474','orasul-bantuit.jpg',3,'2014-05-20',0),(6,'Harry Potter și Piatra Filosofala','9786060861975','harry-potter-si-piatra-filosofala.jpg',1,'2010-05-20',2),(7,'The Stand','9786060861175','the-stand.jpeg',3,'2011-05-20',5),(11,'Amintiri din copilărie','9781260821973','amintiri-din-copilarie.jpg',5,'2017-05-20',1),(33,'Harry Potter și prizonierul din Azkaban','9786060861973','harry-potter-si-prizonierul-din-azkaban-cover.jpg',1,'2014-05-20',0),(34,'Harry Potter și Pocalul de Foc','9786060865988','harry-potter-4-si-pocalul-de-foc-cover.jpg',1,'2022-05-20',6),(35,'Harry Potter și Ordinul Phoenix','9786067887723','harry-potter-si-ordinul-phoenix-5-cover.jpg',1,'2016-05-20',4),(36,'Harry Potter și Prințul Semisânge','9786060862345','harry-potter-si-printul-semisange-cover.jpg',1,'2018-05-20',18),(37,'Harry Potter și Talismanele Morții','9786060861331','harry-potter-si-talismanele-mortii-cover.jpg',1,'2021-05-20',18),(38,'Aventurile lui Huckleberry Finn','9786060865827','aventurile-lui-huckleberry-finn-cover.jpg',2,'2012-05-20',14),(39,'Aventurile lui Tom Sawyer','9786060864776','aventurile-lui-tom-sawer-cover.jpg',2,'2016-05-20',1),(40,'Prinț și cerșetor','9786060862871','print-si-cersetor-cover.jpg',2,'2020-05-20',18),(41,'Victoria vulturilor','9786067585414','victoria-vulturilor-cover.jpg',3,'2013-05-20',8),(42,'Imperiul de fildeș','9786067583427','imperiul-de-fildes-cover.jpg',3,'2010-05-20',4),(43,'Conversații cu o moartă','9736819493','conversatii-cu-o-moarta.jpg',4,'2016-05-20',14),(44,'Paradisul','9786064907936','paradisul-cover.jpeg',6,'2011-05-20',1),(47,'Infernul','9786060061137','infernul-cover.jpeg',6,'2011-05-20',1),(48,'Purgatoriul','9786060067146','purgatoriul-cover.jpeg',6,'2013-05-20',1),(49,'Religia în limitele rațiunii pure','9789735076504','Religia-in-limitele-ratiunii-pure.jpg',5,'2023-05-20',0),(50,'Tema pentru acasă','9789975334952','tema-pentru-acasa.jpg',7,'2013-05-20',9),(51,'Baltagul','9786069335505','baltagul.jpg',5,'2011-05-20',17);
/*!40000 ALTER TABLE `carte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `nume_categorie` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Fantezie'),(2,'Horror'),(3,'Thriller'),(4,'Drama'),(5,'Literatura clasica'),(6,'Literatura universala'),(7,'Literatura romana'),(8,'Pentru copii'),(9,'Umor'),(10,'Epopee'),(11,'Filosofie');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorii_carte`
--

DROP TABLE IF EXISTS `categorii_carte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorii_carte` (
  `id_carte` int NOT NULL,
  `id_categorie` int NOT NULL,
  KEY `fk_categorii_to_carte` (`id_carte`),
  KEY `fk_categorii_to_categorie` (`id_categorie`),
  CONSTRAINT `fk_categorii_to_carte` FOREIGN KEY (`id_carte`) REFERENCES `carte` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_categorii_to_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorii_carte`
--

LOCK TABLES `categorii_carte` WRITE;
/*!40000 ALTER TABLE `categorii_carte` DISABLE KEYS */;
INSERT INTO `categorii_carte` VALUES (4,1),(4,8),(5,6),(5,2),(6,1),(6,8),(7,2),(7,3),(7,6),(11,8),(11,7),(34,1),(34,8),(35,1),(35,8),(36,1),(36,8),(37,1),(37,8),(38,6),(38,9),(38,8),(39,8),(39,6),(41,1),(42,1),(43,7),(44,6),(44,5),(47,5),(47,6),(48,5),(48,6),(49,11),(50,5),(50,7),(51,7),(51,5),(33,1),(33,8);
/*!40000 ALTER TABLE `categorii_carte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienti` (
  `cnp` varchar(13) NOT NULL,
  `nume` varchar(30) NOT NULL,
  `prenume` varchar(30) NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parola` varchar(60) NOT NULL,
  UNIQUE KEY `cnp` (`cnp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES ('1','Ion','Vasile','aaa@uab.eo','$2y$10$A2i90cGFl/uoTaHGOIIQUu9C.qFt3eIkP3jqEThcW2opSRUMUPjVG'),('1111111111111','aaa','a','aaaa@uab.e','$2y$10$BbgAn6cX8DfnmqMOyuRUduy4si4yIfaiFKIu4SerGGFojRar4YXja'),('1234567890123','John','Doe','johndoe@example.com','$2y$10$a/OaHn3czioarOwPDAgTKOhwMeryqUoEDTQ7iTrjXTlR5L7sNVsmm'),('123456789101','Dumitru','Tronciu','dumitru.tronciu@gmail.com','$2y$10$rY4/4/R8gzclQEmPvMlaS.DnaYEkNqNXDhMKWdHgBvlX71ymhDtlq'),('2345678901234','Michael','Davis','michaeldavis@example.com','$2y$10$fuIdaUUiDKbu/MFKsPiEzuKrf6M/NnqLCWhMXPSBDpLQIU.HjDU6q'),('4567890123456','David','Johnson','davidjohnson@example.com','$2y$10$DXrXcevK5yMwwYdubiEfJOvVyWUz8tUHu9VkuiRFdOs6t/o/X19Ym'),('7890123456789','Emily','Brown','emilybrown@example.com','$2y$10$7kRjL1kdA2gBZ8Ov0quq9uCaU3APRNmRWAN0JT..fo1vXKqtw/nJm'),('9876543210987','Jane','Smith','janesmith@example.com','$2y$10$nbZdO0SQWx12gnF.8Z.Ne.IxBaLCU.C42KkgzHSX2SDaYFN6IbLBm');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `complete_carte_view`
--

DROP TABLE IF EXISTS `complete_carte_view`;
/*!50001 DROP VIEW IF EXISTS `complete_carte_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `complete_carte_view` AS SELECT 
 1 AS `ID`,
 1 AS `Titlu`,
 1 AS `ISBN`,
 1 AS `Editura`,
 1 AS `Autor`,
 1 AS `Categorii`,
 1 AS `Publicare`,
 1 AS `Stoc`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `editura`
--

DROP TABLE IF EXISTS `editura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nume` varchar(30) NOT NULL,
  `telefon` varchar(10) NOT NULL,
  `tara` varchar(30) NOT NULL,
  `judet` varchar(40) NOT NULL,
  `localitate` varchar(50) NOT NULL,
  `strada` varchar(60) NOT NULL,
  `numar_adresa` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editura`
--

LOCK TABLES `editura` WRITE;
/*!40000 ALTER TABLE `editura` DISABLE KEYS */;
INSERT INTO `editura` VALUES (1,'Arthur','0744300870','Romania','Alba','Alba Iulia','str. Florilor','1'),(2,'ART','0744300870','Romania','Bucuresti','Bucuresti','Splaiul Independenţei','315-319'),(3,'Nemira','372118685','Romania','Bucuresti','Bucuresti','Str. Iani Buzoiani','14'),(4,'Polirom','0232214100','Romania','Iasi','Iasi','Bulevardul Carol I','4'),(5,'Humanitas','0372716036','Romania','Bucuresti','Bucuresti','Piaţa Presei Libere','1'),(6,'Litera','0752101770','Romania','Bucuresti','Bucuresti','Strada Moeciu','7A'),(7,'Bestseller','0723282807','Romania','Bucuresti','Bucuresti','Piața Presei Libere','1');
/*!40000 ALTER TABLE `editura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formular_imprumut`
--

DROP TABLE IF EXISTS `formular_imprumut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formular_imprumut` (
  `id_tranzactie` int NOT NULL AUTO_INCREMENT,
  `id_carte` int NOT NULL,
  `cnp_client` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_imprumut` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tranzactie`),
  KEY `fk_imprumut_carte` (`id_carte`),
  KEY `fk_imprumut_client` (`cnp_client`),
  CONSTRAINT `fk_imprumut_carte` FOREIGN KEY (`id_carte`) REFERENCES `carte` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formular_imprumut`
--

LOCK TABLES `formular_imprumut` WRITE;
/*!40000 ALTER TABLE `formular_imprumut` DISABLE KEYS */;
INSERT INTO `formular_imprumut` VALUES (3,38,'123456789101','2023-05-22 15:41:09'),(4,49,'123456789101','2023-05-22 22:08:51'),(9,34,'1','2023-05-23 00:09:07');
/*!40000 ALTER TABLE `formular_imprumut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `formular_imprumut_view`
--

DROP TABLE IF EXISTS `formular_imprumut_view`;
/*!50001 DROP VIEW IF EXISTS `formular_imprumut_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `formular_imprumut_view` AS SELECT 
 1 AS `id_operatie`,
 1 AS `Titlu`,
 1 AS `Cover`,
 1 AS `client_email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `formular_restituire`
--

DROP TABLE IF EXISTS `formular_restituire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formular_restituire` (
  `id_tranzactie` int NOT NULL AUTO_INCREMENT,
  `id_carte` int NOT NULL,
  `cnp_client` varchar(13) NOT NULL,
  `data_imprumut` datetime NOT NULL,
  `data_restituire` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tranzactie`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formular_restituire`
--

LOCK TABLES `formular_restituire` WRITE;
/*!40000 ALTER TABLE `formular_restituire` DISABLE KEYS */;
INSERT INTO `formular_restituire` VALUES (1,5,'123456789101','2023-05-21 15:24:37','2023-05-22 21:33:29'),(2,11,'123456789101','2023-05-22 15:40:16','2023-05-22 21:36:34'),(5,34,'1','2023-05-23 00:01:38','2023-05-23 00:01:57'),(6,34,'1','2023-05-23 00:01:45','2023-05-23 00:01:56'),(7,34,'1','2023-05-23 00:03:34','2023-05-23 00:03:45'),(8,34,'1','2023-05-23 00:03:37','2023-05-23 00:03:44');
/*!40000 ALTER TABLE `formular_restituire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `main_page_view`
--

DROP TABLE IF EXISTS `main_page_view`;
/*!50001 DROP VIEW IF EXISTS `main_page_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `main_page_view` AS SELECT 
 1 AS `id`,
 1 AS `titlu_carte`,
 1 AS `cover`,
 1 AS `stoc`,
 1 AS `autor`,
 1 AS `data_publicarii`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `complete_carte_view`
--

/*!50001 DROP VIEW IF EXISTS `complete_carte_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `complete_carte_view` AS select `a`.`id` AS `ID`,`a`.`titlu_carte` AS `Titlu`,`a`.`isbn` AS `ISBN`,`e`.`nume` AS `Editura`,concat(`au`.`nume`,' ',`au`.`prenume`) AS `Autor`,`f_categoriile`(`a`.`id`) AS `Categorii`,`a`.`data_publicarii` AS `Publicare`,`a`.`stoc` AS `Stoc` from (((`carte` `a` join `editura` `e` on((`e`.`id` = `a`.`id_editura`))) join `autori_carte` `ac` on((`ac`.`id_carte` = `a`.`id`))) join `autor` `au` on((`au`.`id_autor` = `ac`.`id_autor`))) group by `a`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `formular_imprumut_view`
--

/*!50001 DROP VIEW IF EXISTS `formular_imprumut_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `formular_imprumut_view` AS select `b`.`id_tranzactie` AS `id_operatie`,`a`.`titlu_carte` AS `Titlu`,`a`.`cover` AS `Cover`,`c`.`email` AS `client_email` from ((`carte` `a` join `formular_imprumut` `b` on((`b`.`id_carte` = `a`.`id`))) join `clienti` `c` on((`c`.`cnp` = `b`.`cnp_client`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `main_page_view`
--

/*!50001 DROP VIEW IF EXISTS `main_page_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `main_page_view` AS select `a`.`id` AS `id`,`a`.`titlu_carte` AS `titlu_carte`,`a`.`cover` AS `cover`,`a`.`stoc` AS `stoc`,concat(`b`.`nume`,' ',`b`.`prenume`) AS `autor`,`a`.`data_publicarii` AS `data_publicarii` from ((`carte` `a` join `autori_carte` `c` on((`c`.`id_carte` = `a`.`id`))) join `autor` `b` on((`b`.`id_autor` = `c`.`id_autor`))) group by `a`.`id` */;
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

-- Dump completed on 2023-05-23 10:18:11
