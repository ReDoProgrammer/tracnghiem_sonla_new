<?php

/**
 * @author honestphan
 * @copyright 2012
 */
if((!$_SESSION['admin'])){
    header('LOCATION: index.php?module=member&act=login');  
    exit();
}
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_sukien.php');
include('controller/c_block.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/sukien/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $cot_noi_dung = noi_dung;
    $cot_thao_tac = thao_tac;
$link_add ='index.php?module=sukien&act=add';


    if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 35;
        $start = ($page - 1) * $limit;
        //$list_huyen = getListHuyen(0,20);
        $list_sukien = getListsukien($start, $limit);
        
        //$total1 = totalnho3();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=sukien&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();



    require('view/template/sukien/list.tpl');  
    break;
    
    
    //case add
    
    case 'add':
    session_start();
    require ('language/sukien/add.php');
    
     $heading_title = heading_title;
     $tieu_de = tieu_de;
     $theo_danh_muc = theo_danh_muc;
     $hinh_anh = hinh_anh;
     $link_anh = link_anh;
     $link_tai = link_tai;
     $kieu_file = kieu_file;
     $mediafire = mediafire;
     $fshare = fshare;
     $mb = mb;
     $mo_ta = mo_ta;
     $pass = pass;
    
     $link_list = 'index.php?module=sukien&act=list';
         
    
    // $list_dmsukien = getListdmsukien(0,50);
     
   
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    insertsukien($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/sukien/add.tpl');
    break;
    
    
    
    //case edit gioi thieu
    case 'edit':
    require('language/sukien/edit.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $noi_dung = noi_dung;
    
    $link_list = 'index.php?module=sukien&act=list';
   // $list_dmsukien = getListdmsukien(0,50);
    $id = $_REQUEST['id'];
    $sukien = getsukien($id);
      
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editsukien($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }          
    require('view/template/sukien/edit.tpl');
    break; 
    
    case 'del':
    get_file('language/sukien/del.php');
    $link_list = 'index.php?module=sukien&act=list';
    $id = $_REQUEST['id'];
    delsukien($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;
 }
?>