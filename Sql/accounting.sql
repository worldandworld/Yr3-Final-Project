-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 08, 2016 at 04:08 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accounting`
--

-- --------------------------------------------------------

--
-- Table structure for table `Accounts`
--

CREATE TABLE `Accounts` (
  `AccID` int(11) NOT NULL,
  `AccName` varchar(45) NOT NULL,
  `DefaultCreditInterestRate` double NOT NULL,
  `CreditInterestTerm` int(11) NOT NULL,
  `DefaultCreditInterestCalculationTerm` int(11) DEFAULT NULL,
  `DefaultDebitInterestRate` double NOT NULL,
  `DefaultDebtInterestTerm` int(11) DEFAULT NULL,
  `DefaultDebtInterestCalculationTerm` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Chitties`
--

CREATE TABLE `Chitties` (
  `ChittyID` int(11) NOT NULL,
  `ChittyName` varchar(45) NOT NULL,
  `ChittyStatus` int(11) NOT NULL COMMENT '01 Not Started, 01 Active, 02  Closed',
  `OpeningDate` datetime NOT NULL,
  `ClosingDate` datetime NOT NULL,
  `Term` int(11) NOT NULL COMMENT 'The number of times the auction or similar activity occurs ',
  `TermUnit` int(11) NOT NULL COMMENT 'Like Monthly, Weekly, Daily etc',
  `RemainingTerm` int(11) NOT NULL COMMENT 'Number of terms left to complete the chitty'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ChittyTransactions`
--

CREATE TABLE `ChittyTransactions` (
  `ChittyTransactionID` int(11) NOT NULL,
  `ChittyNo` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `ChtyTermNo` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `TransRefence` varchar(50) DEFAULT NULL COMMENT 'Reference from actual Bank transaction',
  `TransStatus` int(11) DEFAULT NULL COMMENT 'If Transaction Pending or Cleared',
  `ClearanceDate` datetime DEFAULT NULL,
  `PaymentMethod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ChittyUsers`
--

CREATE TABLE `ChittyUsers` (
  `UserId` int(11) NOT NULL,
  `ChittyID` int(11) NOT NULL,
  `LatePaymentFee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `UserAccounts`
--

CREATE TABLE `UserAccounts` (
  `UserID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `CreditInterestRate` double NOT NULL,
  `CreditInterestTerm` int(11) NOT NULL,
  `CreditInterestCalculationTerm` int(11) DEFAULT NULL,
  `DebitInterestRate` double NOT NULL,
  `DebtInterestTerm` int(11) DEFAULT NULL,
  `DebtInterestCalculationTerm` int(11) DEFAULT NULL,
  `AccStatus` int(11) NOT NULL COMMENT '01 Not Started, 01 Active, 02  Closed',
  `OpeningDate` datetime NOT NULL,
  `ClosingDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `UserId` int(11) NOT NULL,
  `UserName` varchar(45) NOT NULL,
  `UserNameVerified` tinyint(1) DEFAULT NULL,
  `UserPassword` varchar(200) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Town` varchar(25) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL,
  `Country` varchar(25) DEFAULT NULL,
  `PostCode` varchar(25) DEFAULT NULL,
  `Phone 1` varchar(15) DEFAULT NULL,
  `Phone 2` varchar(15) DEFAULT NULL,
  `IDType` varchar(15) DEFAULT NULL,
  `AddressProofType` varchar(15) DEFAULT NULL,
  `IDRef` varchar(15) DEFAULT NULL,
  `AddressRef` varchar(15) DEFAULT NULL,
  `IdVirified` tinyint(1) DEFAULT NULL,
  `UserType` int(11) DEFAULT NULL COMMENT 'Admin, Standard User, Manager etc',
  `OverDraftLimit` int(11) DEFAULT NULL COMMENT 'if User accont can go negative and the limit',
  `Stayanonymous` tinyint(1) DEFAULT NULL,
  `AnonymusName` varchar(45) DEFAULT NULL,
  `passwordSalt` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UserId`, `UserName`, `UserNameVerified`, `UserPassword`, `FirstName`, `MiddleName`, `LastName`, `Address`, `Town`, `State`, `Country`, `PostCode`, `Phone 1`, `Phone 2`, `IDType`, `AddressProofType`, `IDRef`, `AddressRef`, `IdVirified`, `UserType`, `OverDraftLimit`, `Stayanonymous`, `AnonymusName`, `passwordSalt`) VALUES
(1, 'JohnnyC', 1, 'password', 'John', 'M', 'Crane', '123 Dublin Road', 'Dundalk', 'Louth', 'Ireland', 'M3DNS', '0897352426', '0976567865', 'Photo', 'Bill', '87393bujdw', 'unwdjni9', 1, 1, 1000, 0, 'Yo', 'dash'),
(2, 'vchfgbfdv', NULL, 'fgbfdbfgb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'gfbfgbb', NULL, 'fgbfgbfgb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'John', NULL, 'slayer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'ergreergt', NULL, 'ergtgetg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'dfgfvfv', NULL, 'fevgrbgbbt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Abdul', NULL, 'password', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Abdulfss', NULL, '[B@4efe9f2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'èA½Ã {Wo'),
(9, 'Johnny', NULL, '[18, -78, -39, -119, -13, 88, -76, -3, -1, 5, 72, 38, 69, 18, -11, -123, -29, -95, -92, -35, 13, -110, -1, -111, 65, -79, -108, -15, 57, 125, 53, -38]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'R°;¸ñÓ,ô'),
(10, 'CODEDEMON', NULL, '[-67, 60, -83, 43, 29, 55, -62, -97, 7, -110, 3, -71, 117, 33, 19, -86, -94, 117, -27, 19, 51, -81, -122, 125, -94, 48, 104, -73, 82, -70, 41, -112]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[-117, -21, -83, -22, 5, 59, 92, 42]'),
(11, 'hvhvg', NULL, '[-104, 9, 116, -85, 61, 58, -21, 34, 125, 49, 28, -57, -97, -118, 4, -105, -47, -92, 106, -69, -4, 29, 67, 95, 42, -42, -13, -41, -82, 108, -55, 118]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[-123, -101, 64, 115, -49, -97, -127, 90]'),
(12, 'vfdbdbdbf', NULL, '5bbfeea5ef7c9f4e9c3463282df5b68a6e31d6c1a8ff5222eb422ec4d93c88', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f7f7e9e64ced92c'),
(13, '''*''', NULL, '27c8fdeb09beb84a359c2cab92f8bb05acf351bf46a9975f1e52cd69bd2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fc75d08040351ef3'),
(14, 'dwdsv', NULL, 'c41899aa9577467c9c732f2b9ebf45d354e6e4244ebae86c157e792e937ecfe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1afcc492374088f7'),
(15, 'Debo', NULL, '7b60577c67b4b6b0b3f49411aee412cecc8d23a028359de1f385a01046582f0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c3f9f3cae8e4a47c');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Accounts`
--
ALTER TABLE `Accounts`
  ADD PRIMARY KEY (`AccID`);

--
-- Indexes for table `Chitties`
--
ALTER TABLE `Chitties`
  ADD PRIMARY KEY (`ChittyID`);

--
-- Indexes for table `ChittyTransactions`
--
ALTER TABLE `ChittyTransactions`
  ADD PRIMARY KEY (`ChittyTransactionID`),
  ADD UNIQUE KEY `ChittyTransactionID_UNIQUE` (`ChittyTransactionID`),
  ADD KEY `fk_userfk` (`UserID`);

--
-- Indexes for table `ChittyUsers`
--
ALTER TABLE `ChittyUsers`
  ADD PRIMARY KEY (`UserId`,`ChittyID`),
  ADD KEY `ChittyID_idx` (`ChittyID`);

--
-- Indexes for table `UserAccounts`
--
ALTER TABLE `UserAccounts`
  ADD PRIMARY KEY (`UserID`,`AccountID`),
  ADD KEY `fk_acnt` (`AccountID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `UserName_UNIQUE` (`UserName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Accounts`
--
ALTER TABLE `Accounts`
  MODIFY `AccID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Chitties`
--
ALTER TABLE `Chitties`
  MODIFY `ChittyID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ChittyTransactions`
--
ALTER TABLE `ChittyTransactions`
  MODIFY `ChittyTransactionID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ChittyTransactions`
--
ALTER TABLE `ChittyTransactions`
  ADD CONSTRAINT `fk_userfk` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserId`);

--
-- Constraints for table `ChittyUsers`
--
ALTER TABLE `ChittyUsers`
  ADD CONSTRAINT `fk_chittyid` FOREIGN KEY (`ChittyID`) REFERENCES `Chitties` (`ChittyID`),
  ADD CONSTRAINT `fk_userid` FOREIGN KEY (`UserId`) REFERENCES `Users` (`UserId`);

--
-- Constraints for table `UserAccounts`
--
ALTER TABLE `UserAccounts`
  ADD CONSTRAINT `fk_acnt` FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccID`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
