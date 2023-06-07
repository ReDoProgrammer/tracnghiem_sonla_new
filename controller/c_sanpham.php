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
        $view = getsanpham($id);
		 if(!$view){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
        
        // san pham cung danh muc
        $danhmuc1 = $view['muc_id'];
        $list_splienquan = getListsplienquan($danhmuc1,0, 6);
        
        // luot xem 
        $luotxem = $view['luot_xem_id'];
        $luotxemmoi = $luotxem +1;
        luotview($luotxemmoi,$id);
        //$list_categories = getListCategories(1, 15);
         //$tong = totalcategories();
         
         // cho diem bang sao
        $rating = $view['rating'];
        if($rating!=0){
        $point = floatval($view['total']/$view['number'])*2;
        }else{
         $point =0;    
        }
        
        
        $description = $view['tieu_de'];
        $title =home ." | ".$view['tieu_de'];
    	$heading_title=home;
    	require('view/theme/default/template/home/header.tpl');
        
        
        require('view/theme/default/template/sanpham/detail.tpl');    
     	require('view/theme/default/template/home/right.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
        break;
     
    
        
       // casse lisst
        case'list':
        
		 $_SESSION['ten'] = $_POST['tieu_de'];
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
		
		
        
		  if($_SERVER['REQUEST_METHOD']=='POST')
    {
    $list_theodanhmucsp = getListtksanpham($_POST['tieu_de'],$start,$limit);
   // $total = totaltkdownload($_POST['tieu_de']);
    //het tim kiem trong list
    }else{
        
        $list_theodanhmucsp = getListsanpham($start, $limit);
       
       
        }
        $total = totalsanpham();
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
        
        
         case'listbytype':
        
         $catid = (int)$_REQUEST['catid'];
        $danhmuc_detail = getdanhmuc($catid);
        
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
        
        $list_theodanhmucsp = getListtheodanhmucsp($danh_muc,$start, $limit);
		if(!$list_theodanhmucsp){
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
		require('view/theme/default/template/sanpham/list.tpl');
		require('view/theme/default/template/home/right.tpl'); 
 
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
}
ob_end_flush(); 

?>