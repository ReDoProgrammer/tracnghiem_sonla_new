<?php
ob_start();
/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_download.php');
include('language/lang_download.php');
include('controller/c_left.php');
include('controller/c_right.php');
include('controller/c_thongke.php');
$page = $_GET['act'];
   switch($page){
        case 'view':
        
		 $cat= (int)$_REQUEST['cat'];
        $tendanhmuc = getdanhmucdl($cat);
       	 $title = "".$gioithieu_detail['tieu_de'];
    	 //$heading_title=home;
    	//$list_gioithieu = getListgioithieu(0,3);
    
        $download = getdownload('id');
        if($download){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
		
		        
        $id = $_REQUEST['id'];
        $download = getdownload($id);
        
		 //d?c duôi file
        $filename = trim($download['file']);
        $path = '.'.$filename;
        
        $ext = end(explode(".",$filename));
        
        $list_download = getListdownload(0,10);
         $luotxem = (int)$download['luot_xem'];
        $luotxemmoi = $luotxem +1;
        congdon($luotxemmoi,$id);
        $description = $gioithieu_detail['tieu_de'];
    
        
    	require('view/theme/default/template/home/header.tpl');        

        require('view/theme/default/template/download/detail.tpl');
        
    	require('view/theme/default/template/home/right.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
        break;
        
        
          case'list':
        
        if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = (int)$_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 12;
        $start = ($page - 1) * $limit;
        
        
        $list_download = getListdownload($start, $limit);
        if(!$list_download){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
        $total = totaldownload();
        // paging
        $paging = new Pagination();
        $paging->total = (int)$total;
        $paging->limit = (int)$limit;
        $paging->url = "index.php?module=download&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        $xem_tiep = xem_tiep;
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl'); 
	
    	require('view/theme/default/template/download/list.tpl');

        require('view/theme/default/template/home/right.tpl');
        
    	require('view/theme/default/template/home/footer.tpl');    
        break;
        
        
        
        
         case'listbydm':
        
        $cat= (int)$_REQUEST['cat'];
        $tendanhmuc = getdanhmucdl($cat);
        
        
        
        if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 15;
        $start = ($page - 1) * $limit;
        
         $theodanhmuc = (int)$_REQUEST['cat'];
        //layx ma danh muc o tren urrl 
        //index.php?module=tintuc&act=listbytype&catid=<?php echo $list['ma_danh_muc']
        
       $list_download = getListtinhoatdong2($theodanhmuc,$start, $limit);
        
       // $list_theodanhmuc = getListtinhoatdongcon($theodanhmuc,$start, $limit);
        
        if(!$list_download){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
        $total = totaltheomadanhmuc($theodanhmuc);//tinh tong
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=download&act=listbydm&cat=".$cat."&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
       
      
        
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl');
  
        require('view/theme/default/template/download/list.tpl');
         
    	require('view/theme/default/template/home/right.tpl'); 
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
}
  ob_end_flush();
?>