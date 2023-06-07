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
include('model/m_bbt.php');
include('controller/c_block.php');
$page = $_GET['act'];
 switch($page){
 
 
	case 'view':
        
       		 $$title = title;
    	$heading_title= title;
    	//$list_gioithieu = getListgioithieu(0,3);
    
        $bbt = getbbt('id');
        if(!bbt){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
        
        $id = $_REQUEST['id'];
        $bbt = getbbt($id);
        
        $tag = $about_detail['mo_ta'];
        $description = $about['tieu_de'];
        $title = $gioithieu_detail['tieu_de'];
    
        

 
        require('view/template/bbt/view.tpl');
    	
 
        break;
 
 
    case 'list':
	$_SESSION['tieude'] = $_POST['title'];
    //Get language
    require('language/bbt/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $title = title;
	$loai_cau_bbt = loai_cau_bbt;
	$dia_chi = dia_chi;
    $tbbt_gian = tbbt_gian;
    $hinh_anh = hinh_anh;
    $author = author;
    $luot_xem = luot_xem;
	$email = email;
	$tim_kiem = tim_kiem;
    $cot_thao_tac = cot_thao_tac;
    $link_add ='index.php?module=bbt&act=add';
	
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
       
    
   
     $list_bbt = getlisttk($_POST['title'],$start,$limit);
    $total = totalbbt2($_POST['title']);
     } else {
   
   
    
    $list_bbt = getListbbt($start, $limit);
  
    $total = totalbbt();
   }
    
    $paging = new Pagination();
    $paging->total = $total;
    $paging->limit = $limit;
    $paging->url = "index.php?module=bbt&act=list&page={page}";
    $paging->page = $page;
    $pagination = $paging->render();
     
    require('view/template/bbt/list.tpl');
    break;
	
    //case them can bo
    case 'add':
    require ('language/bbt/add.php');
    
     $heading_title = heading_title;
     $ma_tin_tuc = ma_tin_tuc;
     $title = title;
     $hinh_anh = hinh_anh;
     $file = file;
     $link = link;
     $author = author;
     $mo_ta = mo_ta;
     $noi_dung = noi_dung;
     $tbbt_gian = tbbt_gian;
	 $loai_cau_bbt = loai_cau_bbt;
	 $dia_chi = dia_chi;
	 $email = email;
	 $tim_kiem = tim_kiem;
     
         $link_list = 'index.php?module=bbt&act=list';
    
   
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    insertbbt($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/bbt/add.tpl');
    break;
    //case edit gioi thieu
    case 'edit':
    require('language/bbt/edit_bbt.php');
    $heading_title = heading_title;
    $title = title;
    $hinh_anh = hinh_anh;
	$loai_cau_bbt = loai_cau_bbt;
	$dia_chi = dia_chi;
    $mo_ta = mo_ta;
    $noi_dung = noi_dung;
    $author = author;
    $link = link;
    $file = file;
	$email = email;
    $tbbt_gian = tbbt_gian;
	$tim_kiem = tim_kiem;
    $link_list = 'index.php?module=bbt&act=list';
    $id = $_REQUEST['id'];
    $bbt = getbbt($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editbbt($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/bbt/edit.tpl');
    break; 
    
    case 'del':
    get_file('language/bbt/del.php');
    $link_list = 'index.php?module=bbt&act=list';
    $id = $_REQUEST['id'];
    delbbt($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;

 }
    // xoa
    

?>