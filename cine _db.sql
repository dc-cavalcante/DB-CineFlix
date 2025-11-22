DROP DATABASE IF EXISTS `cineflix`;
CREATE DATABASE IF NOT EXISTS `cineflix` DEFAULT CHARACTER SET utf8mb4;
USE `cineflix`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: cineflix
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `assinante`
--

DROP TABLE IF EXISTS assinante;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE assinante (
  ID_Assinante int NOT NULL AUTO_INCREMENT,
  Nome varchar(100) NOT NULL,
  Email varchar(100) NOT NULL,
  Senha varchar(255) NOT NULL,
  Status_Pagamento varchar(45) DEFAULT NULL,
  ID_Plano int NOT NULL,
  PRIMARY KEY (ID_Assinante),
  KEY fk_ASSINANTE_PLANO_idx (ID_Plano),
  CONSTRAINT fk_ASSINANTE_PLANO FOREIGN KEY (ID_Plano) REFERENCES plano (ID_Plano)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assinante`
--

LOCK TABLES assinante WRITE;
/*!40000 ALTER TABLE assinante DISABLE KEYS */;
INSERT INTO assinante (ID_Assinante, Nome, Email, Senha, Status_Pagamento, ID_Plano) VALUES (1,'João Silva','joao@email.com','123','Ativo',3),(2,'Maria Souza','maria@email.com','abc','Ativo',1),(3,'Carlos Lima','carlos@email.com','xyz','Pendente',2);
/*!40000 ALTER TABLE assinante ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS genero;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE genero (
  ID_Genero int NOT NULL AUTO_INCREMENT,
  Nome_Genero varchar(50) NOT NULL,
  PRIMARY KEY (ID_Genero)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES genero WRITE;
/*!40000 ALTER TABLE genero DISABLE KEYS */;
INSERT INTO genero (ID_Genero, Nome_Genero) VALUES (1,'Ação'),(2,'Comédia'),(3,'Ficção Científica'),(4,'Drama'),(5,'Terror');
/*!40000 ALTER TABLE genero ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_visualizacao`
--

DROP TABLE IF EXISTS historico_visualizacao;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE historico_visualizacao (
  ID_Historico int NOT NULL AUTO_INCREMENT,
  Data_Hora datetime DEFAULT CURRENT_TIMESTAMP,
  Ponto_Parada int DEFAULT NULL,
  Tempo_Assistido int DEFAULT NULL,
  ID_Perfil int NOT NULL,
  ID_Titulo int NOT NULL,
  PRIMARY KEY (ID_Historico),
  KEY fk_HISTORICO_PERFIL_idx (ID_Perfil),
  KEY fk_HISTORICO_TITULO_idx (ID_Titulo),
  CONSTRAINT fk_HISTORICO_PERFIL FOREIGN KEY (ID_Perfil) REFERENCES perfil (ID_Perfil),
  CONSTRAINT fk_HISTORICO_TITULO FOREIGN KEY (ID_Titulo) REFERENCES titulo (ID_Titulo)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_visualizacao`
--

LOCK TABLES historico_visualizacao WRITE;
/*!40000 ALTER TABLE historico_visualizacao DISABLE KEYS */;
INSERT INTO historico_visualizacao (ID_Historico, Data_Hora, Ponto_Parada, Tempo_Assistido, ID_Perfil, ID_Titulo) VALUES (1,'2025-11-20 20:00:00',120,120,1,1),(2,'2025-11-21 15:30:00',15,15,2,2);
/*!40000 ALTER TABLE historico_visualizacao ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS perfil;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE perfil (
  ID_Perfil int NOT NULL AUTO_INCREMENT,
  Apelido varchar(50) NOT NULL,
  Faixa_Etaria varchar(45) DEFAULT NULL,
  ID_Assinante int NOT NULL,
  PRIMARY KEY (ID_Perfil),
  KEY fk_PERFIL_ASSINANTE_idx (ID_Assinante),
  CONSTRAINT fk_PERFIL_ASSINANTE FOREIGN KEY (ID_Assinante) REFERENCES assinante (ID_Assinante)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES perfil WRITE;
/*!40000 ALTER TABLE perfil DISABLE KEYS */;
INSERT INTO perfil (ID_Perfil, Apelido, Faixa_Etaria, ID_Assinante) VALUES (1,'João Pai','Adulto',1),(2,'Joãozinho','Kids',1),(3,'Maria','Adulto',2);
/*!40000 ALTER TABLE perfil ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano`
--

DROP TABLE IF EXISTS plano;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE plano (
  ID_Plano int NOT NULL AUTO_INCREMENT,
  Nome_Plano varchar(50) NOT NULL,
  Valor_Mensal decimal(10,2) NOT NULL,
  PRIMARY KEY (ID_Plano)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano`
--

LOCK TABLES plano WRITE;
/*!40000 ALTER TABLE plano DISABLE KEYS */;
INSERT INTO plano (ID_Plano, Nome_Plano, Valor_Mensal) VALUES (1,'Básico com Anúncios',19.90),(2,'Padrão HD',39.90),(3,'Premium 4K',59.90);
/*!40000 ALTER TABLE plano ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulo`
--

DROP TABLE IF EXISTS titulo;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE titulo (
  ID_Titulo int NOT NULL AUTO_INCREMENT,
  Titulo varchar(150) NOT NULL,
  Sinopse text,
  Ano_Lancamento int DEFAULT NULL,
  Duracao_Total int DEFAULT NULL COMMENT 'Em minutos',
  Classificacao varchar(10) DEFAULT NULL,
  PRIMARY KEY (ID_Titulo)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulo`
--

LOCK TABLES titulo WRITE;
/*!40000 ALTER TABLE titulo DISABLE KEYS */;
INSERT INTO titulo (ID_Titulo, Titulo, Sinopse, Ano_Lancamento, Duracao_Total, Classificacao) VALUES (1,'O Predador de Marte','Astronautas lutam em Marte.',2024,120,'+14'),(2,'Aventura na Cidade','Um cachorro perdido em SP.',2023,95,'Livre'),(3,'O Lago Secreto','Mistérios em um acampamento.',2022,110,'+16');
/*!40000 ALTER TABLE titulo ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulo_genero`
--

DROP TABLE IF EXISTS titulo_genero;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE titulo_genero (
  ID_Titulo int NOT NULL,
  ID_Genero int NOT NULL,
  PRIMARY KEY (ID_Titulo,ID_Genero),
  KEY fk_TITULO_GENERO_GENERO_idx (ID_Genero),
  CONSTRAINT fk_TITULO_GENERO_GENERO FOREIGN KEY (ID_Genero) REFERENCES genero (ID_Genero),
  CONSTRAINT fk_TITULO_GENERO_TITULO FOREIGN KEY (ID_Titulo) REFERENCES titulo (ID_Titulo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulo_genero`
--

LOCK TABLES titulo_genero WRITE;
/*!40000 ALTER TABLE titulo_genero DISABLE KEYS */;
INSERT INTO titulo_genero (ID_Titulo, ID_Genero) VALUES (1,1),(2,2),(1,3),(3,4),(3,5);
/*!40000 ALTER TABLE titulo_genero ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-22 15:14:54
