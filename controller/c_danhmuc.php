<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_tintuc.php');
include('language/lang_tintuc.php');

$page = $_GET['act'];
   switch($page){
        case 'view':
      
        $title = title;
    	$heading_title= title;
        
        $id = $_REQUEST['id'];
        $tintuc_detail = gettintuc($id);
        
        
         $tong = totaltintuc();
        
    	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/left.tpl');
    	require('view/theme/default/template/home/right.tpl'); 
    	require('view/theme/default/template/tintuc/detail.tpl');
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
        $limit = 6;
        $start = ($page - 1) * $limit;
        
        
        $list_tintuc = getLisTintuc($start, $limit);
        
        $total = totaltintuc();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=tintuc&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/left.tpl');
    	require('view/theme/default/template/home/right.tpl'); 
    	require('view/theme/default/template/tintuc/list.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
        break;
}
?>