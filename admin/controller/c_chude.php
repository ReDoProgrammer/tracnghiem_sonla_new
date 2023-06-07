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
include('model/m_chude.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/chude/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ten_loai = ten_loai;
    $mo_ta = mo_ta;
    $thu_tu = thu_tu;
    $cot_thao_tac = cot_thao_tac;
$link_add ='index.php?module=chude&act=add';

    $list_chude = getListchude();

    require('view/template/chude/list.tpl');  
    break;
    
    //case them tuyen dung
    case 'add':
    require ('language/chude/add.php');
    
     $heading_title = heading_title;
     $ten_loai = ten_loai;
     $danh_muc_cha = danh_muc_cha;
     $thu_tu = thu_tu;

     $_SESSION['ten'] = $_POST['ten_chu_de'];
     $_SESSION['thutu'] = $_POST['thu_tu'];
     
     $link_list = 'index.php?module=chude&act=list';
    
    if($_POST['ten_chu_de']=="")
    {
    $err['exist'] = chua_nhap_ten;
    $error_chude = $err['exist']; 
    }   
        
    if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
         }

    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    insertchude($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/chude/add.tpl');
    break;
    
    //case edit
    case 'edit':
    require('language/chude/edit.php');
    $heading_title = heading_title;
    $ten_loai = ten_loai;
    $danh_muc_cha = danh_muc_cha;
    $thu_tu = thu_tu;
    $link_list = 'index.php?module=chude&act=list';
    $id = $_REQUEST['id'];
    $chude = getchude($id);
     
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editchude($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/chude/edit.tpl');
    break; 
    
    case 'del':
    get_file('language/chude/del.php');
    $link_list = 'index?module=chude&act=list';
    $id = $_REQUEST['id'];
    delchude($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;



 }
    // xoa
    

?>