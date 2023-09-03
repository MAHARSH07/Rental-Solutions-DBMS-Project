
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
(5, 'PARK PLACE', 3, 'BIG BITE', 'MARUTHI MANDIRA', 9448876564, 1);

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `OWNER_ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `EMAIL_ID` varchar(100) NOT NULL,
  `CONTACT` bigint(20) NOT NULL,
  `ADDRESS` varchar(50) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`OWNER_ID`, `NAME`, `EMAIL_ID`, `CONTACT`, `ADDRESS`, `USERNAME`, `PASSWORD`) VALUES
(1, 'nischal', 'nischal@gmail.com', 6362245161, 'VIJAYANAGAR', 'nichal', '321'),
(2, 'RAM', 'ram123@gmail.com', 9886686640, 'CHANDRALAYOUT', 'RAM', '123'),
(3, 'akash', 'akash07@gmail.com', 9448805567, 'MYSORE', 'akash123', '123'),
(4, 'MAHARSH', 'maharshgr07@gmail.com', 9902043623, 'Vijayanagar', 'MAHARSHGR', '123'),
(5, 'fhf', '', 0, '', 'gjh', '1');

-- --------------------------------------------------------

--
-- Table structure for table `owner_signup`
--

CREATE TABLE `owner_signup` (
  `FIRSTNAME` varchar(50) NOT NULL,
  `LASTNAME` varchar(50) NOT NULL,
  `PHONENUMBER` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owner_signup`
--

INSERT INTO `owner_signup` (`FIRSTNAME`, `LASTNAME`, `PHONENUMBER`, `USERNAME`, `PASSWORD`) VALUES
('akash', 'k', 2147483647, 'akash123', '123'),
('fhf', 'khk', 6868, 'gjh', '1'),
('MAHARSH', 'G R', 990204362, 'MAHARSHGR', '123'),
('nischal', 'n', 779757498, 'nichal', '321'),
('RAM', 'RQ', 808080912, 'RAM', '123');

--
-- Triggers `owner_signup`
--
DELIMITER $$
CREATE TRIGGER `OWNER_UPDATE` AFTER INSERT ON `owner_signup` FOR EACH ROW BEGIN INSERT INTO owner(NAME,USERNAME,PASSWORD)VALUES(NEW.FIRSTNAME,NEW.USERNAME,NEW.PASSWORD); END
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



INSERT INTO `pg` (`PG_ID`, `PG_NAME`, `NO_OF_ROOMS`, `LANDMARK`, `LOCATION`, `OWNER_ID`, `ROOMS_FILLED`, `ROOMS_VACANT`, `FACILITIES`, `FOOD`) VALUES
(1, 'SHIVAPG', 5, 'NEAR POLAR BEAR', 'RR NAGAR', 1, 3, 2, 'WIFI', 'VEG'),
(2, 'ARUN PG', 3, 'NEAR ARCADE', 'RR NAGAR', 1, 2, 1, 'WIFI', 'VEG'),
(3, 'HARI PG', 3, 'NEAR PETROL BUNK', 'CHANDRALAYOUT', 2, 2, 1, 'WIFI', 'VEG'),
(4, 'SHARMA PG', 2, 'METRO STATION', 'VIJAYANAGAR', 4, 2, 0, 'WIFI', 'VEG'),
(5, 'ROHITH PG', 2, 'PETROL BUNK', 'MOODALPALYA', 2, 0, 2, 'WIFI', 'VEG AND NON-VEG');



CREATE TABLE `signup` (
  `FIRSTNAME` varchar(30) NOT NULL,
  `LASTNAME` varchar(30) DEFAULT NULL,
  `PHONENUMBER` bigint(20) DEFAULT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `signup` (`FIRSTNAME`, `LASTNAME`, `PHONENUMBER`, `USERNAME`, `PASSWORD`) VALUES
('NISHANTH', 'C', 4141, 'DADFAFF', '421'),
('jeevan', 'um', 42141241, 'j1', '123'),
('Lkhith', 'C', 908018351, 'likhi', '123'),
('MAHARSH', 'G R', 9902043623, 'MAHARSHGR', '123'),
('manish', 'mv', 8980842121, 'manish', '123'),
('nischal', 'n', 6362245161, 'nischal10', '123');


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
  ADD PRIMARY KEY (`USERNAME`,`PASSWORD`);

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
  ADD PRIMARY KEY (`USERNAME`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flat`
--
ALTER TABLE `flat`
  MODIFY `FLAT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `OWNER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pg`
--
ALTER TABLE `pg`
  MODIFY `PG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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


