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
  `id_giocatore` int NOT NULL AUTO_INCREMENT,
  `nome_giocatore` varchar(50) NOT NULL,
  `cognome_giocatore` varchar(50) NOT NULL,
  `ruolo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_giocatore`),
  KEY `IDX_COGNOME_NOME` (`cognome_giocatore`,`nome_giocatore`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giocatore`
--

LOCK TABLES `giocatore` WRITE;
/*!40000 ALTER TABLE `giocatore` DISABLE KEYS */;
INSERT INTO `giocatore` VALUES (1,'Rodrigo','Becao','difensore'),(2,'Beto','Betuncal','attaccante'),(3,'Nahuel','Molina','centrocampista'),(4,'Joao','Pedro','attaccante');
/*!40000 ALTER TABLE `giocatore` ENABLE KEYS */;
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
  `n_goal` tinyint unsigned NOT NULL,
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
INSERT INTO `join_squadra_partita` VALUES (1,'CAG','T',1,6,3,48,423,78,15,2,1,2,2),(1,'UDI','C',5,24,11,52,439,84,19,2,0,2,2);
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
  `id_giocatore` int NOT NULL,
  `minuto` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id_partita`,`id_giocatore`,`minuto`),
  KEY `IDX_ID_PARTITA_ID_GIOCATORE_MINUTO` (`id_partita`,`id_giocatore`,`minuto`),
  KEY `FK_GIOCATORE_MARCATORE_idx` (`id_giocatore`),
  CONSTRAINT `FK_GIOCATORE_MARCATORE` FOREIGN KEY (`id_giocatore`) REFERENCES `giocatore` (`id_giocatore`) ON UPDATE CASCADE,
  CONSTRAINT `FK_PARTITA_MARCATORE` FOREIGN KEY (`id_partita`) REFERENCES `partita` (`id_partita`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcatore`
--

LOCK TABLES `marcatore` WRITE;
/*!40000 ALTER TABLE `marcatore` DISABLE KEYS */;
INSERT INTO `marcatore` VALUES (1,1,38),(1,2,45),(1,2,49),(1,2,73),(1,3,59),(1,4,32);
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
  `giornata` tinyint unsigned NOT NULL,
  `data_partita` date NOT NULL,
  `orario_partita` time NOT NULL,
  PRIMARY KEY (`id_partita`),
  KEY `IDX_GIORNATA_DATA_PARTITA_ORARIO_PARTITA` (`giornata`,`data_partita`,`orario_partita`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partita`
--

LOCK TABLES `partita` WRITE;
/*!40000 ALTER TABLE `partita` DISABLE KEYS */;
INSERT INTO `partita` VALUES (1,31,'2022-04-03','15:00:00');
/*!40000 ALTER TABLE `partita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posizione_classifica`
--

DROP TABLE IF EXISTS `posizione_classifica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posizione_classifica` (
  `codice_squadra` char(3) NOT NULL,
  `stagione` char(7) NOT NULL,
  `punti` tinyint unsigned NOT NULL,
  `partite_giocate` tinyint unsigned NOT NULL,
  `vittorie` tinyint unsigned NOT NULL,
  `pareggi` tinyint unsigned NOT NULL,
  `sconfitte` tinyint unsigned NOT NULL,
  PRIMARY KEY (`codice_squadra`,`stagione`),
  KEY `IDX_STAGIONE_PUNTI` (`stagione` DESC,`punti` DESC),
  CONSTRAINT `FK_SQUADRA_POSIZIONE_CLASSIFICA` FOREIGN KEY (`codice_squadra`) REFERENCES `squadra` (`codice_squadra`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posizione_classifica`
--

LOCK TABLES `posizione_classifica` WRITE;
/*!40000 ALTER TABLE `posizione_classifica` DISABLE KEYS */;
INSERT INTO `posizione_classifica` VALUES ('CAG','2021-22',0,1,0,0,1),('UDI','2021-22',3,1,1,0,0);
/*!40000 ALTER TABLE `posizione_classifica` ENABLE KEYS */;
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
INSERT INTO `squadra` VALUES ('CAG','Cagliari Calcio'),('UDI','Udinese Calcio');
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

-- Dump completed on 2022-04-06  3:05:25
