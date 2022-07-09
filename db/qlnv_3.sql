-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2022 at 06:56 PM
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
-- Database: `qlnv_3`
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
-- Indexes for table `su_dung_tb`
--
ALTER TABLE `su_dung_tb`
  ADD PRIMARY KEY (`SD_ID`),
  ADD KEY `fk_sdtb_tb` (`SD_IDTB`),
  ADD KEY `fk_sdtb_nv` (`SD_IDNV`);

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
  ADD KEY `fk_yctb_ltb` (`YCTB_IDLTB`),
  ADD KEY `fk_yctb_nv` (`YCTB_IDNV`);

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

--
-- Constraints for table `su_dung_tb`
--
ALTER TABLE `su_dung_tb`
  ADD CONSTRAINT `fk_sdtb_nv` FOREIGN KEY (`SD_IDNV`) REFERENCES `nhan_vien` (`NV_ID`),
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
  ADD CONSTRAINT `fk_yctb_ltb` FOREIGN KEY (`YCTB_IDLTB`) REFERENCES `loai_tb` (`LTB_ID`),
  ADD CONSTRAINT `fk_yctb_nv` FOREIGN KEY (`YCTB_IDNV`) REFERENCES `nhan_vien` (`NV_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
