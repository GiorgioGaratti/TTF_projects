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
-- Table structure for table `join_squadra_partita`
--

DROP TABLE IF EXISTS `join_squadra_partita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `join_squadra_partita` (
  `id_partita_join` int NOT NULL,
  `stato` char(1) NOT NULL,
  `nome_squadra` varchar(15) NOT NULL,
  `n_gol` tinyint unsigned NOT NULL,
  `tiri_totali` tinyint unsigned NOT NULL,
  `tiri_in_porta` tinyint unsigned NOT NULL,
  `possesso_palla` tinyint unsigned NOT NULL,
  `passaggi` smallint unsigned NOT NULL,
  `precisione_passaggi` tinyint unsigned NOT NULL,
  `falli_commessi` tinyint unsigned NOT NULL,
  `ammonizioni` tinyint unsigned NOT NULL,
  `espulsioni` tinyint unsigned NOT NULL,
  `fuorigioco` tinyint unsigned NOT NULL,
  `calci_angolo` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id_partita_join`,`stato`),
  KEY `FK_SQUADRA_JOIN` (`nome_squadra`),
  CONSTRAINT `FK_PARTITA_JOIN` FOREIGN KEY (`id_partita_join`) REFERENCES `partita` (`id_partita`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SQUADRA_JOIN` FOREIGN KEY (`nome_squadra`) REFERENCES `squadra` (`nome_squadra`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `join_squadra_partita`
--

LOCK TABLES `join_squadra_partita` WRITE;
/*!40000 ALTER TABLE `join_squadra_partita` DISABLE KEYS */;
INSERT INTO `join_squadra_partita` VALUES (1,'C','Inter',1,11,5,46,349,84,20,2,1,1,6),(1,'T','Milan',2,10,3,54,430,83,14,4,1,2,4);
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
  `id_partita_marcatore` int NOT NULL,
  `nome_squadra` varchar(15) NOT NULL,
  `biennio` char(7) NOT NULL,
  `ruolo` varchar(25) NOT NULL,
  PRIMARY KEY (`nome`,`cognome`,`minuto`,`id_partita_marcatore`),
  KEY `IDXFK_PARTITA_MARCATORE` (`id_partita_marcatore`),
  KEY `IDXFK_SQUADRA_MARCATORE` (`nome_squadra`,`biennio`),
  CONSTRAINT `FK_PARTITA_MARCATORE` FOREIGN KEY (`id_partita_marcatore`) REFERENCES `partita` (`id_partita`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SQUADRA_MARCATORE` FOREIGN KEY (`nome_squadra`, `biennio`) REFERENCES `squadra` (`nome_squadra`, `biennio`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcatore`
--

LOCK TABLES `marcatore` WRITE;
/*!40000 ALTER TABLE `marcatore` DISABLE KEYS */;
INSERT INTO `marcatore` VALUES ('Ivan','Perisic',38,1,'Inter','2021-22','centrocampista'),('Olivier','Giroud',75,1,'Milan','2021-22','attaccante'),('Olivier','Giroud',78,1,'Milan','2021-22','attaccante');
/*!40000 ALTER TABLE `marcatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partita`
--

DROP TABLE IF EXISTS `partita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partita` (
  `id_partita` int NOT NULL AUTO_INCREMENT,
  `data_partita` date NOT NULL,
  `num_giornata` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id_partita`),
  KEY `IDX_NUM_GIORNATA_DATA_PARTITA` (`num_giornata`,`data_partita`) /*!80000 INVISIBLE */
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partita`
--

LOCK TABLES `partita` WRITE;
/*!40000 ALTER TABLE `partita` DISABLE KEYS */;
INSERT INTO `partita` VALUES (1,'2021-02-05',24);
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
  `biennio` char(7) NOT NULL,
  `partite_giocate` tinyint unsigned NOT NULL,
  `vittorie` tinyint unsigned NOT NULL,
  `pareggiate` tinyint unsigned NOT NULL,
  `sconfitte` tinyint unsigned NOT NULL,
  `punti` tinyint unsigned NOT NULL,
  PRIMARY KEY (`nome_squadra`,`biennio`),
  KEY `IDX_BIENNIO_PUNTI` (`biennio` DESC,`punti` DESC) /*!80000 INVISIBLE */,
  KEY `IDXFK_STAGIONE_SQUADRA` (`biennio` DESC),
  CONSTRAINT `FK_STAGIONE_SQUADRA` FOREIGN KEY (`biennio`) REFERENCES `stagione` (`biennio`) ON DELETE RESTRICT ON UPDATE CASCADE
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

--
-- Table structure for table `stagione`
--

DROP TABLE IF EXISTS `stagione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stagione` (
  `biennio` char(7) NOT NULL,
  PRIMARY KEY (`biennio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stagione`
--

LOCK TABLES `stagione` WRITE;
/*!40000 ALTER TABLE `stagione` DISABLE KEYS */;
INSERT INTO `stagione` VALUES ('2021-22');
/*!40000 ALTER TABLE `stagione` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-23  3:05:23
