<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_searchdm.php');
include('language/lang_tintuc.php');
include('controller/c_left.php');
include('controller/c_right.php');
include('controller/c_thongke.php');
$page = $_GET['act'];
   switch($page){
       
     
       // casse lisst
        case'listdm':
        
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
        
        
           if($_POST['tieu_de']=="")
         {
          
        }
        
        

    
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    $list_timkiem = getListtimkiemdm($_POST['tieu_de'],$start,$limit);
    $total = totaltimkiemdm($_POST['tieu_de']);
    //het tim kiem trong list
    }
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=searchdm&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/right.tpl'); 
        require('view/theme/default/template/home/left.tpl');
    	require('view/theme/default/template/searchdm.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
        break;
               
               
       
}


?>