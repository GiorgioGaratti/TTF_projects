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
/*!40000 ALTER TABLE `classifica` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `join_squadra_partita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcatore`
--

DROP TABLE IF EXISTS `marcatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcatore` (
  `id_partita` int NOT NULL,
  `codice_squadra` char(3) NOT NULL,
  `id_marcatore` int NOT NULL,
  `nome_marcatore` varchar(50) NOT NULL,
  `minuto` tinyint NOT NULL,
  PRIMARY KEY (`id_partita`,`codice_squadra`,`id_marcatore`),
  KEY `IDX_ID_PARTITA_MINUTO` (`id_partita`,`minuto`),
  KEY `FK_SQUADRA_MARCATORE_idx` (`codice_squadra`),
  CONSTRAINT `FK_PARTITA_MARCATORE` FOREIGN KEY (`id_partita`) REFERENCES `partita` (`id_partita`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SQUADRA_MARCATORE` FOREIGN KEY (`codice_squadra`) REFERENCES `squadra` (`codice_squadra`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcatore`
--

LOCK TABLES `marcatore` WRITE;
/*!40000 ALTER TABLE `marcatore` DISABLE KEYS */;
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
  `stagione` char(7) NOT NULL,
  `giornata` tinyint NOT NULL,
  `data_partita` date NOT NULL,
  `orario_partita` time NOT NULL,
  PRIMARY KEY (`id_partita`),
  KEY `IDX_STAGIONE_GIORNATA_DATA_ORARIO` (`stagione` DESC,`giornata`,`data_partita`,`orario_partita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partita`
--

LOCK TABLES `partita` WRITE;
/*!40000 ALTER TABLE `partita` DISABLE KEYS */;
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
  `nome_esteso` varchar(30) NOT NULL,
  PRIMARY KEY (`codice_squadra`),
  KEY `IDX_NOME_ESTESO` (`nome_esteso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `squadra`
--

LOCK TABLES `squadra` WRITE;
/*!40000 ALTER TABLE `squadra` DISABLE KEYS */;
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

-- Dump completed on 2022-04-06 17:04:59
