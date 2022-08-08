<?php

use ServiceChamCong\Core\Controller;
/**
 * Class Auth
 */
class Staff extends Controller
{
    public function execute()
    {
        $this->view('staff', []);
    }

    public function index()
    {
        $model = $this->model('StaffModel');
        $res = $model->getList();
        
        echo json_encode($res);
    }
}