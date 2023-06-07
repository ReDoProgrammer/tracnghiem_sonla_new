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
include('model/m_hoi.php');
include('controller/c_block.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
	$_SESSION['tieude'] = $_POST['title'];
    //Get language
    require('language/hoi/list_hoi.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $title = title;
	$loai_cau_hoi = loai_cau_hoi;
	$dia_chi = dia_chi;
    $thoi_gian = thoi_gian;
    $hinh_anh = hinh_anh;
    $author = author;
    $luot_xem = luot_xem;
	$email = email;
	$tim_kiem = tim_kiem;
    $cot_thao_tac = cot_thao_tac;
    $link_add ='index.php?module=hoi&act=add';
	
	 if($_POST['title']=="")
         {
           $err['exist'] = "Nhập từ khóa để tìm kiếm";
           $error_tentk = $err['exist']; 
        }
    if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
    }
    
    if($_REQUEST['page']==""){ $page = 1;}
    else{$page = $_REQUEST['page'];}
    
    //get input for class page
      $limit = 5;
      $start = ($page - 1) * $limit; 
      
    //kiem tra du lieu cua from
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid){
       
    
   
     $list_hoi = getlisttk($_POST['title'],$start,$limit);
    $total = totalhoi2($_POST['title']);
     } else {
   
   
    
    $list_hoi = getListhoi($start, $limit);
  
    $total = totalhoi();
   }
    
    $paging = new Pagination();
    $paging->total = $total;
    $paging->limit = $limit;
    $paging->url = "index.php?module=hoi&act=list&page={page}";
    $paging->page = $page;
    $pagination = $paging->render();
     
    require('view/template/hoi/list_hoi.tpl');
    break;
	
    //case them can bo
    case 'add':
    require ('language/hoi/add_hoi.php');
    
     $heading_title = heading_title;
     $ma_tin_tuc = ma_tin_tuc;
     $title = title;
     $hinh_anh = hinh_anh;
     $file = file;
     $link = link;
     $author = author;
     $mo_ta = mo_ta;
     $noi_dung = noi_dung;
     $thoi_gian = thoi_gian;
	 $loai_cau_hoi = loai_cau_hoi;
	 $dia_chi = dia_chi;
	 $email = email;
	 $tim_kiem = tim_kiem;
     
         $link_list = 'index.php?module=hoi&act=list';
    
   
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    inserthoi($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/hoi/add_hoi.tpl');
    break;
    //case edit gioi thieu
    case 'edit':
    require('language/hoi/edit_hoi.php');
    $heading_title = heading_title;
    $title = title;
    $hinh_anh = hinh_anh;
	$loai_cau_hoi = loai_cau_hoi;
	$dia_chi = dia_chi;
    $mo_ta = mo_ta;
    $noi_dung = noi_dung;
    $author = author;
    $link = link;
    $file = file;
	$email = email;
    $thoi_gian = thoi_gian;
	$tim_kiem = tim_kiem;
    $link_list = 'index.php?module=hoi&act=list';
    $id = $_REQUEST['id'];
    $hoi = gethoi($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    edithoi($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/hoi/edit_hoi.tpl');
    break; 
    
    case 'del':
    get_file('language/hoi/del_hoi.php');
    $link_list = 'index.php?module=hoi&act=list';
    $id = $_REQUEST['id'];
    delhoi($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;

 }
    // xoa
    

?>