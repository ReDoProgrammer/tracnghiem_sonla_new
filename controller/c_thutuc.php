<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_thutuc.php');
include('model/counter.php');
include('controller/c_left.php');
include('controller/c_right.php');
include('language/lang_thutuc.php');
include('controller/c_thongke.php');

$page = $_GET['act'];
   switch($page){
        case 'view':
      
        $title = title;
    	$heading_title= title;
        
        
        
        $_SESSION['linhvuc_id'] = $_POST['linhvuc_id'];
        $_SESSION['donvi_id'] = $_POST['donvi_id'];
        
        
        $id = $_REQUEST['id'];
        $thutuc = getthutuc($id);
        if(!$thutuc){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
       
        
        
        
        
        $list_donvi = getListdonvi(0,50);
     
     $list_linhvuc = getListlinhvuc(0,50);
     
        $list_thutuc = getListthutuc(1, 6);
         $tong = totalthutuc();
        
         $luotxem = $tintuc_detail['view'];
        $luotxemmoi = $luotxem +1;
        congdon($luotxemmoi,$id);
        
        $tag = $tintuc_detail['mo_ta'];
        $description = $tintuc_detail['tieu_de'];
        
    	require('view/theme/default/template/home/header.tpl');
        
        require('view/theme/default/template/home/left.tpl');
require('view/theme/default/template/thutuc/detail.tpl');		
    	 require('view/theme/default/template/home/right.tpl'); 
    	require('view/theme/default/template/home/footer.tpl');    
        break;
     
       // casse lisst
         case 'list':
        //lay thong tin lang 
        $timkiem = tim_kiem;
        $sohieu = so_hieu;
        
        //l?y danh sach bang tin
       //assign input data from form to the SESSION
        $_SESSION['donvi_id'] = $_POST['donvi_id'];
        $_SESSION['linhvuc_id'] = $_POST['linhvuc_id'];
        
        if($_REQUEST['page']==""){
         $page = 1;
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 20;
        $start = ($page - 1) * $limit;
        
        $list_donvi = getlistdonvi(0, 100);
        $list_linhvuc = getlistlinhvuc(0,100);
    	
    	
    	if($_SERVER['REQUEST_METHOD']=='POST'){
     
	    $list_thutuc = getListtimkiemthutuc($_POST,$limit,$start);
	    //$total = tt($_POST,$limit,$start);
	  
        }else{
	
	    $list_thutuc = getListthutuc($start,$limit);
        
        if(!$list_thutuc){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
            $total = totalthutuc();
        
	    }
    	
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=vanban&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
    
        $title = home;
    	$heading_title = home;
        
        require('view/theme/default/template/home/header.tpl'); 
        
        require('view/theme/default/template/home/left.tpl');
		require('view/theme/default/template/thutuc/list.tpl');
require('view/theme/default/template/home/right.tpl');
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
        
        
        case'listbydm':
        
        $cat= $_REQUEST['cat'];
        $tendanhmuc = getdanhmucdl($cat);
        
        
        
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
        
         $theodanhmuc = $_REQUEST['cat'];
        //layx ma danh muc o tren urrl 
        //index.php?module=tintuc&act=listbytype&catid=<?php echo $list['ma_danh_muc']
        
        $list_theodanhmuc = getListtinhoatdong2($theodanhmuc,$start, $limit);
        if(!$list_theodanhmuc){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
        $total = totaltheomadanhmuc($theodanhmuc);//tinh tong
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=thutuc&act=listbydm&cat=".$cat."&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl');
        require('view/theme/default/template/thutuc/tinhoatdong_list.tpl');
        require('view/theme/default/template/home/left.tpl'); 
    	require('view/theme/default/template/home/right.tpl'); 
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
               
          }


?>