<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_lct.php');
include('model/counter.php');
include('language/lang_lct.php');
include('controller/c_left.php');
include('controller/c_right.php');
include('controller/c_thongke.php');
$page = $_GET['act'];
   switch($page){
        case 'view':
      
        $title = title;
    	$heading_title= title;
        
        $id = (int)$_REQUEST['id'];
        $lct = getlct($id);
        
        
         $tong = totallct();
		 
		  $list_lct = getListlct(1, 6);
		 
         $luotxem = $lct['luot_xem'];
        $luotxemmoi = $luotxem +1;
        luotxem($luotxemmoi,$id);
        
        $title = $lct['tieu_de'];
        
    	require('view/theme/default/template/home/header.tpl'); 
        require('view/theme/default/template/lct/detail.tpl');
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
                
        $page = (int)$_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 20;
        $start = ($page - 1) * $limit;
        
        
        $list_lct = getListlct($start, $limit);
        
        $total = totallct();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=lct&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        
        $heading_title = title;
        $title = title;
        
       	require('view/theme/default/template/home/header.tpl'); 
        require('view/theme/default/template/lct/list.tpl');
    	require('view/theme/default/template/home/right.tpl'); 
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
}
?>