<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_hoctap.php');
include('controller/c_left.php');
include('controller/c_right.php');
include('language/lang_hoctap.php');
include('controller/c_thongke.php');

$page = $_GET['act'];
   switch($page){
        case 'view':
      
        $title = title;
    	$heading_title= title;
        
        $id = $_REQUEST['id'];
        $hoctap = gethoctap($id);
        
       
        $danh_muc = $_REQUEST['catid']; 
        //layx ma danh muc o tren urrl 
        //index.php?module=tintuc&act=listbytype&catid=<?php echo $list['ma_danh_muc']
        
        $hoctap1 = getListdmhoctap($danh_muc,$start, $limit);
        //$list_news = getListnews(1, 6);
        // $tong = totalnews();
        
         $luotxem = $hoctap['luot_xem'];
        $luotxemmoi = $luotxem +1;
        congdon($luotxemmoi,$id);
        
    	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/right.tpl');
        require('view/theme/default/template/home/left.tpl'); 
    	require('view/theme/default/template/hoctap/detail.tpl');
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
        
        
        $list_hoctap = getListhoctap($start, $limit);
        
        $total = totalnews();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=news&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        $xem_tiep = xem_tiep;
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/right.tpl');
        require('view/theme/default/template/home/left.tpl'); 
    	require('view/theme/default/template/hoctap/list.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
        break;
               
        case'listbytype':
        
        $catid = (int)$_REQUEST['catid'];
        $danhmuc = gethoctap1($catid);
        
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
        
        $danh_muc = $_REQUEST['catid']; 
        //layx ma danh muc o tren urrl 
        //index.php?module=tintuc&act=listbytype&catid=<?php echo $list['ma_danh_muc']
        
        $list_theodmhoctap = getListdmhoctap($danh_muc,$start, $limit);
        
        $total1 = totaldmhoctap($danh_muc);//tinh tong
        // paging
        $paging = new Pagination();
        $paging->total = $total1;
        $paging->limit = $limit;
        $paging->url = "index.php?module=hoctap&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl');
		require('view/theme/default/template/home/right.tpl'); 
        require('view/theme/default/template/home/left.tpl'); 
    	require('view/theme/default/template/hoctap/list.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
        break;
}

?>