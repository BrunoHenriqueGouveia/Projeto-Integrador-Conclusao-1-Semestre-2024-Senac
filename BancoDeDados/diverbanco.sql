-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: diver
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `nomeDoevento` varchar(50) DEFAULT NULL,
  `local` varchar(50) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `data_inicio` varchar(10) DEFAULT NULL,
  `data_fim` varchar(10) DEFAULT NULL,
  `hora_inicio` varchar(10) DEFAULT NULL,
  `hora_fim` varchar(10) DEFAULT NULL,
  `categoria_evento` varchar(30) DEFAULT NULL,
  `qtd_ingresso_vip` int DEFAULT NULL,
  `preco_vip` double DEFAULT NULL,
  `qtd_ingresso_meia` int DEFAULT NULL,
  `preco_meia` double DEFAULT NULL,
  `qtd_ingresso_inteira` int DEFAULT NULL,
  `preco_inteiro` double DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `imagem` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (5,' Lauana Prado',' Ginásio Estadual Geraldo José de Almeida','Rua Manuel da Nóbrega, 1361 Ibirapuera','05868733','Lauana Prado, destaque da música sertaneja, apresenta o seu novo trabalho “Transcende - Ao Vivo no Ibirapuera”. O audiovisual mais ousado da carreira da cantora até hoje, será realizado no dia 16 de maio em São Paulo e promete surpreender o público.','29/08/2024','29/08/2024','18:00','23:00','festa e show',100,150,0,0,100,100,'admin@gmail.com','Luana Prado.png'),(6,'Matheus Ceará','Arena Tatuapé','Rua Uriel Gaspar 149','05478420','O show \"Meta a Mão que o Dedo é Pouco” é o humorista Matheus Ceará em sua melhor forma: como o contador de piadas desbocado, sem as amarras do papel que o tornou famoso na TV, livre para contar suas histórias das maneiras mais hilárias.','20/07/2024','20/07/2024','16:00','20:00','stand up comedy',20,100,19,25,18,50,'emanuel@gmail.com','matheusCeara.jpeg'),(7,'Museu do Ipiranga','Museu do Ipiranga ','R. dos Patriotas, 20, São Paulo','05478420','venha conhecer o melhor museu','18/09/2024','18/09/2024','11:00','18:00','passeios',0,0,30,5,0,0,'bruno@gmail.com','museu.webp'),(8,'Histórias do Porchat','Teatro Multiplan','avenida senador teotonio 200','05868730','‘HISTÓRIAS DO PORCHAT’ é o novo espetáculo de stand-up de Fábio Porchat. ','10/09/2024','10/09/2024','14:00','23:00','stand up comedy',100,200,50,25,50,100,'pedro@gmail.com','porchat.webp');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresso`
--

DROP TABLE IF EXISTS `ingresso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresso` (
  `id_ingresso` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tipo_ingresso` varchar(10) DEFAULT NULL,
  `valor_ingresso` double DEFAULT NULL,
  `qtdIngresso` int DEFAULT NULL,
  `fk_evento` int DEFAULT NULL,
  PRIMARY KEY (`id_ingresso`),
  KEY `FK_ingresso_2` (`fk_evento`),
  CONSTRAINT `FK_ingresso_2` FOREIGN KEY (`fk_evento`) REFERENCES `evento` (`id_evento`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresso`
--

LOCK TABLES `ingresso` WRITE;
/*!40000 ALTER TABLE `ingresso` DISABLE KEYS */;
INSERT INTO `ingresso` VALUES (1,'pedro silva','374.764.028-12','pedro@gmail.com','vip',70,1,6),(2,'pedro silva','374.764.028-12','pedro@gmail.com','vip',100,2,7),(4,'Bruno Henrique Gouveia Da Silva','374.764.028-12','bruno@gmail.com','vip',210,3,5),(5,'Bruno Henrique Gouveia Da Silva','374.764.028-12','bruno@gmail.com','vip',300,3,6),(6,'emanuel santos da silva','374.764.028-20','emanuel@gmail.com','vip',50,2,8),(7,'Bruno Henrique Gouveia Da Silva','545.454.545-45','bruno@gmail.com','vip',50,1,7),(10,'ana nivea','545.454.545-45','ananivea@gmail.com','inteira',210,3,6),(17,'mayra silva','458.488.787-45','mayra@gmail.com','meia',25,1,6);
/*!40000 ALTER TABLE `ingresso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'joao  carlos ',50,'37476402820','joao@gmail.com','123456'),(2,'Bruno Henrique Gouveia',20,'37476402812','bruno@gmail.com','123456'),(3,'admin',20,'37476402654','admin@gmail.com','123456'),(4,'pedro silva ',50,'37476402812','pedro@gmail.com','123456'),(5,'mayra silva',20,'37476402412','mayra@gmail.com','123456'),(10,'emanuel santos ',30,'37476402147','emanuel@gmail.com','123456'),(11,'Ana nivea',22,'37476202512','ananivea@gmail.com','123456');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-03 21:50:59
