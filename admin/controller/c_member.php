<?php

/**
 * @author ReDo
 * @copyright 2023
 */



$page = $_GET['act'];
switch ($page) {
    case 'login':
        require('view/template/member/login.tpl');
        return;
    case 'logout':
        session_destroy();
        require('view/template/member/login.tpl');
        return;
    case 'list':
        if (!isset($_SESSION['admin'])) {
            header('LOCATION: index.php?module=member&act=login');
            exit();
        }
        require('view/template/member/list.tpl');
        return;
    
}
