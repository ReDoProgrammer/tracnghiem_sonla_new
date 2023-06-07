<?php
ob_start();
/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_cts.php');
include('controller/c_left.php');
include('model/counter.php');
include('controller/c_right.php');
include('controller/c_thongke.php');
require_once ('system/phpmailer/class.phpmailer.php');
$page = $_GET['act'];
 switch($page){
	
    
    //case them lien he
    case 'add':
	 
      $link_login = 'index.php?module=member&act=login';
        if(!$_SESSION['login']){
        header('LOCATION: '.$link_login);   
         exit();
    }
    session_start();
    require ('language/add_cts.php');
     
     $heading_title = heading_title;
     $ma_lien_he = ma_lien_he;
     $tieu_de = tieu_de;
     $ten = ten;
     $dia_chi = dia_chi;
     $email = email;
     $dien_thoai = dien_thoai;
     $noi_dung = noi_dung;
     $ma_bao_mat = ma_bao_mat;
     
     $link_list = 'index.php?module=cts&act=list';
     // $captcha = 'system/captcha.php?type=math';
      
	  $id = $_REQUEST['id'];
        $cts = getcts($id);
	  
      $start = 0;
      $limit = 10;
	       
      $list_cts = getListcts($start, $limit);
        
	$_SESSION['chudeid'] = $_POST['chu_de_id']; 
		
		 $_SESSION['hoten'] = $_POST['ho_ten'];
     //kiem tra du lieu nhap mobile
      if($_POST['ho_ten']==""){
        $err['exist'] = "Vui lòng nhập họ và tên";
        $error_hoten = $err['exist'];
        
       }
	   
	    $_SESSION['ngaysinh'] = $_POST['ngay_sinh'];
    
    if($_POST['ngay_sinh']=="")
    {
        $err['exist'] = "Vui lòng nhập ngày sinh";
        $error_ns = $err['exist'];
    }
	
	$_SESSION['cmt'] = $_POST['so_cmt'];    
    if($_POST['so_cmt']=="")
    {
        $err['exist'] = "Vui lòng nhập số CMT";
        $error_cmt = $err['exist'];
    }
	$_SESSION['ngaycap'] = $_POST['ngay_cap'];    
    if($_POST['ngay_cap']=="")
    {
        $err['exist'] = "Vui lòng nhập ngày cấp CMT";
        $error_ngaycap = $err['exist'];
    }
	$_SESSION['noicap'] = $_POST['noi_cap'];    
    if($_POST['noi_cap']=="")
    {
        $err['exist'] = "Vui lòng nhập nơi cấp CMT";
        $error_noicap = $err['exist'];
    }
	
	$_SESSION['tencq'] = $_POST['ten_co_quan'];    
    if($_POST['ten_co_quan']=="")
    {
        $err['exist'] = "Vui lòng nhập tên cơ quan đơn vị";
        $error_tencq = $err['exist'];
    }
	
	$_SESSION['tinhthanh'] = $_POST['tinh_thanh'];    
    if($_POST['tinh_thanh']=="")
    {
        $err['exist'] = "Vui lòng nhập tỉnh thành phố";
        $error_tinhthanh = $err['exist'];
    }
	
	$_SESSION['chucvu'] = $_POST['chuc_vu'];    
    if($_POST['chuc_vu']=="")
    {
        $err['exist'] = "Vui lòng nhập chức vụ";
        $error_chucvu = $err['exist'];
    }
	
	$_SESSION['chucdanh'] = $_POST['chuc_danh'];    
    if($_POST['chuc_danh']=="")
    {
        $err['exist'] = "Vui lòng nhập chức danh thẩm quyền";
        $error_chucdanh = $err['exist'];
    }
	
	$_SESSION['didong'] = $_POST['dien_thoai'];    
    if($_POST['dien_thoai']=="")
    {
        $err['exist'] = "Vui lòng nhập điện thoại di động";
        $error_didong = $err['exist'];
    }
	
	$_SESSION['diachi'] = $_POST['dia_chi'];    
    if($_POST['dia_chi']=="")
    {
        $err['exist'] = "Vui lòng nhập địa chỉ";
        $error_diachi = $err['exist'];
    }
	
	$_SESSION['canhantochuc'] = $_POST['tochuc_canhan_id']; 
	if($_POST['tochuc_canhan_id']=="false")
        {
        $err['exist'] = "Lựa chọn danh mục";
        $error_tochuccanhan = $err['exist'];
        }
     
	$_SESSION['goidangky'] = $_POST['goi_dang_ky'];
	 
        $_SESSION['email'] = $_POST['email'];
    if($_POST['email']==""){
        $err['exist'] = "Vui lòng nhập địa chỉ Email";
        $error_email2 = $err['exist'];
    } else{
    //kiem tra su ton tai
     $m = check_email($_POST['email']);
     if($m == '1'){
        $err['exist'] = "Email đã có người đăng ký";
        $error_email2 = $err['exist'];
     }
     }
        $_SESSION['hinhanh'] = $_POST['hinh_anh'];
        $_SESSION['mota'] = $_POST['mo_ta'];
        $_SESSION['linktai'] = $_POST['link_tai'];
        $_SESSION['mediafire'] = $_POST['mediafire'];
        $_SESSION['drive'] = $_POST['drive'];
        $_SESSION['fshare'] = $_POST['fshare'];
        $_SESSION['pass'] = $_POST['pass'];
        $_SESSION['mb'] = $_POST['mb'];
        $_SESSION['video'] = $_POST['video'];
        $_SESSION['price'] = $_POST['price'];
        
        $_SESSION['file'] = $_POST['kieu_file'];

         
      if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
         } 
		 
     if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    insertcts($_POST);
	
	      $content = content;
	      
	     $title =  'Bạn đã đăng ký tài khoản '.$_POST['email'].' thành công';
	     $to = $_POST['email'];
		 //$from = $_POST['nguoi_gui'];
		 $from = 'cksonline26@gmail.com';
	     $user_name = $cts['ho_ten'];
	     $site_name = site_name;
	     //$site_name = "Hệ thống CTS Tỉnh Sonla";
	    
        $mail = new PHPMailer(true); 
		$mail->IsSMTP();
		$mail->Host       = "smtp.gmail.com";  
