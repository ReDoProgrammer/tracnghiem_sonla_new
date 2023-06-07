<?php

ob_start();

defined('DSVH') or die('Restricted access');
include('model/m_sanpham.php');
include('model/counter.php');
include('controller/c_left.php');
include('controller/c_right.php');
include('language/lang_sanpham.php');
include('controller/c_thongke.php');

$page = $_GET['act'];
   switch($page){
        case 'view':
      
        $title = title;
    	$heading_title= title;
        
        $id = $_REQUEST['id'];
        
        
        $tintuc_detail = getsanpham($id);
        
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
        $list_sanpham = getListsanpham(1, 6);
        $tong = totalsanpham();
        
        $luotxem = $tintuc_detail['luot_xem_id'];
        $luotxemmoi = $luotxem +1;
        congdon($luotxemmoi,$id);
        
        $tag = $tintuc_detail['mo_ta'];
        $description = $tintuc_detail['tieu_de'];
        $title = $tintuc_detail['tieu_de'];
    	require('view/theme/default/template/home/header.tpl');
        
        
        require('view/theme/default/template/sanpham/detail.tpl');    
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
        
        
        $list_news = getListnews($start, $limit);
        if(!$list_news){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
        $total = totalnews();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=sanpham&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        $xem_tiep = xem_tiep;
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl'); 
       
        require('view/theme/default/template/sanpham/list.tpl');
        require('view/theme/default/template/home/right.tpl');
        
    	require('view/theme/default/template/home/footer.tpl');    
        break;
        
        
        case'listbydm':
        
        $cat= $_REQUEST['cat'];
        $cha = $_REQUEST['cha'];
        
        $_SESSION['link'] = "http://".$_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
        
        $tendanhmuc = getdanhmucdl($cat);   
        $dm = getdanhmucdl($cha); 
        
        
        if($dm['login']){
          
          if(!$_SESSION['login']){
             header('LOCATION: index.php?module=member&act=login');  
             exit(); 
          }
        
        }
        
        
        $getdmnho = getdanhmucnho($cat);
        
        if($getdmnho['login']){
          
          if(!$_SESSION['login']){
             header('LOCATION: index.php?module=member&act=login');  
             exit(); 
          }
        
        }
           
        if($_REQUEST['page']==""){
        $page = 1;
        $start =1;        
        }
        else{                
        $page = $_REQUEST['page'];             
        }
       //get input for class page
        $limit = 13;
        $start = ($page - 1) * $limit;        
        $theodanhmuc = $_REQUEST['cat'];
        
        
        //layx ma danh muc o tren urrl 
        //index.php?module=tintuc&act=listbytype&catid=<?php echo $list['ma_danh_muc']     
        $list_theodanhmuc = getListtinhoatdong2(1, $limit);
		$list_theodanhmuc1 = getListtinhoatdong2(0, 1);
        /*
        if(!$list_theodanhmuc){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
        */
        $total = totaltheomadanhmuc($theodanhmuc);//tinh tong
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=sanpham&act=listbydm&cat=".$cat."&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();        
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl');
        
   
        require('view/theme/default/template/sanpham/list.tpl');
    	require('view/theme/default/template/home/right.tpl'); 
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
               
          }
ob_end_flush(); 

?>