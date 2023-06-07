<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_album.php');
include('model/counter.php');
include('language/lang_album.php');
include('controller/c_left.php');
include('controller/c_right.php');

include('controller/c_thongke.php');
$page = $_GET['act'];
   switch($page){
        case 'view':
      
        $title = title;
    	$heading_title= title;
        
        $id = (int)$_REQUEST['id'];//cai nay co tac dung lay id album tren url
       $hinhanh = gettenalbum($id);
        //$tenalbum_view = gettenalbum($id);//cai nay de lanm j ha cau? ti cau sua cho nay nhe, lam gi thi cau goi no ra sau 
        $hinhanh1 = totalhinhanh1($id);
        
        $start=0;
        $limit=200;
        
        $list_hinhanh1 = getListhinhanh($id, $start, $limit);//cai nay hien danh sach hinh anhco trong album
        $list_tenalbum = getListtenalbum($x,$start, $limit);
        // $tong = totaltenalbum();
         $luotxem = $hinhanh['view_id'];
        $luotxemmoi = $luotxem +1;
        congdon($luotxemmoi,$id);
        
    	require('view/theme/default/template/home/header.tpl'); 
 
        require('view/theme/default/template/album/detail.tpl');
        
        require('view/theme/default/template/home/right.tpl');  
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
        
        
               // casse lisst
        case'list':
        $id = (int)$_REQUEST['id'];//cai nay co tac dung lay id album tren url
        $hinhanh1 = totalhinhanh1($id);
        if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 20;
        $start = ($page - 1) * $limit;
        
        
        $list_album = getListalbum($start, $limit);
        
        $start=0;
        $limit=8;
        
        $list_hinhanh = getListhinhanh($id, $start, $limit);

        
        $total = totalalbum($id);
        //paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=album&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl');

    	require('view/theme/default/template/album/list.tpl');
         
        require('view/theme/default/template/home/right.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
        break;
     
       // casse lisst
        case'listby':
        
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
        
        $loaianbum = $_REQUEST['loai'];
        if($loaianbum =='1'){
            $x=1;
        }
         if($loaianbum =='2'){
            $x=2;
        }
        if($loaianbum =='3'){
            $x='3';
        }
        $list_tenalbum = getListtenalbum($x,$start, $limit);
        $total = totalhinhanh1($catid);
        //$total = totaltenalbum();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=album&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl'); 
    
    	require('view/theme/default/template/album/list.tpl');
        
        require('view/theme/default/template/home/right.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
        break;
}
?>