try {		
		$mail->SMTPDebug  = 0;                     // enables SMTP debug information (for testing)
		$mail->SMTPAuth   = true;                  // enable SMTP authentication
		$mail->SMTPSecure = "ssl";                 // sets the prefix to the servier
		$mail->Host       = "smtp.gmail.com";      // sets GMAIL as the SMTP server
		$mail->Port       = 465;                   // set the SMTP port for the GMAIL server
		$mail->Username   = "cksonline26@gmail.com";  // GMAIL username
		$mail->Password   = "ouqzydbbisyhjqbh";            // GMAIL password
		$mail->CharSet     = "utf-8";
		
		$mail->AddReplyTo('nbinh88@gmail.com', 'CKS Sơn La');
		//$mail->AddAddress($to, $user_name);
		$mail->AddAddress($to, $user_name);
       		$mail->SetFrom($from, $site_name);
		$mail->Subject = $title;
		$mail->AltBody = $content; 
		$mail->Body = $content;
		$mail->Send();
		$_SESSION['success'] = send_mail_success;
		$_SESSION['warning'] = '';
	} catch (phpmailerException $e) {
	    $_SESSION['warning'] = 'loi smtp';
		//echo $e->errorMessage(); //Pretty error messages from PHPMailer
	} catch (Exception $e) {
		//echo $e->getMessage(); //Boring error messages from anything else!
		$_SESSION['warning'] = 'loi smtp';
	}      

		//chuyen huong ve list
		 header('LOCATION: '.$link_list);    
		 exit;
		 
		}else{
			
		//$_SESSION['warning'] = wr;
		//$_SESSION['success']='';
		
		}
    
 
    	require('view/theme/default/template/home/header.tpl'); 
    

    	require('view/theme/default/template/cts/add.tpl');
   
    	require('view/theme/default/template/home/footer.tpl');    
        break;
 
//key list

       
       case'list':
	     $link_login = 'index.php?module=member&act=login';
        if(!$_SESSION['login']){
        header('LOCATION: '.$link_login);   
         exit();
		}
       
        $heading_title = title;
        $title = title;
       	require('view/theme/default/template/home/header.tpl'); 

		require('view/theme/default/template/cts/list.tpl');
   	
    	require('view/theme/default/template/home/footer.tpl');    
        break;


		case 'view':
		  $link_login = 'index.php?module=member&act=login';
        if(!$_SESSION['login']){
        header('LOCATION: '.$link_login);   
         exit();
    }
      
        $title = title;
    	$heading_title= title;
        
        $id = $_REQUEST['id'];
        $cts = getcts($id);
        
        
         $tong = totalcts();
        
    	require('view/theme/default/template/home/header.tpl');
     
        require('view/theme/default/template/cts/view.tpl');
    	require('view/theme/default/template/home/right.tpl'); 
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;

 }

    
 ob_end_flush();  
?>