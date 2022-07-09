<?php

namespace Services\Service1\Core;

class App{

    protected $action = "execute";
    protected $params = [];

    function __construct(){
 
        $arr = $this->UrlProcess();

        // Controller
        if(!is_null($arr)) {
            if(file_exists("./services/service1/controllers/".$arr[0].".php")){
                $this->controller = $arr[0];
                unset($arr[0]);
            }
        }
        require_once "./services/service1/controllers/". $this->controller .".php";
        $this->controller = new $this->controller;

        // Action
        if(isset($arr[1])){
            if( method_exists( $this->controller , $arr[1]) ){
                $this->action = $arr[1];
            }
            unset($arr[1]);
        }

        // Params
        $this->params = $arr?array_values($arr):[];

        call_user_func_array([$this->controller, $this->action], $this->params );

    }

    function UrlProcess(){
        if( isset($_GET["url"]) ){
            return explode("/", filter_var(trim($_GET["url"], "/")));
        }
    }

}
