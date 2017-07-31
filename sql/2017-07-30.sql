-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: inkoncert.com.br    Database: inkoncert
-- ------------------------------------------------------
-- Server version	5.6.35-cll-lve

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
  `IDARTISTA` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(100) NOT NULL,
  `NOME` varchar(45) NOT NULL,
  `SENHA` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDARTISTA`),
  UNIQUE KEY `IDARTISTA_UNIQUE` (`IDARTISTA`),
  UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gro_t_artista`
--

LOCK TABLES `gro_t_artista` WRITE;
/*!40000 ALTER TABLE `gro_t_artista` DISABLE KEYS */;
INSERT INTO `gro_t_artista` VALUES (3,'teste@yahoo.com.br','Teste',NULL),(4,'teste2@yahoo.com.br','Teste',NULL);
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
INSERT INTO `gro_t_artista_estilo` VALUES (3,1),(4,1),(3,2),(4,2);
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
  KEY `FK_ART_INST_ART_idx` (`IDARTISTA`),
  CONSTRAINT `FK_ART_INST_ART` FOREIGN KEY (`IDARTISTA`) REFERENCES `gro_t_artista` (`IDARTISTA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ART_INST_INST` FOREIGN KEY (`IDINSTRUMENTO`) REFERENCES `gro_t_instrumento` (`IDINSTRUMENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gro_t_artista_instrumento`
--

LOCK TABLES `gro_t_artista_instrumento` WRITE;
/*!40000 ALTER TABLE `gro_t_artista_instrumento` DISABLE KEYS */;
INSERT INTO `gro_t_artista_instrumento` VALUES (3,2),(3,3),(4,2),(4,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gro_t_estilo`
--

LOCK TABLES `gro_t_estilo` WRITE;
/*!40000 ALTER TABLE `gro_t_estilo` DISABLE KEYS */;
INSERT INTO `gro_t_estilo` VALUES (1,'Sertanejo'),(2,'MPB'),(3,'Samba/Pagode'),(4,'Forró'),(5,'Eletrônica'),(6,'Gospel'),(7,'Axé'),(8,'Funk'),(9,'Country'),(10,'Reggae'),(11,'Rap'),(12,'Clássica'),(13,'Hip-Hop'),(14,'Blues'),(15,'Jazz'),(16,'Pop'),(17,'Outro');
/*!40000 ALTER TABLE `gro_t_estilo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gro_t_feedback`
--

DROP TABLE IF EXISTS `gro_t_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gro_t_feedback` (
  `IDFEEDBACK` int(11) NOT NULL AUTO_INCREMENT,
  `P1` int(2) NOT NULL COMMENT 'Tem a música como profissão principal ? (SIM ou NAO)\n\n',
  `P2` int(2) NOT NULL COMMENT 'Em qual função/instrumento você atua com mais frequencia?',
  `P3` int(2) NOT NULL COMMENT 'Grau de conhecimento nesta função/instrumento?',
  `P4` int(2) NOT NULL COMMENT 'Como você avalia este serviço?',
  `P5` int(2) NOT NULL COMMENT 'Você indicaria esta solução a um amigo?',
  PRIMARY KEY (`IDFEEDBACK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gro_t_feedback`
--

LOCK TABLES `gro_t_feedback` WRITE;
/*!40000 ALTER TABLE `gro_t_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `gro_t_feedback` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gro_t_instrumento`
--

LOCK TABLES `gro_t_instrumento` WRITE;
/*!40000 ALTER TABLE `gro_t_instrumento` DISABLE KEYS */;
INSERT INTO `gro_t_instrumento` VALUES (1,'Vocal'),(2,'Violão'),(3,'Guitarra'),(4,'Baixo'),(5,'Bateria'),(6,'Teclado'),(7,'Piano'),(8,'Violino'),(9,'Backvocal'),(10,'Solo'),(11,'Outros');
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

-- Dump completed on 2017-07-30 22:00:08
