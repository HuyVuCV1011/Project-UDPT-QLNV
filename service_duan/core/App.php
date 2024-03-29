<?php

namespace ServiceDuAn\Core;

class App{

    protected $action = "execute";
    protected $params = [];

    function __construct(){
 
        $arr = $this->UrlProcess();

        if(!is_null($arr)) {
            if(file_exists("./service_duan/controllers/".$arr[0].".php")){
                // Controller
                $this->controller = $arr[0];
                unset($arr[0]);

                require_once "./service_duan/controllers/". $this->controller .".php";
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
        }
    }

    function UrlProcess(){
        if( isset($_GET["url"]) ){
            return explode("/", filter_var(trim($_GET["url"], "/")));
        }
    }
}
