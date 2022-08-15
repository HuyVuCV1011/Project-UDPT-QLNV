<?php

use ServiceYeuCau\Core\Controller;
/**
 * Class Project
 */
class Off extends Controller
{
    public function execute()
    {
        $this->view('off', []);
    }

    public function index($id)
    {
        $model = $this->model('OffModel');
        $res = $model->getOffByStaff($id, isset($_GET['manager']) ? $_GET['manager'] : null);

        echo json_encode($res);
    }

    public function addOff($id)
    {
        $model = $this->model('OffModel');
        echo $model->addOff($id, $_POST['start_date'], $_POST['end_date'], $_POST['content'], $_POST['type']);
    }

    public function deleteOff($id)
    {
        $model = $this->model('OffModel');
        echo $model->deleteOff($id);
    }

    public function getOffById($id)
    {
        $model = $this->model('OffModel');
        echo json_encode($model->getOffById($id));
    }

    public function updateOff($id)
    {
        $model = $this->model('OffModel');
        echo $model->updateOff($id, $_POST['start_date'], $_POST['end_date'], $_POST['content'], $_POST['type']);
    }

    public function updateOffStatus($id)
    {
        $model = $this->model('OffModel'); 
        echo $model->updateOffStatus($id, $_POST['status']); 
    }
}