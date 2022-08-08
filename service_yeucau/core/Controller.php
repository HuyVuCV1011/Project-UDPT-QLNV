<?php

namespace ServiceYeuCau\Core;
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
        require_once "./service_yeucau/models/".$model.".php";
        return new $model;
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
