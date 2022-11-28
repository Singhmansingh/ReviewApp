-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 28, 2022 at 07:29 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reviewdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `carid` int(11) NOT NULL,
  `make` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`carid`, `make`, `color`) VALUES
(1, 'honda', 'blue'),
(2, 'honda', 'green'),
(3, 'honda', 'silver'),
(4, 'toyota', 'red'),
(5, 'toyota', 'black'),
(6, 'toyota', 'blue'),
(7, 'hyundai', 'red'),
(8, 'tesla', 'white'),
(9, 'ford', 'silver'),
(10, 'ford', 'black'),
(11, 'hyundai', 'black'),
(12, 'hyundai', 'purple'),
(13, 'mitsubishi', 'red'),
(14, 'pontiac', 'green'),
(15, 'porsche', 'red'),
(16, 'royals royce', 'black'),
(17, 'mercedes', 'blue'),
(18, 'mercedes', 'silver'),
(19, 'mercedes', 'silver'),
(20, 'mercedes', 'green');

-- --------------------------------------------------------

--
-- Table structure for table `rentals`
--

CREATE TABLE `rentals` (
  `rentalid` int(11) NOT NULL,
  `rentaldate` date DEFAULT NULL,
  `carid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rentals`
--

INSERT INTO `rentals` (`rentalid`, `rentaldate`, `carid`) VALUES
(1, '2022-07-20', 3),
(2, '2022-03-11', 2),
(3, '2022-07-15', 1),
(4, '2022-06-06', 5),
(5, '2022-05-22', 6),
(6, '2022-01-30', 7),
(7, '2022-02-04', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`carid`);

--
-- Indexes for table `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`rentalid`),
  ADD KEY `carid` (`carid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `carid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `rentals`
--
ALTER TABLE `rentals`
  MODIFY `rentalid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rentals`
--
ALTER TABLE `rentals`
  ADD CONSTRAINT `rentals_ibfk_1` FOREIGN KEY (`carid`) REFERENCES `cars` (`carid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
