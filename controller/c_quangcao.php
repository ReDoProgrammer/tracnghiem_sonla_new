<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_left.php');
$page = $_GET['act'];
 switch($page){
   
    case 'view':
    $id = $_REQUEST['id'];
    $quangcao = getadv($id);
    if($quangcao['link']){
    $direct = $quangcao['link'];
    } else {
    $direct = '/';
    }
    $luot_click = $quangcao['view_id'];
    $click = $luot_click +1;
    
    click_view($id,$click);
    
    header('LOCATION: '.$direct);    
    exit();
    break;
    
    
 }
?>