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
include('model/m_ntm.php');
include('controller/c_block.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/ntm/list.php');
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
    
$link_add ='index.php?module=ntm&act=add';


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
      
       
        delntm($id);
         
      }  
   
    //chuyen huong ve list
    header('LOCATION: '.$link_list);
       } 
        
        $list_ntm = getListntm($start, $limit);
        
        $total = totalntm();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=ntm&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();



    require('view/template/ntm/list.tpl');  
    break;
    
    //case them can bo
    case 'add':
    require ('language/ntm/add.php');
    
     $heading_title = heading_title;
     $ma_tin_tuc = ma_tin_tuc;
     $tieu_de = tieu_de;
     $hinh_anh = hinh_anh;
     $mo_ta = mo_ta;
     $noi_dung = noi_dung;
     $thoi_gian = thoi_gian;
     
     $list_dm = getListdm(0,50);
         $link_list = 'index.php?module=ntm&act=list';
         
          if($_POST['dm_id']=="false")
        {
        $err['exist'] = "L?a ch?n danh m?c";
        $error_danhmuc = $err['exist'];
        }
    
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
    insertntm($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/ntm/add.tpl');
    break;
    //case edit gioi thieu
    case 'edit':
    require('language/ntm/edit.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $hinh_anh = hinh_anh;
    $mo_ta = mo_ta;
    $noi_dung = noi_dung;
    $thoi_gian = thoi_gian;
    
    
    $list_dm = getListdm(0,50);
    $link_list = 'index.php?module=ntm&act=list';
    $id = $_REQUEST['id'];
    $ntm = getntm($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editntm($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/ntm/edit.tpl');
    break; 
    
    case 'del':
    get_file('language/ntm/del.php');
    $link_list = 'index.php?module=ntm&act=list';
    $id = $_REQUEST['id'];
    delntm($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;
    
    
     case 'active':
    $id = $_GET['id'];
    set_status($id,0);
    header('LOCATION: '.'index.php?module=ntm&act=list');  
     exit();
    break;
    
    case 'deactive':
    $id = $_GET['id'];
    set_status($id,1);
     header('LOCATION: '.'index.php?module=ntm&act=list');  
     exit();
    break;

 }
    // xoa
    

?>