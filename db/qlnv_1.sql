-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2022 at 06:55 PM
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
-- Database: `qlnv_1`
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
(20, 'nv020', '2022-07-07', '2022-07-07 08:00:00', '2022-07-07 16:30:00');

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
-- Indexes for table `yeu_cau_lam_viec_tai_nha`
--
ALTER TABLE `yeu_cau_lam_viec_tai_nha`
  ADD PRIMARY KEY (`TN_ID`),
  ADD KEY `fk_NV_YCLVTN` (`TN_IDNV`);

--
-- Indexes for table `yeu_cau_nghi_phep`
--
ALTER TABLE `yeu_cau_nghi_phep`
  ADD PRIMARY KEY (`NP_ID`),
  ADD KEY `fk_NV_YCNP` (`NP_IDNV`);

--
-- Indexes for table `yeu_cau_ot`
--
ALTER TABLE `yeu_cau_ot`
  ADD PRIMARY KEY (`OT_ID`),
  ADD KEY `fk_NV_YCOT` (`OT_IDNV`),
  ADD KEY `fk_NVQL_YCOT` (`OT_IDNGUOIDUYET`);

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

--
-- Constraints for table `yeu_cau_lam_viec_tai_nha`
--
ALTER TABLE `yeu_cau_lam_viec_tai_nha`
  ADD CONSTRAINT `fk_NV_YCLVTN` FOREIGN KEY (`TN_IDNV`) REFERENCES `nhan_vien` (`NV_ID`);

--
-- Constraints for table `yeu_cau_nghi_phep`
--
ALTER TABLE `yeu_cau_nghi_phep`
  ADD CONSTRAINT `fk_NV_YCNP` FOREIGN KEY (`NP_IDNV`) REFERENCES `nhan_vien` (`NV_ID`);

--
-- Constraints for table `yeu_cau_ot`
--
ALTER TABLE `yeu_cau_ot`
  ADD CONSTRAINT `fk_NVQL_YCOT` FOREIGN KEY (`OT_IDNGUOIDUYET`) REFERENCES `nhan_vien` (`NV_ID`),
  ADD CONSTRAINT `fk_NV_YCOT` FOREIGN KEY (`OT_IDNV`) REFERENCES `nhan_vien` (`NV_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
