<?php

use ServiceDuAn\Core\Controller;
/**
 * Class Project
 */
class Project extends Controller
{
    public function getProjectByStaff($id)
    {
        $model = $this->model('ProjectModel');
        $res = $model->getProjectByStaff($id);

        echo json_encode($res);
    }
}