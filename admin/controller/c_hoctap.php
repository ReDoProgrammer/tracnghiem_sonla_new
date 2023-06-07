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
include('model/m_hoctap.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/hoctap/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $tieu_de = tieu_de;
    $thoi_gian = thoi_gian;
    $hinh_anh = hinh_anh;
    $chuyen_muc = chuyen_muc;
    $luot_xem = luot_xem;
    $cot_thao_tac = cot_thao_tac;
$link_add ='index.php?module=hoctap&act=add';


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
        
         if($_SERVER['REQUEST_METHOD']=='POST'){
      foreach($_POST['selected'] as $id){
        delhoctap($id);
      }  
    $_SESSION['success'] = del_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);
     }
        
        
        $list_hoctap = getListhoctap($start, $limit);
        
        $total = totalhoctap();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=hoctap&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();



    require('view/template/hoctap/list.tpl');  
    break;
    
    //case them can bo
    case 'add':
    require ('language/hoctap/add.php');
    
     $heading_title = heading_title;
     $ma_tin_tuc = ma_tin_tuc;
     $tieu_de = tieu_de;
     $hinh_anh = hinh_anh;
     $mo_ta = mo_ta;
     $video = "Video";
     $chuyen_muc = chuyen_muc;
     $noi_dung = noi_dung;
     $thoi_gian = thoi_gian;
     
         $link_list = 'index.php?module=hoctap&act=list';
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    inserthoctap($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/hoctap/add.tpl');
    break;
    //case edit gioi thieu
    case 'edit':
    require('language/hoctap/edit.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $hinh_anh = hinh_anh;
    $mo_ta = mo_ta;
    $chuyen_muc = chuyen_muc;
    $noi_dung = noi_dung;
    $thoi_gian = thoi_gian;
    $link_list = 'index.php?module=hoctap&act=list';
    $id = $_REQUEST['id'];
    $hoctap = gethoctap($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    edithoctap($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/hoctap/edit.tpl');
    break; 
    
    case 'del':
    get_file('language/hoctap/del.php');
    $link_list = 'index?module=news&act=list';
    $id = $_REQUEST['id'];
    delhoctap($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;

 }
    // xoa
    

?>