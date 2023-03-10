-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2023 at 08:09 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mechanic`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `BillID` int(11) NOT NULL,
  `EmissionDate` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `CarID` int(11) NOT NULL,
  `Brand` varchar(25) NOT NULL,
  `Model` varchar(25) NOT NULL,
  `Color` varchar(25) NOT NULL,
  `Plate` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `ClientID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `Nif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `JobID` int(11) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Description` varchar(25) NOT NULL,
  `PaymentHour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `PartID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Shop` varchar(255) NOT NULL,
  `PurchasePrice` int(11) NOT NULL,
  `RetailPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `partsused`
--

CREATE TABLE `partsused` (
  `PartsUsedID` int(11) NOT NULL,
  `PartID` int(11) NOT NULL,
  `Quantidy` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `ServiceID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `CarID` int(11) NOT NULL,
  `WorkerID` int(11) NOT NULL,
  `BillID` int(11) NOT NULL,
  `Details` text DEFAULT NULL,
  `DateReceived` int(11) NOT NULL,
  `DateFinished` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `timelinecustom`
--

CREATE TABLE `timelinecustom` (
  `TLCID` int(11) NOT NULL,
  `TLDID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `steps` int(11) NOT NULL,
  `step1` varchar(255) DEFAULT NULL,
  `step2` varchar(255) DEFAULT NULL,
  `step3` varchar(255) DEFAULT NULL,
  `step4` varchar(255) DEFAULT NULL,
  `step5` varchar(255) DEFAULT NULL,
  `step6` varchar(255) DEFAULT NULL,
  `step7` varchar(255) DEFAULT NULL,
  `step8` varchar(255) DEFAULT NULL,
  `step9` varchar(255) DEFAULT NULL,
  `step10` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `timelinedata`
--

CREATE TABLE `timelinedata` (
  `TLDID` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `TLTID` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `timelinetype`
--

CREATE TABLE `timelinetype` (
  `TLTID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `steps` int(11) NOT NULL,
  `step1` varchar(255) DEFAULT NULL,
  `step2` varchar(255) DEFAULT NULL,
  `step3` varchar(255) DEFAULT NULL,
  `step4` varchar(255) DEFAULT NULL,
  `step5` varchar(255) DEFAULT NULL,
  `step6` varchar(255) DEFAULT NULL,
  `step7` varchar(255) DEFAULT NULL,
  `step8` varchar(255) DEFAULT NULL,
  `step9` varchar(255) DEFAULT NULL,
  `step10` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

CREATE TABLE `workers` (
  `WorkerID` int(11) NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `Nif` int(11) NOT NULL,
  `Iban` varchar(25) NOT NULL,
  `JobID` int(11) NOT NULL,
  `JobHours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`BillID`),
  ADD KEY `ServiceID` (`ServiceID`),
  ADD KEY `ClientID` (`ClientID`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`CarID`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ClientID`),
  ADD KEY `FirstName` (`FirstName`,`LastName`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`JobID`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`PartID`);

--
-- Indexes for table `partsused`
--
ALTER TABLE `partsused`
  ADD PRIMARY KEY (`PartsUsedID`),
  ADD KEY `PartID` (`PartID`),
  ADD KEY `ServiceID` (`ServiceID`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`ServiceID`),
  ADD KEY `ClientID` (`ClientID`),
  ADD KEY `CarID` (`CarID`),
  ADD KEY `WorkerID` (`WorkerID`),
  ADD KEY `BillID` (`BillID`);

--
-- Indexes for table `timelinecustom`
--
ALTER TABLE `timelinecustom`
  ADD PRIMARY KEY (`TLCID`),
  ADD KEY `TLDID` (`TLDID`);

--
-- Indexes for table `timelinedata`
--
ALTER TABLE `timelinedata`
  ADD PRIMARY KEY (`TLDID`),
  ADD KEY `ServiceID` (`ServiceID`),
  ADD KEY `ClientID` (`ClientID`),
  ADD KEY `TLTID` (`TLTID`);

--
-- Indexes for table `timelinetype`
--
ALTER TABLE `timelinetype`
  ADD PRIMARY KEY (`TLTID`);

--
-- Indexes for table `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`WorkerID`),
  ADD KEY `JobID` (`JobID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`),
  ADD CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`);

--
-- Constraints for table `partsused`
--
ALTER TABLE `partsused`
  ADD CONSTRAINT `partsused_ibfk_1` FOREIGN KEY (`PartID`) REFERENCES `parts` (`PartID`),
  ADD CONSTRAINT `partsused_ibfk_2` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`),
  ADD CONSTRAINT `service_ibfk_2` FOREIGN KEY (`CarID`) REFERENCES `cars` (`CarID`),
  ADD CONSTRAINT `service_ibfk_3` FOREIGN KEY (`WorkerID`) REFERENCES `workers` (`WorkerID`);

--
-- Constraints for table `timelinecustom`
--
ALTER TABLE `timelinecustom`
  ADD CONSTRAINT `timelinecustom_ibfk_1` FOREIGN KEY (`TLDID`) REFERENCES `timelinedata` (`TLDID`);

--
-- Constraints for table `timelinedata`
--
ALTER TABLE `timelinedata`
  ADD CONSTRAINT `timelinedata_ibfk_1` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`),
  ADD CONSTRAINT `timelinedata_ibfk_2` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`),
  ADD CONSTRAINT `timelinedata_ibfk_3` FOREIGN KEY (`TLTID`) REFERENCES `timelinetype` (`TLTID`);

--
-- Constraints for table `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`JobID`) REFERENCES `jobs` (`JobID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
