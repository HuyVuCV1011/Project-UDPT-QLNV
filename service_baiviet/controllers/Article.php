<?php

use ServiceBaiViet\Core\Controller;
/**
 * Class Article
 */
class Article extends Controller
{
    public function execute()
    {
        $this->view('article', []);
    }


    public function getArticles()
    {
        $model = $this->model('ArticleModel');
        $res = $model->getArticles();

        echo json_encode($res);
    }
}