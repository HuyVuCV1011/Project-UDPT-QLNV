<?php

use ServiceChamCong\Core\Controller;
/**
 * Class Auth
 */
class Auth extends Controller
{
    public function execute()
    {
        $this->view('login', []);
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