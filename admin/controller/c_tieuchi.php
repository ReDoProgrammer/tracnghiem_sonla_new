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

include('model/m_tieuchi.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/tieuchi/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    $theo_danh_muc = theo_danh_muc;
    $loai_san_pham = loai_san_pham;
    $ma_san_pham = ma_san_pham;
    $ten_san_pham = ten_san_pham;
    $thoi_gian = thoi_gian;
    $so_luong = so_luong;
    $dung_luong = dung_luong;
    $kho_hang = kho_hang;
    $ma_san_pham = ma_san_pham;
    $gia_san_pham = gia_san_pham;
    $hinh_anh = hinh_anh;
    $cot_thao_tac = thao_tac;
	
	$ref="http://".eregi_replace("/$","",(getenv(HTTP_HOST)?getenv(HTTP_HOST):$_SERVER['HTTP_HOST']).(getenv(REQUEST_URI)?getenv(REQUEST_URI):$_SERVER['REQUEST_URI']));
    $_SESSION['back'] = $ref;
$link_add ='index.php?module=tieuchi&act=add';



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
        
        //thuc hien tim kiem luon trong phan list
        
           if($_POST['tieu_de']=="")
         {
           $err['exist'] = "Nhập tiêu đề bài viết";
           $error_tensp = $err['exist']; 
        }
        
        
    if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
         }
    
    
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    $list_tieuchi = getListtktentieuchi($_POST['tieu_de'],$start,$limit);
    $total = totaltktentieuchi($_POST['tieu_de']);
    //het tim kiem trong list
    }else{
        
        $list_tieuchi = getListtieuchi($start, $limit);
        
        $total = totaltieuchi();
    
    }
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=tieuchi&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();

    require('view/template/tieuchi/list.tpl');  
    break;
    
    //case them can bo
    case 'add':
    session_start();
    require ('language/tieuchi/add.php');
    
     $heading_title = heading_title;
     $ma_san_pham = ma_san_pham;
     $loai_san_pham = loai_san_pham;
     $ten_san_pham = ten_san_pham;
     $hinh_anh = hinh_anh;
     $gia_san_pham = gia_san_pham;
     $bao_hanh = bao_hanh;
     $theo_danh_muc = theo_danh_muc;
     $so_luong = so_luong;
     $dung_luong = dung_luong;
     $anh1 = anh1;
     $anh2 = anh2;
     $anh3 = anh3;
     $anh4 = anh4;
     $mo_ta = mo_ta;
     $thoi_gian = thoi_gian;

     $list_dm = getListdm(0,50);
     $link_list = 'index.php?module=tieuchi&act=list';
      
$_SESSION['dmtieuchiid'] = $_POST['dmtieuchi_id'];
 $_SESSION['mota'] = $_POST['mo_ta'];
  $_SESSION['noidung'] = $_POST['noi_dung'];
   $_SESSION['file'] = $_POST['files'];
       
      // if($_POST['muc_id']=="false")
        //{
       // $err['exist'] = "Lựa chọn danh mục";
       // $error_danhmuc = $err['exist'];
      //  }
       if($_POST['tieu_de']=="")
        {
        $err['exist'] = "Nhập tiêu đề bài viết";
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
    inserttieuchi($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/tieuchi/add.tpl');
    break;
    //case them can bo
    case 'edit':
    require ('language/tieuchi/edit.php');
    
     $heading_title = heading_title;
     $ma_may_tinh = ma_may_tinh;
     $ma_san_pham = ma_san_pham;
     $loai_san_pham = loai_san_pham;
     $ten_san_pham = ten_san_pham;
     $hinh_anh = hinh_anh;
     $theo_danh_muc = theo_danh_muc;
     $gia_san_pham = gia_san_pham;
     $bao_hanh = bao_hanh;
     $hang_san_xuat = hang_san_xuat;
     $kho_hang = kho_hang;
     $khuyen_mai = khuyen_mai;
     $mo_ta = mo_ta;
     $noi_dung = noi_dung;
     $thoi_gian = thoi_gian;
     
    $link_list = 'index.php?module=tieuchi&act=list';
    $id = $_REQUEST['id'];
    $tieuchi = gettieuchi($id);
    $list_dm = getListdm(0,50);
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    edittieuchi($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/tieuchi/edit.tpl');
    break;
    // xoa   
    case 'del':
    get_file('language/tieuchi/del.php');
    $link_list = 'index.php?module=tieuchi&act=list';
    $id = $_REQUEST['id'];
    deltieuchi($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;
	
	    case 'active':
    $id = $_GET['id'];
    set_status($id,1);
    header('location: '.$_SESSION['back']);
    exit();
    break;
    
    case 'deactive':
    $id = $_GET['id'];
    set_status($id,0);
    header('location: '.$_SESSION['back']);
    exit();
    break;
    



 }

    

?>