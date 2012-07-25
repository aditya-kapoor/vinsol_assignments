-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 24, 2012 at 10:35 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `articles`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `artID` varchar(10) NOT NULL,
  `userID` varchar(10) NOT NULL,
  `catogaryID` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`artID`),
  KEY `catogaryID` (`catogaryID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articles`
--

INSERT DELAYED IGNORE INTO `articles` (`artID`, `userID`, `catogaryID`, `name`) VALUES
('A1', 'U1', 'C1', 'A1'),
('A10', 'U1', 'C3', 'A10'),
('A2', 'U2', 'C2', 'A2'),
('A3', 'U2', 'C1', 'A3'),
('A4', 'U2', 'C3', 'A4'),
('A5', 'U2', 'C4', 'A5'),
('A6', 'U2', 'C5', 'A6'),
('A7', 'U2', 'C1', 'A7'),
('A8', 'U1', 'C2', 'A8'),
('A9', 'U1', 'C3', 'A9');

-- --------------------------------------------------------

--
-- Table structure for table `catogary`
--

DROP TABLE IF EXISTS `catogary`;
CREATE TABLE IF NOT EXISTS `catogary` (
  `catID` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`catID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catogary`
--

INSERT DELAYED IGNORE INTO `catogary` (`catID`, `name`) VALUES
('C1', 'Art'),
('C2', 'Technology'),
('C3', 'Spiritual'),
('C4', 'Culture'),
('C5', 'Business');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `commID` varchar(10) NOT NULL,
  `userID` varchar(10) NOT NULL,
  `artID` varchar(10) NOT NULL,
  PRIMARY KEY (`commID`),
  KEY `userID` (`userID`),
  KEY `artID` (`artID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT DELAYED IGNORE INTO `comments` (`commID`, `userID`, `artID`) VALUES
('Comm1', 'U1', 'A1'),
('Comm10', 'U2', 'A2'),
('Comm11', 'U1', 'A1'),
('Comm12', 'U1', 'A1'),
('Comm13', 'U1', 'A3'),
('Comm14', 'U1', 'A4'),
('Comm15', 'U2', 'A5'),
('Comm16', 'U2', 'A6'),
('Comm17', 'U1', 'A10'),
('Comm18', 'U1', 'A9'),
('Comm19', 'U1', 'A10'),
('Comm2', 'U1', 'A1'),
('Comm20', 'U1', 'A8'),
('comm21', 'U2', 'A2'),
('comm22', 'U1', 'A2'),
('Comm3', 'U2', 'A1'),
('Comm4', 'U2', 'A2'),
('Comm5', 'U2', 'A1'),
('Comm6', 'U1', 'A3'),
('Comm7', 'U1', 'A4'),
('Comm8', 'U2', 'A5'),
('Comm9', 'U2', 'A2');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userID` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT DELAYED IGNORE INTO `users` (`userID`, `name`, `type`) VALUES
('U1', 'Aditya', 'admin'),
('U2', 'ABC', 'normal');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`catogaryID`) REFERENCES `catogary` (`catID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`artID`) REFERENCES `articles` (`artID`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;