<?php
//Khai báo namespace để gọi class App mới tại index.php
namespace ServiceYeuCau\Core;

class App{

    protected $action = "execute";
    protected $params = [];

    //Constructor
    function __construct(){
 
        //Xử lý url
        $arr = $this->UrlProcess();

        if(!is_null($arr)) {
            //Kiểm tra tên controller có tồn tại hay không
            if(file_exists("./service_yeucau/controllers/".$arr[0].".php")){
                // Controller
                //this->controller scope rộng hơn( gán biến bt)
                $this->controller = $arr[0];
                //Loại bỏ giá trị trong array
                unset($arr[0]);

                //Gọi controller tương ứng
                require_once "./service_yeucau/controllers/". $this->controller .".php";
                $this->controller = new $this->controller;
        
                // Action
                //Nếu có function
                if(isset($arr[1])){
                    if( method_exists( $this->controller , $arr[1]) ){
                        $this->action = $arr[1];
                    }
                    //Loại bỏ giá trị trong array
                    unset($arr[1]);
                }
        
                // Params
                //Lấy giá trị cuối trong arr
                $this->params = $arr?array_values($arr):[];


                //Gọi đến function được yêu cầu trong controllers được require bên trên
                call_user_func_array([$this->controller, $this->action], $this->params );
            }
        }
    }

    
    function UrlProcess(){
        //Nếu có param url trong get request
        if( isset($_GET["url"]) ){
            // đưa string về dạng mảng, ?url=wfh/addWfh => ['wfh', 'addWfh']
            return explode("/", filter_var(trim($_GET["url"], "/")));
        }
    }
}
