<?php

/**
 * @author ReDo
 * @copyright 2023
 */
if((!$_SESSION['admin'])){
  header('LOCATION: index.php?module=member&act=login');  
  exit();
}
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_topic.php');
$page = $_GET['act'];
switch ($page) { 
  case 'list':
    require('view/template/topic/index.tpl');
    break;
}
?>