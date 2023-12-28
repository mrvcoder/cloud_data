-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2023 at 11:09 PM
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
-- Database: `cloud_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `cloud_data`
--

CREATE TABLE `cloud_data` (
  `IP_Address` longtext DEFAULT NULL,
  `Common_Name` longtext DEFAULT NULL,
  `Organization` longtext DEFAULT NULL,
  `Country` longtext DEFAULT NULL,
  `Locality` longtext DEFAULT NULL,
  `Province` longtext DEFAULT NULL,
  `Subject_Alternative_DNS_Name` longtext DEFAULT NULL,
  `Subject_Alternative_IP_address` longtext DEFAULT NULL,
  `Self-signed` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
