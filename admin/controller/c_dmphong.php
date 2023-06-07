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
include('model/m_dmphong.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/dmphong/list_danhmuc.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ten_loai = ten_loai;
    $mo_ta = mo_ta;
    $thu_tu = thu_tu;
    $cot_thao_tac = cot_thao_tac;
    
$link_add ='index.php?module=dmphong&act=add';

    $list_dm = getListdm();

    require('view/template/dmphong/list_dm.tpl');  
    break;
    
    //case them tuyen dung
    case 'add':
    require ('language/dmphong/add_danhmuc.php');
    
     $heading_title = heading_title;
     $ten_loai = ten_loai;
     $danh_muc_cha = danh_muc_cha;
     $thu_tu = thu_tu;

     $list_dm = getListdm(0,50);
     
     $link_list = 'index.php?module=dmphong&act=list';
     
    $_SESSION['tt'] = $_POST['stt']; 
    $_SESSION['dm'] = $_POST['tieu_de'];
         if($_POST['tieu_de']=="")
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
    insertdmphong($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/dmphong/add_dm.tpl');
    break;
    
    //case edit
    case 'edit':
    require('language/dmphong/edit_danhmuc.php');
    $heading_title = heading_title;
    $ten_loai = ten_loai;
    $danh_muc_cha = danh_muc_cha;
    $thu_tu = thu_tu;
    $link_list = 'index.php?module=dmphong&act=list';
    $id = $_REQUEST['id'];
    $dmphong = getdm($id);
     
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editdm($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/dmphong/edit_dm.tpl');
    break; 
    
    case 'del':
    get_file('language/dmphong/del_danhmuc.php');
    $link_list = 'index.php?module=dmphong&act=list';
    $id = $_REQUEST['id'];
    deldm($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;



 }
    // xoa
    

?>