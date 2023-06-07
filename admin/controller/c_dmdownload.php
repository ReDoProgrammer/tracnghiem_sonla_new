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
include('model/m_dmdownload.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/dmdownload/list_danhmuc.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ten_loai = ten_loai;
    $mo_ta = mo_ta;
    $thu_tu = thu_tu;
    $cot_thao_tac = cot_thao_tac;
    
$link_add ='index.php?module=dmdownload&act=add';

    $list_dmdownload = getListdmdownload();

    require('view/template/dmdownload/list_dm.tpl');  
    break;
    
    //case them tuyen dung
    case 'add':
    require ('language/dmdownload/add_danhmuc.php');
    
     $heading_title = heading_title;
     $ten_loai = ten_loai;
     $danh_muc_cha = danh_muc_cha;
     $thu_tu = thu_tu;

     $list_dmdownload = getListdmdownload(0,50);
     
     $link_list = 'index.php?module=dmdownload&act=list';
     
    $_SESSION['tt'] = $_POST['thu_tu']; 
    $_SESSION['dm'] = $_POST['ten_dm'];
         if($_POST['ten_dm']=="")
         {
            $err['exist'] = ten_danh_muc;
            $error_dm = $err['exist'];
         }
         
     if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
         }     
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    insertdmdownload($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/dmdownload/add_dm.tpl');
    break;
    
    //case edit
    case 'edit':
    require('language/dm/edit_danhmuc.php');
    $heading_title = heading_title;
    $ten_loai = ten_loai;
    $danh_muc_cha = danh_muc_cha;
    $thu_tu = thu_tu;
    $link_list = 'index.php?module=dmdownload&act=list';
    $id = $_REQUEST['id'];
    $dmdownload = getdmdownload($id);
     
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editdmdownload($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/dmdownload/edit_dm.tpl');
    break; 
    
    case 'del':
    get_file('language/dmdownload/del_danhmuc.php');
    $link_list = 'index.php?module=dmdownload&act=list';
    $id = $_REQUEST['id'];
    deldmdownload($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;



 }
    // xoa
    

?>