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
include('model/m_hethong.php');
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
$link_add ='index.php?module=news&act=add';


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
        
        
        $list_news = getListnews($start, $limit);
        
        $total = totalnews();
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
     
         $link_list = 'index.php?module=news&act=list';
    
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
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/news/add_news.tpl');
    break;
    //case edit gioi thieu
    case 'edit':
    require('language/hethong/edit.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $banner = banner;
    $mo_ta = mo_ta;
    $url = url;
    $title_name = title_name;
    $copyright = copyright;
    $generator = generator;
    $author = author;
    $dia_chi = dia_chi;
    $dien_thoai = dien_thoai;
    $email = email;
    $link_list = 'index.php?module=home';
    
    $hethong = gethethong1();
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    edithethong($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/hethong/edit.tpl');
    break; 
    
	
	
    case 'del':
    get_file('language/news/del_news.php');
    $link_list = 'index?module=news&act=list';
    $id = $_REQUEST['id'];
    delnews($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;
	
	
	case 'info':
    require('language/hethong/info.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $banner = banner;
    $mo_ta = mo_ta;
    $url = url;
    $title_name = title_name;
    $copyright = copyright;
    $generator = generator;
    $author = author;
    $dia_chi = dia_chi;
    $dien_thoai = dien_thoai;
    $email = email;
    $link_list = 'index.php?module=home';
    
    $hethong['os'] = 'Linux ict1.sonla.gov.vn 3.10.0-514.el7.x86_64 #1 SMP Tue Nov 22 16:42:41 UTC 2016 x86_64';
    $hethong['service'] = "Apache/2.4.6 (CentOS) OpenSSL/1.0.2k-fips PHP/7.0"; 
	$hethong['dev']  = "Trung tâm CNTT&TT Sơn La"; 
    $hethong['php_version']  = "PHP 7.0"; 
	$hethong['sql_version']  = "MySQL 5.6"; 
	$hethong['realeas']  = "15/12/2021"; 
	$hethong['web_version']	 = "3.0.12";    
    
    require('view/template/hethong/info.tpl');
    break; 

 }
    // xoa
    

?>