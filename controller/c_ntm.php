<?php

ob_start();

defined('DSVH') or die('Restricted access');
include('model/m_ntm.php');
include('model/counter.php');
include('controller/c_left.php');
include('controller/c_right.php');
include('language/lang_ntm.php');
include('controller/c_thongke.php');

$page = $_GET['act'];
   switch($page){
        case 'view':
      
        $title = title;
    	$heading_title= title;
        
        $id = $_REQUEST['id'];
        
        
        $tintuc_detail = getntm($id);
        
        $dm = getdanhmucdl($tintuc_detail['dm_id']);   
        if($dm['login']){
          
          if(!$_SESSION['login']){
             header('LOCATION: index.php?module=member&act=login');  
             exit(); 
          }
        
        }
        
        
        
        if(!$tintuc_detail){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
       
         $list_tinlienquan = getListtinhoatdonglienquan(0,5, substr($tintuc_detail['tieu_de'],0,8));
        $list_ntm = getListntm(1, 6);
        $tong = totalntm();
        
        $luotxem = $tintuc_detail['luot_xem_id'];
        $luotxemmoi = $luotxem +1;
        congdon($luotxemmoi,$id);
        
        $tag = $tintuc_detail['mo_ta'];
        $description = $tintuc_detail['tieu_de'];
        $title = $tintuc_detail['tieu_de'];
    	require('view/theme/default/template/home/header.tpl');
        
        
        require('view/theme/default/template/ntm/detail.tpl');    
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
        $limit = 12;
        $start = ($page - 1) * $limit;
        
        
        $list_ntm = getListntm($start, $limit);
       // if(!$list_ntm){
         //  header('LOCATION: index.php?module=home');  
          // exit(); 
       // }
        $total = totalntm();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=ntm&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        $xem_tiep = xem_tiep;
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl'); 
       
        require('view/theme/default/template/ntm/list.tpl');
        require('view/theme/default/template/home/right.tpl');
        
    	require('view/theme/default/template/home/footer.tpl');    
        break;
        
        
   case'listbytype':
        
         $catid = (int)$_REQUEST['catid'];
        $danhmuc_detail = getntm($catid);
        
        if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 24;
        $start = ($page - 1) * $limit;
        
        $danh_muc = $_REQUEST['catid']; 
        //layx ma danh muc o tren urrl 
        //index.php?module=tintuc&act=listbytype&catid=<?php echo $list['ma_danh_muc']
        
        $list_ntm = getListtheodanhmucntm($danh_muc,$start, $limit);
		if(!$list_ntm){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
        
        $total = totaltheomadanhmuc($danh_muc);//tinh tong
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=sanpham&act=listbytype&catid=".$catid."&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl');
		require('view/theme/default/template/ntm/list.tpl');
		require('view/theme/default/template/home/right.tpl'); 
 
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
               
          }
ob_end_flush(); 

?>