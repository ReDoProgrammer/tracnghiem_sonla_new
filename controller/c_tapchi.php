<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_tapchi.php');
include('model/counter.php');
include('controller/c_left.php');
include('controller/c_right.php');
include('language/lang_tapchi.php');
include('controller/c_thongke.php');

$page = $_GET['act'];
   switch($page){
        case 'view':
      
        $title = title;
    	$heading_title= title;
        
        
   
        
        $id = $_REQUEST['id'];
        $tapchi = gettapchi($id);
        if(!$tapchi){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
       //d?c duôi file
        $filename = trim($tapchi['file']);
        $path = '.'.$filename;
        
        $ext = end(explode(".",$filename));
        
       $list_tapchi = getListtapchi(0, 10); 
        
        
     
        
         $luotxem = $tapchi['view'];
      $luotxemmoi = $luotxem +1;
        luotxem($luotxemmoi,$id);
        
        $tag = $tintuc_detail['mo_ta'];
        $description = $tintuc_detail['tieu_de'];
        
    	require('view/theme/default/template/home/header.tpl');
        require('view/theme/default/template/home/left.tpl');
        require('view/theme/default/template/tapchi/detail.tpl');
          
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
     
       // casse lisst
         case 'list':
         
    if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 17;
        $start = ($page - 1) * $limit;
        
        
        $list_tapchi = getListtapchi($start, $limit);
        
        $total = totaltapchi();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=tapchi&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        
        $heading_title = title;
        $title = title;
        
        require('view/theme/default/template/home/header.tpl');
        require('view/theme/default/template/home/left.tpl'); 
        require('view/theme/default/template/tapchi/list.tpl');
        require('view/theme/default/template/home/right.tpl');	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
        
        
         case 'download':
        
        $id = $_REQUEST['id'];
        $vanban_detail = getvanban($id);
       
        if(!$vanban_detail){
            exit(); 
        }
        
        //các file upload du?c d? trong 1 thu m?c riêng
        $upload_dir = "."; //l?y tên file c?n download t? URL
        $filename = $vanban_detail['file'];
        //th?c hi?n quá trình ki?m tra
        
        if(!$filename){
            exit(); 
        }
      
        $view_old = $vanban_detail['luot_tai'];
        $view_new = $view_old +1;
        update_count('van_ban','luot_tai','van_ban_id',$view_new, $id);
        //m? file d? d?c v?i ch? d? nh? phân (binary)
        //$fp = fopen($upload_dir.$filename, "rb");
        //g?i header d?n cho browser
        //header('Content-type: application/octet-stream');
        //header('Content-disposition: attachment; filename="'.$filename.'"');
        //header('Content-length: ' . filesize($upload_dir.$filename));
        //d?c file và tr? d? li?u v? cho browser
        //fpassthru($fp);
        //fclose($fp); 
        
        header('LOCATION:'.$vanban_detail['file']);  
           exit(); 
        
         break;
        
        
      }


?>