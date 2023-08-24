-- Hice un Dumpo Data only de todas las tablas que tenia assignaments, components, components_log, customer_log, customers, equipment, invoices, repair_components, repair_status, repairs, status_history, stock,  technicians, y tambien las vistas como view_assignments, view_customerequipment, view_invoices, view_repairdetails
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: servicio_tecnico
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,3,3,'2023-07-14'),(2,6,2,'2023-09-03'),(3,1,1,'2030-08-06');
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `components`
--

LOCK TABLES `components` WRITE;
/*!40000 ALTER TABLE `components` DISABLE KEYS */;
INSERT INTO `components` VALUES (1,'Nadolol','Oth injury due to oth accident on board fishing boat, init',400.00),(2,'Perphenazine','Puncture wound without foreign body of scalp',250.00),(3,'Hammer Baking','Poisoning by unsp antieplptc and sed-hypntc drugs, undet',350.00),(4,'Cockroach American','Neuroendocrine cell hyperplasia of infancy',50.00),(5,'Quinapril','Pressr ulc of contig site of back,buttock & hip, unstageable',750.00),(6,'Stemphylium sarciniforms','Commrcl fix-wing aircraft collision injuring occupant, subs',50.40),(7,'Prednisone','Toxic effect of ingested mushrooms, self-harm, subs',520.80),(8,'Sanitizer Original','Torus fx upper end of unsp tibia, subs for fx w routn heal',999.99),(9,'COTTON SEED','Ophiasis',29.99),(10,'Quinapril','Osteolysis, unspecified site',329.99),(13,'nuevo coso','nada',345.00),(16,'1','3',3.00);
/*!40000 ALTER TABLE `components` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_BeforeModifyComponent` BEFORE INSERT ON `components` FOR EACH ROW BEGIN
    DECLARE action_description VARCHAR(200);
    
    -- Si es una inserción, registra la acción como "Nuevo componente agregado"
    IF NEW.id_component IS NULL THEN
        SET action_description = CONCAT('Nuevo componente agregado: ', NEW.name);
    ELSE
        -- Si es una actualización, registra la acción como "Componente actualizado"
        SET action_description = CONCAT('Componente actualizado: ', NEW.name);
    END IF;
    
    -- Inserta el registro en la tabla de log
    INSERT INTO components_log (action_date, action_description, performed_by)
    VALUES (NOW(), action_description, @user);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_BeforeInsertComponent` BEFORE INSERT ON `components` FOR EACH ROW BEGIN
    IF NEW.name IS NULL OR NEW.name='' OR NEW.description IS NULL OR NEW.description= '' OR NEW.price IS NULL OR NEW.price= '' THEN 
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No se pueden insertar registros con campos nulos en la tabla Components';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_BeforeUpdateComponent` BEFORE UPDATE ON `components` FOR EACH ROW BEGIN
    IF NEW.name IS NULL OR NEW.description IS NULL OR NEW.price IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No se pueden actualizar registros con campos nulos en la tabla Components';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_BeforeDeleteComponent` BEFORE DELETE ON `components` FOR EACH ROW BEGIN
    DECLARE num_repairs INT;
    
    SELECT COUNT(*) INTO num_repairs
    FROM Repair_Components
    WHERE id_component = OLD.id_component;
    
    IF num_repairs > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No se puede eliminar un componente con reparaciones asociadas';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `components_log`
--

LOCK TABLES `components_log` WRITE;
/*!40000 ALTER TABLE `components_log` DISABLE KEYS */;
INSERT INTO `components_log` VALUES (1,'2023-08-10 01:43:32','Componente actualizado: nuevo coso','yo'),(2,'2023-08-10 01:46:48','Componente actualizado: ','yo'),(3,'2023-08-10 01:49:07','Componente actualizado: 3123','yo'),(4,'2023-08-10 01:52:41','Componente actualizado: 1','yo');
/*!40000 ALTER TABLE `components_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_log`
--

LOCK TABLES `customer_log` WRITE;
/*!40000 ALTER TABLE `customer_log` DISABLE KEYS */;
INSERT INTO `customer_log` VALUES (1,26,'2023-08-10 01:05:18','Se agregó un nuevo cliente con ID: 26',NULL),(2,26,'2023-08-10 01:07:09','Se eliminó el cliente con ID: 26',NULL),(3,27,'2023-08-10 01:29:19','Se agregó un nuevo cliente con ID: 27',NULL),(4,27,'2023-08-10 01:30:03','Se eliminó el cliente con ID: 27','yo'),(5,28,'2023-08-22 22:15:35','Se agregó un nuevo cliente con ID: 28',NULL),(6,29,'2023-08-22 22:15:35','Se agregó un nuevo cliente con ID: 29',NULL),(7,30,'2023-08-22 22:21:53','Se agregó un nuevo cliente con ID: 30',NULL),(8,31,'2023-08-22 22:21:53','Se agregó un nuevo cliente con ID: 31',NULL),(9,32,'2023-08-22 22:21:53','Se agregó un nuevo cliente con ID: 32',NULL),(10,33,'2023-08-22 22:21:53','Se agregó un nuevo cliente con ID: 33',NULL),(11,34,'2023-08-22 22:21:53','Se agregó un nuevo cliente con ID: 34',NULL),(12,35,'2023-08-22 22:21:53','Se agregó un nuevo cliente con ID: 35',NULL),(13,36,'2023-08-22 22:21:53','Se agregó un nuevo cliente con ID: 36',NULL),(14,37,'2023-08-22 22:21:53','Se agregó un nuevo cliente con ID: 37',NULL);
/*!40000 ALTER TABLE `customer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John Doe','123 Main St, Anytown','555-123-4567','john.doe@example.com'),(2,'Jane Smith','456 Elm Ave, Springfield','555-987-6543','jane.smith@example.com'),(3,'Denys Eccott','43235 Riverside Point','167-261-5681','deccott0@sohu.com'),(4,'Liane Tincknell','0614 Lillian Park','545-160-2837','ltincknell1@topsy.com'),(5,'Cedric Brocks','74 Troy Way','458-863-3025','cbrocks2@macromedia.com'),(6,'Erina Pohl','0 Pond Pass','446-642-0142','epohl3@cbc.ca'),(7,'Silvain Dick','685 Coolidge Pass','322-313-0654','sdick4@blogspot.com'),(8,'Kaitlyn Babar','789 Fulton Parkway','840-259-5142','kbabar5@gov.uk'),(9,'Indira Whyman','6 Montana Way','468-955-0783','iwhyman6@weebly.com'),(10,'Collie Smees','5053 Petterle Junction','393-898-4229','csmees7@amazonaws.com'),(11,'Bogart Yorke','91747 Comanche Street','312-552-6043','byorke8@nydailynews.com'),(12,'Noemi McIlvoray','7174 Eliot Trail','564-187-9770','nmcilvoray9@omniture.com'),(13,'Oates Deaton','852 Donald Trail','378-489-9946','odeatona@photobucket.com'),(14,'Giavani Parradye','19 Almo Court','687-162-2680','gparradyeb@comsenz.com'),(15,'Angie Oldam','10 Farwell Drive','799-386-3052','aoldamc@google.fr'),(16,'Corbie Masic','9365 Old Shore Lane','234-153-0954','cmasicd@a8.net'),(17,'Jaynell Wolfenden','7 Messerschmidt Point','128-798-3693','jwolfendene@wisc.edu'),(18,'Othella Healy','860 Lillian Plaza','499-994-2898','ohealyf@wordpress.com'),(19,'Tomas Presnail','462 Portage Street','621-786-9033','tpresnailg@typepad.com'),(20,'Michael Johnson','789 Oak St, Metroville','555-555-5555','michael.johnson@example.com'),(21,'norma ejoe','1442 derqui , buenos aires','53211-123-4567','norme.3joe@example.com'),(22,'norma ejoe','1442 derqui , buenos aires','53211-123-4567','norme.3joe@example.com'),(23,'norma ejoe','1442 derqui , buenos aires','53211-123-4567','norme.3joe@example.com'),(28,'Nuevo Cliente 1','Dirección 1','123-456-7890','nuevo1@gmail.com'),(29,'Nuevo Cliente 2','Dirección 2','987-654-3210','nuevo2@gmail.com'),(30,'Nuevo Cliente 3','Dirección 3','123-456-7893','nuevo3@gmail.com'),(31,'Nuevo Cliente 4','Dirección 4','123-456-7894','nuevo4@gmail.com'),(32,'Nuevo Cliente 5','Dirección 5','123-456-7895','nuevo5@gmail.com'),(33,'Nuevo Cliente 6','Dirección 6','123-456-7896','nuevo6@gmail.com'),(34,'Nuevo Cliente 7','Dirección 7','987-654-3217','nuevo7@gamil.com'),(35,'Nuevo Cliente 8','Dirección 8','987-654-3218','nuevo8@gamil.com'),(36,'Nuevo Cliente 9','Dirección 9','987-654-3219','nuevo9@gamil.com'),(37,'Nuevo Cliente 10','Dirección 10','987-654-3220','nuevo10@gamil.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_AfterInsertCustomer` AFTER INSERT ON `customers` FOR EACH ROW BEGIN
    INSERT INTO Customer_Log (id_customer, change_date, action, modified_by)
    VALUES (NEW.id_customer, NOW(), CONCAT('Se agregó un nuevo cliente con ID: ', NEW.id_customer), @user);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_AfterUpdateCustomer` AFTER UPDATE ON `customers` FOR EACH ROW BEGIN
    IF NOT (OLD.name <=> NEW.name AND OLD.address <=> NEW.address AND OLD.phone <=> NEW.phone AND OLD.email <=> NEW.email) THEN
        INSERT INTO Customer_Log (id_customer, change_date, action, modified_by)
        VALUES (NEW.id_customer, NOW(), CONCAT('Se modificó el cliente con ID: ', NEW.id_customer), @user);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_AfterDeleteCustomer` AFTER DELETE ON `customers` FOR EACH ROW BEGIN
    INSERT INTO Customer_Log (id_customer, change_date, action, modified_by)
    VALUES (OLD.id_customer, NOW(), CONCAT('Se eliminó el cliente con ID: ', OLD.id_customer), @user);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'NASDAQ','3 Series','230-12-5737',1),(2,'NYSES','afari','843-22-3235',2),(3,'NYSEV','ersa','266-56-2268',3),(4,'NYSEN','avigator','835-47-5614',4),(5,'NASDAQ','Equus','713-89-6181',5),(6,'NASDAQ','Malibu','484-46-3485',6),(7,'NASDAQ','Grand Am','429-59-4709',7),(8,'NASDAQ','I','378-15-8158',8),(9,'NYSEB','oxster','210-93-5280',9),(10,'NASDAQ','Supra','658-69-2791',10);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,3,'2023-07-26',1000.00),(2,6,'2023-09-30',150.00);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `repair_components`
--

LOCK TABLES `repair_components` WRITE;
/*!40000 ALTER TABLE `repair_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `repair_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `repair_status`
--

LOCK TABLES `repair_status` WRITE;
/*!40000 ALTER TABLE `repair_status` DISABLE KEYS */;
INSERT INTO `repair_status` VALUES (1,'En Progreso'),(2,'En Espera'),(3,'Completada'),(4,'Cancelada');
/*!40000 ALTER TABLE `repair_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `repairs`
--

LOCK TABLES `repairs` WRITE;
/*!40000 ALTER TABLE `repairs` DISABLE KEYS */;
INSERT INTO `repairs` VALUES (1,'2023-07-15','2023-07-20','Laptop screen replacement',150.00,1),(2,'2023-07-20','2023-07-22','Hard drive upgrade',100.00,2),(3,'2023-06-20','2023-06-27','hub usb',100.00,1),(4,'2023-02-01','2023-02-05','CPU fan replacement',800.00,5),(5,'2023-04-01','2023-04-05','reset',10.00,5),(6,'2023-08-01','2023-08-05','set windows',50.00,5);
/*!40000 ALTER TABLE `repairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `status_history`
--

LOCK TABLES `status_history` WRITE;
/*!40000 ALTER TABLE `status_history` DISABLE KEYS */;
INSERT INTO `status_history` VALUES (1,1,3,'2023-08-05'),(2,1,2,'2023-08-10'),(3,2,3,'2023-08-05');
/*!40000 ALTER TABLE `status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,100,'2023-08-07'),(2,2,10,'2023-08-07'),(3,3,70,'2023-08-07'),(4,4,18,'2023-08-07'),(5,5,0,'2023-08-07'),(6,6,300,'2023-08-07'),(7,7,40,'2023-08-07'),(8,8,20,'2023-08-07'),(9,9,110,'2023-08-07'),(10,10,170,'2023-08-07');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `technicians`
--

LOCK TABLES `technicians` WRITE;
/*!40000 ALTER TABLE `technicians` DISABLE KEYS */;
INSERT INTO `technicians` VALUES (1,'Alex Johnson','Reparación de laptops'),(2,'Emily White','Reparación de computadoras de escritorio'),(3,'William Davis','Soporte de redes');
/*!40000 ALTER TABLE `technicians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'servicio_tecnico'
--

--
-- Dumping routines for database 'servicio_tecnico'
--
/*!50003 DROP FUNCTION IF EXISTS `GetAssignedRepairsCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetAssignedRepairsCount`(technician_id INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE repairs_count INT;
    SELECT COUNT(*) INTO repairs_count
    FROM Assignments a
    WHERE a.id_technician = technician_id;
    RETURN repairs_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetCurrentRepairStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetCurrentRepairStatus`(repair_id INT) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE current_status VARCHAR(100);
    SELECT s.name INTO current_status
    FROM Status_History sh
    INNER JOIN Repair_Status s ON sh.id_status = s.id_status
    WHERE sh.id_repair = repair_id
    ORDER BY sh.change_date DESC
    LIMIT 1;
    RETURN current_status;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetRepairsByCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetRepairsByCustomer`(customer_id INT) RETURNS varchar(1000) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE repairs_list VARCHAR(1000);
    SELECT GROUP_CONCAT(CONCAT('ID: ', r.id_repair, ', Start Date: ', r.start_date, ', End Date: ', r.end_date, ', Description: ', r.description, ', Total Cost: ', r.total_cost) SEPARATOR '\n') INTO repairs_list
    FROM Repairs r
    INNER JOIN Equipment e ON r.id_equipment = e.id_equipment
    WHERE e.id_customer = customer_id;
    RETURN repairs_list;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetTotalCostByCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetTotalCostByCustomer`(customer_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total_cost DECIMAL(10, 2);
    SELECT SUM(r.total_cost) INTO total_cost
    FROM Repairs r
    INNER JOIN Equipment e ON r.id_equipment = e.id_equipment
    WHERE e.id_customer = customer_id;
    RETURN total_cost;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalculateTotalCostByTechnician` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateTotalCostByTechnician`(
    IN technician_id INT,
    OUT total_cost DECIMAL(10, 2)
)
BEGIN
    SELECT SUM(R.total_cost) INTO total_cost
    FROM Repairs R
    INNER JOIN Assignments A ON R.id_repair = A.id_repair
    WHERE A.id_technician = technician_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalculateTotalCostInRangeWithIVA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateTotalCostInRangeWithIVA`(
    IN customer_id INT,
    IN start_date DATE,
    IN end_date DATE,
    OUT total_cost_with_iva DECIMAL(10, 2)
)
BEGIN
    -- Calculamos el costo total de las reparaciones en el rango de fechas especificado
    SELECT COALESCE(SUM(R.total_cost), 0) INTO total_cost_with_iva
    FROM Repairs R
    INNER JOIN Equipment E ON R.id_equipment = E.id_equipment
    WHERE E.id_customer = customer_id
    AND R.start_date BETWEEN start_date AND end_date;
    
    -- Calculamos el IVA y lo sumamos al costo total
    SET total_cost_with_iva = total_cost_with_iva + (total_cost_with_iva * 0.21);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckCostThreshold` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckCostThreshold`(
    IN customer_id INT,
    OUT message VARCHAR(100)
)
BEGIN
    DECLARE total_cost DECIMAL(10, 2);
    DECLARE cost_threshold DECIMAL(10, 2);
    
    -- Calculamos el costo total de las reparaciones para el cliente
    SELECT COALESCE(SUM(R.total_cost), 0) INTO total_cost
    FROM Repairs R
    INNER JOIN Equipment E ON R.id_equipment = E.id_equipment
    WHERE E.id_customer = customer_id;
    
    -- Definimos el umbral de costo
    SET cost_threshold = 500.00;
    
    -- Comparación y mensaje de salida
    IF total_cost <= cost_threshold THEN
        SET message = CONCAT('El costo total de las reparaciones para el cliente está por debajo del umbral (', cost_threshold, ').');
    ELSE
        SET message = CONCAT('El costo total de las reparaciones para el cliente está por encima del umbral (', cost_threshold, ').');
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRepairStatusHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRepairStatusHistory`(
    IN repair_id INT
)
BEGIN
    SELECT RH.change_date, RS.name
    FROM Status_History RH
    INNER JOIN Repair_Status RS ON RH.id_status = RS.id_status
    WHERE RH.id_repair = repair_id
    ORDER BY RH.change_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateComponentPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateComponentPrice`(
    IN component_id INT,
    IN new_price DECIMAL(10, 2)
)
BEGIN
    UPDATE Components
    SET price = new_price
    WHERE id_component = component_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-24 14:22:59
