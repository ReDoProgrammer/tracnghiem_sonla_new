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
include('model/m_tuyendung.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/tuyendung/list_tuyendung.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $tieu_de = tieu_de;
    $hinh_anh = hinh_anh;
    $mo_ta = mo_ta;
    $noi_dung = noi_dung;
    $thoi_gian = thoi_gian;
    $cot_thao_tac = cot_thao_tac;
$link_add ='index.php?module=tuyendung&act=add';

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
        
        
        $list_tuyendung = getListTuyendung($start, $limit);
        
        $total = totaltuyendung();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=tuyendung&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
        

    require('view/template/tuyendung/list_tuyendung.tpl');  
    break;
    
    //case them tuyen dung
    case 'add':
    require ('language/tuyendung/add_tuyendung.php');
    
     $heading_title = heading_title;
     $ma_lien_he = ma_lien_he;
     $tieu_de = tieu_de;
     $hinh_anh = hinh_anh;
     $mo_ta = mo_ta;
     $noi_dung = noi_dung;
     $thoi_gian = thoi_gian;
     
         $link_list = 'index.php?module=tuyendung&act=list';
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    insertTuyendung($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/tuyendung/add_tuyendung.tpl');
    break;
    
    //case edit gioi thieu
    case 'edit':
    require('language/tuyendung/edit_tuyendung.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $hinh_anh = hinh_anh;
    $mo_ta = mo_ta;
    $noi_dung = noi_dung;
    $thoi_gian = thoi_gian;
    $link_list = 'index.php?module=tuyendung&act=list';
    $id = $_REQUEST['id'];
    $tuyendung = getTuyendung($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editTuyendung($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/tuyendung/edit_tuyendung.tpl');
    break; 
    
    case 'del':
    get_file('language/tuyendung/del_tuyendung.php');
    $link_list = 'index?module=tuyendung&act=list';
    $id = $_REQUEST['id'];
    delTuyendung($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;
 }
  function totaltuyendung(){
   $result = mysql_query("select * from tuyen_dung",dbconnect());
    return mysql_num_rows($result);
}   
    
?>