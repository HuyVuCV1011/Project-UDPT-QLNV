<?php

use ServiceNhanVien\Core\Controller;
/**
 * Class Auth
 */
class Auth extends Controller
{
    public function execute()
    {
        $link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        $res = explode("/", filter_var(trim($link, "/")));
        $urlArr = ['?url=ot', '?url=wfh', '?url=off', '?url=article'];
        $hostArr = ['localhost:81', 'localhost:82', 'localhost:83', 'localhost:84'];
        if (!in_array($res[2], $hostArr) && !in_array(@$res[4], $urlArr)) {
            $this->view('login', []);
        }
    }

    public function login()
    {
        $username = $_POST['username'];
        $password = $_POST['password'];

        $model = $this->model('AuthModel');
        $res = $model->check($username, $password);

        echo json_encode($res);
    }
}