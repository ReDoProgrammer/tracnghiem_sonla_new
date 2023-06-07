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
include('model/m_danhmuc.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/danhmuc/list_danhmuc.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ten_loai = ten_loai;
    $mo_ta = mo_ta;
    $thu_tu = thu_tu;
    $cot_thao_tac = cot_thao_tac;
$link_add ='index.php?module=danhmuc&act=add';

    $list_danhmuc = getListDanhmuc();

    require('view/template/danhmuc/list_danhmuc.tpl');  
    break;
    
    //case them tuyen dung
    case 'add':
    require ('language/danhmuc/add_danhmuc.php');
    
     $heading_title = heading_title;
     $ten_loai = ten_loai;
     $danh_muc_cha = danh_muc_cha;
     $thu_tu = thu_tu;

     
         $link_list = 'index.php?module=danhmuc&act=list';
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    insertDanhmuc($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/danhmuc/add_danhmuc.tpl');
    break;
    
    //case edit
    case 'edit':
    require('language/danhmuc/edit_danhmuc.php');
    $heading_title = heading_title;
    $ten_loai = ten_loai;
    $danh_muc_cha = danh_muc_cha;
    $thu_tu = thu_tu;
    $link_list = 'index.php?module=danhmuc&act=list';
    $id = $_REQUEST['id'];
    $danhmuc = getDanhmuc($id);
     
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editDanhmuc($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/danhmuc/edit_danhmuc.tpl');
    break; 
    
    case 'del':
    get_file('language/danhmuc/del_danhmuc.php');
    $link_list = 'index?module=danhmuc&act=list';
    $id = $_REQUEST['id'];
    delDanhmuc($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;
    
    	//vi tri
	    case 'up':
     $link_list = './index.php?module=danhmuc&act=list';
     $id = $_REQUEST['id'];
     
     $danhmuc = getDanhmuc($id);
     $vt = $adv['sap_xep'] + 1;
     update_vitri($id,$vt);
     
     $_SESSION['success'] = up;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    break;
    
    case 'down':
    $link_list = './index.php?module=danhmuc&act=list';
    $id = $_REQUEST['id'];
     $danhmuc = getDanhmuc($id);
     $vt = $adv['sap_xep'] - 1;
     update_vitri($id,$vt);
     $_SESSION['success'] = down;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    break;
    




 }
    // xoa
    

?>