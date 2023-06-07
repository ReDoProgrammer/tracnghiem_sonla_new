<?php

/**
 * @author nbinh88@gmail.com
 * @copyright 2013
 */
if((!$_SESSION['admin'])){
    header('LOCATION: index.php?module=member&act=login');  
    exit();
}
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
//include('controller/c_block.php');
include('model/m_lienhe.php');
include('controller/c_block.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/lienhe/list_lienhe.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    $tieu_de = tieu_de;
    $ho_ten = ho_ten;
    $dia_chi = dia_chi;
    $email = email;
    $dien_thoai = dien_thoai;
    $noi_dung = noi_dung;
    $cot_thao_tac = cot_thao_tac;
	$lienhe = getLienhe($_REQUEST['id']);

	$list_lienhe = getListLienhe();

    require('view/template/lienhe/list_lienhe.tpl');  
    break;
  
    case 'del':
    get_file('language/lienhe/list_lienhe.php');
    $link_list = 'index.php?module=lienhe&act=list';
    $id = $_REQUEST['id'];
    delLienhe($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
    break;
    
        //view 
    case 'view':
    require('language/lienhe/view_lienhe.php');
    
    $lienhe = getLienhe($_REQUEST['id']);
    
    require('view/template/lienhe/view_lienhe.tpl');
    break;

 }
?>