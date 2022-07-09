<?php
session_start();
require_once "./services/service1/Bridge.php";
require_once "./services/service2/Bridge.php";
require_once "./services/service3/Bridge.php";
new Services\Service1\Core\App();
new Services\Service2\Core\App();
new Services\Service3\Core\App();