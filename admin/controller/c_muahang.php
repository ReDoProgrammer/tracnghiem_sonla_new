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
include('model/m_muahang.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/muahang/list_muahang.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $tieu_de = tieu_de;
    $thoi_gian = thoi_gian;
    $cot_thao_tac = cot_thao_tac;
$link_add ='index.php?module=muahang&act=add';

$list_muahang = getListMuahang();

    require('view/template/muahang/list_muahang.tpl');  
    break;
    

    //case edit gioi thieu
    case 'edit':
    require('language/muahang/edit_muahang.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $noi_dung = noi_dung;
    $thoi_gian = thoi_gian;
    $link_list = 'index.php?module=muahang&act=list';
    $id = $_REQUEST['id'];
    $muahang = getMuahang($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editMuahang($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/muahang/edit_muahang.tpl');
    break; 


 }
    // xoa
    

?>