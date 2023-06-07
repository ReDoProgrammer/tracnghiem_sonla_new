<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_right.php');
$page = $_GET['act'];
 switch($page){
   
    case 'view':
    $id = $_REQUEST['id'];
    $lienket = getlienket1($id);
    if($lienket['link']){
    $direct = $lienket['link'];
    } else {
    $direct = 'http://cd4design.net';
    }
    $luot_click = $lienket['click'];

    $click = $luot_click +1;
    
    click_lienket($id,$click);
    
    header('LOCATION: '.$direct);    
    exit();
    

    break;
    
    
 }
?>