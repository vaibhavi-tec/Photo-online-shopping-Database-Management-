-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 24, 2023 at 01:35 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `astore`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `UserID` int(11) DEFAULT NULL,
  `FullName` varchar(50) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `PostCode` varchar(6) NOT NULL,
  `City` varchar(28) NOT NULL,
  `Country` varchar(28) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `AddressID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`UserID`, `FullName`, `StreetAddress`, `PostCode`, `City`, `Country`, `Phone`, `AddressID`) VALUES
(1, 'Admin', 'Vanha Maantie 6', '02650', 'Espoo', 'Finland', '0123456789', 1),
(2, 'Anh Pham', 'Vanha Maantie 8', '02650', 'Helsinki', 'Finland', '012 345 6787', 2),
(3, 'adones evangelista', 'Purok1, Brgy.Tan-awan', '6111', 'Kabankalan City', 'Philippines', '09120119912', 3),
(1, 'Admin', 'Vanha Maantie 6', '02650', 'Espoo', 'Finland', '0123456789', 4),
(2, 'Anh Pham', 'Vanha Maantie 8', '02650', 'Helsinki', 'Finland', '012 345 6787', 5),
(3, 'adones evangelista', 'Purok1, Brgy.Tan-awan', '6111', 'Kabankalan City', 'Philippines', '09120119912', 6);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(58) NOT NULL,
  `Description` mediumtext DEFAULT NULL,
  `CategorySlug` varchar(68) NOT NULL,
  `Image` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`, `Description`, `CategorySlug`, `Image`) VALUES
(1, 'Photo Print', 'Varieties of photos', 'Photo-Print', 'passport.jpg'),
(2, 'Photo Album', 'TVs', 'tv', 'baby photoshoot.jpg'),
(3, 'Photo Frames', 'Computers', 'computers', 'frame2.jpg'),
(4, 'Photo Mugs', 'Game Consoles', 'game-console', 'bluemug1.jpg'),
(5, 'Photo Cushion', 'Networks', 'networks', 'cushion1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `MessageID` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Subject` varchar(128) DEFAULT NULL,
  `Content` varchar(158) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order details`
--

CREATE TABLE `order details` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` smallint(2) NOT NULL DEFAULT 1,
  `Total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `SubTotal` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(10,2) DEFAULT NULL,
  `ShippingFee` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `Status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(40) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ProductPrice` decimal(10,2) DEFAULT 0.00,
  `UnitsInStock` smallint(5) DEFAULT 0,
  `Description` varchar(255) NOT NULL,
  `ManufactureYear` smallint(5) NOT NULL,
  `Image` varchar(50) NOT NULL,
  `ProductSlug` varchar(50) NOT NULL,
  `Feature` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `CategoryID`, `ProductPrice`, `UnitsInStock`, `Description`, `ManufactureYear`, `Image`, `ProductSlug`, `Feature`) VALUES
(1, 'Passport', 1, '100.00', 17, 'Planning to travel somewhere. It’s time to get those travel documents ready – passports and visas are your tickets to open doors in other countries. Get them online now – Select Passport and Visa Photo option, upload photos, select country specification, ', 2023, 'passport.jpg', 'Planning to travel somewhere. It’s time to get tho', 1),
(2, '4X6 Photo', 1, '500.22', 15, 'Newer', 2023, '4x6.jpg', '4X6-Photo', 0),
(3, '6X8 Photo', 1, '200.56', 10, 'Sony Full HD', 2023, '6X8.jpg', 'sony-40-inches', 1),
(4, '8X12 Photo', 1, '250.89', 12, 'Samsung LED', 2023, '8X12.jpg', 'samsung-32-inches', 0),
(5, 'Classic Photobook', 2, '100.00', 8, 'Intel-NVIDA-Logitech', 2023, 'classic photo pook.jpg', 'lenovo-pc', 0),
(6, 'Baby Phootoshoot book', 2, '230.00', 6, 'Apple Early 2010', 2023, 'baby photoshoot.jpg', 'macbook-pro', 1),
(7, '8X12 Photo', 3, '600.00', 12, 'Microsoft Future', 2023, '8X12.jpg', 'xbox-five', 0),
(8, 'Standard Photoframe 2', 3, '522.00', 15, 'Sony Tomorrow', 2023, 'frame2.jpg', 'playstation-6', 1),
(9, 'Standard Photoframe 3', 3, '200.00', 16, 'Modem ADSL 8+', 2023, 'frame3.jpg', 'linksys-123', 1),
(10, 'Standard Photoframe 4', 3, '43.00', 22, 'Router Full Speed', 2023, 'frame4.jpg', 'netgear-456', 0),
(11, 'Classic White Mug', 4, '120.00', 17, 'Adobe Power', 2023, 'mug1.jpg', 'adobe-photoshop-cc', 1),
(12, 'Heart Handeled Mug', 4, '1209.00', 16, 'Canon Powerful 3D', 2023, 'redmug1.jpg', 'canon-2222d', 1),
(13, 'Classic Black Mug', 4, '200.00', 14, 'HDMI High Speed Standard', 2023, 'mug2.jpg', 'hdmi-5.0', 1),
(15, 'Cushion', 5, '588.00', 14, 'HDMI High Speed Standard', 2023, 'cushion1.jpg', 'hdmi-5.0', 1),
(16, 'Square Cushion', 5, '688.00', 14, 'HDMI High Speed Standard', 2023, 'cushion2.jpg', 'hdmi-5.0', 1),
(17, 'Heart Cushion', 5, '988.00', 14, 'HDMI High Speed Standard', 2023, 'cushion3.jpg', 'hdmi-5.0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `PostCode` varchar(6) NOT NULL,
  `City` varchar(28) NOT NULL,
  `Country` varchar(28) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Username` varchar(28) DEFAULT NULL,
  `Password` varchar(158) DEFAULT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FullName`, `StreetAddress`, `PostCode`, `City`, `Country`, `Phone`, `Email`, `Username`, `Password`, `Admin`) VALUES
(1, 'Admin', 'Purok 1, Brgy.Enclaro', '610722', 'Binalbagan City', 'Phippines', '0912011191', 'admin@gmail.com', 'admin', '$2a$10$mpJCYlSr762SwQVzdLwxR.KgRuWEHA2NzUanxxG/nxEStDRcRBbB6', 1),
(2, 'GANGA', 'Brgy.tooy', '572103', 'Himamaylan City', 'Philippines', '09123456732', 'gs@gmail.com', 'gangadhara', '$2a$10$mpJCYlSr762SwQVzdLwxR.KgRuWEHA2NzUanxxG/nxEStDRcRBbB6', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`AddressID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`),
  ADD UNIQUE KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
