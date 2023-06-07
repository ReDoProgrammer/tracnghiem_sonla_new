<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_khuyenmai.php');
include('language/lang_khuyenmai.php');

$page = $_GET['act'];
   switch($page){
        case 'view':
      
        $title = title;
    	$heading_title= title;
        
        $id = $_REQUEST['id'];
        $khuyenmai = getkhuyenmai($id);
        
        
         $tong = totalkhuyenmai();
        
    	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/left.tpl');
    	require('view/theme/default/template/home/right.tpl'); 
    	require('view/theme/default/template/khuyenmai/view.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
        break;
     
       // casse lisst
        case'list':
        
                
        $heading_title = title;
        $title = title;
        case'list':
//phan trang        
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
        
   //list hien thi     
        $list_khuyenmai = getListKhuyenmai($start, $limit);
        
        $total = totalkhuyenmai();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=khuyenmai&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();


       	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/left.tpl');
    	require('view/theme/default/template/home/right.tpl');
    	require('view/theme/default/template/khuyenmai/list.tpl'); 
    	require('view/theme/default/template/home/footer.tpl');
        
    
        break;
}
?>