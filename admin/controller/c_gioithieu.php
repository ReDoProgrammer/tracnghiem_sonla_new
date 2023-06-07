<?php

/**
 * @author honestphan
 * @copyright 2012
 */
if((!$_SESSION['admin'])){
  header('LOCATION: index.php?module=member&act=login');  
  exit();
}
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_about.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/about/list_about.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $cot_noi_dung = noi_dung;
    $cot_thao_tac = thao_tac;
    $link_add ='index.php?module=about&act=add';
    
     if($_SERVER['REQUEST_METHOD']=='POST')
      {  
    foreach($_POST['selected'] as $id){
      
       
        delabout($id);
         
      } 
      } 
    $list_about = getListabout();

    require('view/template/about/list_about.tpl');  
    break;
    
    
    //case add
    
    case 'add':
    session_start();
    require ('language/about/add_about.php');
    
     $heading_title = heading_title;
     $tieu_de = tieu_de;
     $theo_danh_muc = theo_danh_muc;
     $hinh_anh = hinh_anh;
     $link_anh = link_anh;
     $link_tai = link_tai;
     $kieu_file = kieu_file;
     $mediafire = mediafire;
     $fshare = fshare;
     $mb = mb;
     $mo_ta = mo_ta;
     $pass = pass;
    
     $link_list = 'index.php?module=about&act=list';
         
    
     $list_danhmuc = getListdmabout(0,50);
     
   
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    insertabout($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/about/add_about.tpl');
    break;
    
    
    
    //case edit gioi thieu
    case 'edit':
    require('language/about/edit_about.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $noi_dung = noi_dung;
    
    $link_list = 'index.php?module=about&act=list';
    
    $id = $_REQUEST['id'];
    $about = getabout($id);
      
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editabout($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }          
    require('view/template/about/edit_about.tpl');
    break; 
 }
?>