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
-- Table structure for table `giocatore`
--

DROP TABLE IF EXISTS `giocatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giocatore` (
  `id_giocatore` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `ruolo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_giocatore`),
  KEY `IDX_COGNOME_NOME` (`cognome`,`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giocatore`
--

LOCK TABLES `giocatore` WRITE;
/*!40000 ALTER TABLE `giocatore` DISABLE KEYS */;
INSERT INTO `giocatore` VALUES (1,'Olivier','Giroud','attaccante'),(2,'Ivan','Perisic','centrocampista');
/*!40000 ALTER TABLE `giocatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcatore`
--

DROP TABLE IF EXISTS `marcatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcatore` (
  `id_partita` int unsigned NOT NULL,
  `id_squadra` char(3) NOT NULL,
  `stagione` char(7) NOT NULL,
  `giornata` tinyint unsigned NOT NULL,
  `id_giocatore` int unsigned NOT NULL AUTO_INCREMENT,
  `minuto` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id_partita`,`minuto`,`id_giocatore`,`giornata`,`stagione`,`id_squadra`),
  KEY `FK_GIOCATORE_MARCATORE_idx` (`id_giocatore`),
  KEY `FK_PARTITA_MARCATORE_idx` (`id_squadra`,`stagione`,`id_partita`,`giornata`) /*!80000 INVISIBLE */,
  KEY `IDX_STAGIONE_GIORNATA_ID_PARTITA_MINUTO` (`stagione` DESC,`giornata`,`id_partita`,`minuto`),
  CONSTRAINT `FK_GIOCATORE_MARCATORE` FOREIGN KEY (`id_giocatore`) REFERENCES `giocatore` (`id_giocatore`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PARTITA_MARCATORE` FOREIGN KEY (`id_squadra`, `stagione`, `id_partita`, `giornata`) REFERENCES `partita` (`id_squadra`, `stagione`, `id_partita`, `giornata`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcatore`
--

LOCK TABLES `marcatore` WRITE;
/*!40000 ALTER TABLE `marcatore` DISABLE KEYS */;
INSERT INTO `marcatore` VALUES (3,'MIL','2021-22',24,1,75),(3,'MIL','2021-22',24,1,78),(3,'INT','2021-22',24,2,38);
/*!40000 ALTER TABLE `marcatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nome_squadra`
--

DROP TABLE IF EXISTS `nome_squadra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nome_squadra` (
  `id_squadra` char(3) NOT NULL,
  `nome_esteso` varchar(30) NOT NULL,
  PRIMARY KEY (`id_squadra`),
  KEY `IDX_NOME_ESTESO` (`nome_esteso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nome_squadra`
--

LOCK TABLES `nome_squadra` WRITE;
/*!40000 ALTER TABLE `nome_squadra` DISABLE KEYS */;
INSERT INTO `nome_squadra` VALUES ('MIL','AC Milan'),('INT','FC INternazionale');
/*!40000 ALTER TABLE `nome_squadra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partita`
--

DROP TABLE IF EXISTS `partita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partita` (
  `id_squadra` char(3) NOT NULL,
  `stagione` char(7) NOT NULL,
  `id_partita` int unsigned NOT NULL,
  `giornata` tinyint unsigned NOT NULL,
  `stato_squadra` char(1) NOT NULL,
  `giorno_settimana` char(3) NOT NULL,
  `data_partita` date NOT NULL,
  `orario_partita` time NOT NULL,
  `num_goal` tinyint unsigned NOT NULL,
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
  PRIMARY KEY (`id_squadra`,`stagione`,`id_partita`,`giornata`),
  KEY `FK_SQUADRA_PARTITA_idx` (`id_squadra`,`stagione`),
  KEY `IDX_STAGIONE_GIORNATA_DATA_PARTITA_ORARIO_PARTITA` (`stagione` DESC,`giornata`,`data_partita`,`orario_partita`),
  CONSTRAINT `FK_SQUADRA_PARTITA` FOREIGN KEY (`id_squadra`, `stagione`) REFERENCES `squadra` (`id_squadra`, `stagione`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partita`
--

LOCK TABLES `partita` WRITE;
/*!40000 ALTER TABLE `partita` DISABLE KEYS */;
INSERT INTO `partita` VALUES ('INT','2021-22',3,24,'C','Sab','2021-02-05','20:45:00',1,11,5,46,349,84,20,2,1,1,6),('MIL','2021-22',3,24,'T','Sab','2021-02-05','20:45:00',2,10,3,54,430,83,14,4,1,2,4);
/*!40000 ALTER TABLE `partita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `squadra`
--

DROP TABLE IF EXISTS `squadra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `squadra` (
  `id_squadra` char(3) NOT NULL,
  `stagione` char(7) NOT NULL,
  `partite_giocate` tinyint unsigned NOT NULL,
  `vittorie` tinyint unsigned NOT NULL,
  `pareggi` tinyint unsigned NOT NULL,
  `sconfitte` tinyint unsigned NOT NULL,
  `punti` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id_squadra`,`stagione`),
  KEY `IDX_STAGIONE_PUNTI` (`stagione` DESC,`punti` DESC),
  CONSTRAINT `FK_NOME_SQUADRA_SQUADRA` FOREIGN KEY (`id_squadra`) REFERENCES `nome_squadra` (`id_squadra`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `squadra`
--

LOCK TABLES `squadra` WRITE;
/*!40000 ALTER TABLE `squadra` DISABLE KEYS */;
INSERT INTO `squadra` VALUES ('INT','2021-22',1,0,0,1,0),('MIL','2021-22',1,1,0,0,3);
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

-- Dump completed on 2022-03-30 12:56:40
