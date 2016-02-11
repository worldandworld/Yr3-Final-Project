-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 11, 2016 at 09:27 AM
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
CREATE DATABASE IF NOT EXISTS `accounting` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `accounting`;

-- --------------------------------------------------------

--
-- Table structure for table `Accounts`
--

DROP TABLE IF EXISTS `Accounts`;
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

DROP TABLE IF EXISTS `Chitties`;
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

DROP TABLE IF EXISTS `ChittyTransactions`;
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

DROP TABLE IF EXISTS `ChittyUsers`;
CREATE TABLE `ChittyUsers` (
  `UserId` int(11) NOT NULL,
  `ChittyID` int(11) NOT NULL,
  `LatePaymentFee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `UserAccounts`
--

DROP TABLE IF EXISTS `UserAccounts`;
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

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `UserId` int(11) NOT NULL,
  `UserName` varchar(45) NOT NULL,
  `UserNameVerified` tinyint(1) DEFAULT '0',
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
  `IdVirified` tinyint(1) DEFAULT '0',
  `UserType` int(11) DEFAULT NULL COMMENT 'Admin, Standard User, Manager etc',
  `OverDraftLimit` int(11) DEFAULT NULL COMMENT 'if User accont can go negative and the limit',
  `Stayanonymous` tinyint(1) DEFAULT '0',
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
(15, 'Debo', NULL, '7b60577c67b4b6b0b3f49411aee412cecc8d23a028359de1f385a01046582f0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c3f9f3cae8e4a47c'),
(16, 'demian', NULL, 'b4f49b24f8c5c470ca8a4ea0f172d74b22c8f74533cd2337d2d6950d7f690dc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '863f53d35ead927'),
(17, 'Jacccckkkk', NULL, 'bb2bb4f54abd2ca069292f9f2d3fcefd6fda32e0dc2dd86697eb5176adce1a5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8dadf8c2294696'),
(19, 'mathews', 0, 'E<\rI""=,0H12|?V{D`', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, 'M;~2\n'),
(20, 'aziz', 0, '2c427c6138ead0c91c341c2572eed9b19a6a7d85f9243882747d6e9b29d3366', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, '68f037359de42a3249e15d619e291c'),
(21, 'adam', 0, '•ŸE>£ìçÇª;¾Ö2SÃ˜¸7û±/Ë3Ñù`ð=\nÐ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, 'Ýó¢ÀÛ\Z­j`)M5 '),
(22, 'ajax', 0, '[B@31fa4412', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, 'îc\\^Nd}7Ü{îh§'),
(23, 'jacccck', 0, 'ffffffb01affffff995546ffffff9cffffffabffffff9b70ffffffc1fffffff6ffffffa617ffffff89ffffff9effffffffeffffff966b76ffffff9b50fffffff22c66ffffffa8167e3a42b6d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, '4461ffffffeb486515ffffffe350ffffff8affffffe7ffffffa81affffffdb15ffffffdb1d'),
(25, 'run', 0, '20701effffffafffffffbcffffffe6ffffffb9ffffffbeffffffca1ffffffed1affffffd9ffffffea6957ffffff95ffffffa6ffffffe4fffffff768ffffffceffffffb931ffffffb7ffffffcaffffffe42ffffffebffffffe640ffffffe4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, 'ffffffc0ffffff9d553a106dffffff95fffffff248ffffffc919ffffffd13effffff8effffffedffffffe4'),
(26, 'sasas', 0, '3oAXPPgLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, '/]hg?C[\0?'),
(27, 'abdulffs', 0, 'OjV_.TM~PnY+Mq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, '3XKv}W'),
(28, 'Demon', 0, 'ffffff94ffffffc368ffffffcb6362fffffff110ffffffb5ffffffa5ffffffe8ffffff80fffffffbaffffff8effffff96fffffff61dffffff89ffffff88ffffffc0ffffffb6fffffff75b3dffffff81ffffffc63d6ed7862', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, '5e7317a651526ffffff93fffffffdffffff92ffffff81ffffff90ffffffa7284b66'),
(29, 'Neutral', 0, '2fffffffde752b4effffffbc575870ffffffc816ffffff9bfffffff6393effffffbdffffffcfffffffd7507a4fbffffffb20ffffffe3ffffffd83b69ffffffa872145d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, '44ffffffc7ffffffb45634ffffff9bffffff902f8ffffff87ffffffbdd63ffffffd696b'),
(30, 'Killian', 0, '77fffffffaffffffa757ffffffc746ffffff81ffffffb247fffffffdffffffa0ffffffd7323afffffffe2963ffffffca22045ffffffafffffffc4e5ffffffff3ffffffa7a27ffffffd28ffffffc3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, 'ffffff984077ffffffaf393effffffccffffffcdffffff94ffffffdbffffffc07bffffffcdffffffbb2fffffffbd'),
(31, 'beast', 0, 'ffffffe346ffffffa758ffffffafffffffb74effffffd8ffffffdaffffffdb3dffffffd822f202a3c6b7ffffffc632ffffff82ffffffd5fffffff6fffffffe12aa79ffffffdb10fffffff6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, 'fffffff7ffffffce1b574ffffffa0ffffffa2ffffffc33d1cffffff805657bfffffff3ffffff99'),
(32, 'gdejskk', 0, '45ffffffbfffffff98122bffffff9dffffff9814918ffffffecffffffe2035ffffff97f6b71633c3d16ffffffc54c2dffffffcfffffffc2fffffff9fffffffaffffff8affffffd51e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, 'ffffff8bffffffb21e5effffffcfffffff9724312a64fffffff259fffffff1ffffffcbffffffbb39');

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
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
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
