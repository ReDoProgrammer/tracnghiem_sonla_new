<?php
/**
 * @author ReDo
 * @copyright 2023
 */
 


$page = $_GET['act'];
switch($page){
    case 'login':
        require('view/template/member/login.tpl');
        return;
    case 'logout':
        session_destroy();
        require('view/template/member/login.tpl');
        return;
}