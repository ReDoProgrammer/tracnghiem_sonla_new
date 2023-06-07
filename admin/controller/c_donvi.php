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
include('model/m_donvi.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/donvi/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ten_loai = ten_loai;
    $mo_ta = mo_ta;
    $thu_tu = thu_tu;
    $cot_thao_tac = cot_thao_tac;
$link_add ='index.php?module=donvi&act=add';

    $list_donvi = getListdonvi();

    require('view/template/donvi/list.tpl');  
    break;
    
    //case them tuyen dung
    case 'add':
    require ('language/donvi/add.php');
    
     $heading_title = heading_title;
     $ten_loai = ten_loai;
     $danh_muc_cha = danh_muc_cha;
     $thu_tu = thu_tu;

     $_SESSION['ten'] = $_POST['tieu_don_vi'];
     $_SESSION['thutu'] = $_POST['thu_tu'];
     
     $link_list = 'index.php?module=donvi&act=list';
    
    if($_POST['ten_don_vi']=="")
    {
    $err['exist'] = chua_nhap_ten;
    $error_donvi = $err['exist']; 
    }   
        
    if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
         }

    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    insertdonvi($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/donvi/add.tpl');
    break;
    
    //case edit
    case 'edit':
    require('language/donvi/edit.php');
    $heading_title = heading_title;
    $ten_loai = ten_loai;
    $danh_muc_cha = danh_muc_cha;
    $thu_tu = thu_tu;
    $link_list = 'index.php?module=donvi&act=list';
    $id = $_REQUEST['id'];
    $donvi = getdonvi($id);
     
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editdonvi($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/donvi/edit.tpl');
    break; 
    
    case 'del':
    get_file('language/donvi/del.php');
    $link_list = 'index?module=donvi&act=list';
    $id = $_REQUEST['id'];
    deldonvi($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;



 }
    // xoa
    

?>