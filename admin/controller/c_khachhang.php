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
include('model/m_khachhang.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/khachhang/list_khachhang.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $tieu_de = tieu_de;
    $thoi_gian = thoi_gian;
    $ho_ten = ho_ten;
    $thu_tu = thu_tu;
    $dia_chi = dia_chi;
    $dien_thoai = dien_thoai;
    $email = email;
    $id = id;
    $so_luong = so_luong;
    $ten_hang = ten_hang;
    $cot_thao_tac = cot_thao_tac;
    $link_add ='index.php?module=khachhang&act=add';


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
        
        
        $list_khachhang = getListkhachhang($start, $limit);
        
        $total = totalkhachhang();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=khachhang&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();



    require('view/template/khachhang/list.tpl');  
    break;
    
    //case them can bo
    case 'add':
    require ('language/khachhang/add_khachhang.php');
    
     $heading_title = heading_title;
     $ma_tin_tuc = ma_tin_tuc;
     $tieu_de = tieu_de;
    $thoi_gian = thoi_gian;
    $ho_ten = ho_ten;
    $thu_tu = thu_tu;
    $dia_chi = dia_chi;
    $dien_thoai = dien_thoai;
    $email = email;
    $id = id;
    $so_luong = so_luong;
    $ten_hang = ten_hang;
     
         $link_list = 'index.php?module=khachhang&act=list';
    
    $_SESSION['ten'] = $_POST['ten'];
    $_SESSION['email'] = $_POST['email'];
    $_SESSION['dt'] = $_POST['dien_thoai'];
    $_SESSION['diachi'] = $_POST['dia_chi'];
    $_SESSION['tenhang'] = $_POST['ten_hang'];
    $_SESSION['soluong'] = $_POST['so_luong'];
    $_SESSION['thutu'] = $_POST['thu_tu'];
    if($_POST['ten']=="")
    {
    $err['exist'] = chua_nhap_ten;
    $error_ten = $err['exist']; 
    }
     if($_POST['dien_thoai']=="")
    {
    $err['exist'] = "Vui l�ng nh?p s? di?n tho?i";
    $error_dt = $err['exist']; 
    }   
        
    if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
         }

    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    insertkhachhang($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/khachhang/add.tpl');
    break;
    //case edit gioi thieu
    case 'edit':
    require('language/khachhang/edit_khachhang.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $thoi_gian = thoi_gian;
    $ho_ten = ho_ten;
    $thu_tu = thu_tu;
    $dia_chi = dia_chi;
    $dien_thoai = dien_thoai;
    $email = email;
    $id = id;
    $so_luong = so_luong;
    $ten_hang = ten_hang;
    $link_list = 'index.php?module=khachhang&act=list';
    $id = $_REQUEST['id'];
    
    $khachhang = getkhachhang($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editkhachhang($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/khachhang/edit.tpl');
    break; 
    
    case 'del':
    get_file('language/khachhang/del_khachhang.php');
    $link_list = 'index?module=khachhang&act=list';
    $id = $_REQUEST['id'];
    delkhachhang($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;

 }
    // xoa
    

?>