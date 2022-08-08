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
-- Database: `qlnv_yeucau`
--

-- --------------------------------------------------------

--
-- Table structure for table `yeu_cau_lam_viec_tai_nha`
--

CREATE TABLE `yeu_cau_lam_viec_tai_nha` (
  `TN_ID` int(11) NOT NULL,
  `TN_IDNV` varchar(10) NOT NULL,
  `TN_LIDO` varchar(200) DEFAULT NULL,
  `TN_DUYET` tinyint(1) DEFAULT NULL,
  `TN_LIDOTUCHOI` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `yeu_cau_lam_viec_tai_nha`
--

INSERT INTO `yeu_cau_lam_viec_tai_nha` (`TN_ID`, `TN_IDNV`, `TN_LIDO`, `TN_DUYET`, `TN_LIDOTUCHOI`) VALUES
(1, 'nv001', 'Covid-19, kem xac nhan F0', 1, NULL),
(2, 'nv003', 'Covid-19, kem xac nhan F0', 1, NULL),
(3, 'nv005', 'Nha co viec', 0, 'Li do khong ro rang, yeu cau ghi ro li do'),
(4, 'nv006', 'Covid-19', 0, 'khong co xac nhan F0, yeu cau cap nhat'),
(5, 'nv010', 'Tai nan, kho khan trong viec di lai, kem xac nhan tu benh vien', 1, NULL),
(6, 'nv011', 'Sot cao, dau hieu F0', 0, 'Yeu cau test F0 va gui xac nhan'),
(7, 'nv015', 'Con trai dang bi om, can o nha cham soc', 1, NULL),
(8, 'nv017', 'Ba me tu que len choi', 0, 'Ly do khong phu hop');

-- --------------------------------------------------------

--
-- Table structure for table `yeu_cau_nghi_phep`
--

CREATE TABLE `yeu_cau_nghi_phep` (
  `NP_ID` int(11) NOT NULL,
  `NP_IDNV` varchar(10) NOT NULL,
  `NP_NGAYBD` date DEFAULT NULL,
  `NP_NGAYKT` date DEFAULT NULL,
  `NP_LOAI` varchar(15) DEFAULT NULL,
  `NP_LIDO` varchar(200) DEFAULT NULL,
  `NP_SONGAYCOLUONG` int(11) DEFAULT NULL,
  `NP_LIDOTUCHOI` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `yeu_cau_nghi_phep`
--

INSERT INTO `yeu_cau_nghi_phep` (`NP_ID`, `NP_IDNV`, `NP_NGAYBD`, `NP_NGAYKT`, `NP_LOAI`, `NP_LIDO`, `NP_SONGAYCOLUONG`, `NP_LIDOTUCHOI`) VALUES
(1, 'nv007', '2022-02-03', '2022-02-06', 'Nghi ca ngay', 'Covid-19, kem xac nhan F0', 4, NULL),
(2, 'nv004', '2022-04-01', '2022-04-01', 'Nghi buoi sang', 'Xe bi hu', 11, NULL),
(3, 'nv006', '2022-06-12', '2022-06-13', 'Nghi ca ngay', 'Covid-19, kem xac nhan F0', 9, NULL),
(4, 'nv002', '2022-06-12', '2022-06-15', 'Nghi ca ngay', 'Tai nan, kho khan trong viec di lai, kem xac nhan tu benh vien', 8, NULL),
(5, 'nv001', '2022-07-10', '2022-07-10', 'Nghi buoi chieu', 'Di du tiec', 7, 'Ly do khong ro rang');

-- --------------------------------------------------------

--
-- Table structure for table `yeu_cau_ot`
--

CREATE TABLE `yeu_cau_ot` (
  `OT_ID` int(11) NOT NULL,
  `OT_IDNV` varchar(10) NOT NULL,
  `OT_NGAY` date DEFAULT NULL,
  `OT_GIO` float DEFAULT NULL,
  `OT_LIDO` varchar(200) DEFAULT NULL,
  `OT_DUYET` tinyint(1) DEFAULT NULL,
  `OT_IDNGUOIDUYET` varchar(10) NOT NULL,
  `OT_LIDOTUCHOI` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `yeu_cau_ot`
--

INSERT INTO `yeu_cau_ot` (`OT_ID`, `OT_IDNV`, `OT_NGAY`, `OT_GIO`, `OT_LIDO`, `OT_DUYET`, `OT_IDNGUOIDUYET`, `OT_LIDOTUCHOI`) VALUES
(1, 'nv005', '2022-02-03', 1, 'Van con cong viec chua hoan thanh', 1, 'nv002', NULL),
(2, 'nv010', '2022-04-01', 3, 'Van con cong viec chua hoan thanh', 1, 'nv004', NULL),
(3, 'nv006', '2022-06-12', 2, 'Van con cong viec chua hoan thanh', 1, 'nv003', NULL),
(4, 'nv018', '2022-06-12', 2, 'Van con cong viec chua hoan thanh', 1, 'nv006', NULL),
(5, 'nv020', '2022-07-10', 3, 'Van con cong viec chua hoan thanh', 1, 'nv007', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `yeu_cau_lam_viec_tai_nha`
--
ALTER TABLE `yeu_cau_lam_viec_tai_nha`
  ADD PRIMARY KEY (`TN_ID`);

--
-- Indexes for table `yeu_cau_nghi_phep`
--
ALTER TABLE `yeu_cau_nghi_phep`
  ADD PRIMARY KEY (`NP_ID`);

--
-- Indexes for table `yeu_cau_ot`
--
ALTER TABLE `yeu_cau_ot`
  ADD PRIMARY KEY (`OT_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
