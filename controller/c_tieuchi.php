<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_tieuchi.php');
include('model/counter.php');
include('controller/c_left.php');
include('controller/c_right.php');
include('language/lang_tieuchi.php');
include('controller/c_thongke.php');

$page = $_GET['act'];
   switch($page){
        case 'view':
      
        $title = title;
    	$heading_title= title;
        
        
        
        $_SESSION['linhvuc_id'] = $_POST['linhvuc_id'];
        $_SESSION['donvi_id'] = $_POST['donvi_id'];
        
        
        $id = $_REQUEST['id'];
        $tieuchi = gettieuchi($id);
        if(!$tieuchi){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
       
        
         //d?c duôi file
        $filename = trim($tieuchi['files']);
        $path = '.'.$filename;
        
        $ext = end(explode(".",$filename));

        
        
        $list_donvi = getListdonvi(0,50);
     
     $list_linhvuc = getListlinhvuc(0,50);
     
        $list_tieuchi = getListtieuchi(1, 6);
         $tong = totaltieuchi();
        
         $luotxem = $tintuc_detail['view'];
        $luotxemmoi = $luotxem +1;
        congdon($luotxemmoi,$id);
        
        $tag = $tintuc_detail['mo_ta'];
        $description = $tintuc_detail['tieu_de'];
        
    	require('view/theme/default/template/home/header.tpl');
        

require('view/theme/default/template/tieuchi/detail.tpl');		
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
     
	    $list_tieuchi = getListtimkiemtieuchi($_POST,$limit,$start);
	    //$total = tt($_POST,$limit,$start);
	  
        }else{
	
	    $list_tieuchi = getListtieuchi($start,$limit);
        
        if(!$list_tieuchi){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
            $total = totaltieuchi();
        
	    }
    	
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=tieuchi&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
    
        $title = home;
    	$heading_title = home;
        
        require('view/theme/default/template/home/header.tpl'); 
        

		require('view/theme/default/template/tieuchi/list.tpl');
require('view/theme/default/template/home/right.tpl');
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
        
        
        case'listbydm':
        
          $catid = (int)$_REQUEST['catid'];
        $tendanhmuc = gettieuchi($catid);
        
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
        
        $list_tieuchi = getListtheodanhmuctieuchi($danh_muc,$start, $limit);
		
        
        $total = totaltheomadanhmuc($danh_muc);//tinh tong
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=tieuchi&act=listbytype&catid=".$catid."&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl');
		require('view/theme/default/template/tieuchi/list.tpl');
		require('view/theme/default/template/home/right.tpl'); 
 
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
               
          }


?>