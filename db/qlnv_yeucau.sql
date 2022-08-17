-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2022 at 09:41 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

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
  `TN_DUYET` tinyint(1) DEFAULT 0,
  `TN_LIDOTUCHOI` varchar(200) DEFAULT NULL,
  `TN_IDNGUOIDUYET` varchar(10) DEFAULT NULL,
  `TN_NGAYBD` date DEFAULT NULL,
  `TN_NGAYKT` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `yeu_cau_lam_viec_tai_nha`
--

INSERT INTO `yeu_cau_lam_viec_tai_nha` (`TN_ID`, `TN_IDNV`, `TN_LIDO`, `TN_DUYET`, `TN_LIDOTUCHOI`, `TN_IDNGUOIDUYET`, `TN_NGAYBD`, `TN_NGAYKT`) VALUES
(1, 'nv017', 'Covid-19, kem xac nhan F0', 1, NULL, 'nv008', '2022-08-10', '2022-08-15'),
(2, 'nv015', 'Covid-19, kem xac nhan F0', 1, NULL, 'nv008', '2022-08-09', '2022-08-11'),
(3, 'nv005', 'Nha co viec', 2, 'Li do khong ro rang, yeu cau ghi ro li do', 'nv002', '2022-08-05', '2022-08-06'),
(4, 'nv006', 'Covid-19', 2, 'khong co xac nhan F0, yeu cau cap nhat', 'nv003', '2022-08-01', '2022-08-03'),
(5, 'nv010', 'Tai nan, kho khan trong viec di lai, kem xac nhan tu benh vien', 1, NULL, 'nv004', '2022-07-22', '2022-08-05'),
(6, 'nv011', 'Sot cao, dau hieu F0', 2, 'Yeu cau test F0 va gui xac nhan', 'nv005', '2022-08-02', '2022-08-06'),
(7, 'nv015', 'Con trai dang bi om, can o nha cham soc', 1, NULL, 'nv006', '2022-08-11', '2022-08-14'),
(8, 'nv017', 'Ba me tu que len choi', 2, 'Ly do khong phu hop', 'nv008', '2022-08-07', '2022-08-08'),
(10, 'nv007', 'bị bệnh đau đầu', 0, NULL, 'nv001', '2022-08-16', '2022-08-30');

-- --------------------------------------------------------

--
-- Table structure for table `yeu_cau_nghi_phep`
--

CREATE TABLE `yeu_cau_nghi_phep` (
  `NP_ID` int(11) NOT NULL,
  `NP_IDNV` varchar(10) NOT NULL,
  `NP_NGAYBD` date DEFAULT NULL,
  `NP_NGAYKT` date DEFAULT NULL,
  `NP_LOAI` int(11) DEFAULT NULL,
  `NP_LIDO` varchar(200) DEFAULT NULL,
  `NP_COLUONG` int(11) DEFAULT NULL,
  `NP_LIDOTUCHOI` varchar(200) DEFAULT NULL,
  `NP_DUYET` int(11) DEFAULT 0,
  `NP_IDNGUOIDUYET` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `yeu_cau_nghi_phep`
--

INSERT INTO `yeu_cau_nghi_phep` (`NP_ID`, `NP_IDNV`, `NP_NGAYBD`, `NP_NGAYKT`, `NP_LOAI`, `NP_LIDO`, `NP_COLUONG`, `NP_LIDOTUCHOI`, `NP_DUYET`, `NP_IDNGUOIDUYET`) VALUES
(1, 'nv007', '2022-02-03', '2022-02-06', 0, 'Covid-19, kem xac nhan F0', 0, NULL, 1, 'nv001'),
(2, 'nv004', '2022-04-01', '2022-04-01', 1, 'Xe bi hu', 1, NULL, 1, 'nv001'),
(3, 'nv006', '2022-06-12', '2022-06-13', 2, 'Covid-19, kem xac nhan F0', 0, NULL, 1, 'nv003'),
(4, 'nv014', '2022-06-12', '2022-06-15', 1, 'Tai nan, kho khan trong viec di lai, kem xac nhan tu benh vien', 0, NULL, 1, 'nv005'),
(5, 'nv019', '2022-07-10', '2022-07-10', 0, 'Di du tiec', 1, 'Ly do khong ro rang', 2, 'nv007'),
(9, 'nv007', '2022-08-18', '2022-08-25', 0, 'bị bệnh', NULL, NULL, 0, 'nv002'),
(10, 'nv007', '2022-08-19', '2022-08-20', 1, 'bị ho', NULL, NULL, 0, 'nv001'),
(11, 'nv007', '2022-08-11', '2022-08-21', 0, 'test 123', NULL, NULL, 0, 'nv002'),
(16, 'nv007', '2022-08-18', '2022-08-27', 0, 'test', NULL, NULL, 0, 'nv002'),
(17, 'nv007', '2022-08-19', '2022-08-20', 1, 'test', NULL, NULL, 0, 'nv001'),
(18, 'nv007', '2022-08-17', '2022-08-20', 2, 'test1212121', NULL, NULL, 0, 'nv001'),
(19, 'nv007', '2022-08-17', '2022-08-20', 1, 'test112121212', NULL, NULL, 0, 'nv001'),
(20, 'nv007', '2022-08-18', '2022-08-27', 2, 'test', NULL, NULL, 0, 'nv002'),
(21, 'nv007', '2022-08-17', '2022-08-20', 1, 'test2121212', NULL, NULL, 0, 'nv001'),
(22, 'nv007', '2022-08-17', '2022-08-20', 2, 'test121212', NULL, NULL, 0, 'nv001'),
(23, 'nv007', '2022-08-16', '2022-08-27', 1, 'ádsđ', NULL, NULL, 0, 'nv002');

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
  `OT_DUYET` tinyint(1) DEFAULT 0,
  `OT_IDNGUOIDUYET` varchar(10) NOT NULL,
  `OT_LIDOTUCHOI` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `yeu_cau_ot`
--

INSERT INTO `yeu_cau_ot` (`OT_ID`, `OT_IDNV`, `OT_NGAY`, `OT_GIO`, `OT_LIDO`, `OT_DUYET`, `OT_IDNGUOIDUYET`, `OT_LIDOTUCHOI`) VALUES
(1, 'nv005', '2022-02-05', 3, 'Công việc chậm tiến độ', 1, 'nv002', NULL),
(2, 'nv010', '2022-04-01', 3, 'Van con cong viec chua hoan thanh', 1, 'nv004', NULL),
(3, 'nv006', '2022-06-12', 2, 'Van con cong viec chua hoan thanh', 1, 'nv003', NULL),
(4, 'nv018', '2022-06-12', 2, 'Van con cong viec chua hoan thanh', 1, 'nv006', NULL),
(5, 'nv020', '2022-07-10', 3, 'Van con cong viec chua hoan thanh', 1, 'nv007', NULL),
(20, 'nv007', '2022-08-31', 2, 'Công việc chưa xong', 0, 'nv001', NULL);

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

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `yeu_cau_lam_viec_tai_nha`
--
ALTER TABLE `yeu_cau_lam_viec_tai_nha`
  MODIFY `TN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `yeu_cau_nghi_phep`
--
ALTER TABLE `yeu_cau_nghi_phep`
  MODIFY `NP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `yeu_cau_ot`
--
ALTER TABLE `yeu_cau_ot`
  MODIFY `OT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
