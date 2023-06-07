<?php

/**
 * @author nbinh88@gmail.com
 * @copyright 2013
 */

//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_danhba.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/danhba/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $tieu_de = tieu_de;
    $thoi_gian = thoi_gian;
    $hinh_anh = hinh_anh;
    $luot_xem = luot_xem;
    $cot_thao_tac = cot_thao_tac;
$link_add ='index.php?module=danhba&act=add';


if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 15;
        $start = ($page - 1) * $limit;
         if($_SERVER['REQUEST_METHOD']=='POST'){  
    foreach($_POST['selected'] as $id){
      
       
        delnews($id);
         
      }  
   
    //chuyen huong ve list
    header('LOCATION: '.$link_list);
       } 
        
        $list_danhba = getListdanhba($start, $limit);
        
        $total = totaldanhba();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=danhba&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();



    require('view/template/danhba/list.tpl');  
    break;
    
    //case them can bo
    case 'add':
    require ('language/danhba/add.php');
    
     $heading_title = heading_title;
     $ma_tin_tuc = ma_tin_tuc;
     $tieu_de = tieu_de;
     $hinh_anh = hinh_anh;
     $mo_ta = mo_ta;
     $noi_dung = noi_dung;
     $thoi_gian = thoi_gian;
     
     $list_dm = getListdm(0,50);
         $link_list = 'index.php?module=danhba&act=list';
         
          //if($_POST['dm_id']=="false")
       // {
       // $err['exist'] = "L?a ch?n danh m?c";
       // $error_danhmuc = $err['exist'];
       // }
    
    if($_POST['ho_ten']=="")
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
    insertdanhba($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/danhba/add.tpl');
    break;
    //case edit gioi thieu
    case 'edit':
    require('language/danhba/edit.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $hinh_anh = hinh_anh;
    $mo_ta = mo_ta;
    $noi_dung = noi_dung;
    $thoi_gian = thoi_gian;
    $list_dm = getListdm(0,50);
    

    $link_list = 'index.php?module=danhba&act=list';
    $id = $_REQUEST['id'];
    $danhba = getdanhba($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editdanhba($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/danhba/edit.tpl');
    break; 
    
    case 'del':
    get_file('language/danhba/del.php');
    $link_list = 'index.php?module=danhba&act=list';
    $id = $_REQUEST['id'];
    deldanhba($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;

 }
    // xoa
    

?>