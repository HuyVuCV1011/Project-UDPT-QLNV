<?php

use ServiceYeuCau\Core\Controller;
/**
 * Class Wfh
 */
class Wfh extends Controller
{
    public function execute()
    {
        $this->view('wfh', []);
    }

    public function index($id)
    {
        $model = $this->model('WfhModel');
        $res = $model->getWfhByStaff($id, isset($_GET['manager']) ? $_GET['manager'] : null);

        echo json_encode($res);
    }

    public function addWfh($id)
    {
        $model = $this->model('WfhModel');
        echo $model->addWfh($id, $_POST['start_date'], $_POST['end_date'], $_POST['content']);
    }

    public function deleteWfh($id)
    {
        $model = $this->model('WfhModel');
        echo $model->deleteWfh($id);
    }

    public function getWfhById($id)
    {
        $model = $this->model('WfhModel');
        echo json_encode($model->getWfhById($id));
    }

    public function updateWfh($id)
    {
        $model = $this->model('WfhModel');
        echo $model->updateWfh($id, $_POST['start_date'], $_POST['end_date'], $_POST['content']);
    }

    public function updateWfhStatus($id)
    {
        $model = $this->model('WfhModel'); 
        echo $model->updateWfhStatus($id, $_POST['status']); 
    }
}