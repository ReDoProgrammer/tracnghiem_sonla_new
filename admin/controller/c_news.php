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
include('model/m_news.php');
include('controller/c_block.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/news/list_news.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $tieu_de = tieu_de;
    $thoi_gian = thoi_gian;
    $hinh_anh = hinh_anh;
    $luot_xem = luot_xem;
    $cot_thao_tac = cot_thao_tac;
    
    $ref="http://".eregi_replace("/$","",(getenv(HTTP_HOST)?getenv(HTTP_HOST):$_SERVER['HTTP_HOST']).(getenv(REQUEST_URI)?getenv(REQUEST_URI):$_SERVER['REQUEST_URI']));
    $_SESSION['back'] = $ref;
    
	$link_add ='index.php?module=news&act=add';

	$_SESSION['ten'] = $_POST['tieu_de'];
   
        $_SESSION['dmid'] = $_POST['dm_id'];

	
	   	$this_time = vntime_now();
		$action ="Truy cập khu vực tin tức";
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
        $limit = 20;
        $start = ($page - 1) * $limit;
     
         $list_dm = getListdm(0,50);
		   if($_SERVER['REQUEST_METHOD']=='POST'){ 
		   	    $list_news = getListtknews($_POST,$limit,$start);
	    $total = totaltt($_POST,$limit,$start);
		
    }else{
		
        $list_news = getListnews($start, $limit);
        
        $total = totalnews();
	}
        // paging
       // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=news&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();



    require('view/template/news/list_news.tpl');  
    break;
    
    //case them can bo
    case 'add':
    require ('language/news/add_news.php');
    
     $heading_title = heading_title;
     $ma_tin_tuc = ma_tin_tuc;
     $tieu_de = tieu_de;
     $hinh_anh = hinh_anh;
     $mo_ta = mo_ta;
     $noi_dung = noi_dung;
     $thoi_gian = thoi_gian;
     
     $_SESSION['tacgia'] = $_POST['tac_gia'];
     $_SESSION['nguontin'] = $_POST['nguon_tin'];
	 $_SESSION['tukhoa'] = $_POST['tag'];
     $_SESSION['tinlanhdao'] = $_POST['tin_lanh_dao'];
	 $_SESSION['noibat'] = $_POST['noi_bat'];
     $_SESSION['tinchay'] = $_POST['tin_chay'];
	 $_SESSION['tieude'] = $_POST['tieu_de'];
	 $_SESSION['mota'] = $_POST['mo_ta'];
	 $_SESSION['noidung'] = $_POST['noi_dung'];
	 $_SESSION['dmid'] = $_POST['dm_id'];
	 $_SESSION['hinhanh'] = $_POST['hinh_anh'];
	 $list_dm = getListdm(0,50);
     $link_list = 'index.php?module=news&act=list';
         
        if($_POST['dm_id']=="false")
        {
        $err['exist'] = "Lựa chọn danh mục";
        $error_danhmuc = $err['exist'];
        }
    
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
    insertnews($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
	
	$this_time = vntime_now();
    write_logs("Thêm mới ".$_POST['tieu_de'], $this_time);
	
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/news/add_news.tpl');
    break;
    //case edit gioi thieu
    case 'edit':
    require('language/news/edit_news.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $hinh_anh = hinh_anh;
    $mo_ta = mo_ta;
    $noi_dung = noi_dung;
    $thoi_gian = thoi_gian;
    
    
    $list_dm = getListdm(0,50);
    $link_list = 'index.php?module=news&act=list';
    $id = $_REQUEST['id'];
    $news = getnews($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editnews($id, $_POST);
    $_SESSION['success'] = edit_success;
	
	 $this_time = vntime_now();
    write_logs("Sửa tin tức - ".$id." - ".$news['tieu_de'], $this_time);
		   
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/news/edit_news.tpl');
    break; 
    
    case 'del':
    get_file('language/news/del_news.php');
    $link_list = 'index.php?module=news&act=list';
     $news = getnews($id);
	$id = $_REQUEST['id'];
    delnews($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
	
	 $this_time = vntime_now();
           write_logs("xóa tin tức - ".$id." - ".$news['tieu_de'], $this_time);
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;
    
    
     case 'active':
    $id = $_GET['id'];
    set_status($id,0);
    header('LOCATION: '.'index.php?module=news&act=list');  
     exit();
    break;
    
    case 'deactive':
    $id = $_GET['id'];
    set_status($id,1);
     header('LOCATION: '.'index.php?module=news&act=list');  
     exit();
    break;

 }
    // xoa
    
ob_end_flush(); 
?>