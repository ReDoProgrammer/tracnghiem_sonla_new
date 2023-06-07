<?php
ob_start();
/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_hoi.php');
include('controller/c_left.php');
include('model/counter.php');
include('controller/c_right.php');
include('controller/c_thongke.php');
$page = $_GET['act'];
 switch($page){
    
    
    //case them lien he
    case 'add':
    session_start();
    require ('language/add_hoidap.php');
     
     $heading_title = heading_title;
     $ma_lien_he = ma_lien_he;
     $tieu_de = tieu_de;
     $ten = ten;
     $dia_chi = dia_chi;
     $email = email;
     $dien_thoai = dien_thoai;
     $noi_dung = noi_dung;
     $ma_bao_mat = ma_bao_mat;
     
     $link_list = 'index.php?module=hoidap&act=list';
    //  $captcha = 'system/captcha.php?type=math';
      
      $start = 0;
      $limit = 10;
      
      
      
      
      $list_hoidap = getListhoidap($start, $limit);
        
       $_SESSION['tieude'] = $_POST['title'];
        $_SESSION['ten'] = $_POST['author']; 
        $_SESSION['dc'] = $_POST['dia_chi'];
        $_SESSION['dt'] = $_POST['dien_thoai']; 
        $_SESSION['email'] = $_POST['email']; 
        $_SESSION['nd'] = $_POST['noi_dung'];
   
        
   //  if($_POST['captcha']==""){
      //    $err['captcha'] = ma_bao_ve;
    // }else{
    //      if($_POST['captcha'] != $_SESSION['code'])
        //     {
        //        $err['captcha'] = sai_ma_bao_ve;
        
          //   }  
    // }
     //if(!$err){
    //    $valid = true;    
   // }
   // else{
   //     $valid = false;
   // }     
         
      
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    inserthoidap($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/hoidap/add.tpl');
        require('view/theme/default/template/home/right.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
        break;
 
//key list
case'list':
       
        $heading_title = title;
        $title = title;
    
    $_SESSION['title'] = $_POST['title'];
 
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
    $list_hoidap = getListtkcauhoi($_POST['title'],$start,$limit);
   // $total = totaltktensanpham($_POST['title']);
    //het tim kiem trong list
    }else{
        
        $list_hoidap = getListhoidap($start, $limit);
        
        $total = totalhoidap();
    
    }
		
    	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/hoidap/list.tpl');
        require('view/theme/default/template/home/right.tpl'); 
    	require('view/theme/default/template/home/footer.tpl');    
        break;


  case 'view':
      
        $title = title;
    	$heading_title= title;
        
        $id = $_REQUEST['id'];
        $hoidap = gethoidap($id);
        
        
         $tong = totalhoidap();
        
    	require('view/theme/default/template/home/header.tpl');

        require('view/theme/default/template/hoidap/detail.tpl');
    	require('view/theme/default/template/home/right.tpl'); 
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;

 }

    ob_end_flush(); 

?>