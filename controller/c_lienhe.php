<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_lienhe.php');
include('controller/c_right.php');
include('controller/c_left.php');
include('controller/c_thongke.php');
include('model/counter.php');
$page = $_GET['act'];
 switch($page){
    
    
    //case them lien he
    case 'add':
    session_start();
    require ('language/add_lienhe.php');
     
     $heading_title = heading_title;
     $ma_lien_he = ma_lien_he;
     $tieu_de = tieu_de;
     $ten = ten;
     $dia_chi = dia_chi;
     $email = email;
     $dien_thoai = dien_thoai;
     $noi_dung = noi_dung;
     $ma_bao_mat = ma_bao_mat;
     
     
     $_SESSION['ten'] = $_POST['ten'];
     $_SESSION['tieude'] = $_POST['tieu_de'];
     $_SESSION['email'] = $_POST['email'];
     $_SESSION['dienthoai'] = $_POST['dien_thoai'];
     $_SESSION['noidung'] = $_POST['noi_dung'];
     $_SESSION['diachi'] = $_POST['dia_chi'];
     $link_list = 'index.php?module=lienhe&act=list';
    // $captcha = 'system/captcha.php?type=math';
         
    // if($_POST['captcha']==""){
     //     $err['captcha'] = ma_bao_ve;
     //}else{
     //     if($_POST['captcha'] != $_SESSION['code'])
      //       {
      //          $err['captcha'] = sai_ma_bao_ve;
        
       //      }  
   //  }
     //if(!$err){
      //  $valid = true;    
  //  }
   // else{
   //     $valid = false;
   // }     
         
      
   // if(($_SERVER['REQUEST_METHOD']=='POST')&& $valid)
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
        
    insertlienhe($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    	require('view/theme/default/template/home/header.tpl'); 
        
  
        require('view/theme/default/template/lienhe/add.tpl');
    	require('view/theme/default/template/home/right.tpl');
        
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
 
//key list
        case'list':
       
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl');

		
        require('view/theme/default/template/lienhe/list.tpl');
     	require('view/theme/default/template/home/right.tpl');   	
    	require('view/theme/default/template/home/footer.tpl');    
        break;

 }

    

?>