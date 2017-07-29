-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: groovy
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gro_t_artista`
--

DROP TABLE IF EXISTS `gro_t_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gro_t_artista` (
  `IDARTISTA` int(11) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `NOME` varchar(45) NOT NULL,
  `SENHA` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDARTISTA`),
  UNIQUE KEY `IDARTISTA_UNIQUE` (`IDARTISTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gro_t_artista`
--

LOCK TABLES `gro_t_artista` WRITE;
/*!40000 ALTER TABLE `gro_t_artista` DISABLE KEYS */;
/*!40000 ALTER TABLE `gro_t_artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gro_t_artista_estilo`
--

DROP TABLE IF EXISTS `gro_t_artista_estilo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gro_t_artista_estilo` (
  `IDARTISTA` int(11) NOT NULL,
  `IDESTILO` int(11) NOT NULL,
  PRIMARY KEY (`IDARTISTA`,`IDESTILO`),
  KEY `FK_ART_EST_idx` (`IDESTILO`),
  CONSTRAINT `FK_ART_EST_ART` FOREIGN KEY (`IDARTISTA`) REFERENCES `gro_t_artista` (`IDARTISTA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ART_EST_EST` FOREIGN KEY (`IDESTILO`) REFERENCES `gro_t_estilo` (`IDESTILO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gro_t_artista_estilo`
--

LOCK TABLES `gro_t_artista_estilo` WRITE;
/*!40000 ALTER TABLE `gro_t_artista_estilo` DISABLE KEYS */;
/*!40000 ALTER TABLE `gro_t_artista_estilo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gro_t_artista_instrumento`
--

DROP TABLE IF EXISTS `gro_t_artista_instrumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gro_t_artista_instrumento` (
  `IDARTISTA` int(11) NOT NULL,
  `IDINSTRUMENTO` int(11) NOT NULL,
  PRIMARY KEY (`IDINSTRUMENTO`,`IDARTISTA`),
  KEY `FK_ARTISTA_INSTRUMENTO_idx` (`IDARTISTA`),
  CONSTRAINT `FK_ART_INST_ART` FOREIGN KEY (`IDARTISTA`) REFERENCES `gro_t_artista` (`IDARTISTA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ART_INST_INST` FOREIGN KEY (`IDINSTRUMENTO`) REFERENCES `gro_t_instrumento` (`IDINSTRUMENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gro_t_artista_instrumento`
--

LOCK TABLES `gro_t_artista_instrumento` WRITE;
/*!40000 ALTER TABLE `gro_t_artista_instrumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `gro_t_artista_instrumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gro_t_estilo`
--

DROP TABLE IF EXISTS `gro_t_estilo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gro_t_estilo` (
  `IDESTILO` int(10) NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(45) NOT NULL,
  PRIMARY KEY (`IDESTILO`),
  UNIQUE KEY `IDESTILO_UNIQUE` (`IDESTILO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gro_t_estilo`
--

LOCK TABLES `gro_t_estilo` WRITE;
/*!40000 ALTER TABLE `gro_t_estilo` DISABLE KEYS */;
/*!40000 ALTER TABLE `gro_t_estilo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gro_t_instrumento`
--

DROP TABLE IF EXISTS `gro_t_instrumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gro_t_instrumento` (
  `IDINSTRUMENTO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(45) NOT NULL,
  PRIMARY KEY (`IDINSTRUMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gro_t_instrumento`
--

LOCK TABLES `gro_t_instrumento` WRITE;
/*!40000 ALTER TABLE `gro_t_instrumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `gro_t_instrumento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-29 12:13:59
