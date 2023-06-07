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
include('model/m_maytinh.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/maytinh/list_maytinh.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $loai_san_pham = loai_san_pham;
    $ma_san_pham = ma_san_pham;
    $ten_san_pham = ten_san_pham;
    $thoi_gian = thoi_gian;
    $kho_hang = kho_hang;
    $ma_san_pham = ma_san_pham;
    $gia_san_pham = gia_san_pham;
    $hinh_anh = hinh_anh;
    $cot_thao_tac = thao_tac;
$link_add ='index.php?module=maytinh&act=add';

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
        
        
        $list_maytinh = getListMaytinh($start, $limit);
        
        $total = totalmaytinh();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=maytinh&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();

    require('view/template/maytinh/list_maytinh.tpl');  
    break;
    
    //case them can bo
    case 'add':
    session_start();
    require ('language/maytinh/add_maytinh.php');
    
     $heading_title = heading_title;
     $ma_may_tinh = ma_may_tinh;
     $ma_san_pham = ma_san_pham;
     $loai_san_pham = loai_san_pham;
     $ten_san_pham = ten_san_pham;
     $hinh_anh = hinh_anh;
     $gia_san_pham = gia_san_pham;
     $bao_hanh = bao_hanh;
     $hang_san_xuat = hang_san_xuat;
     $kho_hang = kho_hang;
     $khuyen_mai = khuyen_mai;
     $mo_ta = mo_ta;
     $noi_dung = noi_dung;
     $thoi_gian = thoi_gian;
     $may_tinh = may_tinh;
     
     $list_danhmuccha = getListDanhmuccha();
         $link_list = 'index.php?module=maytinh&act=list';
         
         $_SESSION['masanpham'] = $_POST['ma_san_pham'];
         if($_POST['ma_san_pham']=="")
         {
           $err['exist'] = yeu_cau_nhap_ma;
        $error_ma = $err['exist']; 
        }
        
        $_SESSION['tensanpham'] = $_POST['ten_san_pham'];
         if($_POST['ten_san_pham']=="")
         {
           $err['exist'] = "nhap_ten_san_pham";
        $error_ten = $err['exist'];
        }
        $_SESSION['hinhanh'] = $_POST['hinh_anh'];
        
        
        $_SESSION['khuyenmai'] = $_POST['khuyen_mai'];
         if($_POST['khuyen_mai']=="")
         {
           $err['exist'] = "nhap_khuyen_mai";
        $error_km = $err['exist'];
        }
        
        
    if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
         }
    
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    insertMaytinh($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/maytinh/add_maytinh.tpl');
    break;
    //case them can bo
    case 'edit':
    require ('language/maytinh/edit_maytinh.php');
    
     $heading_title = heading_title;
     $ma_may_tinh = ma_may_tinh;
     $ma_san_pham = ma_san_pham;
     $loai_san_pham = loai_san_pham;
     $ten_san_pham = ten_san_pham;
     $hinh_anh = hinh_anh;
     $gia_san_pham = gia_san_pham;
     $bao_hanh = bao_hanh;
     $hang_san_xuat = hang_san_xuat;
     $kho_hang = kho_hang;
     $khuyen_mai = khuyen_mai;
     $mo_ta = mo_ta;
     $noi_dung = noi_dung;
     $thoi_gian = thoi_gian;
     
    $link_list = 'index.php?module=maytinh&act=list';
    $id = $_REQUEST['id'];
    $maytinh = getMaytinh($id);
    
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editmaytinh($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/maytinh/edit_maytinh.tpl');
    break;
    // xoa   
    case 'del':
    get_file('language/maytinh/del_maytinh.php');
    $link_list = 'index?module=maytinh&act=list';
    $id = $_REQUEST['id'];
    delMaytinh($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;

 }

    

?>