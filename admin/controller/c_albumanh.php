<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */

defined('DSVH') or die('Restricted access');

if((!$_SESSION['admin'])){
    header('LOCATION: index.php?module=member&act=login');  
    exit();
}
include('controller/c_thongke.php');     
include ('model/m_albumanh.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/albumanh/list_albumanh.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ma_album_anh = ma_album_anh;
    $ten_album_anh = ten_album_anh;
    $thao_tac = thao_tac;
    $link_add ='index.php?module=albumanh&act=add';
    
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
        $albumanh = getalbumanh($id);
         if($albumanh['avatar']){
           unlink('../data/image/albumanh/'.$albumanh['avatar']);
         }
          delalbumanh($id);
         $_SESSION['success'] = del_success;
         
      }  
    //chuyen huong ve list
     header('LOCATION: '.$link_list);
     }
 
    $list_albumanh = getListalbumanh($start, $limit);
    $total = total();
    $paging = new Pagination();
    $paging->total = $total;
    $paging->limit = $limit;
    $paging->url = "index.php?module=albumanh&act=list&page={page}";
    $paging->page = $page;
    $pagination = $paging->render();
    $heading_title = heading_title." (".$total." album)";
    
    
    require('view/template/albumanh/list_albumanh.tpl');
    break;
	
	//case them chuc danh
	case 'add':
	require('language/albumanh/add_albumanh.php');
	$heading_title = heading_title;
    $ma_album_anh = ma_album_anh;
	$ten_album_anh = ten_dan_toc;
    $motachitiet = mo_ta_chi_tiet;
    $motachung = mo_ta_chung;
    $hinhdaidien = hinh_dai_dien;
    
    $link_list = 'index.php?module=albumanh&act=list';
    
    if($_POST['ten_album_anh']==""){
        $err['exist'] = chua_nhap_ten;
        $error_name = $err['exist'];
             }
    if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
    }
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    //$_POST['avatar'] = $file_name;   
    insertalbumanh($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/albumanh/edit_albumanh.tpl');
    break;
    
    //case sua dan toc
    case 'edit':
    require('language/albumanh/edit_albumanh.php');
    $heading_title = heading_title;
    $ma_album_anh = ma_album_anh;
    $ten_album_anh = ten_dan_toc;
    $motachitiet = mo_ta_chi_tiet;
    $motachung = mo_ta_chung;
    $hinhdaidien = hinh_dai_dien;
    $link_list = 'index.php?module=albumanh&act=list';
    $id = $_REQUEST['id'];
    $albumanh = getalbumanh($id);
    if(empty($_POST['avatar'])){
    $_POST['avatar'] = $albumanh['avatar'];
    }
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editalbumanh($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/albumanh/edit_albumanh.tpl');
    break; 
    
    case 'del':
    get_file('language/albumanh/del_albumanh.php');
    $link_list = 'index.php?module=albumanh&act=list';
    $id = $_REQUEST['id'];
    $albumanh = getalbumanh($id);
    if($albumanh['avatar']){
           unlink('./data/image/albumanh/'.$albumanh['avatar']);
         }
    delalbumanh($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;  
}
?>