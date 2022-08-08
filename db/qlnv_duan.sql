-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2022 at 06:37 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qlnv_duan`
--

-- --------------------------------------------------------

--
-- Table structure for table `du_an`
--

CREATE TABLE `du_an` (
  `DA_ID` varchar(10) NOT NULL,
  `DA_TEN` varchar(200) DEFAULT NULL,
  `DA_NGAYBD` date DEFAULT NULL,
  `DA_NGAYKT` date DEFAULT NULL,
  `DA_IDQUANLY` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `du_an`
--

INSERT INTO `du_an` (`DA_ID`, `DA_TEN`, `DA_NGAYBD`, `DA_NGAYKT`, `DA_IDQUANLY`) VALUES
('da001', 'Clinic management system', '2022-01-01', '2022-03-03', 'nv001'),
('da002', 'Build Data pipeline of flight for VNA', '2021-03-01', '2021-07-30', 'nv004'),
('da003', 'Web application for Private clinic', '2022-02-01', '2022-03-31', 'nv007'),
('da004', 'Web application for medical equipment retail chain', '2021-11-01', '2022-01-31', 'nv002'),
('da005', 'App mobile for medical equipment retail chain', '2022-05-01', '2022-07-01', 'nv005');

-- --------------------------------------------------------

--
-- Table structure for table `tham_gia_du_an`
--

CREATE TABLE `tham_gia_du_an` (
  `TG_IDNV` varchar(10) NOT NULL,
  `TG_IDDA` varchar(10) NOT NULL,
  `TG_SOGIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tham_gia_du_an`
--

INSERT INTO `tham_gia_du_an` (`TG_IDNV`, `TG_IDDA`, `TG_SOGIO`) VALUES
('nv001', 'da001', 250),
('nv004', 'da001', 270),
('nv007', 'da001', 270),
('nv004', 'da002', 800),
('nv010', 'da002', 820),
('nv013', 'da002', 700),
('nv007', 'da003', 100),
('nv016', 'da003', 80),
('nv019', 'da003', 90),
('nv002', 'da004', 200),
('nv005', 'da004', 300),
('nv008', 'da004', 400),
('nv005', 'da005', 200),
('nv011', 'da005', 200),
('nv014', 'da005', 200);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `du_an`
--
ALTER TABLE `du_an`
  ADD PRIMARY KEY (`DA_ID`);

--
-- Indexes for table `tham_gia_du_an`
--
ALTER TABLE `tham_gia_du_an`
  ADD PRIMARY KEY (`TG_IDDA`,`TG_IDNV`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tham_gia_du_an`
--
ALTER TABLE `tham_gia_du_an`
  ADD CONSTRAINT `fk_DA_TGDUAN` FOREIGN KEY (`TG_IDDA`) REFERENCES `du_an` (`DA_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
