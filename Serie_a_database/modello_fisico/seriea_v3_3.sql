CREATE DATABASE  IF NOT EXISTS `serie_a` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `serie_a`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: serie_a
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `classifica`
--

DROP TABLE IF EXISTS `classifica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classifica` (
  `stagione` char(9) NOT NULL,
  `codice_squadra` char(3) NOT NULL,
  `punti` tinyint unsigned NOT NULL,
  `partite_giocate` tinyint unsigned NOT NULL,
  `vittorie` tinyint unsigned NOT NULL,
  `pareggi` tinyint unsigned NOT NULL,
  `sconfitte` tinyint unsigned NOT NULL,
  PRIMARY KEY (`stagione`,`codice_squadra`),
  KEY `IDX_STAGIONE_PUNTI` (`stagione` DESC,`punti` DESC),
  KEY `FK_SQUADRA_CLASSIFICA_idx` (`codice_squadra`),
  CONSTRAINT `FK_SQUADRA_CLASSIFICA` FOREIGN KEY (`codice_squadra`) REFERENCES `squadra` (`codice_squadra`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classifica`
--

LOCK TABLES `classifica` WRITE;
/*!40000 ALTER TABLE `classifica` DISABLE KEYS */;
INSERT INTO `classifica` VALUES ('2021/2022','ATA',9,6,2,3,1),('2021/2022','INT',7,6,1,4,1),('2021/2022','JUV',2,2,0,2,0),('2021/2022','LAZ',1,4,0,1,3),('2021/2022','MIL',5,3,1,2,0),('2021/2022','NAP',0,1,0,0,1);
/*!40000 ALTER TABLE `classifica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal`
--

DROP TABLE IF EXISTS `goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal` (
  `id_goal` int NOT NULL AUTO_INCREMENT,
  `id_partita` int NOT NULL,
  `codice_squadra` char(3) NOT NULL,
  `nome_marcatore` varchar(50) NOT NULL,
  `minuto` tinyint NOT NULL,
  PRIMARY KEY (`id_goal`),
  KEY `IDX_ID_PARTITA_MINUTO` (`id_partita`,`minuto`),
  KEY `FK_SQUADRA_MARCATORE_idx` (`codice_squadra`),
  CONSTRAINT `FK_PARTITA_MARCATORE` FOREIGN KEY (`id_partita`) REFERENCES `partita` (`id_partita`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SQUADRA_MARCATORE` FOREIGN KEY (`codice_squadra`) REFERENCES `squadra` (`codice_squadra`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal`
--

LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */;
INSERT INTO `goal` VALUES (19,2,'ATA','PASALIC',3),(20,2,'ATA','PASALIC',5),(21,2,'INT','DZEKO',1),(22,3,'ATA','PASALIC',23),(23,3,'JUV','RABIOT',45),(24,4,'LAZ','IMMOBILE',34),(25,4,'LAZ','IMMOBILE',90),(26,4,'LAZ','IMMOBILE',78),(27,5,'ATA','PASALIC',86),(28,5,'ATA','PASALIC',45),(29,5,'MIL','GIROUD',23),(30,5,'MIL','GIROUD',34),(31,6,'ATA','PASALIC',53),(32,6,'ATA','PASALIC',43),(33,6,'ATA','PASALIC',21),(34,6,'ATA','PASALIC',10),(35,6,'NAP','PETAGNA',67),(36,6,'NAP','PETAGNA',87),(37,8,'INT','DZEKO',56),(38,8,'INT','DZEKO',55),(39,8,'INT','DZEKO',54),(40,8,'JUV','RABIOT',50),(41,8,'JUV','RABIOT',5),(42,8,'JUV','RABIOT',44),(43,9,'INT','DZEKO',33),(44,10,'LAZ','IMMOBILE',4),(45,10,'MIL','GIROUD',32),(46,10,'MIL','GIROUD',2),(47,10,'MIL','GIROUD',1),(48,11,'LAZ','IMMOBILE',45),(49,11,'LAZ','IMMOBILE',78),(50,11,'INT','DZEKO',79),(51,11,'INT','DZEKO',80);
/*!40000 ALTER TABLE `goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `join_squadra_partita`
--

DROP TABLE IF EXISTS `join_squadra_partita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `join_squadra_partita` (
  `id_partita` int NOT NULL,
  `codice_squadra` char(3) NOT NULL,
  `casa_trasferta` char(1) NOT NULL,
  `n_goal` tinyint NOT NULL,
  `tiri_totali` tinyint NOT NULL,
  `tiri_in_porta` tinyint NOT NULL,
  `possesso_palla` tinyint NOT NULL,
  `passaggi` smallint NOT NULL,
  `precisione_passaggi` tinyint NOT NULL,
  `falli_commessi` tinyint NOT NULL,
  `ammonizioni` tinyint NOT NULL,
  `espulsioni` tinyint NOT NULL,
  `fuorigioco` tinyint NOT NULL,
  `calci_angolo` tinyint NOT NULL,
  PRIMARY KEY (`id_partita`,`codice_squadra`),
  KEY `FK_SQUADRA_JOIN_idx` (`codice_squadra`),
  CONSTRAINT `FK_PARTITA_JOIN` FOREIGN KEY (`id_partita`) REFERENCES `partita` (`id_partita`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SQUADRA_JOIN` FOREIGN KEY (`codice_squadra`) REFERENCES `squadra` (`codice_squadra`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `join_squadra_partita`
--

LOCK TABLES `join_squadra_partita` WRITE;
/*!40000 ALTER TABLE `join_squadra_partita` DISABLE KEYS */;
INSERT INTO `join_squadra_partita` VALUES (1,'INT','C',0,0,0,40,25,1,1,3,1,2,5),(1,'MIL','T',0,0,0,60,25,1,1,3,1,2,5),(2,'ATA','C',2,12,4,40,345,78,9,2,0,4,5),(2,'INT','T',1,11,4,60,345,78,9,2,1,4,15),(3,'ATA','C',1,3,2,50,332,90,10,3,0,9,1),(3,'JUV','T',1,2,1,50,300,85,20,5,1,2,5),(4,'ATA','C',0,0,0,42,400,78,12,4,0,5,2),(4,'LAZ','T',3,13,7,58,200,90,8,2,0,3,9),(5,'ATA','C',2,2,2,38,340,79,3,2,0,1,1),(5,'MIL','T',2,4,3,62,421,89,2,1,0,3,0),(6,'ATA','C',4,12,6,50,320,70,9,0,0,8,4),(6,'NAP','T',2,6,3,50,312,72,8,0,0,4,2),(7,'ATA','T',0,4,2,52,360,85,8,2,0,2,3),(7,'INT','C',0,5,2,48,280,87,14,3,1,3,3),(8,'INT','C',3,5,2,50,256,87,7,6,0,5,9),(8,'JUV','T',3,6,2,50,265,86,8,5,1,4,10),(9,'INT','C',1,6,5,60,352,84,20,7,1,7,4),(9,'LAZ','T',0,7,5,40,253,87,25,5,1,6,5),(10,'LAZ','C',1,12,3,34,365,90,14,3,0,7,12),(10,'MIL','T',3,13,9,66,389,92,12,2,0,4,10),(11,'INT','T',2,4,4,55,345,78,7,0,0,8,7),(11,'LAZ','C',2,3,2,45,354,76,8,0,0,9,6);
/*!40000 ALTER TABLE `join_squadra_partita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partita`
--

DROP TABLE IF EXISTS `partita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partita` (
  `id_partita` int NOT NULL AUTO_INCREMENT,
  `stagione` char(9) NOT NULL,
  `giornata` tinyint NOT NULL,
  `data_partita` date NOT NULL,
  `orario_partita` time NOT NULL,
  PRIMARY KEY (`id_partita`),
  KEY `IDX_STAGIONE_GIORNATA_DATA_ORARIO` (`stagione` DESC,`giornata`,`data_partita`,`orario_partita`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partita`
--

LOCK TABLES `partita` WRITE;
/*!40000 ALTER TABLE `partita` DISABLE KEYS */;
INSERT INTO `partita` VALUES (2,'2021/2022',1,'2022-02-08','15:00:00'),(3,'2021/2022',2,'2022-02-10','18:00:00'),(4,'2021/2022',3,'2022-02-12','20:45:00'),(5,'2021/2022',4,'2022-02-14','15:00:00'),(6,'2021/2022',5,'2022-02-16','18:00:00'),(7,'2021/2022',6,'2022-02-18','20:45:00'),(8,'2021/2022',7,'2022-02-20','15:00:00'),(9,'2021/2022',8,'2022-02-22','18:00:00'),(10,'2021/2022',9,'2022-02-24','20:45:00'),(11,'2021/2022',10,'2022-02-26','15:00:00'),(1,'2021/2022',31,'2022-04-03','15:00:00');
/*!40000 ALTER TABLE `partita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `squadra`
--

DROP TABLE IF EXISTS `squadra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `squadra` (
  `codice_squadra` char(3) NOT NULL,
  `nome_squadra` varchar(30) NOT NULL,
  PRIMARY KEY (`codice_squadra`),
  KEY `IDX_NOME_ESTESO` (`nome_squadra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `squadra`
--

LOCK TABLES `squadra` WRITE;
/*!40000 ALTER TABLE `squadra` DISABLE KEYS */;
INSERT INTO `squadra` VALUES ('ATA','Atalanta'),('INT','Internazionale'),('JUV','Juventus'),('LAZ','Lazio'),('MIL','Milan'),('NAP','Napoli'),('ROM','Roma');
/*!40000 ALTER TABLE `squadra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-13 12:46:11
