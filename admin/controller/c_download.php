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
include('model/m_download.php');
include('controller/c_block.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/download/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $cot_noi_dung = noi_dung;
    $cot_thao_tac = thao_tac;
$link_add ='index.php?module=download&act=add';


    if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 25;
        $start = ($page - 1) * $limit;
        //$list_huyen = getListHuyen(0,20);
        $list_download = getListdownload($start, $limit);
        
         $total = totaldownload();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=download&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();



    require('view/template/download/list.tpl');  
    break;
    
    
    //case add
    
    case 'add':
    session_start();
    require ('language/download/add.php');
    
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
    
     $link_list = 'index.php?module=download&act=list';
         
    
     $list_dmdownload = getListdmdownload(0,50);
     
   
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    insertdownload($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/download/add.tpl');
    break;
    
    
    
    //case edit gioi thieu
    case 'edit':
    require('language/download/edit.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $noi_dung = noi_dung;
    
    $link_list = 'index.php?module=download&act=list';
    $list_dmdownload = getListdmdownload(0,50);
    $id = $_REQUEST['id'];
    $download = getdownload($id);
      
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editdownload($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }          
    require('view/template/download/edit.tpl');
    break; 
    
    case 'del':
    get_file('language/download/del.php');
    $link_list = 'index.php?module=download&act=list';
    $id = $_REQUEST['id'];
    deldownload($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;
 }
?>