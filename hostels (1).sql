-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2023 at 07:16 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hostels`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `pincode` varchar(6) NOT NULL,
  `No_of_pgs` int(11) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `no_of_hostels` int(11) DEFAULT NULL,
  `locality` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`pincode`, `No_of_pgs`, `city`, `no_of_hostels`, `locality`) VALUES
('110051', 1, 'DELHI', 2, 'K. NAGAR'),
('110071', 2, 'PHAGWARA', 1, 'phag'),
('110072', 2, 'DELHI', 1, 'mandawali');

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `ID` int(11) NOT NULL,
  `H_name` varchar(20) DEFAULT NULL,
  `Pincode` char(6) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `Hostel` tinyint(1) DEFAULT NULL,
  `Curfew` time DEFAULT NULL,
  `Phone_number` varchar(10) DEFAULT NULL,
  `Total_no_of_rooms` int(11) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hostel`
--

INSERT INTO `hostel` (`ID`, `H_name`, `Pincode`, `Type`, `Hostel`, `Curfew`, `Phone_number`, `Total_no_of_rooms`, `Capacity`) VALUES
(1, 'SHIV', '110071', 'Boys', 0, '00:00:00', '9898989898', NULL, 200),
(2, 'mohit', '110051', 'Girls', 1, '23:36:00', '9953963660', NULL, 100),
(3, 'heloo', '110072', 'Girls', 0, '12:40:00', '9954687890', NULL, 400);

-- --------------------------------------------------------

--
-- Table structure for table `mess`
--

CREATE TABLE `mess` (
  `no_of_meals` int(11) DEFAULT NULL,
  `Mess_fees` int(11) DEFAULT NULL,
  `Mess_capacity` int(11) DEFAULT NULL,
  `Veg` tinyint(1) DEFAULT NULL,
  `Schedule` blob DEFAULT NULL,
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mess`
--

INSERT INTO `mess` (`no_of_meals`, `Mess_fees`, `Mess_capacity`, `Veg`, `Schedule`, `ID`) VALUES
(2, 23000, 1000, 1, NULL, 1),
(4, 4000, 100, 1, NULL, 2),
(4, 2000, 100, 1, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `owner_details`
--

CREATE TABLE `owner_details` (
  `Owner_name` varchar(20) DEFAULT NULL,
  `Phone_number` varchar(10) NOT NULL,
  `Email_ID` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owner_details`
--

INSERT INTO `owner_details` (`Owner_name`, `Phone_number`, `Email_ID`) VALUES
('KARAN PG', '9898989898', 'ditileb321@hostovz.com'),
('mohit', '9953963660', 'ditileb321@hostovz.com'),
('SSD', '9954687890', 'ditileb321@hostovz.com');

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

CREATE TABLE `room_types` (
  `Attached_Bathroom` tinyint(1) DEFAULT NULL,
  `AC` tinyint(1) DEFAULT NULL,
  `Room_capacity` int(11) DEFAULT NULL,
  `Fees` int(11) DEFAULT NULL,
  `Wifi` tinyint(1) DEFAULT NULL,
  `No_of_rooms` int(11) DEFAULT NULL,
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`Attached_Bathroom`, `AC`, `Room_capacity`, `Fees`, `Wifi`, `No_of_rooms`, `ID`) VALUES
(1, 1, 100, 2300, 1, 2, 1),
(1, 1, 100, 1000, 1, 2, 2),
(0, 0, 0, 0, 0, 0, 2),
(1, 1, 100, 20000, 1, 5, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`pincode`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Pincode` (`Pincode`),
  ADD KEY `Phone_number` (`Phone_number`);

--
-- Indexes for table `mess`
--
ALTER TABLE `mess`
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `owner_details`
--
ALTER TABLE `owner_details`
  ADD PRIMARY KEY (`Phone_number`);

--
-- Indexes for table `room_types`
--
ALTER TABLE `room_types`
  ADD KEY `ID` (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hostel`
--
ALTER TABLE `hostel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hostel`
--
ALTER TABLE `hostel`
  ADD CONSTRAINT `hostel_ibfk_1` FOREIGN KEY (`Pincode`) REFERENCES `area` (`pincode`),
  ADD CONSTRAINT `hostel_ibfk_2` FOREIGN KEY (`Phone_number`) REFERENCES `owner_details` (`Phone_number`);

--
-- Constraints for table `mess`
--
ALTER TABLE `mess`
  ADD CONSTRAINT `mess_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `hostel` (`ID`);

--
-- Constraints for table `room_types`
--
ALTER TABLE `room_types`
  ADD CONSTRAINT `room_types_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `hostel` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
