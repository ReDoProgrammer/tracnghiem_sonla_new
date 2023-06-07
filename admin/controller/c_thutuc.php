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
include('model/m_thutuc.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/thutuc/list_thutuc.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $tieu_de = tieu_de;
    $thoi_gian = thoi_gian;
    $hinh_anh = hinh_anh;
    $luot_xem = luot_xem;
    $cot_thao_tac = cot_thao_tac;
    
    $ref="http://".eregi_replace("/$","",(getenv(HTTP_HOST)?getenv(HTTP_HOST):$_SERVER['HTTP_HOST']).(getenv(REQUEST_URI)?getenv(REQUEST_URI):$_SERVER['REQUEST_URI']));
    $_SESSION['back'] = $ref;
    
$link_add ='index.php?module=thutuc&act=add';


if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 30;
        $start = ($page - 1) * $limit;
      if($_SERVER['REQUEST_METHOD']=='POST'){  
    foreach($_POST['selected'] as $id){
      
       
        delthutuc($id);
         
      }  
   
    //chuyen huong ve list
    header('LOCATION: '.$link_list);
       } 
       
       
        
        $list_thutuc = getListthutuc($start, $limit);
        
        $total = totalthutuc();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=thutuc&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();



    require('view/template/thutuc/list_thutuc.tpl');  
    break;
    
    //case them can bo
    case 'add':
    require ('language/thutuc/add_thutuc.php');
    
     $heading_title = heading_title;
     $ma_tin_tuc = ma_tin_tuc;
     $tieu_de = tieu_de;
     $hinh_anh = hinh_anh;
     $mo_ta = mo_ta;
     $noi_dung = noi_dung;
     $thoi_gian = thoi_gian;
     
    
         $link_list = 'index.php?module=thutuc&act=list';
         
          
    
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

    $list_donvi = getListdonvi(0,50);
     
     $list_linhvuc = getListlinhvuc(0,50);

    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    insertthutuc($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/thutuc/add_thutuc.tpl');
    break;
    //case edit gioi thieu
    case 'edit':
    require('language/thutuc/edit_thutuc.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $hinh_anh = hinh_anh;
    $mo_ta = mo_ta;
    $noi_dung = noi_dung;
    $thoi_gian = thoi_gian;
    $link_list = 'index.php?module=thutuc&act=list';
    $id = $_REQUEST['id'];
    $thutuc = getthutuc($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editthutuc($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/thutuc/edit_thutuc.tpl');
    break; 
    
    case 'del':
    get_file('language/thutuc/del_thutuc.php');
    $link_list = 'index?module=thutuc&act=list';
    $id = $_REQUEST['id'];
    delthutuc($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;
    
    
     case 'active':
    $id = $_GET['id'];
    set_status($id,0);
    header('location: '.'index.php?module=thutuc&act=list');
    exit();
    break;
    
    case 'deactive':
    $id = $_GET['id'];
    set_status($id,1);
    header('location: '.'index.php?module=thutuc&act=list');
    exit();
    break;

 }
    // xoa
    

?>