<?php

/**
 * Class Controller
 */
class Controller
{
    /**
     * Gọi model.
     * @param $model
     */
    public function model($model)
    {
        require_once "./services/service1/models/".$model.".php";
        return new $model;
    }

    /**
     * Gọi view.
     * @param $view
     * @param array $data
     */
    public function view($view, $data=[])
    {
        require_once "./views/".$view.".php";
    }

    /**
     * Redirect to $url
     * If $url = null, redirect to referer page.
     * @param null $url
     * @return mixed
     */
    public function redirect($url = null)
    {
        if (!empty($url)) {
            header('Location: ' . $url);
        } else {
           header('Location: ' . $_SERVER['HTTP_REFERER']);
        }
    }
}
