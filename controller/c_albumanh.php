<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_home.php');
include('language/lang_albumanh.php');
include('controller/c_thongke.php');
$page = $_GET['act'];
   switch($page){
        case 'view':
       
    	//lấy danh sach bang tin
    	$list_bangtin = getListbangtin(0,5);
    	$list_lkw = getListlienketweb(0,10);
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
    	$list_albumanh = getListalbumanh($start,$limit);
    	//$list_topalbumanh = getListalbumanh(0,1);
    
        $total = totalalbumanh();
        
         $luotxem = $tintuc_detail['view_id'];
        $luotxemmoi = $luotxem +1;
        congdon($luotxemmoi,$id);
        
        
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=albumanh&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
        
        $id = $_REQUEST['id'];
        $albumanh = getalbumanh($id);
        if(!$albumanh){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
        
        $title = home ." - ".$albumanh['ten_album_anh']. "- Album anh";
    	$heading_title= home;
        
    	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/left.tpl'); 
    	require('view/theme/default/template/albumanh/albumanh_detail.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
        break;
        
        case 'list':
        //lấy danh sach bang tin
    	$list_bangtin = getListbangtin(0,5);
    	$list_lkw = getListlienketweb(0,10);
    	 
        if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 30;
        $start = ($page - 1) * $limit;
        
        //$list_topmevabe = getListmevabe(0,1);
       	$list_albumanh = getListalbumanh($start, $limit);
    
        $total = totalalbumanh();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=albumanh&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
        
        $title =home ."".$albumanh['ten_tin_hoat_dong'];
    	$heading_title=home;
        
    	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/left.tpl'); 
    	require('view/theme/default/template/albumanh/albumanh_list.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
        
        break;
        
        
}
?>