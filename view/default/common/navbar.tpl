<?php 
    session_start();
    if(isset($_SESSION["profile"])){
        include('auth-navbar.tpl');
    }else{
        include('unauth-navbar.tpl');
    }
?>