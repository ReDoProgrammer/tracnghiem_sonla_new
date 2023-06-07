<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_duan.php');
include('controller/c_left.php');
include('controller/c_right.php');
include('language/lang_duan.php');
include('controller/c_thongke.php');

$page = $_GET['act'];
   switch($page){
        case 'view':
      
        $title = title;
    	$heading_title= title;
        
        $id = $_REQUEST['id'];
        $duan = getduan($id);
        if(!$duan){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
       
        
        $list_duan = getListduan(1, 6);
         $tong = totalduan();
        
         $luotxem = $duan['luot_xem_id'];
        $luotxemmoi = $luotxem +1;
        congdon($luotxemmoi,$id);
        
        $tag = $duan['mo_ta'];
        $description = $duan['tieu_de'];
        
    	require('view/theme/default/template/home/header.tpl'); 

		require('view/theme/default/template/duan/detail.tpl');
 require('view/theme/default/template/home/right.tpl');
         
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
     
       // casse lisst
        case'list':
        
   
         //$id = $_REQUEST['id'];
    //$tendanhmuc1 = getdanhmucdb($id);
    
    $start = 0;
    $limit = 50;
    
	
    //$list_dmduan = getListdmduan($start, $limit);
        
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
        
        
        $list_duan = getListduan($start, $limit);
        //if(!$list_duan){
          // header('LOCATION: index.php?module=home');  
          // exit(); 
        //}
        $total = totalduan();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=duan&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        $xem_tiep = xem_tiep;
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl'); 
	
    	require('view/theme/default/template/duan/list.tpl');
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
   
   
    	require('view/theme/default/template/duan/tinhoatdong_list.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
        break;    
               
          }


?>