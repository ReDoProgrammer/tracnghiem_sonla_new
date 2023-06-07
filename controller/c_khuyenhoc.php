<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_khuyenhoc.php');
include('language/lang_tintuc.php');
include('model/counter.php');
include('controller/c_left.php');
include('controller/c_right.php');
include('controller/c_thongke.php');
$page = $_GET['act'];
   switch($page){
        case 'view':
      
        $title = title;
    	$heading_title= title;
        
        $id = $_REQUEST['id'];
        $khuyenhoc = getkhuyenhoc($id);
        
         //d?c duôi file
        $filename = trim($khuyenhoc['file']);
        $path = '.'.$filename;
        
        $ext = end(explode(".",$filename));
         $tong = totalkhuyenhoc();
		 
		 $list_khuyenhoc = getListkhuyenhoc(0,10);
		 
         $luotxem = $khuyenhoc['luot_xem'];
        $luotxemmoi = $luotxem +1;
        luotxem($luotxemmoi,$id);
        
    	require('view/theme/default/template/home/header.tpl'); 

		    	require('view/theme/default/template/khuyenhoc/detail.tpl');
    	require('view/theme/default/template/home/right.tpl'); 

    	require('view/theme/default/template/home/footer.tpl');    
        break;
     
       // casse lisst
        case'list':
        
        if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 7;
        $start = ($page - 1) * $limit;
        
        
        $list_khuyenhoc = getListkhuyenhoc($start, $limit);
        
        $total = totalkhuyenhoc();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=khuyenhoc&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl'); 
	require('view/theme/default/template/khuyenhoc/list.tpl');
    	require('view/theme/default/template/home/right.tpl'); 
    
    	require('view/theme/default/template/home/footer.tpl');    
        break;
}
?>