<?php

use ServiceYeuCau\Core\Controller;
/**
 * Class Ot
 */
class Ot extends Controller
{
    public function execute()
    {
        $this->view('ot', []);
    }

    public function index($id)
    {
        $model = $this->model('OtModel');
        $res = $model->getOtByStaff($id, isset($_GET['manager']) ? $_GET['manager'] : null);

        echo json_encode($res);
    }

    public function addOt($id)
    {
        $model = $this->model('OtModel');
        echo $model->addOt($id, $_POST['date'], $_POST['hour'], $_POST['content'], $_POST['managerId']);
    }

    public function deleteOt($id)
    {
        $model = $this->model('OtModel');
        echo $model->deleteOt($id);
    }

    public function getOtById($id)
    {
        $model = $this->model('OtModel');
        echo json_encode($model->getOtById($id));
    }

    public function updateOt($id)
    {
        $model = $this->model('OtModel');
        echo $model->updateOt($id, $_POST['date'], $_POST['hour'], $_POST['content']);
    }

    public function updateOtStatus($id)
    {
        $model = $this->model('OtModel'); 
        echo $model->updateOtStatus($id, $_POST['status']); 
    }
}