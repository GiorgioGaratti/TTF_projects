CREATE DATABASE  IF NOT EXISTS `registro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `registro`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: registro
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
-- Table structure for table `tbl_docente`
--

DROP TABLE IF EXISTS `tbl_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_docente` (
  `codice_fiscale` char(16) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `cognome` varchar(60) NOT NULL,
  `azienda` varchar(50) DEFAULT NULL,
  `data_inserimento` timestamp NOT NULL,
  `data_modifica` timestamp NOT NULL,
  PRIMARY KEY (`codice_fiscale`),
  KEY `IDX_COGNOME` (`cognome`) /*!80000 INVISIBLE */,
  KEY `IDX_INS` (`data_inserimento` DESC) /*!80000 INVISIBLE */,
  KEY `IDX_MOD` (`data_modifica` DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_docente`
--

LOCK TABLES `tbl_docente` WRITE;
/*!40000 ALTER TABLE `tbl_docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_firma`
--

DROP TABLE IF EXISTS `tbl_firma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_firma` (
  `id_firma` smallint unsigned NOT NULL,
  `data` date NOT NULL,
  `codice_fiscale_studente` char(16) NOT NULL,
  `numero_corso` char(6) NOT NULL,
  `anno` year NOT NULL,
  `momento_giornata` varchar(10) NOT NULL,
  `firma_studente` blob,
  `data_inserimento` timestamp NOT NULL,
  `data_modifica` timestamp NOT NULL,
  PRIMARY KEY (`id_firma`),
  KEY `IDX_CODICE_FISCALE_STUDENTE` (`codice_fiscale_studente`),
  KEY `IDX_INS` (`data_inserimento` DESC) /*!80000 INVISIBLE */,
  KEY `IDX_MOD` (`data_modifica` DESC),
  KEY `IDX_DATA_CORSO` (`data` DESC,`numero_corso`) /*!80000 INVISIBLE */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_firma`
--

LOCK TABLES `tbl_firma` WRITE;
/*!40000 ALTER TABLE `tbl_firma` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_firma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_giorno_presenza`
--

DROP TABLE IF EXISTS `tbl_giorno_presenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_giorno_presenza` (
  `data` date NOT NULL,
  `numero_corso` char(6) NOT NULL,
  `anno` year NOT NULL,
  `data_inserimento` timestamp NOT NULL,
  `data_modifica` timestamp NOT NULL,
  PRIMARY KEY (`numero_corso`,`data`,`anno`),
  KEY `IDX_INS` (`data_inserimento` DESC) /*!80000 INVISIBLE */,
  KEY `IDX_MOD` (`data_modifica` DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_giorno_presenza`
--

LOCK TABLES `tbl_giorno_presenza` WRITE;
/*!40000 ALTER TABLE `tbl_giorno_presenza` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_giorno_presenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lezione`
--

DROP TABLE IF EXISTS `tbl_lezione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_lezione` (
  `id_lezione` smallint unsigned NOT NULL,
  `codice_fiscale_docente` char(16) NOT NULL,
  `numero_corso` char(6) NOT NULL,
  `anno` year NOT NULL,
  `data` date NOT NULL,
  `modulo` varchar(75) NOT NULL,
  `orario_di_inizio` time NOT NULL,
  `orario_di_fine` time NOT NULL,
  `argomenti` varchar(200) DEFAULT NULL,
  `firma_docente` blob NOT NULL,
  `firma_codocente` blob,
  `firma_tutor` blob,
  `nome_docente` varchar(60) NOT NULL,
  `nome_codocente` varchar(60) DEFAULT NULL,
  `nome_tutor` varchar(60) DEFAULT NULL,
  `data_inserimento` timestamp NOT NULL,
  `data_modifica` timestamp NOT NULL,
  PRIMARY KEY (`id_lezione`),
  KEY `IDX_MODULO` (`modulo`) /*!80000 INVISIBLE */,
  KEY `IDX_ORARIO_INIZIO_ORARIO_FINE` (`orario_di_inizio`,`orario_di_fine`),
  KEY `IDX_DATA` (`data` DESC),
  KEY `IDX_INS` (`data_inserimento` DESC) /*!80000 INVISIBLE */,
  KEY `IDX_MOD` (`data_modifica` DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lezione`
--

LOCK TABLES `tbl_lezione` WRITE;
/*!40000 ALTER TABLE `tbl_lezione` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_lezione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_registro`
--

DROP TABLE IF EXISTS `tbl_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_registro` (
  `numero_corso` char(6) NOT NULL,
  `anno` year NOT NULL,
  `titolo` varchar(120) NOT NULL,
  `figura_professionale` varchar(80) NOT NULL,
  `fse_obiettivo` varchar(20) NOT NULL,
  `dispositivo` varchar(30) NOT NULL,
  `sede_corso` varchar(100) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_termine` date NOT NULL,
  `durata_corso` smallint unsigned NOT NULL,
  `ente` varchar(100) NOT NULL,
  `indirizzo` varchar(120) NOT NULL,
  `data_inserimento` timestamp NOT NULL,
  `data_modifica` timestamp NOT NULL,
  PRIMARY KEY (`numero_corso`,`anno`),
  KEY `IDX_TITOLO_ANNO` (`titolo`,`anno` DESC) /*!80000 INVISIBLE */,
  KEY `IDX_INS` (`data_inserimento` DESC) /*!80000 INVISIBLE */,
  KEY `IDX_MOD` (`data_modifica` DESC) /*!80000 INVISIBLE */,
  KEY `IDX_SEDE` (`sede_corso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_registro`
--

LOCK TABLES `tbl_registro` WRITE;
/*!40000 ALTER TABLE `tbl_registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_studente`
--

DROP TABLE IF EXISTS `tbl_studente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_studente` (
  `codice_fiscale` char(16) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `cognome` varchar(60) NOT NULL,
  `numero_ordine` smallint unsigned NOT NULL,
  `data_inserimento` timestamp NOT NULL,
  `data_modifica` timestamp NOT NULL,
  PRIMARY KEY (`codice_fiscale`),
  KEY `IDX_COGNOME` (`cognome`) /*!80000 INVISIBLE */,
  KEY `IDX_INS` (`data_inserimento` DESC) /*!80000 INVISIBLE */,
  KEY `IDX_MOD` (`data_modifica` DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_studente`
--

LOCK TABLES `tbl_studente` WRITE;
/*!40000 ALTER TABLE `tbl_studente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_studente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-13 19:33:06
