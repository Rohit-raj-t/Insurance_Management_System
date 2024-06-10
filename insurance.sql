-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2018 at 11:44 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insurance`
--

-- --------------------------------------------------------

--
-- Table structure for table `branchtable`
--

CREATE TABLE `branchtable` (
  `Id` int(11) NOT NULL,
  `branchcode` varchar(50) NOT NULL,
  `branchName` varchar(50) NOT NULL,
  `branchAddress` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branchtable`
--

INSERT INTO `branchtable` (`Id`, `branchcode`, `branchName`, `branchAddress`) VALUES
(1, 'br232', 'xyzxyz', 'xyz xyz');

-- --------------------------------------------------------

--
-- Table structure for table `clienttable`
--

CREATE TABLE `clienttable` (
  `Id` int(11) NOT NULL,
  `clientName` varchar(50) NOT NULL,
  `clientContact` varchar(50) NOT NULL,
  `clientAddress` varchar(150) NOT NULL,
  `clientAdhaar` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clienttable`
--

INSERT INTO `clienttable` (`Id`, `clientName`, `clientContact`, `clientAddress`, `clientAdhaar`) VALUES
(1, 'arnold', '52332234442', 'xyz xyz xyz', '123432234');

-- --------------------------------------------------------

--
-- Table structure for table `employeetable`
--

CREATE TABLE `employeetable` (
  `SId` int(11) NOT NULL,
  `BCode` varchar(50) NOT NULL,
  `EmployeeName` varchar(50) NOT NULL,
  `EmployeeContact` varchar(15) NOT NULL,
  `EmployeeAddress` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employeetable`
--

INSERT INTO `employeetable` (`SId`, `BCode`, `EmployeeName`, `EmployeeContact`, `EmployeeAddress`) VALUES
(1, 'br232', 'john', '23232323432', 'xyzxyz xyz'),
(2, 'br232', 'smith', '453423423', 'xyz xyz xyz');

-- --------------------------------------------------------

--
-- Table structure for table `insurancetable`
--

CREATE TABLE `insurancetable` (
  `Id` int(11) NOT NULL,
  `ClientsName` varchar(50) NOT NULL,
  `insuranceNum` varchar(100) NOT NULL,
  `insuranceType` varchar(50) NOT NULL,
  `Amount` double NOT NULL DEFAULT '0',
  `PayMonth` varchar(45) NOT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `BranchName` varchar(45) NOT NULL,
  `EmployeeName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insurancetable`
--

INSERT INTO `insurancetable` (`Id`, `ClientsName`, `insuranceNum`, `insuranceType`, `Amount`, `PayMonth`, `StartDate`, `EndDate`, `BranchName`, `EmployeeName`) VALUES
(1, 'arnold', '432432', 'Life Insurance', 440000, '444', '2018-09-06 15:13:40', '2022-09-06 15:13:40', 'br232', 'john');

-- --------------------------------------------------------

--
-- Table structure for table `paymenttable`
--

CREATE TABLE `paymenttable` (
  `Id` int(11) NOT NULL,
  `PayDate` datetime DEFAULT NULL,
  `client` varchar(50) NOT NULL,
  `Insurance` varchar(50) NOT NULL,
  `PayMonth` varchar(150) NOT NULL,
  `PayYear` varchar(150) NOT NULL,
  `PayAmount` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymenttable`
--

INSERT INTO `paymenttable` (`Id`, `PayDate`, `client`, `Insurance`, `PayMonth`, `PayYear`, `PayAmount`) VALUES
(1, '2018-09-06 15:14:11', 'arnold', '432432', 'Sep', '2018', 444);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branchtable`
--
ALTER TABLE `branchtable`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `branchcode` (`branchcode`);

--
-- Indexes for table `clienttable`
--
ALTER TABLE `clienttable`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `employeetable`
--
ALTER TABLE `employeetable`
  ADD PRIMARY KEY (`SId`),
  ADD KEY `par_ind` (`BCode`);

--
-- Indexes for table `insurancetable`
--
ALTER TABLE `insurancetable`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `paymenttable`
--
ALTER TABLE `paymenttable`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branchtable`
--
ALTER TABLE `branchtable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clienttable`
--
ALTER TABLE `clienttable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employeetable`
--
ALTER TABLE `employeetable`
  MODIFY `SId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `insurancetable`
--
ALTER TABLE `insurancetable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `paymenttable`
--
ALTER TABLE `paymenttable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employeetable`
--
ALTER TABLE `employeetable`
  ADD CONSTRAINT `fk_branchTable` FOREIGN KEY (`BCode`) REFERENCES `branchtable` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
