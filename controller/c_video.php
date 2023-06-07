<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_quayphim.php');
//include('language/lang_quayphim.php');
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
        $quayphim_view = getquayphim($id);
        if(!$quayphim_view){
           header('LOCATION: index.html');  
           exit(); 
        }
        $list_quayphim = getListQuayphim(0, 20);
         $tong = totalquayphim();
		 
		   // Get ID Video Youtube
        parse_str(parse_url($quayphim_view['video'], PHP_URL_QUERY), $MyArray);
        $idVideo = $MyArray["v"];

        
        $luotxem = $quayphim_view['luot_xem'];
        $luotxemmoi = $luotxem +1;
        congdon($luotxemmoi,$id);
        
    	require('view/theme/default/template/home/header.tpl'); 
        
       
        require('view/theme/default/template/quayphim/view.tpl');
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
        $limit = 40;
        $start = ($page - 1) * $limit;
        
        
        $list_quayphim = getListQuayphim($start, $limit);
        
        $total = totalquayphim();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=video&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        
        $heading_title = title;
        $title = Video;
       	require('view/theme/default/template/home/header.tpl');
        
    
        require('view/theme/default/template/quayphim/list.tpl'); 
        
        require('view/theme/default/template/home/right.tpl');
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
}
?>