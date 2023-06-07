<?php

/**
 * @author honestphan
 * @copyright 2012
 */
$page = $_GET['act'];
 switch($page){
    case 'search':
    //Get language
    require('language/hienvat/tracuu/lang_tracuu.php');  
    //gan du lieu
    $button_add = button_add;
    $heading_title = heading_title;
    $button_delete = button_delete;
    //text
    $cot_ten_dia_chi = ten_dia_chi;
    $cot_dia_chi = dia_chi;
    $cot_mo_ta_ngan_gon = mo_ta_ngan_gon;
  
    $cot_thuoc_loai = thuoc_loai;
    $cot_thao_tac = thao_tac;
    
    //link
   
    $title = title;
    
    require('view/template/hienvat/tracuu/tracuu.tpl');  
    break;
    
    
    
   
    
  
 }



?>