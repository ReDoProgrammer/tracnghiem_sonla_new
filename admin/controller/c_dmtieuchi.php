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
include('model/m_dmtieuchi.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/dmtieuchi/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ten_loai = ten_loai;
    $mo_ta = mo_ta;
    $thu_tu = thu_tu;
    $cot_thao_tac = cot_thao_tac;
    
	$link_add ='index.php?module=dmtieuchi&act=add';

   
    
      if($_POST['selected']==""){
        $err['exist'] = chua_chon;
        $error_name = $err['exist'];
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
    $limit = 10;
    $start = ($page - 1) * $limit; 
    
    //kiem tra du lieu cua from
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid){
      foreach($_POST['selected'] as $id){
         
        deldmtieuchi($id);
         
      }  
    $_SESSION['success'] = del_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);
     }
 
    $list_dmtieuchi = getListdmtieuchi($start, $limit);
	

    $total = totaldmtieuchi();
    $paging = new Pagination();
    $paging->total = $total;
    $paging->limit = $limit;
    $paging->url = "index.php?module=dmtieuchi&act=list&page={page}";
    $paging->page = $page;
    $pagination = $paging->render();
    $heading_title = heading_title." (".$total." loại văn bản)";

    require('view/template/dmtieuchi/list.tpl');  
    break;
    
    //case them tuyen dung
    case 'add':
    require ('language/dmtieuchi/add.php');
    
     $heading_title = heading_title;
     $ten_loai = ten_loai;
     $danh_muc_cha = danh_muc_cha;
     $thu_tu = thu_tu;

     //$dm_tieuchi = getListdm(0,50);
     
     $link_list = 'index.php?module=dmtieuchi&act=list';
     
    $_SESSION['tt'] = $_POST['thu_tu']; 
    $_SESSION['ten'] = $_POST['ten_dm'];
         if($_POST['ten_dm']=="")
         {
            $err['exist'] = ten_danh_muc;
            $error_dm = $err['exist'];
         }
         
     if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
         }     
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    insertdmtieuchi($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/dmtieuchi/add.tpl');
    break;
    
    //case edit
    case 'edit':
    require('language/dmtieuchi/edit.php');
    $heading_title = heading_title;
    $ten_loai = ten_loai;
    $danh_muc_cha = danh_muc_cha;
    $thu_tu = thu_tu;
    $link_list = 'index.php?module=dmtieuchi&act=list';
    $id = $_REQUEST['id'];
    $dmtieuchi = getdmtieuchi($id);
     
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editdmtieuchi($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/dmtieuchi/edit.tpl');
    break; 
    
    case 'del':
    get_file('language/dmtieuchi/del.php');
    $link_list = 'index?module=dmtieuchi&act=list';
    $id = $_REQUEST['id'];
    deldmtieuchi($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;



 }
    // xoa
    

?>