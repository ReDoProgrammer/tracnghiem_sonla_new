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

include('model/m_sanpham.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/sanpham/list_sanpham.php');
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
$link_add ='index.php?module=sanpham&act=add';

     $_SESSION['tieude'] = $_POST['tieu_de'];
   
        $_SESSION['mucid'] = $_POST['muc_id'];
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
        
           
    $list_dm = getListdm(0, 100);
    
    if(($_SERVER['REQUEST_METHOD']=='POST')&& ($_POST['search']='1')){
     
	    $list_sanpham = getListtksanpham($_POST,$limit,$start);
	    $total = totaltt($_POST,$limit,$start);
		
    }else{
        
        $list_sanpham = getListsanpham($start, $limit);
        
        $total = totalsanpham();
    
    }
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=sanpham&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();

    require('view/template/sanpham/list_sanpham.tpl');  
    break;
    
    //case them can bo
    case 'add':
    session_start();
    require ('language/sanpham/add_sanpham.php');
    
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
     $link_list = 'index.php?module=sanpham&act=list';
      
      $_SESSION['tieude'] = $_POST['tieu_de'];
      $_SESSION['hinhanh'] = $_POST['hinh_anh'];
      $_SESSION['video'] = $_POST['video'];
      $_SESSION['gia'] = $_POST['gia'];
      $_SESSION['dungluong'] = $_POST['dung_luong'];
      $_SESSION['soluong'] = $_POST['so_luong'];
      $_SESSION['dingdang'] = $_POST['dinh_dang'];
       $_SESSION['anh1'] = $_POST['anh1'];
       $_SESSION['anh2'] = $_POST['anh2'];
       $_SESSION['anh3'] = $_POST['anh3'];
       $_SESSION['anh4'] = $_POST['anh4'];
       $_SESSION['noidung'] = $_POST['noi_dung'];
	   $_SESSION['dmid'] = $_POST['muc_id'];
       
       if($_POST['muc_id']=="false")
        {
        $err['exist'] = "Lựa chọn danh mục";
        $error_danhmuc = $err['exist'];
        }
       if($_POST['tieu_de']=="")
        {
        $err['exist'] = "Nhập tiêu đề sản phẩm";
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
    insertsanpham($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/sanpham/add_sanpham.tpl');
    break;
    //case them can bo
    case 'edit':
    require ('language/sanpham/edit_sanpham.php');
    
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
     
    $link_list = 'index.php?module=sanpham&act=list';
    $id = $_REQUEST['id'];
    $sanpham = getsanpham($id);
    $list_dm = getListdm(0,50);
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editsanpham($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/sanpham/edit_sanpham.tpl');
    break;
    // xoa   
    case 'del':
    get_file('language/maytinh/del_maytinh.php');
    $link_list = 'index.php?module=sanpham&act=list';
    $id = $_REQUEST['id'];
    delsanpham($id);
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