<?php
if (!isset($_SESSION['admin'])) {
    header('LOCATION: index.php?module=member&act=login');
    exit();
}
$page = $_GET['act'];
switch ($page) {
    case 'member':
        require('view/template/config/member.tpl');
        return;
    case 'site':
        require('view/template/config/site.tpl');
        return;
}
