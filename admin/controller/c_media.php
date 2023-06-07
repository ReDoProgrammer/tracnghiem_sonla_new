<?php
ob_start();
/**
 * @author nguyenbinh
 * @copyright 2012
 */
if((!$_SESSION['admin'])){
    header('LOCATION: index.php?module=member&act=login');  
    exit();
}
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_quayphim.php');
include('controller/c_block.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/quayphim/list_quayphim.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $tieu_de = tieu_de;
    $hinh_anh = hinh_anh;
    $video = video;
    $thoi_gian = thoi_gian;
    $cot_thao_tac = cot_thao_tac;
$link_add ='index.php?module=media&act=add';



$this_time = vntime_now();
		$action ="Truy cập khu vực media";
		$action_name = "vew_tdxl";
		$agent = $_SERVER['HTTP_USER_AGENT'];
		$aip = $_SERVER['REMOTE_ADDR'];
		write_logs($action, $action_name, $agent, $aip, $this_time);


if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 5;
        $start = ($page - 1) * $limit;
        
    // nhap thong tin 
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
        //kiem tra du lieu cua from
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid){
      foreach($_POST['selected'] as $id){
      
       
        delQuayphim($id);
         
      }  
   
    //chuyen huong ve list
    header('LOCATION: '.$link_list);
     }
      // het lap lieu cua film  
        
        $list_quayphim = getListQuayphim($start, $limit);
        
        $total = totalquayphim();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=media&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();



    require('view/template/quayphim/list_quayphim.tpl');  
    break;
    
    //case them can bo
    case 'add':
    require ('language/quayphim/add_quayphim.php');
    
     $heading_title = heading_title;
     $tieu_de = tieu_de;
     $hinh_anh = hinh_anh;
     $video = video;
     $noi_dung = noi_dung;
     $thoi_gian = thoi_gian;
     
     $link_list = 'index.php?module=media&act=list';
     
     
    
    $_SESSION['tieude'] = $_POST['tieu_de'];
    $_SESSION['pic'] = $_POST['hinh_anh'];
    
    if($_POST['hinh_anh']=="")
    {
    $err['exist'] = 'Nhập một hình anh demo';
    $error_pic = $err['exist']; 
    }
    $_SESSION['file'] = $_POST['file'];
    $_SESSION['video'] = $_POST['video'];
  
    $_SESSION['noidung'] = $_POST['noi_dung'];
    if($_POST['tieu_de']=="")
    {
    $err['exist'] = 'Nhâp tiêu đề cho bài viết';
    $error_tieude = $err['exist']; 
    }   
        
    if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
         }

    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    insertQuayphim($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/quayphim/add_quayphim.tpl');
    break;
    //case edit gioi thieu
    case 'edit':
    require('language/quayphim/edit_quayphim.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $hinh_anh = hinh_anh;
	$video = video;
    $noi_dung = noi_dung;
    $thoi_gian = thoi_gian;
    $link_list = 'index.php?module=media&act=list';
    $id = $_REQUEST['id'];
    $quayphim = getquayphim($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editquayphim($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/quayphim/edit_quayphim.tpl');
    break; 
    
    case 'del':
    get_file('language/quayphim/del_quayphim.php');
    $link_list = 'index.php?module=media&act=list';
    $id = $_REQUEST['id'];
    delQuayphim($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;
    
    
     case 'active':
    $id = $_GET['id'];
    set_status($id,0);
    header('LOCATION: '.'index.php?module=media&act=list');  
     exit();
    break;
    
    case 'deactive':
    $id = $_GET['id'];
    set_status($id,1);
     header('LOCATION: '.'index.php?module=media&act=list');  
     exit();
    break;

 }
    // xoa
    
ob_end_flush(); 

?>