/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 8.0.41 : Database - expediaflightbooking
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`expediaflightbooking` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `expediaflightbooking`;

/*Table structure for table `airline` */
/*NB: we are changing the collate from 'utf8mb4_general_ci' to a version to 'utf8mb4_general_ci' that can be supported by php since the collate below is unspported with php  which we can revert later on*/
/*replace utf8mb4_general_ci later*/

DROP TABLE IF EXISTS `airline`;

CREATE TABLE `airline` (
  `airlineid` int NOT NULL AUTO_INCREMENT,
  `airlinename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logo` varchar(10) DEFAULT NULL,
  `homecountyid` int DEFAULT NULL,
  PRIMARY KEY (`airlineid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airline` */

insert  into `airline`(`airlineid`,`airlinename`,`logo`,`homecountyid`) values 
(1,'Kenya Airways','KQ',NULL),
(2,'Air Tanzania','ATCL',NULL),
(3,'British Airways','BA',NULL),
(4,'Uganda Airline','UA',NULL);

/*Table structure for table `airport` */

DROP TABLE IF EXISTS `airport`;

CREATE TABLE `airport` (
  `airportid` int NOT NULL AUTO_INCREMENT,
  `airportcode` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cityid` int DEFAULT NULL,
  `airportname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`airportid`),
  KEY `cityId` (`cityid`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`cityid`) REFERENCES `city` (`cityId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airport` */

insert  into `airport`(`airportid`,`airportcode`,`cityid`,`airportname`) values 
(1,'NBO',1,'JOMO KENYATTA INTERNATIONAL AIRPORT'),
(2,'JRO',2,'KILIMANJARO INTERNATIONAL AIRPORT'),
(3,'GBR',3,'HEATHROW INTERNATIONAL AIRPORT'),
(4,'EBB',4,'ENTEBE INTERNATIONAL AIRPORT');

/*Table structure for table `booking` */

DROP TABLE IF EXISTS `booking`;

CREATE TABLE `booking` (
  `bookingid` int NOT NULL AUTO_INCREMENT,
  `bookingtypeid` int DEFAULT NULL,
  `flightid` int DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`bookingid`),
  KEY `flight id` (`flightid`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`flightid`) REFERENCES `flight_supply` (`flightid`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`bookingid`) REFERENCES `booking supply` (`bookingsupplyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `booking` */

/*Table structure for table `booking supply` */

DROP TABLE IF EXISTS `booking supply`;

CREATE TABLE `booking supply` (
  `bookingsupplyid` int NOT NULL AUTO_INCREMENT,
  `flightid` int DEFAULT NULL,
  `bookingclassid` int DEFAULT NULL,
  `numberofseats` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `currency` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`bookingsupplyid`),
  KEY `currency` (`currency`),
  KEY `booking class id` (`bookingclassid`),
  CONSTRAINT `booking supply_ibfk_2` FOREIGN KEY (`bookingsupplyid`) REFERENCES `flight_supply` (`flightid`),
  CONSTRAINT `booking supply_ibfk_4` FOREIGN KEY (`bookingclassid`) REFERENCES `bookingtype` (`bookingid`),
  CONSTRAINT `booking supply_ibfk_5` FOREIGN KEY (`bookingsupplyid`) REFERENCES `currency` (`currencyid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `booking supply` */

/*Table structure for table `bookingclass` */

DROP TABLE IF EXISTS `bookingclass`;

CREATE TABLE `bookingclass` (
  `bookingclassid` int NOT NULL AUTO_INCREMENT,
  `classname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bookingtypeid` int DEFAULT NULL,
  PRIMARY KEY (`bookingclassid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bookingclass` */

insert  into `bookingclass`(`bookingclassid`,`classname`,`bookingtypeid`) values 
(1,'economy class',NULL),
(2,'premium economy class',NULL),
(3,'business class',NULL),
(4,'first class',NULL);

/*Table structure for table `bookingtype` */

DROP TABLE IF EXISTS `bookingtype`;

CREATE TABLE `bookingtype` (
  `bookingid` int NOT NULL AUTO_INCREMENT,
  `bookingname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`bookingid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bookingtype` */

insert  into `bookingtype`(`bookingid`,`bookingname`) values 
(6,'Cabin Classes'),
(7,'Fare Classes_Booking Codes'),
(8,'PNR_Passenger Name Record');

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `cityId` int NOT NULL AUTO_INCREMENT,
  `cityName` varchar(100) DEFAULT NULL,
  `countryId` int DEFAULT NULL,
  PRIMARY KEY (`cityId`),
  KEY `city_ibfk_1` (`countryId`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `city` */

insert  into `city`(`cityId`,`cityName`,`countryId`) values 
(1,'Nairobi',4),
(2,'dare-es-salam',6),
(3,'London',7),
(4,'Kampala',8);

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `countryid` int NOT NULL AUTO_INCREMENT,
  `countryName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `country` */

insert  into `country`(`countryid`,`countryName`) values 
(4,'Kenya'),
(6,'Tanzania'),
(7,'Europe'),
(8,'Uganda');

/*Table structure for table `currency` */

DROP TABLE IF EXISTS `currency`;

CREATE TABLE `currency` (
  `currencyid` int NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `default` decimal(3,0) DEFAULT NULL,
  `exchange_rate` decimal(3,0) DEFAULT NULL,
  `paymentid` int DEFAULT NULL,
  PRIMARY KEY (`currencyid`),
  KEY `paymentid` (`paymentid`),
  CONSTRAINT `currency_ibfk_1` FOREIGN KEY (`paymentid`) REFERENCES `payment method` (`paymentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `currency` */

/*Table structure for table `flight_supply` */

DROP TABLE IF EXISTS `flight_supply`;

CREATE TABLE `flight_supply` (
  `flightid` int NOT NULL AUTO_INCREMENT,
  `flightnumber` varchar(100) DEFAULT NULL,
  `airlineid` int DEFAULT NULL,
  `depature_time` datetime DEFAULT NULL,
  `depature_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `destinationcityid` int DEFAULT NULL,
  PRIMARY KEY (`flightid`),
  KEY `airline id` (`airlineid`),
  KEY `destination city id` (`destinationcityid`),
  CONSTRAINT `flight_supply_ibfk_1` FOREIGN KEY (`airlineid`) REFERENCES `airline` (`airlineid`),
  CONSTRAINT `flight_supply_ibfk_2` FOREIGN KEY (`destinationcityid`) REFERENCES `city` (`cityId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flight_supply` */

insert  into `flight_supply`(`flightid`,`flightnumber`,`airlineid`,`depature_time`,`depature_city`,`arrival_time`,`destinationcityid`) values 
(1,'KQ310',1,'2025-08-20 14:30:00','Nairobi','2025-08-20 23:20:00',3),
(2,'TC100',2,'2025-08-29 08:30:00','Nairobi','2025-08-29 10:20:00',1),
(4,'EK 725',3,'2025-08-29 11:30:00','Dar-es-salam','2025-08-29 21:30:00',2),
(5,'UR 111',4,'2025-08-25 11:30:00','Nairobi','2025-08-25 12:30:00',1);

/*Table structure for table `gender` */

DROP TABLE IF EXISTS `gender`;

CREATE TABLE `gender` (
  `gender_id` int NOT NULL AUTO_INCREMENT,
  `gendername` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `gender` */

/*Table structure for table `identification  documents` */

DROP TABLE IF EXISTS `identification  documents`;

CREATE TABLE `identification  documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `documentname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `identification  documents_ibfk_1` FOREIGN KEY (`id`) REFERENCES `passenger manifest` (`passengerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `identification  documents` */

/*Table structure for table `passenger manifest` */

DROP TABLE IF EXISTS `passenger manifest`;

CREATE TABLE `passenger manifest` (
  `passengerid` int NOT NULL AUTO_INCREMENT,
  `bookingid` int DEFAULT NULL,
  `bookingclassid` int DEFAULT NULL,
  `identification_document` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `passanger_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `gender_id` int DEFAULT NULL,
  PRIMARY KEY (`passengerid`),
  KEY `booking class id` (`bookingclassid`),
  KEY `gender id` (`gender_id`),
  CONSTRAINT `passenger manifest_ibfk_1` FOREIGN KEY (`bookingclassid`) REFERENCES `bookingclass` (`bookingclassid`),
  CONSTRAINT `passenger manifest_ibfk_2` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `passenger manifest` */

/*Table structure for table `payment method` */

DROP TABLE IF EXISTS `payment method`;

CREATE TABLE `payment method` (
  `paymentid` int NOT NULL AUTO_INCREMENT,
  `paymentname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`paymentid`),
  CONSTRAINT `payment method_ibfk_1` FOREIGN KEY (`paymentid`) REFERENCES `bookingclass` (`bookingclassid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `payment method` */

/* Procedure structure for procedure `sp_check_airline_details` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_airline_details` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_airline_details`(IN P_airlineid INT)
BEGIN
		SELECT a.* ,`countryName`
		FROM `airline` a
		JOIN `country` c ON c.countryid=a.homecountyid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_airportdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_airportdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_airportdetails`(IN P_airportid INT)
BEGIN
		SELECT a.* ,c.cityName,n.countryName
		FROM `airport` a
		JOIN `city` c ON c.cityid=a.cityid
		JOIN `country` n ON n.countryid=c.countryid
		WHERE a.airportid=P_airportid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_bookingclass_details` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_bookingclass_details` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_bookingclass_details`(IN P_bookingclassid INT)
BEGIN
		SELECT b.* ,s.price, c.currency
		FROM `bookingclass` b
		JOIN `booking supply` s ON s.bookingclassid=b.bookingclassid
		JOIN `currency` c ON c.currencyid =s.bookingsupplyid
		WHERE b.bookingclass=P_bookingclass;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_bookingsupply_detail` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_bookingsupply_detail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_bookingsupply_detail`(IN P_bookingsupplyid INT)
BEGIN
		SELECT b.* ,`bookingname`
		FROM `booking supply` b
		JOIN `bookingtype` t ON t.bookingid=b.bookingclassid
		WHERE b.bookingsupplyid= P_bookingsupplyid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_bookingtypedetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_bookingtypedetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_bookingtypedetail`(IN P_bookingid INT)
BEGIN
		SELECT * FROM `bookingtype`
		WHERE `bookingid`=P_bookingid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_booking_details` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_booking_details` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_booking_details`(IN P_bookingid INT)
BEGIN
		SELECT b.* , `classname`
		FROM `booking` b
		JOIN `bookingclass` c ON c.bookingclassid=b.flightid
		WHERE b.bookingid=P_bookingid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_cityddetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_cityddetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_cityddetails`(in P_cityId int)
BEGIN
		SELECT c.* , `countryName`
		FROM `city` c
		JOIN `country` n ON n.countryid=c.countryId
		WHERE c.cityId=P_cityId;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_countrydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_countrydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_countrydetails`(IN P_countryid INT)
BEGIN
		SELECT n.* ,`cityName`
		FROM `country` n
		JOIN `city` c ON c.countryId=n.countryid
		WHERE n.countryid=P_countryid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_flightsupply_details` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_flightsupply_details` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_flightsupply_details`(IN P_flightid  INT)
BEGIN
		SELECT f.* ,a.airlinename
		FROM `flight_supply` f
		JOIN `airline` a ON a.airlineid=f.airlineid
		WHERE f.flight_supply =P_flight_supply;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_genderdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_genderdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_genderdetails`(in P_gender_id int)
BEGIN
		SELECT g.* ,p.passanger_name
		FROM `gender` g
		JOIN `passenger manifest` p on p.gender_id=g.gender_id
		WHERE g.gender_id=P_gender_id;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_identificationdocument_details` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_identificationdocument_details` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_identificationdocument_details`(IN P_id INT)
BEGIN
		SELECT d.* ,g.gendername
		FROM `identification  documents` d
		JOIN `gender` g ON g.gender_id= d.`id`
		WHERE d.id=P_id;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_passengermanifest_details` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_passengermanifest_details` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_passengermanifest_details`(IN P_passengerid INT)
BEGIN
		SELECT p.* ,b.classname 
		FROM `passenger manifest` p
		JOIN `bookingclass` b ON b.bookingclassid=p.bookingclassid
		WHERE p.passengerid=P_passengerid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_paymentmethod_details` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_paymentmethod_details` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_paymentmethod_details`(IN P_paymentid INT)
BEGIN
		SELECT p.* , m.payment_method, c.exchange_rate
		FROM `payment method` p
		JOIN `currency` c ON c.currencyid=p.paymentid
		JOIN `booking` m ON m.payment_method=c.currencyid
		WHERE p.paymentid=P_paymentid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairport`(in P_airportid int)
BEGIN
		delete from `airport`
		where `airportid`=P_airportid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingclass`(in P_bookingclassid int)
BEGIN
		delete from `bookingclass`
		where `bookingclassid`=P_bookingclassid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingtype`(in P_bookingid int)
BEGIN
		delete from `bookingtype`
		where `bookingid`=P_bookingid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecity`()
BEGIN
		delete from `city`
		where `cityId`=P_cityId;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecountry`(in P_countryid int)
BEGIN
		delete from `country` 
		where `countryid`= P_countryid; 
		
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletegender` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletegender` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletegender`(in P_gender_id int)
BEGIN
		delete from `gender`
		where `gender_id`=P_gender_id;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_airline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_airline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_airline`(in P_airlineid int)
BEGIN
		delete from `airline`
		where `airlineid`=P_airlineid; 
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_bookings` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_bookings` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_bookings`(in P_bookingid int)
BEGIN
		delete from `booking`
		where `bookingid`=P_bookingid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_bookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_bookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_bookingsupply`(in P_bookingsupplyid int)
BEGIN
		delete from `booking supply`
		where `bookingsupplyid`=P_bookingsupplyid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_currencies` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_currencies` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_currencies`(in P_currencyid int)
BEGIN
		delete from `currency`
		where `currencyid`=P_currencyid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_flightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_flightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_flightsupply`(in P_flightid int)
BEGIN
		delete from `flight_supply`
		where `flightid`=P_flightid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_identification_document` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_identification_document` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_identification_document`(in P_id int)
BEGIN
		delete from `identification  documents`
		where `id`=P_id;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_passenger_manifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_passenger_manifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_passenger_manifest`(in P_passengerid int)
BEGIN
		delete from `passenger manifest`
		where `passengerid`=P_passengerid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_paymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_paymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_paymentmethod`(in P_paymentid int)
BEGIN

		DELETE FROM `payment method`
		WHERE `paymentid`=P_paymentid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_fiiltercity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_fiiltercity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fiiltercity`(in P_countryId int)
BEGIN
		if P_countryId = 0 then
		select c. *, o.countryName
		from `city` c
		join `country` o on o.countryid=c.countryId
		order by `countryName`, `cityName`;
		
		else
		
		SELECT c. *, o.countryName
		from `city` c
		JOIN `country` o ON o.countryid=c.countryId
		where c.countryId=P_countryId;
		
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterairlines` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterairlines` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterairlines`(in P_airlinename varchar(100), in P_countryName varchar(100))
BEGIN
		IF P_airlinename='' THEN
		
			SET P_airlinename='@@@';
		
		END IF;
		
		IF P_countryName='' THEN
		
			SET P_countryName='@@@';
		
		END IF;
		
		SELECT a.*, c.countryName
		FROM  `airline` a
		JOIN `country` c ON c.countryid=a.homecountyid
		WHERE a.airlinename LIKE CONCAT ("%",P_airlinename,"%")
		OR c.countryName LIKE CONCAT ("%",P_countryName,"%")
		ORDER BY `airlinename`, `countryName`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterairport`(in P_cityName varchar(100),in P_airportname varchar(100))
BEGIN
		if P_cityName='' then
		
			set P_cityName='@@@';
		
		end if;
		
		IF P_airportname='' THEN
		
			SET P_airportname='@@@';
		
		end if;
		
		select a.*, c.cityName
		from  `airport` a
		join `city` c on c.cityId=a.cityid
		where c.cityName like concat ("%",P_cityName,"%")
		or a.airportname LIKE CONCAT ("%",P_airportname,"%")
		order by `cityName`, `airportname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterbooking`(in P_classname varchar(100), in P_flightnumber varchar(100))
BEGIN
		IF P_classname='' THEN
		
			SET P_classname='@@@';
		
		END IF;
		
		IF P_flightnumber='' THEN
		
			SET P_flightnumber='@@@';
		
		END IF;
		
		
		SELECT b.*, c.classname, f.flightnumber
		FROM `booking` b
		JOIN `flight_supply` f ON f.flightid=b.flightid
		join `bookingclass` c on c.bookingclassid=b.bookingid
		WHERE c.classname LIKE CONCAT ("%",P_classname,"%")
		OR f.flightnumber LIKE CONCAT ("%",P_flightnumber,"%")
		ORDER BY `classname`, `flightnumber`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterbookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterbookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterbookingclass`(IN P_price float,in P_identification_document varchar(100))
BEGIN
		IF P_price='' THEN
		
			SET P_price='@@@';
		
		END IF;
		
		IF P_identification_document='' THEN
		
			SET P_identification_document='@@@';
		
		END IF;
		
		SELECT b.*, s.price,p.identification_document
		FROM  `bookingclass` b
		JOIN `booking supply` s on s.bookingclassid=b.bookingclassid
		join `passenger manifest` p  on p.`bookingclassid`=b.bookingclassid
		WHERE s.price LIKE CONCAT ("%",P_price,"%")
		OR p.identification_document LIKE CONCAT ("%",P_identification_document,"%")
		ORDER BY `identification_document`,`price`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterbookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterbookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterbookingsupply`(in P_classname varchar(100), in P_flightnumber varchar(100))
BEGIN
		IF P_classname='' THEN
		
			SET P_classname='@@@';
		
		END IF;
		
		IF P_flightnumber='' THEN
		
			SET P_flightnumber='@@@';
		
		END IF;
		
		
		SELECT b.*, c.classname, f.flightnumber
		FROM `booking` b
		JOIN `flight_supply` f ON f.flightid=b.flightid
		JOIN `bookingclass` c ON c.bookingclassid=b.bookingid
		WHERE c.classname LIKE CONCAT ("%",P_classname,"%")
		OR f.flightnumber LIKE CONCAT ("%",P_flightnumber,"%")
		ORDER BY `classname`, `flightnumber`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterbookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterbookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterbookingtype`(in P_classname varchar(100))
BEGIN
		IF P_classname='' THEN
		
			SET P_classname='@@@';
		
		END IF;
		
		
		SELECT t.*, b.classname
		FROM  `bookingtype` t
		JOIN `bookingclass` b ON b.bookingtypeid=t.bookingid
		WHERE b.classname LIKE CONCAT ("%",P_classname,"%")
		ORDER BY `bookingname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filtercountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filtercountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filtercountry`(in P_cityName varchar(100))
BEGIN
		IF P_cityName='' THEN
		
			SET P_cityName='@@@';
		
		END IF;
		
		SELECT n.*, c.`cityName`
		FROM  `country` n
		JOIN `city` c on c.countryId=n.countryid
		WHERE gc.cityName LIKE CONCAT ("%",P_cityName,"%")
		ORDER BY `cityName`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterflightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterflightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterflightsupply`(in P_payment_method varchar(50), in P_price float, in P_airlinename varchar(100))
BEGIN
		IF P_payment_method='' THEN
		
			SET P_payment_method='@@@';
		
		END IF;
		
		IF P_price='' THEN
		
			SET P_price='@@@';
		
		END IF;
		
		IF P_airlinename='' THEN
		
			SET P_airlinename='@@@';
		
		END IF;
		
		
		SELECT f.*, b.payment_method,s.price,a.airlinename
		FROM `flight_supply` f
		JOIN `booking` b ON b.flightid=f.flightid
		JOIN `booking supply` s ON s.flightid=f.flightid
		JOIN `airline` a ON a.`homecountyid`=f.airlineid
		WHERE b.payment_method LIKE CONCAT ("%",P_payment_method,"%")
		OR a.airlinename LIKE CONCAT ("%",P_airlinename,"%")
		ORDER BY `airlinename`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filtergender` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filtergender` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filtergender`(in P_gendername varchar(100), in P_passanger_name varchar(100))
BEGIN
		IF P_gendername='' THEN
		
			SET P_gendername='@@@';
		
		END IF;
		
		IF P_passanger_name='' THEN
		
			SET P_passanger_name='@@@';
		
		END IF;
		
		SELECT g.*, p.passanger_name
		FROM  `gender` a
		JOIN `passenger manifest` p ON p.gender_id=g.gender_id
		WHERE g.gendername LIKE CONCAT ("%",P_gendername,"%")
		OR p.passanger_name LIKE CONCAT ("%",P_passanger_name,"%")
		ORDER BY `passanger_name`,`gendername`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filteridentificationdocument` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filteridentificationdocument` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filteridentificationdocument`(in P_passanger_name varchar(100), in P_gendername char(1))
BEGIN
		IF P_passanger_name='' THEN
		
			SET P_passanger_name='@@@';
		
		END IF;
		
		IF P_gendername='' THEN
		
			SET P_gendername='@@@';
		
		END IF;
		
		SELECT d.*, p.passanger_name, g.gendername
		FROM  `identification  documents` d
		JOIN `passenger manifest` p ON p.identification_documentd=d.`documentname`
		join `gender` g on g.gender_id=p.gender_id
		WHERE p.passanger_name LIKE CONCAT ("%",P_passanger_name,"%")
		OR g.gendername LIKE CONCAT ("%",Pgendername,"%")
		ORDER BY `passanger_name`, `gendername`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterpassengermanifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterpassengermanifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterpassengermanifest`(in P_booking_date datetime,in P_classname varchar(100))
BEGIN
		IF P_booking_date='' THEN
		
			SET P_booking_date='@@@';
		
		END IF;
		
		IF P_classname='' THEN
		
			SET P_classname='@@@';
		
		END IF;
		
		SELECT p.*, c.classname, b.booking_date
		FROM  `passenger manifest` p
		JOIN `bookingclass` c ON c.bookingclassid=p.bookingclassid
		join `booking` b on b.bookingid =p.bookingid
		WHERE c.classname LIKE CONCAT ("%",P_classname,"%")
		ORDER BY `classname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterpaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterpaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterpaymentmethod`(in P_currency_name varchar(100))
BEGIN
		IF P_currency_name='' THEN
		
			SET P_currency_name='@@@';
		
		END IF;
		
		SELECT p.*, c.currency_name
		FROM  `payment method` p
		JOIN `currency` c ON c.paymentid=p.`paymentid`
		WHERE c.currency_name LIKE CONCAT ("%",P_currency_name,"%")
		ORDER BY `currency_name`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairport`()
BEGIN
		select * from `airport`
		order by`cityid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingclass`()
BEGIN
		select * from `bookingclass`
		order by `bookingclassid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingtype`()
BEGIN
		select * from `bookingtype`
		order by `bookingid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcity`()
BEGIN
		select * from `city`
		order by `cityName`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcountries` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcountries` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcountries`()
BEGIN
		SELECT * FROM `country`
		ORDER BY `countryName`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcurrencies` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcurrencies` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcurrencies`()
BEGIN
		select * from `currency`
		order by `exchange_rate`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getgender` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getgender` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getgender`()
BEGIN
		select * from `gender`
		order by `gender_id`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_get_airline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_get_airline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_airline`()
BEGIN
    SELECT * 
    FROM `expediaflightbooking`.`airline`
    ORDER BY `airlinename`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_get_bookings` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_get_bookings` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_bookings`()
BEGIN
		select * from `booking`
		order by `flight id`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_get_bookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_get_bookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_bookingsupply`()
BEGIN
		select *  from `booking supply`
		order by`bookingclassid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_get_flightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_get_flightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_flightsupply`()
BEGIN
		select * from `flight_supply`
		order by`flightid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_get_identification_document` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_get_identification_document` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_identification_document`()
BEGIN
		select * from `identification  documents`
		order by `documentname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_get_passenger_manifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_get_passenger_manifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_passenger_manifest`()
BEGIN
		select * from `passenger manifest`
		order by `booking id`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_get_paymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_get_paymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_paymentmethod`()
BEGIN
		select * from `payment method`
		order by `paymentid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveairport`(
in P_airportid int,
in P_airportcode varchar(3),
in P_cityid int,
in P_airportname varchar(100)
)
BEGIN
		-- Check if we are updating an existing airport (P_airportid is greater than 0)
    IF P_airportid > 0 THEN
        -- If the airport exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`airport`
        SET
            `airportcode`=P_airportcode,
            `cityid`=P_cityid,
            `airportname`=P_airportname
        WHERE
            `airportid`=P_airportid;
    ELSE
        -- If P_airportid is 0, we're adding a new city.
        -- We will check if an airport with the same name and code already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`airport`
            WHERE `airportcode` = P_airportcode AND `airportname`=P_airportname
        ) THEN
            -- If no duplicate is found, insert the new city record.
            INSERT INTO `expediaflightbooking`.`airport`
            (
               `airportcode`,
               `cityid`,
               `airportname`
            )
            VALUES
            (
                P_airportcode,
                P_cityid,
                P_airportname
            );
        END IF;
    END IF;
		
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingclass`(in P_bookingclassid int, in P_classname varchar(100),in P_bookingtypeid int)
BEGIN
		-- check if we are adding a new booking  class
		IF P_bookingclassid= 0 THEN
		--  create a new booking
			IF NOT EXISTS (SELECT 1 FROM `bookingclass` WHERE `classname`=P_classname) THEN
			INSERT INTO `bookingclass`(`classname`,`bookingtypeid`)
			VALUES (P_classname,P_bookingtypeid);
		END IF;
		
	ELSE
		-- if the passed id is not zero Update the existing country details
		UPDATE `bookingclass`
		SET `classname`=P_classname, `bookingtypeid`=P_bookingtypeid
		WHERE `bookingclassid`=P_bookingclassid;
		
	END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingtype`(
IN P_bookingid int,
in P_bookingname varchar(100)
)
BEGIN
		-- Check if we are updating an existing booking type 
    IF P_bookingid > 0 THEN
        -- If the booking type exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`bookingtype`
        SET
            `bookingname`=P_bookingname
        WHERE
            `bookingid`=P_bookingid;
    ELSE
        -- If P_bookingid is 0, we're adding a new booking type.
        -- We will check if a booking type with the same name already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`bookingtype`
            WHERE `bookingid`=P_bookingid
        ) THEN
            -- If no duplicate is found, insert the new booking type record.
            INSERT INTO `expediaflightbooking`.`bookingtype`
            (
               `bookingname`
            )
            VALUES
            (
                P_bookingname
            );
        END IF;
    END IF;
		
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecity`(
    IN P_cityId INT,
    IN P_cityName VARCHAR(100),
    IN P_countryId INT
)
BEGIN
    -- Check if we are updating an existing city (P_cityId is greater than 0)
    IF P_cityId = 0 THEN
        -- If the city exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`city`
        SET
            `cityName` = P_cityName,
            `countryId` = P_countryId
        WHERE
            `cityId` = P_cityId;
    ELSE
        -- If P_cityId is 0, we're adding a new city.
        -- We will check if a city with the same name and country ID already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`city` 
            WHERE `cityName` = P_cityName AND `countryId` = P_countryId
        ) THEN
            -- If no duplicate is found, insert the new city record.
            INSERT INTO `expediaflightbooking`.`city`
            (
                `cityName`,
                `countryId`
            )
            VALUES
            (
                P_cityName,
                P_countryId
            );
        END IF;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecountry`(IN P_countryid INT, in P_countryName VARCHAR(100))
BEGIN
		-- check if we are adding  a new country
		if P_countryid= 0 THEN
		--  create a new country
			if not exists (SELECT 1 FROM `country` WHERE `countryName`=P_countryName) THEN
			INSERT INTO `country`(countryName)
			VALUES (P_countryName);
		END IF;
		
	ELSE
		-- if the passed id is not zero Update the existing country details
		update `country`
		set `countryName` =P_countryName
		where `countryid` =P_countryid;
		
	end if;
	
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecurrencies` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecurrencies` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecurrencies`(in P_currencyid int, in P_currency_name varchar(100), in P_default decimal(3,0), in P_exchange_rate decimal(3,0), in P_paymentid int)
BEGIN
		-- Check if we are updating an existing currency
    IF P_currencyid > 0 THEN
        -- If the currency exists, update its details
        UPDATE `expediaflightbooking`.`currency`
        SET
           `currency_name`=P_currency_name,
           `default`=P_default,
           `exchange_rate`=P_exchange_rate,
           `paymentid`=P_paymentid
        WHERE
           `currencyid`=P_currencyid;
    ELSE
        -- If P_currencyid is 0, we're adding a new currency.
        -- We will check if a currency with the same details already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`currency`
            WHERE `currencyid`=P_currencyid
        ) THEN
            -- If no duplicate is found, insert the new currency record.
            INSERT INTO `expediaflightbooking`.`currency`
            (
               `currency_name`,
               `default`,
               `exchange_rate`,
               `paymentid`
            )
            VALUES
            (
                P_currency_name,
                P_default,
                P_exchange_rate,
                P_paymentid
            );
        END IF;
    END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savegender` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savegender` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savegender`(in P_gender_id int, in P_gendername char(1))
BEGIN
		insert into `gender`(`gender_id`,`gendername`)
		values(P_gender_id, P_gendername);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_save_airline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_save_airline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_save_airline`(in P_airlineid int, in P_airlinename varchar(100), in P_logo varchar(10), in P_homecountyid int)
BEGIN
			-- Check if we are updating an existing city (P_cityId is greater than 0)
    IF P_airlineid > 0 THEN
        -- If the airline exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`airline`
        SET
           `airlinename`=P_airlinename,
           `logo`=P_logo,
           `homecountyid`=P_homecountyid
        WHERE
            `airlineid`=P_airlineid;
    ELSE
        -- If P_airlineid is 0, we're adding a new airline.
        -- We will check if an airline with the same name already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`airline`
            WHERE `airlineid`=P_airlineid and `airlinename`=P_airlinename
        ) THEN
            -- If no duplicate is found, insert the new city record.
            INSERT INTO `expediaflightbooking`.`airline`
            (
               `airlinename`,
               `logo`,
               `homecountyid`
            )
            VALUES
            (
                P_airlinename,
                P_logo,
                P_homecountyid
            );
        END IF;
    END IF;
		
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_save_booking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_save_booking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_save_booking`()
BEGIN
	-- Check if we are updating an existing booking
    IF P_bookingid > 0 THEN
        -- If the booking exists, update its etails
        UPDATE `expediaflightbooking`.`booking`
        SET
           `bookingtypeid`=P_bookingtypeid,
           `flightid`=P_flightid,
           `booking_date`=P_booking_date,
           `payment_method`=P_payment_method
        WHERE
            `bookingid`=P_bookingid;
    ELSE
        -- If P_bookingidis 0, we're adding a new booking.
        -- We will check if a booking has the same name adetails to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`booking`
            WHERE `bookingtypeid`=P_bookingtypeid AND `flightid`=P_flightid
        ) THEN
            -- If no duplicate is found, insert the new booking record.
            INSERT INTO `expediaflightbooking`.`booking`
            (
               `bookingtypeid`,
               `flightid`,
               `booking_date`,
               `payment_method`
            )
            VALUES
            (
                P_bookingtypeid,
                P_flightid,
                P_booking_date,
                P_payment_method
            );
        END IF;
    END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_save_bookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_save_bookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_save_bookingsupply`(in P_bookingsupplyid int, in P_flightid int, in P_bookingclassid int, in P_numberofseats int, in P_price float, in P_currency int)
BEGIN
				-- Check if we are updating an existing booking supply
    IF P_bookingsupplyid > 0 THEN
        -- If the booking supply exists, update its properties.
        UPDATE `expediaflightbooking`.`booking supply`
        SET
           `flightid`=P_flightid,
           `bookingclassid`=P_bookingclassid,
           `numberofseats`=P_numberofseats,
           `price`=P_price,
           `currency`=P_currency
        WHERE
            `bookingsupplyid`=P_bookingsupplyid;
    ELSE
        -- If P_bookingsupplyid is 0, we're adding a new booking supply.
        -- We will check if a booking supply with the same id and already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`booking supply`
            WHERE `bookingsupplyid`=P_bookingsupplyid AND `bookingclassid`=P_bookingclassid
        ) THEN
            -- If no duplicate is found, insert the new city record.
            INSERT INTO `expediaflightbooking`.`booking supply`
            (
               `flightid`,
               `bookingclassid`,
               `numberofseats`,
               `price`,
               `currency`
            )
            VALUES
            (
                P_flightid,
                P_bookingclassid,
                P_numberofseats,
                P_price,
                P_currency
            );
        END IF;
    END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_save_flightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_save_flightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_save_flightsupply`(IN P_flightid INT, IN P_flightnumber VARCHAR(100), IN P_airlineid INT, IN P_depature_time DATETIME, IN P_depature_city VARCHAR(100), IN P_arrival_time DATETIME, IN P_destinationcityid INT)
BEGIN
			-- Check if we are updating an existing flight supply
    IF P_flightid > 0 THEN
        -- If the flight exists, update its properties.
        UPDATE `expediaflightbooking`.`flight_supply`
        SET
            `flightnumber`=P_flightnumber,
            `airline id`=P_airlineid,
            `depature_time`=P_depature_time,
            `depature_city`=P_depature_city,
            `arrival_time`=P_arrival_time,
            `destinationcityid`=P_destinationcityid
        WHERE
            `flightid`=P_flightid;
    ELSE
        -- If P_flightid is 0, we're adding a new flight supply.
        -- We will check if a flight supply with the same id and already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`flight_supply`
            WHERE `flightid`=P_flightid AND `airlineid`=P_airlineid
        ) THEN
            -- If no duplicate is found, insert the new city record.
            INSERT INTO `expediaflightbooking`.`flight_supply`
            (
               `flightnumber`,
               `airlineid`,
               `depature_time`,
               `depature_city`,
               `arrival_time`,
               `destinationcityid`
            )
            VALUES
            (
                P_flightnumber,
                P_airlineid,
                P_depature_time,
                P_depature_city,
                P_arrival_time,
                P_destinationcityid
            );
        END IF;
    END IF;
		
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_save_identification_document` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_save_identification_document` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_save_identification_document`(in P_id int, in P_documentname varchar(100))
BEGIN
		-- check if we are adding  a new identification document
		IF P_id= 0 THEN
		--  create a new identification document
			IF NOT EXISTS (SELECT 1 FROM `identification  documents` WHERE `id`=P_id) THEN
			INSERT INTO `identification  documents`(`documentname`)
			VALUES (P_documentname);
		END IF;
		
	ELSE
		-- if the passed id is not zero Update the existing country details
		UPDATE `identification  documents`
		SET `documentname`=P_documentname
		WHERE `id`=P_id;
		
	END IF;
	
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_save_passanger_manifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_save_passanger_manifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_save_passanger_manifest`(in P_passengerid int, in P_bookingid int, in P_bookingclassid int, in P_identification_document varchar(100), in P_DOB date, in P_gender_id int)
BEGIN
		-- Check if we are updating an existing passenger manifest
    IF P_passengerid = 0 THEN
        -- If the passenger manifest exists, update its details
        UPDATE `expediaflightbooking`.`passenger manifest`
        SET
            `bookingid`=P_bookingid,
            `bookingclassid`=P_bookingclassid,
            `identification_document`=P_identification_document,
            `passanger_name`=P_passanger_name,
            `DOB`=P_DOB,
            `gender_id`=P_gender_id
        WHERE
            `passengerid`=P_passengerid;
    ELSE
        -- If P_passengerid is 0, we're adding a new passanger.
        -- We will check if a passenger with the same details already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`passenger manifest`
            WHERE `bookingid`=P_bookingid AND `DOB`=P_DOB
        ) THEN
            -- If no duplicate is found, insert the new passenger record.
            INSERT INTO `expediaflightbooking`.`passenger manifest`
            (
               `bookingid`,
               `bookingclassid`,
               `identification_document`,
               `passanger_name`,
               `DOB`,
               `gender_id`
            )
            VALUES
            (
                P_bookingid,
                P_bookingclassid,
                P_identification_document,
                P_passanger_name,
                P_DOB,
                P_gender_id
            );
        END IF;
    END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_save_paymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_save_paymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_save_paymentmethod`(in P_paymentid int, in P_paymentname varchar(100))
BEGIN
		-- Check if we are updating an existing payment method
    IF P_paymentid > 0 THEN
        -- If the payment method exists, update its details
        UPDATE `expediaflightbooking`.`payment method`
        SET
           `paymentname`=P_paymentname
        WHERE
           `paymentid`=P_paymentid;
    ELSE
        -- If P_paymentid is 0, we're adding a new payment.
        -- We will check if a payment with the same details already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`payment method`
            WHERE `paymentname`=P_paymentname
        ) THEN
            -- If no duplicate is found, insert the new payment record.
            INSERT INTO `expediaflightbooking`.`payment method`
            (
               `paymentname`
            )
            VALUES
            (
                P_paymentname
            );
        END IF;
    END IF;
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
