-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2022 at 06:38 AM
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
-- Database: `qlnv_thietbi`
--

-- --------------------------------------------------------

--
-- Table structure for table `loai_tb`
--

CREATE TABLE `loai_tb` (
  `LTB_ID` varchar(10) NOT NULL,
  `LTB_TEN` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loai_tb`
--

INSERT INTO `loai_tb` (`LTB_ID`, `LTB_TEN`) VALUES
('ltb001', 'Laptop'),
('ltb002', 'Máy in'),
('ltb003', 'Tài khoản');

-- --------------------------------------------------------

--
-- Table structure for table `su_dung_tb`
--

CREATE TABLE `su_dung_tb` (
  `SD_ID` int(11) NOT NULL,
  `SD_IDNV` varchar(10) NOT NULL,
  `SD_IDTB` varchar(10) NOT NULL,
  `SD_NGAYNHAN` date NOT NULL,
  `SD_NGAYTRA` date DEFAULT NULL,
  `SD_TINHTRANGNHAN` varchar(50) NOT NULL,
  `SD_TINHTRANGTRA` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `su_dung_tb`
--

INSERT INTO `su_dung_tb` (`SD_ID`, `SD_IDNV`, `SD_IDTB`, `SD_NGAYNHAN`, `SD_NGAYTRA`, `SD_TINHTRANGNHAN`, `SD_TINHTRANGTRA`) VALUES
(1, 'nv001', 'tb004', '2021-07-07', NULL, 'Góc màn hình bị mờ', NULL),
(2, 'nv002', 'tb008', '2021-07-07', NULL, 'Mới 100%', NULL),
(3, 'nv004', 'tb001', '2021-07-07', NULL, 'Mới 100%', NULL),
(4, 'nv005', 'tb009', '2021-07-07', NULL, 'Mới 100%', NULL),
(5, 'nv007', 'tb003', '2021-07-07', NULL, 'Mới 100%', NULL),
(6, 'nv008', 'tb010', '2021-07-07', NULL, 'Mới 100%', NULL),
(7, 'nv010', 'tb007', '2021-07-07', NULL, 'Mới 100%', NULL),
(8, 'nv011', 'tb012', '2021-07-07', NULL, 'Mới 100%', NULL),
(9, 'nv013', 'tb005', '2021-07-07', NULL, 'Mới 100%', NULL),
(10, 'nv014', 'tb014', '2021-07-07', '2022-06-06', 'Mới 100%', 'Có xảy ra tình trạng kẹt mực');

-- --------------------------------------------------------

--
-- Table structure for table `thiet_bi`
--

CREATE TABLE `thiet_bi` (
  `TB_ID` varchar(10) NOT NULL,
  `TB_TEN` varchar(50) NOT NULL,
  `TB_IDLOAI` varchar(10) NOT NULL,
  `TB_GIATRI` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thiet_bi`
--

INSERT INTO `thiet_bi` (`TB_ID`, `TB_TEN`, `TB_IDLOAI`, `TB_GIATRI`) VALUES
('tb001', 'Laptop ASUS tuf fx504', 'ltb001', 20000000),
('tb002', 'Laptop ASUS tuf fx504', 'ltb001', 20000000),
('tb003', 'Laptop ASUS tuf fx504', 'ltb001', 20000000),
('tb004', 'Laptop Macbook Pro 2018', 'ltb001', 41000000),
('tb005', 'Laptop Macbook Pro 2018', 'ltb001', 41000000),
('tb006', 'Laptop Macbook Air 2022', 'ltb001', 40000000),
('tb007', 'Laptop Macbook Air 2022', 'ltb001', 40000000),
('tb008', 'Máy in phun màu Epson L805', 'ltb002', 6800000),
('tb009', 'Máy in phun màu Epson L805', 'ltb002', 6800000),
('tb010', 'Máy in phun màu Epson L805', 'ltb002', 6800000),
('tb011', 'Máy in HP Laserjet Pro M404dn (W1A53A)', 'ltb002', 6090000),
('tb012', 'Máy in HP Laserjet Pro M404dn (W1A53A)', 'ltb002', 6090000),
('tb013', 'Máy in đa năng HP LaserJet M236sdw (9YG09A)', 'ltb002', 6450000),
('tb014', 'Máy in đa năng HP LaserJet M236sdw (9YG09A)', 'ltb002', 6450000);

-- --------------------------------------------------------

--
-- Table structure for table `yeu_cau_thiet_bi`
--

CREATE TABLE `yeu_cau_thiet_bi` (
  `YCTB_ID` int(11) NOT NULL,
  `YCTB_IDNV` varchar(10) NOT NULL,
  `YCTB_LOAIYC` varchar(100) NOT NULL,
  `YCTB_IDLTB` varchar(10) NOT NULL,
  `YCTB_NOIDUNG` varchar(300) DEFAULT NULL,
  `YCTB_ITDUYET` tinyint(1) DEFAULT NULL,
  `YCTB_KETOANDUYET` tinyint(1) DEFAULT NULL,
  `YCTB_CHIPHI` double DEFAULT NULL,
  `YCTB_GDDUYET` tinyint(1) DEFAULT NULL,
  `YCTB_LIDOTUCHOI` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `yeu_cau_thiet_bi`
--

INSERT INTO `yeu_cau_thiet_bi` (`YCTB_ID`, `YCTB_IDNV`, `YCTB_LOAIYC`, `YCTB_IDLTB`, `YCTB_NOIDUNG`, `YCTB_ITDUYET`, `YCTB_KETOANDUYET`, `YCTB_CHIPHI`, `YCTB_GDDUYET`, `YCTB_LIDOTUCHOI`) VALUES
(1, 'nv001', 'Cung cấp thiết bị', 'ltb001', NULL, 1, 1, 41000000, 1, NULL),
(2, 'nv002', 'Cung cấp thiết bị', 'ltb002', NULL, 1, 1, 6800000, 1, NULL),
(3, 'nv004', 'Cung cấp thiết bị', 'ltb001', NULL, 1, 1, 20000000, 1, NULL),
(4, 'nv005', 'Cung cấp thiết bị', 'ltb002', NULL, 1, 1, 6800000, 1, NULL),
(5, 'nv007', 'Cung cấp thiết bị', 'ltb001', NULL, 1, 1, 20000000, 1, NULL),
(6, 'nv008', 'Cung cấp thiết bị', 'ltb001', NULL, 1, 1, 6800000, 1, NULL),
(7, 'nv010', 'Cung cấp thiết bị', 'ltb001', NULL, 1, 1, 40000000, 1, NULL),
(8, 'nv011', 'Cung cấp thiết bị', 'ltb002', NULL, 1, 1, 6090000, 1, NULL),
(9, 'nv013', 'Cung cấp thiết bị', 'ltb001', NULL, 1, 1, 40000000, 1, NULL),
(10, 'nv014', 'Cung cấp thiết bị', 'ltb002', NULL, 1, 1, 6450000, 1, NULL),
(11, 'nv014', 'Sửa chữa thiết bị', 'ltb002', 'ket muc', 1, 1, 450000, 1, NULL),
(12, 'nv016', 'Cung cấp thiết bị', 'ltb001', NULL, 1, 0, NULL, 0, NULL),
(13, 'nv017', 'Cung cấp thiết bị', 'ltb002', NULL, 1, 1, 6450000, 0, NULL),
(14, 'nv019', 'Cung cấp thiết bị', 'ltb001', NULL, 1, 1, 20000000, 1, NULL),
(15, 'nv020', 'Cung cấp thiết bị', 'ltb002', NULL, 0, 0, NULL, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `loai_tb`
--
ALTER TABLE `loai_tb`
  ADD PRIMARY KEY (`LTB_ID`);

--
-- Indexes for table `su_dung_tb`
--
ALTER TABLE `su_dung_tb`
  ADD PRIMARY KEY (`SD_ID`),
  ADD KEY `fk_sdtb_tb` (`SD_IDTB`);

--
-- Indexes for table `thiet_bi`
--
ALTER TABLE `thiet_bi`
  ADD PRIMARY KEY (`TB_ID`),
  ADD KEY `fk_tb_ltb` (`TB_IDLOAI`);

--
-- Indexes for table `yeu_cau_thiet_bi`
--
ALTER TABLE `yeu_cau_thiet_bi`
  ADD PRIMARY KEY (`YCTB_ID`),
  ADD KEY `fk_yctb_ltb` (`YCTB_IDLTB`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `su_dung_tb`
--
ALTER TABLE `su_dung_tb`
  MODIFY `SD_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `yeu_cau_thiet_bi`
--
ALTER TABLE `yeu_cau_thiet_bi`
  MODIFY `YCTB_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `su_dung_tb`
--
ALTER TABLE `su_dung_tb`
  ADD CONSTRAINT `fk_sdtb_tb` FOREIGN KEY (`SD_IDTB`) REFERENCES `thiet_bi` (`TB_ID`);

--
-- Constraints for table `thiet_bi`
--
ALTER TABLE `thiet_bi`
  ADD CONSTRAINT `fk_tb_ltb` FOREIGN KEY (`TB_IDLOAI`) REFERENCES `loai_tb` (`LTB_ID`);

--
-- Constraints for table `yeu_cau_thiet_bi`
--
ALTER TABLE `yeu_cau_thiet_bi`
  ADD CONSTRAINT `fk_yctb_ltb` FOREIGN KEY (`YCTB_IDLTB`) REFERENCES `loai_tb` (`LTB_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
