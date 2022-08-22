<?php
session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');
require_once "./service_nhanvien/Bridge.php";
require_once "./service_duan/Bridge.php";
require_once "./service_yeucau/Bridge.php";
require_once "./service_baiviet/Bridge.php";
new ServiceNhanVien\Core\App();
new ServiceDuAn\Core\App();
new ServiceYeuCau\Core\App();
new ServiceBaiViet\Core\App();