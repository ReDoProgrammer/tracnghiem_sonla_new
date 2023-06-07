<?php

ob_start();

defined('DSVH') or die('Restricted access');
include('model/m_news.php');
include('model/counter.php');
include('controller/c_left.php');
include('controller/c_right.php');
include('language/lang_news.php');
include('controller/c_thongke.php');

$page = $_GET['act'];
   switch($page){
        case 'view':
      
        $title = title;
    	$heading_title= title;
        
        $id = $_REQUEST['id'];
        
        
        $tintuc_detail = getnews($id);
        
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
        
        //d?c duôi file
        $filename = trim($tintuc_detail['file']);
        $path = '.'.$filename;
        
        $ext = end(explode(".",$filename));
        // $tong = totalthongbao();
       
         $list_tinlienquan = getListtinhoatdonglienquan(0,5, substr($tintuc_detail['tieu_de'],0,8));
        $list_news = getListnews(1, 6);
        $tong = totalnews();
        
        $luotxem = $tintuc_detail['luot_xem_id'];
        $luotxemmoi = $luotxem +1;
        congdon($luotxemmoi,$id);
        
          //share Face
        if(!empty($tintuc_detail['hinh_anh'])){
            $image_src = 'https://mattran.sonla.gov.vn'.$tintuc_detail['hinh_anh'];
            $og_image = 'https://mattran.sonla.gov.vn'.$tintuc_detail['hinh_anh'];
        }else{
            $image_src = 'https://mattran.sonla.gov.vn'.$tintuc_detail['link_anh'];
            $og_image = 'https://mattran.sonla.gov.vn'.$tintuc_detail['hinh_anh'];
        }
        $og_url = 'https://mattran.sonla.gov.vn/index.php?module=news&act=view&id='.$id;
        $og_title = $tintuc_detail['tieu_de'];
        $og_description = $description;
        
        $tag = $tintuc_detail['mo_ta'];
        $description = $tintuc_detail['tieu_de'];
        $title = $tintuc_detail['tieu_de'];
    	require('view/theme/default/template/home/header.tpl');
        
        
        require('view/theme/default/template/news/detail.tpl');    
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
        
        
        $list_theodanhmuc = getListnews(1, $limit);
		$list_theodanhmuc1 = getListnews(0, 1);
       
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
       
        require('view/theme/default/template/news/list.tpl');
        require('view/theme/default/template/home/right.tpl');
        
    	require('view/theme/default/template/home/footer.tpl');    
        break;
        
        
        case'listbydm':
        
           $cat= (int)$_REQUEST['cat'];
  
        $cha = (int)$_REQUEST['cha'];

        
        $_SESSION['link'] = "http://".$_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
        
        $tendanhmuc = getdanhmucdl($cha);
        $tendanhmuc1 = getdanhmucnho($cat);
 
        $dm = getdanhmucdl($cha); 
        
        
      
        
           
        if($_REQUEST['page']==""){
        $page = 1;
        $start =1;        
        }
        else{                
        $page = (int)$_REQUEST['page'];             
        }
       //get input for class page
        $limit = 13;
        $start = ($page - 1) * $limit;        
        
		$theodanhmuc = (int)$_REQUEST['cha'];
       
     
        //layx ma danh muc o tren urrl 
        //index.php?module=tintuc&act=listbytype&catid=<?php echo $list['ma_danh_muc']    
 
     
        $list_theodanhmuc = getListtinhoatdong2($start, $limit);
        $total = totaltheomadanhmuc($theodanhmuc);
        $paging = new Pagination();
        $paging->total = (int)$total;
       
      
        /*
        if(!$list_theodanhmuc){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
        */
        
        
        //$total = totaltheomadanhmuccha($theodanhmuccha);//tinh tong
        // paging
        
        
         //$paging->url = "index.php?module=news&act=listbydm&cha=".$cha."&page={page}";
        $paging->limit = (int)$limit;
        if($cha){
        $paging->url = "index.php?module=news&act=listbydm&cha=".$cha."&page={page}";   
        }
        else{
        $paging->url = "index.php?module=news&act=listbydm&cat=".$cat."&page={page}";    
        }   
        $paging->page = $page;
        $pagination = $paging->render();     
       
        
        $heading_title = title;
        $title = $tendanhmuc['title'];
        $title = $tendanhmuc1['tieu_de1'];
       	require('view/theme/default/template/home/header.tpl');
        
   
        require('view/theme/default/template/news/list.tpl');
    	require('view/theme/default/template/home/right.tpl'); 
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
               
          }
ob_end_flush(); 

?>