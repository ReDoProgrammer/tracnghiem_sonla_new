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
include('model/m_khuyenmai.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/khuyenmai/list_khuyenmai.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $tieu_de = tieu_de;
    $thoi_gian = thoi_gian;
    $cot_thao_tac = cot_thao_tac;
$link_add ='index.php?module=khuyenmai&act=add';

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
        
        
        $list_khuyenmai = getListKhuyenmai($start, $limit);
        
        $total = totalkhuyenmai();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=khuyenmai&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();

    require('view/template/khuyenmai/list_khuyenmai.tpl');  
    break;
    
    //case them can bo
    case 'add':
    require ('language/khuyenmai/add_khuyenmai.php');
    
     $heading_title = heading_title;
     $ma_khuyen_mai = ma_khuyen_mai;
     $tieu_de = tieu_de;
     $hinh_anh = hinh_anh;
     $mo_ta = mo_ta;
     $noi_dung = noi_dung;
     $thoi_gian = thoi_gian;
     
         $link_list = 'index.php?module=khuyenmai&act=list';
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    insertKhuyenmai($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/khuyenmai/add_khuyenmai.tpl');
    break;
    //case edit gioi thieu
    case 'edit':
    require('language/khuyenmai/edit_khuyenmai.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $hinh_anh = hinh_anh;
    $mo_ta = mo_ta;
    $noi_dung = noi_dung;
    $thoi_gian = thoi_gian;
    $link_list = 'index.php?module=khuyenmai&act=list';
    $id = $_REQUEST['id'];
    $khuyenmai = getKhuyenmai($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editKhuyenmai($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/khuyenmai/edit_khuyenmai.tpl');
    break; 
    
    case 'del':
    get_file('language/khuyenmai/del_khuyenmai.php');
    $link_list = 'index?module=khuyenmai&act=list';
    $id = $_REQUEST['id'];
    delKhuyenmai($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;



 }
    // xoa
    

?>