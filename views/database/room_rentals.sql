-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2023 at 04:45 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `room_rentals`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_flat` (IN `name` VARCHAR(50), IN `landmark` VARCHAR(50), IN `contact` BIGINT, IN `address` VARCHAR(50), IN `noofrooms` INT, IN `fid` INT)   BEGIN
 UPDATE flat SET FLAT_NAME = name, LANDMARK=landmark,CONTACT=contact,LOCATION=address,NO_OF_ROOMS=noofrooms WHERE FLAT_ID = fid ;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_pg` (IN `name` VARCHAR(50), IN `landmark` VARCHAR(50), IN `noofrooms` INT, IN `roomsfilled` INT, IN `roomsvac` INT, IN `address` VARCHAR(50), IN `facilities` VARCHAR(50), IN `food` VARCHAR(50), IN `p_id` INT)   BEGIN
	UPDATE pg SET PG_NAME=Name,LANDMARK=landmark,NO_OF_ROOMS=Noofrooms,ROOMS_FILLED=roomsfilled,ROOMS_VACANT=roomsvac,LOCATION=address,FACILITIES=facilities,FOOD=food WHERE PG_ID=P_ID ;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `flat`
--

CREATE TABLE `flat` (
  `FLAT_ID` int(11) NOT NULL,
  `FLAT_NAME` varchar(50) NOT NULL,
  `NO_OF_ROOMS` int(11) NOT NULL,
  `LANDMARK` varchar(50) NOT NULL,
  `LOCATION` varchar(50) NOT NULL,
  `CONTACT` bigint(20) NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flat`
--

INSERT INTO `flat` (`FLAT_ID`, `FLAT_NAME`, `NO_OF_ROOMS`, `LANDMARK`, `LOCATION`, `CONTACT`, `OWNER_ID`) VALUES
(1, 'Peninsula Heights ', 5, 'NEAR VVS PU COLLEGE', 'BASVESHWARNAGAR', 8990214912, 4),
(3, 'LUXURY LAKE', 4, 'SJBIT COLLEGE', 'KENGERI', 6433748536, 2),
(4, 'THE BEND', 2, 'SHANTHI SAGAR HOTEL', 'VIJAYANAGAR', 8144754540, 3),
(5, 'PARK PLACE', 3, 'BIG BITE', 'MARUTHI MANDIRA', 9448876564, NULL),
(9, 'Swagath Springs', 2, 'Near cordial high school', 'MOODALPALYA', 8471242014, 4),
(10, 'Springs Soft', 2, 'Near RR temple', 'RR Nagar', 8742917212, 7);

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `OWNER_ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `contact` bigint(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`OWNER_ID`, `name`, `email_id`, `contact`, `address`, `username`, `pwd`) VALUES
(2, 'RAM', 'ram123@gmail.com', 9886686640, 'CHANDRALAYOUT', 'RAM', '123'),
(3, 'akash', 'akash07@gmail.com', 9448805567, 'MYSORE', 'akash123', '123'),
(4, 'MAHARSH', 'maharshgr07@gmail.com', 9902043623, 'Vijayanagar', 'MAHARSHGR', '123'),
(7, 'nischal', 'nischal@gmail.com', 2147483647, 'Vijayanagar', 'nischal10', '123');

-- --------------------------------------------------------

--
-- Table structure for table `owner_signup`
--

CREATE TABLE `owner_signup` (
  `name` varchar(50) DEFAULT NULL,
  `contact` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owner_signup`
--

INSERT INTO `owner_signup` (`name`, `contact`, `username`, `pwd`, `email_id`, `address`) VALUES
('akash', 2147483647, 'akash123', '123', 'akash@gmail.com', 'Bangalore'),
('MAHARSH', 990204362, 'MAHARSHGR', '123', 'maharsh@gmail.com', 'BANGALORE'),
('nischal', 2147483647, 'nischal10', '123', 'nischal@gmail.com', 'Vijayanagar'),
('RAM', 808080912, 'RAM', '123', 'ram@gmail.com', 'CHENNAI');

--
-- Triggers `owner_signup`
--
DELIMITER $$
CREATE TRIGGER `OWNER_UPDATE` AFTER INSERT ON `owner_signup` FOR EACH ROW BEGIN INSERT INTO owner(name,username,pwd,contact,email_id,address)VALUES(NEW.name,NEW.username,NEW.pwd,NEW.contact,NEW.email_id,NEW.address); END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pg`
--

CREATE TABLE `pg` (
  `PG_ID` int(11) NOT NULL,
  `PG_NAME` varchar(50) NOT NULL,
  `NO_OF_ROOMS` int(11) NOT NULL,
  `LANDMARK` varchar(50) NOT NULL,
  `LOCATION` varchar(50) DEFAULT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `ROOMS_FILLED` int(11) NOT NULL,
  `ROOMS_VACANT` int(11) NOT NULL,
  `FACILITIES` varchar(50) NOT NULL,
  `FOOD` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pg`
--

INSERT INTO `pg` (`PG_ID`, `PG_NAME`, `NO_OF_ROOMS`, `LANDMARK`, `LOCATION`, `OWNER_ID`, `ROOMS_FILLED`, `ROOMS_VACANT`, `FACILITIES`, `FOOD`) VALUES
(1, 'SHIVAPG', 5, 'NEAR POLAR BEAR', 'RR NAGAR', NULL, 3, 2, 'WIFI', 'VEG'),
(2, 'ARUN PG', 3, 'NEAR ARCADE', 'RR NAGAR', NULL, 2, 1, 'WIFI', 'VEG'),
(3, 'HARI PG', 3, 'NEAR PETROL BUNK', 'CHANDRALAYOUT', 2, 2, 1, 'WIFI', 'VEG'),
(4, 'SHARMA PG', 2, 'METRO STATION', 'VIJAYANAGAR', 4, 2, 0, 'WIFI', 'VEG'),
(5, 'ROHITH PG', 2, 'PETROL BUNK', 'MOODALPALYA', 2, 0, 2, 'WIFI', 'VEG AND NON-VEG'),
(12, 'Swagath PG', 2, 'Near NPS ground', 'Bashweshwarnagar', 7, 1, 1, 'wifi', 'veg');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `name` varchar(30) NOT NULL,
  `contact` bigint(20) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `email_id` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`name`, `contact`, `username`, `pwd`, `email_id`) VALUES
('NISHANTH', 4141, 'DADFAFF', '421', 'ni@gmail.com'),
('jeevan', 42141241, 'j1', '123', 'jeevan@gmail.com\r\n'),
('Likhith', 908018351, 'likhi', '123', 'likhith@gmail.com'),
('MAHARSH', 9902043623, 'MAHARSHGR', '123', 'maharsh@gmail.com'),
('manish', 8980842121, 'manish', '123', 'manish@gmail.com'),
('nigama', 4194719571, 'nigam', '123', 'nigama@gmail.com'),
('nischal', 6362245161, 'nischal10', '123', 'nischal@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flat`
--
ALTER TABLE `flat`
  ADD PRIMARY KEY (`FLAT_ID`),
  ADD KEY `OWNER_ID` (`OWNER_ID`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`OWNER_ID`);

--
-- Indexes for table `owner_signup`
--
ALTER TABLE `owner_signup`
  ADD PRIMARY KEY (`username`,`pwd`);

--
-- Indexes for table `pg`
--
ALTER TABLE `pg`
  ADD PRIMARY KEY (`PG_ID`),
  ADD KEY `OWNER_ID` (`OWNER_ID`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flat`
--
ALTER TABLE `flat`
  MODIFY `FLAT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `OWNER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pg`
--
ALTER TABLE `pg`
  MODIFY `PG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flat`
--
ALTER TABLE `flat`
  ADD CONSTRAINT `FL1` FOREIGN KEY (`OWNER_ID`) REFERENCES `owner` (`OWNER_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `flat_ibfk_1` FOREIGN KEY (`OWNER_ID`) REFERENCES `owner` (`OWNER_ID`);

--
-- Constraints for table `pg`
--
ALTER TABLE `pg`
  ADD CONSTRAINT `PFK1` FOREIGN KEY (`OWNER_ID`) REFERENCES `owner` (`OWNER_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pg_ibfk_1` FOREIGN KEY (`OWNER_ID`) REFERENCES `owner` (`OWNER_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
