<?php
session_start();
if(!isset($_SESSION['profile'])){
    header('LOCATION: index.php?module=member&act=login');  
    exit();
}
$action = $_GET['act'];
switch ($action) {
    case "index":
        require('view/examination/index.tpl');
        break;
    case "do-exam":
        require('view/examination/do-exam.tpl');
        break;
    case "history":
        require('view/examination/history.tpl');
        break;
    case "history-detail":
        require('view/examination/history-detail.tpl');
        break;
}
