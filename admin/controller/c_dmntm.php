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
include('model/m_dmntm.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/dmntm/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ten_loai = ten_loai;
    $mo_ta = mo_ta;
    $thu_tu = thu_tu;
    $cot_thao_tac = cot_thao_tac;
    
$link_add ='index.php?module=dmntm&act=add';

    $list_dmntm = getListdmntm();

    require('view/template/dmntm/list.tpl');  
    break;
    
    //case them tuyen dung
    case 'add':
    require ('language/dmntm/add.php');
    
     $heading_title = heading_title;
     $ten_loai = ten_loai;
     $danh_muc_cha = danh_muc_cha;
     $thu_tu = thu_tu;

     $list_dmntm = getListdmntm(0,50);
     
     $link_list = 'index.php?module=dmntm&act=list';
     
    $_SESSION['tt'] = $_POST['thu_tu']; 
    $_SESSION['dm'] = $_POST['ten_dm'];
         if($_POST['ten_dm']=="")
         {
            $err['exist'] = ten_danh_muc;
            $error_dm1 = $err['exist'];
         }
         
     if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
         }     
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    insertdmntm($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/dmntm/add.tpl');
    break;
    
    //case edit
    case 'edit':
    require('language/dmntm/edit.php');
    $heading_title = heading_title;
    $ten_loai = ten_loai;
    $danh_muc_cha = danh_muc_cha;
    $thu_tu = thu_tu;
    $link_list = 'index.php?module=dmntm&act=list';
    $id = $_REQUEST['id'];
    $danhmuc = getdmntm($id);
     
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editdmntm($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/dmntm/edit.tpl');
    break; 
    
    case 'del':
    get_file('language/dmntm/del.php');
    $link_list = 'index?module=dmntm&act=list';
    $id = $_REQUEST['id'];
    delDanhmuc($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;



 }
    // xoa
    

?>