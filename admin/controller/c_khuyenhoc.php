<?php
ob_start();
/**
 * @author nbinh88@gmail.com
 * @copyright 2013
 */
if((!$_SESSION['admin'])){
  header('LOCATION: index.php?module=member&act=login');  
  exit();
}

//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_khuyenhoc.php');
include('controller/c_block.php');

	
	$list_action = get_list_action_module($_SESSION['user_id'], 'thong_bao');

$tb_view = false;
$tb_add = false;
$tb_edit = false;
$tb_del = false;

foreach($list_action as $la){
       $action = $la['action'];
       if($action == 'view'){
        $tb_view = true;
       }
       if($action == 'add'){
          $tb_add = true;
       }
       if($action == 'edit'){
          $tb_edit = true;
       }
       if($action == 'del'){
          $tb_del = tre;
       }       
}

$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/khuyenhoc/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $tieu_de = tieu_de;
    $thoi_gian = thoi_gian;
    $hinh_anh = hinh_anh;
    $luot_xem = luot_xem;
    $cot_thao_tac = cot_thao_tac;
$link_add ='index.php?module=khuyenhoc&act=add';  
$link_list = 'index.php?module=home';


if($_SESSION['phan_quyen']=='2'){
	if(!$tb_view)
    {
      $_SESSION['warning'] = "Bạn không được quyền truy cập chức năng này";
      header('LOCATION: '.$link_list);  
      exit();
    }
}

	$this_time = vntime_now();
	$action ="Săm soi khu vực thông báo";
	$action_name = "list_mem";
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
        $limit = 10;
        $start = ($page - 1) * $limit;
         if($_SERVER['REQUEST_METHOD']=='POST')
      {  
    foreach($_POST['selected'] as $id){
      
       
        delkhuyenhoc($id);
         
      }  
   
    //chuyen huong ve list
    header('LOCATION: '.$link_list);
       } 
        
        $list_khuyenhoc = getListkhuyenhoc($start, $limit);
        
        $total = totalkhuyenhoc();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=khuyenhoc&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();



    require('view/template/khuyenhoc/list.tpl');  
    break;
    
    //case them can bo
    case 'add':
    require ('language/khuyenhoc/add.php');
    
     $heading_title = heading_title;
     $ma_tin_tuc = ma_tin_tuc;
     $tieu_de = tieu_de;
     $hinh_anh = hinh_anh;
     $mo_ta = mo_ta;
     $noi_dung = noi_dung;
     $thoi_gian = thoi_gian;
     
         $link_list = 'index.php?module=khuyenhoc&act=list';
		 
		 if($_SESSION['phan_quyen']=='2'){
	if(!$tb_add)
    {
      $_SESSION['warning'] = "Bạn không được quyền truy cập chức năng này";
      header('LOCATION: '.$link_list);  
      exit();
    }
}
    
    $_SESSION['link'] = $_POST['link']; 
    $_SESSION['file'] = $_POST['file']; 
	$_SESSION['nd'] = $_POST['noi_dung']; 
	$_SESSION['ten'] = $_POST['tieu_de'];
      if($_POST['tieu_de']=="")
    {
    $err['exist'] = chua_nhap_ten;
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
    insertkhuyenhoc($_POST);
    $_SESSION['success'] = edit_success;
	
	$this_time = vntime_now();
		$action ="Truy cập khu vực thông báo";
		$action_name = "vew_tdxl";
		$agent = $_SERVER['HTTP_USER_AGENT'];
		$aip = $_SERVER['REMOTE_ADDR'];
		write_logs($action, $action_name, $agent, $aip, $this_time);
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/khuyenhoc/add.tpl');
    break;
    //case edit gioi thieu
    case 'edit':
    require('language/khuyenhoc/edit.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $hinh_anh = hinh_anh;
    $mo_ta = mo_ta;
    $noi_dung = noi_dung;
    $thoi_gian = thoi_gian;
    $link_list = 'index.php?module=khuyenhoc&act=list';
	
		 if($_SESSION['phan_quyen']=='2'){
	if(!$tb_add)
    {
      $_SESSION['warning'] = "Bạn không được quyền truy cập chức năng này";
      header('LOCATION: '.$link_list);  
      exit();
    }
}
    $id = $_REQUEST['id'];
    $khuyenhoc = getkhuyenhoc($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editkhuyenhoc($id, $_POST);
    $_SESSION['success'] = edit_success;
	
	$this_time = vntime_now();
    write_logs("Thêm mới ".$_POST['tieu_de'], $this_time);
	
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/khuyenhoc/edit.tpl');
    break; 
    
    case 'del':
    get_file('language/khuyenhoc/del.php');
    $link_list = 'index.php?module=khuyenhoc&act=list';
	


    if(!$tb_del)
    {
      $_SESSION['warning'] = "Bạn không được quyền thực hiện chức năng xóa thông tin ở mục này";
      header('LOCATION: '.$link_list);  
      exit();
    }

	if($tb_del){
	
    $id = $_REQUEST['id'];
    delkhuyenhoc($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
	} 
    break;

 }
    // xoa
    
  ob_end_flush(); 
?>