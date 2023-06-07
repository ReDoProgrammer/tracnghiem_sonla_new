<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_home.php');
include('model/counter.php');
include('language/lang_about.php');
include('controller/c_left.php');
include('controller/c_right.php');
include('controller/c_thongke.php');
$page = $_GET['act'];
   switch($page){
        case 'view':
        
       		 $$title = title;
    	$heading_title= title;
    	//$list_gioithieu = getListgioithieu(0,3);
    
        $about = getabout('id');
        if(!gioithieu_detail){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
        
        $id = (int)$_REQUEST['id'];
        $gioithieu_detail = getabout($id);
        
        $tag = $about_detail['mo_ta'];
        $description = $about['tieu_de'];
        $title = $gioithieu_detail['tieu_de'];
    
        
    	require('view/theme/default/template/home/header.tpl');
 
        require('view/theme/default/template/about/detail.tpl');
    	
    	require('view/theme/default/template/home/right.tpl'); 
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
}
?>