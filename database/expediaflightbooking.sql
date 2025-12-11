/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - expediaflightbooking
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`expediaflightbooking` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `expediaflightbooking`;

/*Table structure for table `airline` */

DROP TABLE IF EXISTS `airline`;

CREATE TABLE `airline` (
  `airlineid` int(11) NOT NULL AUTO_INCREMENT,
  `airlinename` varchar(100) DEFAULT NULL,
  `logo` varchar(10) DEFAULT NULL,
  `homecountyid` int(11) DEFAULT NULL,
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
  `airportid` int(11) NOT NULL AUTO_INCREMENT,
  `airportcode` varchar(3) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
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
  `bookingid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingtypeid` int(11) DEFAULT NULL,
  `flightid` int(11) DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bookingid`),
  KEY `flight id` (`flightid`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`flightid`) REFERENCES `flight_supply` (`flightid`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`bookingid`) REFERENCES `booking supply` (`bookingsupplyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `booking` */

/*Table structure for table `booking supply` */

DROP TABLE IF EXISTS `booking supply`;

CREATE TABLE `booking supply` (
  `bookingsupplyid` int(11) NOT NULL AUTO_INCREMENT,
  `flightid` int(11) DEFAULT NULL,
  `bookingclassid` int(11) DEFAULT NULL,
  `numberofseats` int(11) DEFAULT NULL,
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
  `bookingclassid` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(100) DEFAULT NULL,
  `bookingtypeid` int(11) DEFAULT NULL,
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
  `bookingid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingname` varchar(100) DEFAULT NULL,
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
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `cityname` varchar(100) DEFAULT NULL,
  `countryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cityid`),
  KEY `city_ibfk_1` (`countryid`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`countryId`) REFERENCES `country` (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `city` */

insert  into `city`(`cityid`,`cityname`,`countryid`) values 
(1,'Nairobi',4),
(2,'dare-es-salam',6),
(3,'London',7),
(4,'Kampala',8);

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `country` */

insert  into `country`(`countryid`,`countryname`) values 
(4,'Kenya'),
(6,'Tanzania'),
(7,'Europe'),
(8,'Uganda');

/*Table structure for table `currency` */

DROP TABLE IF EXISTS `currency`;

CREATE TABLE `currency` (
  `currencyid` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(100) DEFAULT NULL,
  `default` decimal(3,0) DEFAULT NULL,
  `exchange_rate` decimal(3,0) DEFAULT NULL,
  `paymentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`currencyid`),
  KEY `paymentid` (`paymentid`),
  CONSTRAINT `currency_ibfk_1` FOREIGN KEY (`paymentid`) REFERENCES `payment method` (`paymentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `currency` */

/*Table structure for table `flight_supply` */

DROP TABLE IF EXISTS `flight_supply`;

CREATE TABLE `flight_supply` (
  `flightid` int(11) NOT NULL AUTO_INCREMENT,
  `flightnumber` varchar(100) DEFAULT NULL,
  `airlineid` int(11) DEFAULT NULL,
  `depature_time` datetime DEFAULT NULL,
  `depature_city` varchar(100) DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `destinationcityid` int(11) DEFAULT NULL,
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
  `gender_id` int(11) NOT NULL AUTO_INCREMENT,
  `gendername` char(1) DEFAULT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `gender` */

/*Table structure for table `identification  documents` */

DROP TABLE IF EXISTS `identification  documents`;

CREATE TABLE `identification  documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `identification  documents_ibfk_1` FOREIGN KEY (`id`) REFERENCES `passenger manifest` (`passengerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `identification  documents` */

/*Table structure for table `passenger manifest` */

DROP TABLE IF EXISTS `passenger manifest`;

CREATE TABLE `passenger manifest` (
  `passengerid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingid` int(11) DEFAULT NULL,
  `bookingclassid` int(11) DEFAULT NULL,
  `identification_document` varchar(100) DEFAULT NULL,
  `passanger_name` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
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
  `paymentid` int(11) NOT NULL AUTO_INCREMENT,
  `paymentname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`paymentid`),
  CONSTRAINT `payment method_ibfk_1` FOREIGN KEY (`paymentid`) REFERENCES `bookingclass` (`bookingclassid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `payment method` */

/* Procedure structure for procedure `sp_checkairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkairline`(IN P_airlineid INT)
BEGIN
		SELECT a.* ,`countryName`
		FROM `airline` a
		JOIN `country` c ON c.countryid=a.homecountyid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkairports` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkairports` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkairports`(IN P_airportid INT)
BEGIN
		SELECT a.* ,c.cityname,n.countryname
		FROM `airport` a
		JOIN `city` c ON c.cityid=a.cityid
		JOIN `country` n ON n.countryid=c.countryid
		WHERE a.airportid=P_airportid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkbooking`(IN P_bookingid INT)
BEGIN
		SELECT b.* , `classname`
		FROM `booking` b
		JOIN `bookingclass` c ON c.bookingclassid=b.flightid
		WHERE b.bookingid=P_bookingid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkbookingclassdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkbookingclassdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkbookingclassdetails`(IN P_bookingclassid INT)
BEGIN
		SELECT b.* ,s.price, c.currency
		FROM `bookingclass` b
		JOIN `booking supply` s ON s.bookingclassid=b.bookingclassid
		JOIN `currency` c ON c.currencyid =s.bookingsupplyid
		WHERE b.bookingclass=P_bookingclass;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkbookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkbookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkbookingsupply`(IN P_bookingsupplyid INT)
BEGIN
		SELECT b.* ,`bookingname`
		FROM `booking supply` b
		JOIN `bookingtype` t ON t.bookingid=b.bookingclassid
		WHERE b.bookingsupplyid= P_bookingsupplyid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkbookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkbookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkbookingtype`(IN P_bookingid INT)
BEGIN
		SELECT * FROM `bookingtype`
		WHERE `bookingid`=P_bookingid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkcity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcity`(in P_cityid int)
BEGIN
		SELECT c.* , `countryname`
		FROM `city` c
		JOIN `country` n ON n.countryid=c.countryid
		WHERE c.cityid=P_cityid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkcountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcountry`(IN P_countryid INT)
BEGIN
		SELECT c.* ,a.airlinename
		FROM `country` c
		JOIN `airline` a ON c.countryid=a.homecountyid
		WHERE c.countryid=P_countryid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkcurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcurrency`(in P_currencyid int)
BEGIN
		SELECT c.* ,p.paymentname
		FROM `currency` c
		JOIN `payment method` p ON c.paymentid=p.paymentid
		WHERE c.currencyid=P_currencyid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkflightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkflightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkflightsupply`(IN P_flightid  INT)
BEGIN
		SELECT f.* ,a.airlinename
		FROM `flight_supply` f
		JOIN `airline` a ON a.airlineid=f.airlineid
		WHERE f.flight_supply =P_flight_supply;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkgender` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkgender` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkgender`(in P_gender_id int)
BEGIN
		SELECT g.* ,p.passanger_name
		FROM `gender` g
		JOIN `passenger manifest` p on p.gender_id=g.gender_id
		WHERE g.gender_id=P_gender_id;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkidentificationdocument` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkidentificationdocument` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkidentificationdocument`(IN P_id INT)
BEGIN
		SELECT d.* ,g.gendername
		FROM `identification  documents` d
		JOIN `gender` g ON g.gender_id= d.`id`
		WHERE d.id=P_id;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkpassengermanifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkpassengermanifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkpassengermanifest`(IN P_passengerid INT)
BEGIN
		SELECT p.* ,b.classname 
		FROM `passenger manifest` p
		JOIN `bookingclass` b ON b.bookingclassid=p.bookingclassid
		WHERE p.passengerid=P_passengerid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkpaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkpaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkpaymentmethod`(IN P_paymentid INT)
BEGIN
		SELECT p.* , m.payment_method, c.exchange_rate
		FROM `payment method` p
		JOIN `currency` c ON c.currencyid=p.paymentid
		JOIN `booking` m ON m.payment_method=c.currencyid
		WHERE p.paymentid=P_paymentid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairline`(in P_airlineid int)
BEGIN
		delete from `airline`
		where `airlineid`=P_airlineid; 
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

/* Procedure structure for procedure `sp_deletebooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebooking`(in P_bookingid int)
BEGIN
		delete from `booking`
		where `bookingid`=P_bookingid;
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

/* Procedure structure for procedure `sp_deletebookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingsupply`(in P_bookingsupplyid int)
BEGIN
		delete from `booking supply`
		where `bookingsupplyid`=P_bookingsupplyid;
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

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecity`(in P_cityid int)
BEGIN
		delete from `city`
		where `cityid`=P_cityid;
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

/* Procedure structure for procedure `sp_deletecurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecurrency`(in P_currencyid int)
BEGIN
		delete from `currency`
		where `currencyid`=P_currencyid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightsupply`(in P_flightid int)
BEGIN
		delete from `flight_supply`
		where `flightid`=P_flightid;
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

/* Procedure structure for procedure `sp_deleteidentificationdocument` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteidentificationdocument` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteidentificationdocument`(in P_id int)
BEGIN
		delete from `identification  documents`
		where `id`=P_id;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletepassengermanifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletepassengermanifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletepassengermanifest`(in P_passengerid int)
BEGIN
		delete from `passenger manifest`
		where `passengerid`=P_passengerid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletepaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletepaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletepaymentmethod`(in P_paymentid int)
BEGIN
		DELETE FROM `payment method`
		WHERE `paymentid`=P_paymentid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterairlines` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterairlines` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterairlines`(in P_airlinename varchar(100), in P_countryname varchar(100))
BEGIN
		IF P_airlinename='' THEN
		
			SET P_airlinename='@@@';
		
		END IF;
		
		IF P_countryname='' THEN
		
			SET P_countryname='@@@';
		
		END IF;
		
		SELECT a.*, c.countryname
		FROM  `airline` a
		JOIN `country` c ON c.countryid=a.homecountyid
		WHERE a.airlinename LIKE CONCAT ("%",P_airlinename,"%")
		OR c.countryname LIKE CONCAT ("%",P_countryname,"%")
		ORDER BY `airlinename`, `countryname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterairport`(in P_cityname varchar(100),in P_airportname varchar(100))
BEGIN
		if P_cityname='' then
		
			set P_cityname='@@@';
		
		end if;
		
		IF P_airportname='' THEN
		
			SET P_airportname='@@@';
		
		end if;
		
		select a.*, c.cityname
		from  `airport` a
		join `city` c on c.cityid=a.cityid
		where c.cityname like concat ("%",P_cityname,"%")
		or a.airportname LIKE CONCAT ("%",P_airportname,"%")
		order by `cityname`, `airportname`;
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

/* Procedure structure for procedure `sp_filtercities` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filtercities` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filtercities`(in P_countryid int)
BEGIN
		if P_countryid = 0 then
		select c. *, o.countryname
		from `city` c
		join `country` o on o.countryid=c.countryid
		order by `countryname`, `cityname`;
		
		else
		
		SELECT c. *, o.countryname
		from `city` c
		JOIN `country` o ON o.countryid=c.countryid
		where c.countryid=P_countryid;
		
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filtercountries` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filtercountries` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filtercountries`(in P_cityname varchar(100))
BEGIN
		IF P_cityname='' THEN
		
			SET P_cityname='@@@';
		
		END IF;
		
		SELECT n.*, c.`cityname`
		FROM  `country` n
		JOIN `city` c on c.countryid=n.countryid
		WHERE c.cityname LIKE CONCAT ("%",P_cityname,"%")
		ORDER BY `cityname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filtercurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filtercurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filtercurrency`(in P_currency_name varchar(100), in P_bookingclassid int)
BEGIN
		if P_currency_name='' then
		
			set P_currency_name='@@@';
		
		end if;
		
		select c.*, b.currency
		from  `currency` c
		join `booking supply` b on c.currencyid=b.bookingsupplyid
		where c.currency_name like concat ("%",P_currency_name,"%")
		order by `currency_name`;
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

/* Procedure structure for procedure `sp_getairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairline`()
BEGIN
		SELECT * FROM `expediaflightbooking`.`airline`
		ORDER BY `airlinename`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairlinedetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairlinedetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairlinedetails`(in P_airlineid int)
BEGIN
		SELECT a.*, c.countryname
		FROM  `airline` a
		JOIN `country` c ON c.countryid=a.homecountyid
		ORDER BY `airlinename`, `countryname`;
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

/* Procedure structure for procedure `sp_getairportdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairportdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairportdetails`(in P_airportid int)
BEGIN
		SELECT a.*, c.cityname
		FROM  `airport` a
		JOIN `city` c ON c.cityid=a.cityid
		ORDER BY `cityname`, `airportname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbooking`()
BEGIN
		select * from `booking`
		order by `flight id`;
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

/* Procedure structure for procedure `sp_getbookingclassdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingclassdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingclassdetails`(in P_bookingclassid int)
BEGIN
		SELECT b.*, s.price,p.identification_document
		FROM  `bookingclass` b
		JOIN `booking supply` s ON s.bookingclassid=b.bookingclassid
		JOIN `passenger manifest` p  ON p.`bookingclassid`=b.bookingclassid
		ORDER BY `identification_document`,`price`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingdetails`(in P_bookingid int)
BEGIN
		SELECT b.*, c.classname, f.flightnumber
		FROM `booking` b
		JOIN `flight_supply` f ON f.flightid=b.flightid
		JOIN `bookingclass` c ON c.bookingclassid=b.bookingid
		ORDER BY `classname`, `flightnumber`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingsupply`()
BEGIN
		select *  from `booking supply`
		order by`bookingclassid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingsupplydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingsupplydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingsupplydetails`(in P_bookingsupplyid int)
BEGIN
		SELECT b.*, c.classname, f.flightnumber
		FROM `booking` b
		JOIN `flight_supply` f ON f.flightid=b.flightid
		JOIN `bookingclass` c ON c.bookingclassid=b.bookingid
		ORDER BY `classname`, `flightnumber`;
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

/* Procedure structure for procedure `sp_getbookingtypedetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingtypedetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingtypedetails`(iN P_bookingid int)
BEGIN
		SELECT t.*, b.classname
		FROM  `bookingtype` t
		JOIN `bookingclass` b ON b.bookingtypeid=t.bookingid
		ORDER BY `bookingname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcities` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcities` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcities`()
BEGIN
		select * from `city`
		order by `cityname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcitydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcitydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcitydetails`(in P_cityid int)
BEGIN
		SELECT c.*, a.airportname
		FROM  `city` c
		JOIN `airport` a ON c.cityid=a.cityid
		ORDER BY `cityid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcountries` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcountries` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcountries`()
BEGIN
		SELECT * FROM `country`
		ORDER BY `countryname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcountrydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcountrydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcountrydetails`(in  P_countryid int)
BEGIN
		SELECT n.*, c.`cityname`, a.`airportname`
		FROM  `country` n
		JOIN `city` c ON c.countryid=n.countryid
		join `airport` a on c.cityid=a.cityid
		ORDER BY `countryid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcurrency`()
BEGIN
		select * from `currency`
		order by `exchange_rate`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcurrencydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcurrencydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcurrencydetails`(in P_currencyid INT)
BEGIN
		SELECT c.*, b.currency
		FROM  `currency` c
		JOIN `booking supply` b ON c.currencyid=b.bookingsupplyid
		ORDER BY `currency_name`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightsupply`()
BEGIN
		select * from `flight_supply`
		order by`flightid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightsupplydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightsupplydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightsupplydetails`(IN P_flightid int)
BEGIN
		SELECT f.*, b.payment_method,s.price,a.airlinename
		FROM `flight_supply` f
		JOIN `booking` b ON b.flightid=f.flightid
		JOIN `booking supply` s ON s.flightid=f.flightid
		JOIN `airline` a ON a.`homecountyid`=f.airlineid
		ORDER BY `airlinename`;
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

/* Procedure structure for procedure `sp_getgenderdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getgenderdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getgenderdetails`(IN P_gender_id int)
BEGIN
		SELECT g.*, p.passanger_name
		FROM  `gender` a
		JOIN `passenger manifest` p ON p.gender_id=g.gender_id
		ORDER BY `passanger_name`,`gendername`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getidentificationdocument` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getidentificationdocument` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getidentificationdocument`()
BEGIN
		select * from `identification  documents`
		order by `documentname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getidentificationdocumentdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getidentificationdocumentdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getidentificationdocumentdetails`(in P_id int)
BEGIN
		SELECT d.*, p.passanger_name, g.gendername
		FROM  `identification  documents` d
		JOIN `passenger manifest` p ON p.identification_documentd=d.`documentname`
		JOIN `gender` g ON g.gender_id=p.gender_id
		ORDER BY `passanger_name`, `gendername`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpassengermanifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpassengermanifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpassengermanifest`()
BEGIN
		select * from `passenger manifest`
		order by `booking id`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpassengermanifestdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpassengermanifestdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpassengermanifestdetails`(in P_passengerid int)
BEGIN
		SELECT p.*, c.classname, b.booking_date
		FROM  `passenger manifest` p
		JOIN `bookingclass` c ON c.bookingclassid=p.bookingclassid
		ORDER BY `classname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpaymentmethod`()
BEGIN
		select * from `payment method`
		order by `paymentid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpaymentmethoddetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpaymentmethoddetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpaymentmethoddetails`(in P_paymentid int)
BEGIN
		SELECT p.*, c.currency_name
		FROM  `payment method` p
		JOIN `currency` c ON c.paymentid=p.`paymentid`
		ORDER BY `currency_name`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveairline`(in P_airlineid int, in P_airlinename varchar(100), in P_logo varchar(10), in P_homecountyid int)
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

/* Procedure structure for procedure `sp_savebooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebooking`(in P_bookingid int, in P_bookingtypeid int, in P_flightid  int, in P_booking_date datetime,  in P_payment_method varchar(50))
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

/* Procedure structure for procedure `sp_savebookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingsupply`(in P_bookingsupplyid int, in P_flightid int, in P_bookingclassid int, in P_numberofseats int, in P_price float, in P_currency int)
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
	IN P_cityid INT,
	IN P_cityname VARCHAR(100),
	IN P_countryid INT
    )
BEGIN
		-- Check if we are updating an existing city (P_cityId is greater than 0)
    IF P_cityid = 0 THEN
        -- If the city exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`city`
        SET
            `cityname` = P_cityname,
            `countryid` = P_countryid
        WHERE
            `cityid` = P_cityid;
    ELSE
        -- If P_cityId is 0, we're adding a new city.
        -- We will check if a city with the same name and country ID already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`city` 
            WHERE `cityname` = P_cityname AND `countryid` = P_countryid
        ) THEN
            -- If no duplicate is found, insert the new city record.
            INSERT INTO `expediaflightbooking`.`city`
            (
                `cityname`,
                `countryid`
            )
            VALUES
            (
                P_cityname,
                P_countryid
            );
        END IF;
    END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecountries` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecountries` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecountries`(IN P_countryid INT(11), in P_countryname VARCHAR(100))
BEGIN
		-- Check if we are updating an existing country (P_cityId is greater than 0)
    IF P_countryid = 0 THEN
        -- If the city exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`country`
        SET
            `countryname` = P_countryname
        WHERE
            `countryid` = P_countryid;
    ELSE
        -- If P_countryid is 0, we're adding a new city.
        -- We will check if a city with the same name and country ID already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`countryid`
            WHERE `countryid`= P_countryid
        ) THEN
            -- If no duplicate is found, insert the new country record.
            INSERT INTO `expediaflightbooking`.`country`
            (
               `countryname`
            )
            VALUES
            (
                P_countryname
            );
        END IF;
    END IF;
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

/* Procedure structure for procedure `sp_saveflightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightsupply`(IN P_flightid INT, IN P_flightnumber VARCHAR(100), IN P_airlineid INT, IN P_depature_time DATETIME, IN P_depature_city VARCHAR(100), IN P_arrival_time DATETIME, IN P_destinationcityid INT)
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

/* Procedure structure for procedure `sp_savegender` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savegender` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savegender`(in P_gender_id int, in P_gendername char(1))
BEGIN
		insert into `gender`(`gender_id`,`gendername`)
		values(P_gender_id, P_gendername);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveidentificationdocuments` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveidentificationdocuments` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveidentificationdocuments`(in P_id int, in P_documentname varchar(100))
BEGIN
		-- Check if we are updating an existing identification (P_id is greater than 0)
    IF P_id > 0 THEN
        -- If the id exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`identification  documents`
        SET
            `documentname`=P_documentname
        WHERE
            `id`=P_id;
    ELSE
        -- If P_id is 0, we're adding a new identificationdocument.
        -- We will check if an id of the same already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`identification  documents`
            WHERE `id`=P_id
        ) THEN
            -- If no duplicate is found, insert the new city record.
            INSERT INTO `expediaflightbooking`.`identification  documents`
            (
              `documentname`
            )
            VALUES
            (
                P_documentname
            );
        END IF;
    END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savepassengermanifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savepassengermanifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savepassengermanifest`(in P_passengerid int, in P_bookingid int, in P_bookingclassid int, in P_identification_document varchar(100), in P_DOB date, in P_gender_id int)
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

/* Procedure structure for procedure `sp_savepaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savepaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savepaymentmethod`(in P_paymentid int, in P_paymentname varchar(100))
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
