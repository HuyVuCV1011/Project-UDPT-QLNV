<?php

use ServiceNhanVien\Core\Controller;
/**
 * Class Staff
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

    public function profile($id)
    {
        $model = $this->model('StaffModel');
        $res = $model->getById($id);

        echo json_encode($res);
    }

    public function show($id)
    {
        $model = $this->model('StaffModel');
        $res = $model->getById($id);

        echo json_encode(array_merge($res, ['key' => $_GET['key']]));
    }

    public function getManagerLevel1($id)
    {
        $model = $this->model('StaffModel');
        echo json_encode($model->getManagerLevel1($id));
    }

    public function getManagerLevel2($id)
    {
        $model = $this->model('StaffModel');
        echo json_encode($model->getManagerLevel2($id));
    }
}