<?php
ob_start();
/**
 * @author nbinh88@gmail.com
 * @copyright 2013
 */
if((!$_SESSION['admin'])){
    header('LOCATION: index.php?module=member&act=login');  
    exit();
}
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_dmnews.php');
include('controller/c_block.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/dm/list_danhmuc.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ten_loai = ten_loai;
    $mo_ta = mo_ta;
    $thu_tu = thu_tu;
    $cot_thao_tac = cot_thao_tac;
    
$link_add ='index.php?module=dmnews&act=add';

    $list_dm = getListdm();

    require('view/template/dmnews/list_dm.tpl');  
    break;
    
    //case them tuyen dung
    case 'add':
    require ('language/dm/add_danhmuc.php');
    
     $heading_title = heading_title;
     $ten_loai = ten_loai;
     $danh_muc_cha = danh_muc_cha;
     $thu_tu = thu_tu;

     $list_dm = getListdm(0,50);
     
     $link_list = 'index.php?module=dmnews&act=list';
     
    $_SESSION['tt'] = $_POST['sap_xep']; 
    $_SESSION['dm'] = $_POST['title'];
         if($_POST['title']=="")
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
    insertdm($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/dmnews/add_dm.tpl');
    break;
    
    //case edit
    case 'edit':
    require('language/dmnews/edit_danhmuc.php');
    $heading_title = heading_title;
    $ten_loai = ten_loai;
    $danh_muc_cha = danh_muc_cha;
    $thu_tu = thu_tu;
    $link_list = 'index.php?module=dmnews&act=list';
    $id = $_REQUEST['id'];
    $dmnews = getdm($id);
     
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editdm($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/dmnews/edit_dm.tpl');
    break; 
    
    case 'del':
    get_file('language/dm/del_danhmuc.php');
    $link_list = 'index.php?module=dmnews&act=list';
    $id = $_REQUEST['id'];
    deldmnews($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;



 }
    // xoa
    
ob_end_flush(); 

?>