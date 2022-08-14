-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2022 at 05:05 PM
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
-- Database: `qlnv_nhanvien`
--

-- --------------------------------------------------------

--
-- Table structure for table `cham_cong`
--

CREATE TABLE `cham_cong` (
  `CC_ID` int(11) NOT NULL,
  `CC_IDNV` varchar(10) NOT NULL,
  `CC_NGAY` date DEFAULT NULL,
  `CC_CHECKIN` datetime DEFAULT NULL,
  `CC_CHECKOUT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cham_cong`
--

INSERT INTO `cham_cong` (`CC_ID`, `CC_IDNV`, `CC_NGAY`, `CC_CHECKIN`, `CC_CHECKOUT`) VALUES
(1, 'nv001', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(2, 'nv002', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(3, 'nv003', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(4, 'nv004', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(5, 'nv005', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(6, 'nv006', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(7, 'nv007', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(8, 'nv008', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(9, 'nv009', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(10, 'nv010', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(11, 'nv011', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(12, 'nv012', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(13, 'nv013', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(14, 'nv014', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(15, 'nv015', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(16, 'nv016', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(18, 'nv018', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(19, 'nv019', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(20, 'nv020', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00'),
(21, 'nv001', '2022-08-14', '2022-08-14 17:05:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nhan_vien`
--

CREATE TABLE `nhan_vien` (
  `NV_ID` varchar(10) NOT NULL,
  `NV_GioiTinh` varchar(3) DEFAULT NULL,
  `NV_Ten` varchar(50) DEFAULT NULL,
  `NV_NSinh` date DEFAULT NULL,
  `NV_SDT` varchar(10) DEFAULT NULL,
  `NV_PhongBan` varchar(10) DEFAULT NULL,
  `NV_MatKhau` varchar(12) DEFAULT NULL,
  `NV_NGAYPHEPCONLAI` int(11) DEFAULT NULL,
  `NV_LUONGTHEOGIO` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nhan_vien`
--

INSERT INTO `nhan_vien` (`NV_ID`, `NV_GioiTinh`, `NV_Ten`, `NV_NSinh`, `NV_SDT`, `NV_PhongBan`, `NV_MatKhau`, `NV_NGAYPHEPCONLAI`, `NV_LUONGTHEOGIO`) VALUES
('nv001', 'Nam', 'Nguyen Van A', '2000-01-01', '0123456789', 'pb001', 'NhanVien01', 12, 30000),
('nv002', 'Nu', 'Nguyen Thi B', '2000-01-01', '0123456788', 'pb002', 'NhanVien02', 12, 40000),
('nv003', 'Nam', 'Nguyen Van C', '2000-01-01', '0123456787', 'pb003', 'NhanVien03', 12, 50000),
('nv004', 'Nu', 'Nguyen Thi D', '2000-01-01', '0123456786', 'pb001', 'NhanVien04', 12, 30000),
('nv005', 'Nam', 'Nguyen Van E', '2000-01-01', '0123456785', 'pb002', 'NhanVien05', 12, 40000),
('nv006', 'Nu', 'Nguyen Thi F', '2000-01-01', '0123456784', 'pb003', 'NhanVien06', 12, 50000),
('nv007', 'Nam', 'Nguyen Van G', '2000-01-01', '0123456783', 'pb001', 'NhanVien07', 12, 30000),
('nv008', 'Nu', 'Nguyen Thi H', '2000-01-01', '0123456782', 'pb002', 'NhanVien08', 12, 40000),
('nv009', 'Nam', 'Nguyen Van I', '2000-01-01', '0123456781', 'pb003', 'NhanVien09', 12, 50000),
('nv010', 'Nu', 'Nguyen Thi K', '2000-01-01', '0123456780', 'pb001', 'NhanVien10', 12, 30000),
('nv011', 'Nam', 'Nguyen Van L', '2000-01-01', '0123456799', 'pb002', 'NhanVien11', 12, 40000),
('nv012', 'Nu', 'Nguyen Thi M', '2000-01-01', '0123456709', 'pb003', 'NhanVien012', 12, 50000),
('nv013', 'Nam', 'Nguyen Van N', '2000-01-01', '0123456779', 'pb001', 'NhanVien13', 12, 30000),
('nv014', 'Nu', 'Nguyen Thi O', '2000-01-01', '0123456769', 'pb002', 'NhanVien14', 12, 40000),
('nv015', 'Nam', 'Nguyen Van P', '2000-01-01', '0123456759', 'pb003', 'NhanVien15', 12, 50000),
('nv016', 'Nu', 'Nguyen Thi Q', '2000-01-01', '0123456749', 'pb001', 'NhanVien16', 12, 30000),
('nv017', 'Nam', 'Nguyen Van R', '2000-01-01', '0123456739', 'pb002', 'NhanVien17', 12, 40000),
('nv018', 'Nu', 'Nguyen Thi S', '2000-01-01', '0123456729', 'pb003', 'NhanVien18', 12, 50000),
('nv019', 'Nam', 'Nguyen Van T', '2000-01-01', '0123456719', 'pb001', 'NhanVien19', 12, 30000),
('nv020', 'Nu', 'Nguyen Thi U', '2000-01-01', '0123456979', 'pb002', 'NhanVien20', 12, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `phong_ban`
--

CREATE TABLE `phong_ban` (
  `PB_ID` varchar(10) NOT NULL,
  `PB_TEN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `phong_ban`
--

INSERT INTO `phong_ban` (`PB_ID`, `PB_TEN`) VALUES
('pb001', 'Phong IT'),
('pb002', 'Phong ke toan'),
('pb003', 'Ban giam doc');

-- --------------------------------------------------------

--
-- Table structure for table `quan_li`
--

CREATE TABLE `quan_li` (
  `ID_QLI` varchar(10) NOT NULL,
  `ID_NV` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quan_li`
--

INSERT INTO `quan_li` (`ID_QLI`, `ID_NV`) VALUES
('nv001', 'nv004'),
('nv001', 'nv007'),
('nv004', 'nv010'),
('nv004', 'nv013'),
('nv007', 'nv016'),
('nv007', 'nv019'),
('nv002', 'nv005'),
('nv002', 'nv008'),
('nv005', 'nv011'),
('nv005', 'nv014'),
('nv008', 'nv017'),
('nv007', 'nv020'),
('nv003', 'nv006'),
('nv006', 'nv009'),
('nv006', 'nv012'),
('nv006', 'nv015'),
('nv006', 'nv018');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cham_cong`
--
ALTER TABLE `cham_cong`
  ADD PRIMARY KEY (`CC_ID`),
  ADD KEY `fk_NV_CC` (`CC_IDNV`);

--
-- Indexes for table `nhan_vien`
--
ALTER TABLE `nhan_vien`
  ADD PRIMARY KEY (`NV_ID`),
  ADD KEY `fk_NV_PB` (`NV_PhongBan`);

--
-- Indexes for table `phong_ban`
--
ALTER TABLE `phong_ban`
  ADD PRIMARY KEY (`PB_ID`);

--
-- Indexes for table `quan_li`
--
ALTER TABLE `quan_li`
  ADD KEY `fk_ql_nv` (`ID_QLI`),
  ADD KEY `fk_nv_nv` (`ID_NV`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cham_cong`
--
ALTER TABLE `cham_cong`
  MODIFY `CC_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cham_cong`
--
ALTER TABLE `cham_cong`
  ADD CONSTRAINT `fk_NV_CC` FOREIGN KEY (`CC_IDNV`) REFERENCES `nhan_vien` (`NV_ID`);

--
-- Constraints for table `nhan_vien`
--
ALTER TABLE `nhan_vien`
  ADD CONSTRAINT `fk_NV_PB` FOREIGN KEY (`NV_PhongBan`) REFERENCES `phong_ban` (`PB_ID`);

--
-- Constraints for table `quan_li`
--
ALTER TABLE `quan_li`
  ADD CONSTRAINT `fk_nv_nv` FOREIGN KEY (`ID_NV`) REFERENCES `nhan_vien` (`NV_ID`),
  ADD CONSTRAINT `fk_ql_nv` FOREIGN KEY (`ID_QLI`) REFERENCES `nhan_vien` (`NV_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
