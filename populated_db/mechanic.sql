-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Mar-2023 às 11:47
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mechanic`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `bills`
--

CREATE TABLE `bills` (
  `BillID` int(11) NOT NULL,
  `EmissionDate` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cars`
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
-- Estrutura da tabela `clients`
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
-- Estrutura da tabela `jobs`
--

CREATE TABLE `jobs` (
  `JobID` int(11) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Description` varchar(25) NOT NULL,
  `PaymentHour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `jobs`
--

INSERT INTO `jobs` (`JobID`, `Name`, `Description`, `PaymentHour`) VALUES
(1, 'CEO', 'da owna', 2147483647),
(2, 'Service Manager', 'This is a managerial posi', 1200),
(3, 'Shop Foreman', 'This person supervises th', 950),
(4, 'Diagnostic Technician', 'This is a specialized rol', 900),
(5, 'Automotive Technician', 'This is a common job titl', 850);

-- --------------------------------------------------------

--
-- Estrutura da tabela `parts`
--

CREATE TABLE `parts` (
  `PartID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Shop` varchar(255) NOT NULL,
  `PurchasePrice` int(11) NOT NULL,
  `RetailPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `parts`
--

INSERT INTO `parts` (`PartID`, `Name`, `Description`, `Shop`, `PurchasePrice`, `RetailPrice`) VALUES
(1, 'Spark plugs', 'SPARK PLUG - THREAD Ø10MM', 'https://motorpoint.pt/en/spark-plugs/18-spark-plug-thread-o10mm-3701225400237.html', 4, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `partsused`
--

CREATE TABLE `partsused` (
  `PartsUsedID` int(11) NOT NULL,
  `PartID` int(11) NOT NULL,
  `Quantidy` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `service`
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
-- Estrutura da tabela `timelinecustom`
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
-- Estrutura da tabela `timelinedata`
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
-- Estrutura da tabela `timelinetype`
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
-- Estrutura da tabela `workers`
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
-- Extraindo dados da tabela `workers`
--

INSERT INTO `workers` (`WorkerID`, `FirstName`, `LastName`, `PhoneNumber`, `Nif`, `Iban`, `JobID`, `JobHours`) VALUES
(1, 'Rodrigo', 'Monteiro', 123456789, 265315050, 'PT57003506518297336485929', 1, 0),
(2, 'André', 'Almeida', 987654321, 265365550, 'PT57003506518297366484929', 5, 0),
(3, 'Francisco', 'Dias', 123123123, 267355550, 'PT57007502515297366484929', 5, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`BillID`),
  ADD KEY `ServiceID` (`ServiceID`),
  ADD KEY `ClientID` (`ClientID`);

--
-- Índices para tabela `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`CarID`);

--
-- Índices para tabela `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ClientID`),
  ADD KEY `FirstName` (`FirstName`,`LastName`);

--
-- Índices para tabela `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`JobID`);

--
-- Índices para tabela `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`PartID`);

--
-- Índices para tabela `partsused`
--
ALTER TABLE `partsused`
  ADD PRIMARY KEY (`PartsUsedID`),
  ADD KEY `PartID` (`PartID`),
  ADD KEY `ServiceID` (`ServiceID`);

--
-- Índices para tabela `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`ServiceID`),
  ADD KEY `ClientID` (`ClientID`),
  ADD KEY `CarID` (`CarID`),
  ADD KEY `WorkerID` (`WorkerID`),
  ADD KEY `BillID` (`BillID`);

--
-- Índices para tabela `timelinecustom`
--
ALTER TABLE `timelinecustom`
  ADD PRIMARY KEY (`TLCID`),
  ADD KEY `TLDID` (`TLDID`);

--
-- Índices para tabela `timelinedata`
--
ALTER TABLE `timelinedata`
  ADD PRIMARY KEY (`TLDID`),
  ADD KEY `ServiceID` (`ServiceID`),
  ADD KEY `ClientID` (`ClientID`),
  ADD KEY `TLTID` (`TLTID`);

--
-- Índices para tabela `timelinetype`
--
ALTER TABLE `timelinetype`
  ADD PRIMARY KEY (`TLTID`);

--
-- Índices para tabela `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`WorkerID`),
  ADD KEY `JobID` (`JobID`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`),
  ADD CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`);

--
-- Limitadores para a tabela `partsused`
--
ALTER TABLE `partsused`
  ADD CONSTRAINT `partsused_ibfk_1` FOREIGN KEY (`PartID`) REFERENCES `parts` (`PartID`),
  ADD CONSTRAINT `partsused_ibfk_2` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`);

--
-- Limitadores para a tabela `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`),
  ADD CONSTRAINT `service_ibfk_2` FOREIGN KEY (`CarID`) REFERENCES `cars` (`CarID`),
  ADD CONSTRAINT `service_ibfk_3` FOREIGN KEY (`WorkerID`) REFERENCES `workers` (`WorkerID`);

--
-- Limitadores para a tabela `timelinecustom`
--
ALTER TABLE `timelinecustom`
  ADD CONSTRAINT `timelinecustom_ibfk_1` FOREIGN KEY (`TLDID`) REFERENCES `timelinedata` (`TLDID`);

--
-- Limitadores para a tabela `timelinedata`
--
ALTER TABLE `timelinedata`
  ADD CONSTRAINT `timelinedata_ibfk_1` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`),
  ADD CONSTRAINT `timelinedata_ibfk_2` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`),
  ADD CONSTRAINT `timelinedata_ibfk_3` FOREIGN KEY (`TLTID`) REFERENCES `timelinetype` (`TLTID`);

--
-- Limitadores para a tabela `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`JobID`) REFERENCES `jobs` (`JobID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
