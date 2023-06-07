<?php
    session_start();
    if(isset($_SESSION['profile'])){
        include('auth-nav.tpl');
    }else{
        include('unauth-nav.tpl');
    }
?>