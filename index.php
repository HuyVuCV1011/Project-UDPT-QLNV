<?php
session_start();
require_once "./service_chamcong/Bridge.php";
require_once "./service_duan/Bridge.php";
require_once "./service_thietbi/Bridge.php";
require_once "./service_yeucau/Bridge.php";
new ServiceChamCong\Core\App();
new ServiceDuAn\Core\App();
new ServiceThietBi\Core\App();
new ServiceYeuCau\Core\App();