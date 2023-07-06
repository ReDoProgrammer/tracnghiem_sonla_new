<?php

/**
 * @author ReDo
 * @copyright 2023
 */

$page = $_GET['act'];
switch ($page) {

    case 'logout':
        session_start();
        unset($_SESSION['profile']);
        $link_home = 'index.php?module=home';
        header('LOCATION: ' . $link_home);
        break;

    case 'login':
        require('view/member/login.tpl');
        break;

    case 'register':
        require('view/member/register.tpl');
        break;

    case 'profile':
        require('view/member/profile.tpl');
        break;
    case 'change-profile':
        require('view/member/change-profile.tpl');
        break;
    case 'change-password':
        require('view/member/change-password.tpl');
        break;
        
}
