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
  `stagione` char(7) NOT NULL,
  PRIMARY KEY (`stagione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classifica`
--

LOCK TABLES `classifica` WRITE;
/*!40000 ALTER TABLE `classifica` DISABLE KEYS */;
INSERT INTO `classifica` VALUES ('2021-22');
/*!40000 ALTER TABLE `classifica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `join_squadra_partita`
--

DROP TABLE IF EXISTS `join_squadra_partita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `join_squadra_partita` (
  `stagione` char(7) NOT NULL,
  `nome_squadra` varchar(15) NOT NULL,
  `nome_match` varchar(25) NOT NULL,
  `data_match` date NOT NULL,
  `n_gol` tinyint unsigned DEFAULT NULL,
  `tiri_totali` tinyint unsigned DEFAULT NULL,
  `tiri_in_porta` tinyint unsigned DEFAULT NULL,
  `possesso_palla` tinyint unsigned DEFAULT NULL,
  `passaggi` smallint unsigned DEFAULT NULL,
  `precisione_passaggi` tinyint unsigned DEFAULT NULL,
  `falli_commessi` tinyint unsigned DEFAULT NULL,
  `ammonizioni` tinyint unsigned DEFAULT NULL,
  `espulsioni` tinyint unsigned DEFAULT NULL,
  `fuorigioco` tinyint unsigned DEFAULT NULL,
  `calci_angolo` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`stagione`,`nome_squadra`,`nome_match`,`data_match`),
  KEY `IDXFK_PARTITA_JOIN` (`nome_match`,`data_match`),
  KEY `IDXFK_SQUADRA_JOIN` (`nome_squadra`,`stagione`),
  CONSTRAINT `FK_PARTITA_JOIN` FOREIGN KEY (`nome_match`, `data_match`) REFERENCES `partita` (`nome_match`, `data_match`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SQUADRA_JOIN` FOREIGN KEY (`nome_squadra`, `stagione`) REFERENCES `squadra` (`nome_squadra`, `stagione`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `join_squadra_partita`
--

LOCK TABLES `join_squadra_partita` WRITE;
/*!40000 ALTER TABLE `join_squadra_partita` DISABLE KEYS */;
INSERT INTO `join_squadra_partita` VALUES ('2021-22','Inter','Inter-Milan','2021-02-05',1,11,5,46,349,84,20,2,1,1,6),('2021-22','Milan','Inter-Milan','2021-02-05',2,10,3,54,430,83,14,4,1,2,4);
/*!40000 ALTER TABLE `join_squadra_partita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcatore`
--

DROP TABLE IF EXISTS `marcatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcatore` (
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `minuto` tinyint unsigned NOT NULL,
  `nome_match` varchar(25) NOT NULL,
  `data_match` date NOT NULL,
  `nome_squadra` varchar(15) NOT NULL,
  `stagione` char(7) NOT NULL,
  `ruolo` varchar(25) NOT NULL,
  PRIMARY KEY (`nome`,`cognome`,`minuto`,`nome_match`,`data_match`),
  KEY `IDXFK_SQUADRA_MARCATORE` (`nome_squadra`,`stagione` DESC),
  KEY `IDXFK_PARTITA_MARCATORE` (`nome_match`,`data_match`),
  CONSTRAINT `FK_PARTITA_MARCATORE` FOREIGN KEY (`nome_match`, `data_match`) REFERENCES `partita` (`nome_match`, `data_match`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SQUADRA_MARCATORE` FOREIGN KEY (`nome_squadra`, `stagione`) REFERENCES `squadra` (`nome_squadra`, `stagione`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcatore`
--

LOCK TABLES `marcatore` WRITE;
/*!40000 ALTER TABLE `marcatore` DISABLE KEYS */;
INSERT INTO `marcatore` VALUES ('Ivan','Perisic',38,'Inter-Milan','2021-02-05','Inter','2021-22','centrocampista'),('Olivier','Giroud',75,'Inter-Milan','2021-02-05','Milan','2021-22','attaccante'),('Olivier','Giroud',78,'Inter-Milan','2021-02-05','Milan','2021-22','attaccante');
/*!40000 ALTER TABLE `marcatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partita`
--

DROP TABLE IF EXISTS `partita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partita` (
  `nome_match` varchar(25) NOT NULL,
  `data_match` date NOT NULL,
  `num_giornata` tinyint unsigned NOT NULL,
  `orario_match` time DEFAULT NULL,
  `giorno_settimana` char(3) DEFAULT NULL,
  PRIMARY KEY (`nome_match`,`data_match`),
  KEY `IDX_DATA_MATCH_ORAIO_MATCH` (`data_match`,`orario_match`) /*!80000 INVISIBLE */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partita`
--

LOCK TABLES `partita` WRITE;
/*!40000 ALTER TABLE `partita` DISABLE KEYS */;
INSERT INTO `partita` VALUES ('Inter-Milan','2021-02-05',24,'20:45:00','Sab');
/*!40000 ALTER TABLE `partita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `squadra`
--

DROP TABLE IF EXISTS `squadra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `squadra` (
  `nome_squadra` varchar(15) NOT NULL,
  `stagione` char(7) NOT NULL,
  `partite_giocate` tinyint unsigned NOT NULL,
  `vittorie` tinyint unsigned NOT NULL,
  `pareggi` tinyint unsigned NOT NULL,
  `sconfitte` tinyint unsigned NOT NULL,
  `punti` tinyint unsigned NOT NULL,
  PRIMARY KEY (`nome_squadra`,`stagione`),
  KEY `IDX_STAGIONE_PUNTI` (`stagione` DESC,`punti` DESC) /*!80000 INVISIBLE */,
  KEY `IDXFK_CLASSIFICA_SQUADRA` (`stagione` DESC),
  CONSTRAINT `FK_CLASSIFICA_SQUADRA` FOREIGN KEY (`stagione`) REFERENCES `classifica` (`stagione`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `squadra`
--

LOCK TABLES `squadra` WRITE;
/*!40000 ALTER TABLE `squadra` DISABLE KEYS */;
INSERT INTO `squadra` VALUES ('Inter','2021-22',1,0,0,1,0),('Milan','2021-22',1,1,0,0,3);
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

-- Dump completed on 2022-03-24 12:30:48
