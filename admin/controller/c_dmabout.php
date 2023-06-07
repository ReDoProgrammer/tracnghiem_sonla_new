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
include('model/m_dmabout.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/dmabout/list_dmabout.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ten_loai = ten_loai;
    $mo_ta = mo_ta;
    $thu_tu = thu_tu;
    $cot_thao_tac = cot_thao_tac;
$link_add ='index.php?module=dmabout&act=add';

    $list_dmabout = getListdmabout();

    require('view/template/dmabout/list_dmabout.tpl');  
    break;
    
    //case them tuyen dung
    case 'add':
    require ('language/dmabout/add_dmabout.php');
    
     $heading_title = heading_title;
     $ten_loai = ten_loai;
     $danh_muc_cha = danh_muc_cha;
     $thu_tu = thu_tu;

     
         $link_list = 'index.php?module=dmabout&act=list';
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    insertdmabout($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/dmabout/add_dmabout.tpl');
    break;
    
    //case edit
    case 'edit':
    require('language/dmabout/edit_dmabout.php');
    $heading_title = heading_title;
    $ten_loai = ten_loai;
    $danh_muc_cha = danh_muc_cha;
    $thu_tu = thu_tu;
    $link_list = 'index.php?module=dmabout&act=list';
    $id = $_REQUEST['id'];
    $dmabout = getdmabout($id);
     
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editdmabout($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/dmabout/edit_dmabout.tpl');
    break; 
    
    case 'del':
    get_file('language/dmabout/del_dmabout.php');
    $link_list = 'index?module=dmabout&act=list';
    $id = $_REQUEST['id'];
    deldmabout($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;



 }
    // xoa
    

?>