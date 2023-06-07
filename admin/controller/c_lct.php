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
include('model/m_lct.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/lct/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $tieu_de = tieu_de;
    $thoi_gian = thoi_gian;
    $hinh_anh = hinh_anh;
    $luot_xem = luot_xem;
    $cot_thao_tac = cot_thao_tac;
$link_add ='index.php?module=lct&act=add';


if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 10;
        $start = ($page - 1) * $limit;
         if($_SERVER['REQUEST_METHOD']=='POST')
      {  
    foreach($_POST['selected'] as $id){
      
       
        dellct($id);
         
      }  
   
    //chuyen huong ve list
    header('LOCATION: '.$link_list);
       } 
        
        $list_lct = getListlct($start, $limit);
        
        $total = totallct();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=lct&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();



    require('view/template/lct/list.tpl');  
    break;
    
    //case them can bo
    case 'add':
    require ('language/lct/add.php');
    
     $heading_title = heading_title;
     $ma_tin_tuc = ma_tin_tuc;
     $tieu_de = tieu_de;
     $hinh_anh = hinh_anh;
     $mo_ta = mo_ta;
     $noi_dung = noi_dung;
     $thoi_gian = thoi_gian;
     
         $link_list = 'index.php?module=lct&act=list';
    
  
    $_SESSION['file'] = $_POST['file']; 
   $_SESSION['nd'] = $_POST['noi_dung']; 
   $_SESSION['ten'] = $_POST['tieu_de'];
      if($_POST['tieu_de']=="")
    {
    $err['exist'] = chua_nhap_ten;
    $error_tieude = $err['exist']; 
    }   
        
    if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
         }

    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    insertlct($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/lct/add.tpl');
    break;
    //case edit gioi thieu
    case 'edit':
    require('language/lct/edit.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $hinh_anh = hinh_anh;
    $mo_ta = mo_ta;
    $noi_dung = noi_dung;
    $thoi_gian = thoi_gian;
    $link_list = 'index.php?module=lct&act=list';
    $id = $_REQUEST['id'];
    $lct = getlct($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editlct($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/lct/edit.tpl');
    break; 
    
    case 'del':
    get_file('language/lct/del.php');
    $link_list = 'index?module=lct&act=list';
    $id = $_REQUEST['id'];
    dellct($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;

 }
    // xoa
    

?>