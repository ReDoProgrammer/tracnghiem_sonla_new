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
include('model/m_lienket.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/lienket/list_lienket.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $tieu_de = tieu_de;
    $thoi_gian = thoi_gian;
    $link_lien_ket = link_lien_ket;
    $luot_xem = luot_xem;
    $cot_thao_tac = cot_thao_tac;
$link_add ='index.php?module=lienket&act=add';


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
        
        
        $list_lienket = getListlienket($start, $limit);
        
        $total = totallienket();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=lienket&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();



    require('view/template/lienket/list_lienket.tpl');  
    break;
    
    //case them can bo
    case 'add':
    require ('language/lienket/add_lienket.php');
    
     $heading_title = heading_title;
     $ma_tin_tuc = ma_tin_tuc;
     $tieu_de = tieu_de;
     $link_lien_ket = link_lien_ket;
     $mo_ta = mo_ta;
     $noi_dung = noi_dung;
     $thoi_gian = thoi_gian;
     
         $link_list = 'index.php?module=lienket&act=list';
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    insertlienket($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/lienket/add_lienket.tpl');
    break;
    //case edit gioi thieu
    case 'edit':
    require('language/lienket/edit_lienket.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $link_lien_ket = link_lien_ket;
    $mo_ta = mo_ta;
    $noi_dung = noi_dung;
    $thoi_gian = thoi_gian;
    $link_list = 'index.php?module=lienket&act=list';
    $id = $_REQUEST['id'];
    $lienket = getlienket($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editlienket($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/lienket/edit_lienket.tpl');
    break; 
    
    case 'del':
    get_file('language/lienket/del_lienket.php');
    $link_list = 'index?module=lienket&act=list';
    $id = $_REQUEST['id'];
    dellienket($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;

 }
    // xoa
    

?>