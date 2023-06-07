<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_danhba.php');
include('controller/c_left.php');
include('controller/c_right.php');
include('language/lang_danhba.php');
include('controller/c_thongke.php');

$page = $_GET['act'];
   switch($page){
        case 'view':
      
        $title = title;
    	$heading_title= title;
        
        $id = (int)$_REQUEST['id'];
        $tintuc_detail = getnews($id);
        if(!$tintuc_detail){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
       
        
        $list_news = getListnews(1, 6);
         $tong = totalnews();
        
         $luotxem = $tintuc_detail['luot_xem_id'];
        $luotxemmoi = $luotxem +1;
        congdon($luotxemmoi,$id);
        
        $tag = $tintuc_detail['mo_ta'];
        $description = $tintuc_detail['tieu_de'];
        
    	require('view/theme/default/template/home/header.tpl'); 

		require('view/theme/default/template/news/detail.tpl');
    	require('view/theme/default/template/home/right.tpl');
         
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
     
       // casse lisst
        case'list':
        
   
         //$id = $_REQUEST['id'];
    //$tendanhmuc1 = getdanhmucdb($id);
    
    $start = 0;
    $limit = 50;
    
    $list_dmdanhba = getListdmdanhba($start, $limit);
        
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
        
        
         
       //$theodanhmuc = $_REQUEST['id'];
        
        
        //$list_danhba = getListdanhba2($theodanhmuc,$start, $limit);
        //if(!$list_danhba){
          // header('LOCATION: index.php?module=home');  
          // exit(); 
        //}
        $total = totaldanhba();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=danhba&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        $xem_tiep = xem_tiep;
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl'); 

    	require('view/theme/default/template/danhba/list.tpl');
    	require('view/theme/default/template/home/right.tpl');
  
    	require('view/theme/default/template/home/footer.tpl');    
        break;
        
        
         case'listbydm':
        
        //$cat= $_REQUEST['cat'];
        //$tendanhmuc = getdanhmucdl($cat);
        
        
        
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
        $paging->url = "index.php?module=categories&act=listbydm&cat=".$cat."&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl');
        require('view/theme/default/template/home/left.tpl'); 
    	require('view/theme/default/template/home/right.tpl'); 
    	require('view/theme/default/template/news/tinhoatdong_list.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
        break;    
               
          }


?>