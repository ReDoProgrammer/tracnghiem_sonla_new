<?php

/**
 * @author honestphan
 * @copyright 2011
 */
// no direct access
defined('DSVH') or die('Restricted access');
include('model/m_member.php');
include('model/m_home.php');
include('controller/c_thongke.php');
include('controller/c_block.php');
include('controller/c_left.php');
include('controller/c_right.php');
include('language/lang_member.php');
   //textlink
    $url_reg ='./index.php?module=member&act=register';

   //require_once('system/class.phpmailer.php');
   require_once ('system/phpmailer/class.phpmailer.php');
  
   if(SMTP_AUTH =='1'){
	    $authencation = 'true';
	    }else{
	    $authencation = 'false'; 
    }
 
    $page = $_REQUEST['act'];
    switch($page){
    
     /**
     * 
     *  case register
     * 
    */
    
    case'register':
    ob_start();
    
    if(SPAM_REGISTER == '1'){
        
            if(isset($_SESSION['not_multi_reg'])){
            Header("Location: index.php?module=notification&act=spam_register&id=".$_SESSION['not_multi_reg']); 
            exit;  
            }
   
    }
    // get language
    $text_agree = agree;
    $heading_title = reg_mem;
    $btn_reg = btn_reg;
    $btn_cancel = btn_cancel;
    $username =user_name;
    $email = email;
    $account_info = account_info;
    $male = male;
    $female = female;
    
    $entry_address =  entry_address;
    $entry_birthday = entry_birthday;
    $entry_captcha =entry_captcha;
    $entry_fullname=entry_fullname;
    $entry_gender=entry_gender;
    $entry_homephone=entry_homephone;
    $entry_mobilephone=entry_mobilephone;
    $entry_password=entry_password;
    $entry_profile=entry_profile;
    $entry_re_password=entry_re_password;
    $title = '';
    $title .= $heading_title;
    
    //include('controller/home/c_header.php');
   // include('controller/home/c_left.php');
   // include('controller/home/c_right.php');
  
    $captcha = 'system/captcha.php?type=math';
    //$action = "index.php?module=member&act=add";
    $direction = "./index.php?module=member&act=account";
	$link_list = 'index.php?module=member&act=account';
    $dr = $url_reg;
    //check valid form 
      
      if(empty($_POST['userName'])){
              $err['user_name']= "Nhập tên tài khoản";
        }else{
                if(strlen($_POST['userName']) < 5)
        {
         $err['user_name']= "Độ dài lớn hơn hoặc bằng 5"; 
        } else {
        $check_user_name = check_user_name($_POST['userName']);
        if($check_user_name){
           $err['user_name']= "Tên tài khoản này đã có người dùng";
        }
		}
		}
	
        if(empty($_POST['email'])){
             $err['email'] = "Yêu cầu nhập email";
        } else {
        $check_mail = check_mail($_POST['email']);
       
        if($check_mail){
             $err['email'] = $err['email'] = "Email này đã có người đăng ký";
        } }
        if((empty($_POST['password'])) && strlen($_POST['password']< 6)){
            $err['password'] = er_leng_pwd ." 6";
        }
        if(trim($_POST['password']) != trim($_POST['repassword'])){
             $err['repassword'] = er_repwd;
        }
        if(trim($_POST['captcha']) ==""){
               $err['captcha'] =er_captcha;
        }else{
        if(trim($_POST['captcha']) != $_SESSION['code']){
               $err['captcha'] = er_match;
        }
        }
        
       
        if(!$err){
            
            $valid = true;
            
        } else {
            
            $valid = false;
        }  
    
   
    if(($_SERVER['REQUEST_METHOD']=='POST') && $valid)
    {
             // hash password
            $_POST['password']= hash('sha256', $_POST['password']);
           
            
            addMember($_POST);
            
            //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    
           // Header("Location: ".$direction);
        }//end pos;t
       
        // gan loi
        if(isset($err['email'])){
            $err_email = $err['email'];
        }else{
            $err_user_name ='';
        }
        if(isset($err['password'])){
            $err_password = $err['password'];
        }else{
             $err_password = '';
        }
        if(isset($err['repassword'])){
            $err_repassword = $err['repassword'];
        }
         if(isset($err['captcha'])){
            $err_captcha = $err['captcha'];
        }else{
             $err_captcha='';
        }
         if(isset($err['address'])){
            $err_address = $err['address'];
        }else{
            $err_address = '';
        }
        // luu lai gai tri tren form
        if(isset($_POST['userName'])){
            
          $member['user_name'] = $_POST['userName'];
        }
        if(isset($_POST['email'])){
            
          $member['email'] = $_POST['email'];
        }
        if(isset($_POST['fullName'])){
           $member['full_name'] = $_POST['fullName']; 
        }
        if(isset($_POST['age'])){
            $member['age'] = $_POST['age'];
        }
        if(isset($_POST['gender'])){
            $member['gender'] = $_POST['gender'];
        }
        if(isset($_POST['homePhone'])){
            $member['homephone'] = $_POST['homePhone'];
        }
        if(isset($_POST['mobilePhone'])){
            $member['mobilephone'] = $_POST['mobilePhone'];
        }
        if(isset($_POST['address'])){
            $member['address'] = $_POST['address'];
        }
        //end luu gia tri tren form
   
    	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/left.tpl'); 
    	  include('view/theme/default/template/member/register.tpl');
         require('view/theme/default/template/home/right.tpl'); 
        
    	require('view/theme/default/template/home/footer.tpl');    
    
    ob_flush();
    break;
     
      /**
     * 
     *  active
     * 
    */
     
     case 'active':
     ob_start();
    
     
     $get_mail = trim($_GET['em']);
     $get_auth_code = trim($_GET['au']);
     
     $check = check_auth_code($get_mail, $get_auth_code);
     $new_auth_code = auth_code();
     $from = $email;
     
     if(!$check){
         
         $_SESSION['invalid'] ='Không tồn tại địa chỉ này';
         header( 'location: index.php?module=notification&act=error_url');
         exit();
        
     }else{
         
         update_active($get_mail, $get_auth_code, 1);
         update_new_pwd_and_auth_code($get_mail, $new_auth_code, $check['password']);
         
         $user_name = $check['user_name'];
         $to = trim($check['email']);
          
         //update_active($to,$new_auth_code, '1');
         $title ='Ban da kich hoat thanh vien thanh cong tren '. $site_name;
         $content = 'Email này được gửi từ danh bạ  địa chỉ Sơn La<br>';
         $content .= "Bạn đã kích hoạt tài khoản trên ".$site_name;
         $content .= "Tên đăng nhập:".$user_name.", email: ".$to;
         $content .= "<br>Đăng nhập ngay tại <a href =".$site_url."/".$url_login.">đây</a>";
          
         $type ='gmail';
         $mail = new PHPMailer(true); 
		 $mail->IsSMTP(); 
		 $mail->SMTPDebug  = 2;                     // enables SMTP debug information (for testing)
		 $mail->SMTPAuth   = true;                  // enable SMTP authentication
		 $mail->SMTPSecure = "ssl";                 // sets the prefix to the servier
		 $mail->Host       = "smtp.gmail.com";      // sets GMAIL as the SMTP server
		 $mail->Port       = 465;                   // set the SMTP port for the GMAIL server
		 $mail->Username   = "huongliem88@gmail.com";  // GMAIL username
		 $mail->Password   = "kmfboughqsiemcgd";            // GMAIL password
		 $mail->AddReplyTo('svtbjsc@gmail.com', 'SVTB');
		 $mail->AddReplyTo('huongliem88@gmail.com', 'SVTB');
		 $mail->AddAddress($to, $user_name);
			 $mail->SetFrom($from, $site_name);
		 $mail->Subject = $title;
		 $mail->AltBody = 'To view the message, please use an HTML compatible email viewer!'; 
		 $mail->Body = $content;
		 $mail->Send();
	
         header( 'location: index.php?module=notification&act=active_sucess');
         exit();
          
              
     }
    

 	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/right.tpl'); 
         include('view/theme/default/template/member/reset_pwd.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
     ob_flush();
     break;
     
     /**
     * 
     *  edit
     * 
    */
    case 'edit':
    ob_start();
    if(empty($_SESSION['name'])){
       
                 header('LOCATION: ./index.php?module=member&act=login'); 
                  exit;
                
    }
    else { //start isset session
   
    $text_agree = agree;
    $heading_title = edit_profile;
    $button_continue = update;
    $username = user_name;
    $email = email;
    $account_info = account_info;
    $title = 'SLA -';
    $title .= $heading_title;
   
    // get info of mmber
    $id = $_SESSION['user_id'];
    $member = getMember($id);
    //$action = "index.php?module=member&act=add";
    $direction = "../index.php?module=member&act=edit";
    if($_SERVER['REQUEST_METHOD']=='POST'){
           
             if(!empty($_POST['old_password'])){
                $old_pwd = hash('sha256', $_POST['old_password']);
                if($member['password']== $old_pwd){ // kiem tra mat khau cu
                    //neu mk cu dung thi kiem tra mat khau moi va mk xac nhan
                    if(($_POST['password'] == $_POST['re_password']) && (!empty($_POST['password']))){
                        
                        $_POST['password'] = hash('sha256', $_POST['password']);
                        
                    }else {
                        $rp = 1;
                        $_SESSION['err_pass']= er_repwd;
                        Header("Location: ".$direction);
                        exit;
                    }
                    
                } else { // neu mat khau cu ko dung then-> thong bao va eixt
                    $op = 1;
                    $_SESSION['err_oldpass']= er_old_pwd;
                    Header("Location: ".$direction);
                    exit;
                }
                
             } else{
                
                $_POST['password'] = $member['password'];
             }
             
             editMember($id,$_POST);
             $update =1;
             $_SESSION['update_success'] = update_success;
             Header("Location: ".$direction);
            
           
        }
     
  	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/left.tpl'); 
        include('view/theme/default/template/member/edit.tpl');
        require('view/theme/default/template/home/right.tpl'); 
    	require('view/theme/default/template/home/footer.tpl');    
    
    
    
  
    }//end seession
    ob_flush();
    break;
    
     /**
     * 
     *  login
     * 
    */
    case 'fblogin':
    include('system/facebook/facebook.php');
    
        $facebook = new Facebook(array(
	    'appId' => "149315708609003",
	    'secret' => "80e441c50637cc70ef26ecb1c2a37dd1",
	));
	
	
	$fbUserId = $facebook->getUser();
	
	if ($fbUserId) {
	    try {
	    
	        $user_profile = $facebook->api('/me');
	        
	        if (!empty($user_profile)) {
	        
	        $query="SELECT .... WHERE a.`fbid`='$fbUserId'";    
	        
	        //print_r($_SESSION);
	        //gan session khi dang nhap thanh cong
	        $_SESSION['fbuid'] = $user_profile['id'];
	        $_SESSION['fbemail'] = $user_profile['email'];
	        $_SESSION['fbname'] = $user_profile['name'];
	        $_SESSION['fbfirst_name'] = $user_profile['first_name'];
	        $_SESSION['fblast_name'] = $user_profile['last_name'];
	        
	        $_SESSION['name']= $user_profile['name'];
                //$_SESSION['user_id']= $user_profile['id'];
                //$_SESSION['type']= $result['user_type'];
                $_SESSION['email']= $user_profile['email'];
                
                //lay thong tin facebook acc roi vao bang user trong CSDL
                $member['fb_uid'] = $user_profile['id'];
                $member['userName'] = $user_profile['name'];
                $member['fullName'] = $user_profile['last_name'].$user_profile['first_name'];
                $member['email'] = $user_profile['email'];
                //kiem tra acc FB nay da co trong CSDL chua
                $check_fbacc = check_fbuid($member['fb_uid']);
                $check_fbemail = check_mail( $member['email']);
                
                if($check_fbemail || $check_fbacc){
                    
                    if(!$check_fbacc) {update_fbuid($member['fb_uid'], $member['email']); } 
                   
                } else { addMember($member);}
                
                //lay thong tin thanh vien trong CSDL
	        $tbu = getMemberByEmail($member['email']);
	        $_SESSION['user_id']= $tbu['user_id'];
	        $_SESSION['type']= $tbu['user_type'];
	        
	        if(isset($_SESSION['back'])){
	         $dr = $_SESSION['back'];
	        } else {
	          $dr ="../";
	        }
	        Header("Location: ".$dr);
                exit();
	        
	    }
	    } catch (FacebookApiException $e) {
	        $user = null;
	    }
	 } else {
	    $loginUrl = $facebook->getLoginUrl(array('scope' => 'email'));
	    header('Location: ' . $loginUrl);
	    exit();
	}
	    
    break;
    
    case 'glogin':
    require 'system/openid.php';
	try {
	   
	    $openid = new LightOpenID('');
	    
	    if(!$openid->mode) {
	       
	            $openid->identity = 'https://www.google.com/accounts/o8/id';
	            $openid->required = array('namePerson/first','namePerson/last','contact/email' );
	            header('Location: ' . $openid->authUrl());
	        
	
	    } elseif($openid->mode == 'cancel') {
	    
	    	        echo 'User has canceled authentication!';
	        
	    } else {
	    
	          $guser = $openid->getAttributes();
	          //gan sesssion
	          $_SESSION['name']=  $guser['namePerson/first']." ".$guser['namePerson/last'];
                  $_SESSION['email']= $guser['contact/email'];
		  
		 //lay thong tin google acc roi vao bang user trong CSDL
               $member['userName'] = $guser['namePerson/friendly'];
               $member['fullName'] = $guser['namePerson/first']." ".$guser['namePerson/last'];
               $member['email'] = $guser['contact/email'];
                 
                 //kiem tra acc G nay da co trong CSDL chua
                 $check_gmail = check_mail($member['email']);
                
                 if(!$check_gmail){
                    
                    addMember($member);
                    
                 } 
                
                //lay thong tin thanh vien trong CSDL
	        $tbu = getMemberByEmail($member['email']);
	        $_SESSION['user_id']= $tbu['user_id'];
	        $_SESSION['type']= $tbu['user_type'];
	        $dr ="./";
	        Header("Location: ".$dr);
                exit();
		  
	    }
	} catch(ErrorException $e) {
	    echo $e->getMessage();
	}
	
    break;
    
    
    
    case'login':
    
    ob_start();
    $action = 'index.php?module=member&act=login';
    $link_home = 'index.php?module=member&act=login';
    $link_index = 'index.php?module=home';
    $heading_title =login;
    $title = '';

    $title .= $heading_title;
    include('system/textlink.php');
 
    
        if(($_SESSION['name']!="")){
       
                  header('LOCATION: '.$url_account);  
                  exit;
                
       }
       
      if($_SERVER['REQUEST_METHOD']=='POST'){
                
                 if(empty($_POST['user_name'])){
                    $_SESSION['error_user_name']= entry_name;
                    
                 }
                  if(empty($_POST['password'])){
                    $_SESSION['error_password']= mat_khau;
                    
                 }
                 if(isset($_POST['user_name'])&&isset($_POST['password']))
                 {
                    $pwd = hash('sha256', $_POST['password']);
                    $result = login($_POST['user_name'],$pwd);
                    
                    
                
                 if($result){
                 
                 //set session 

                 $_SESSION['name']= $result['user_name'];
                 $_SESSION['user_id']= $result['user_id'];
                 $_SESSION['type']= $result['user_type'];
                 $_SESSION['avatar'] = $result['avatar'];
                 $_SESSION['email']= $result['email'];
                 
                 $member['ip']= $_SERVER['REMOTE_ADDR']; 
                 
                 insert_time_login( $_SESSION['user_id'],$member['ip']); 
               
                //chuyen huong
		 if($_SESSION['quaylai']){
		  header('LOCATION: '.$_SESSION['quaylai']);   
         exit();
		 }else{
         header('LOCATION: '.$link_index);   
         exit();
         }
         }else{
            //dangn hap sai
            //chuyen huong bat dang nhap lai
         header('LOCATION: '.$link_home);   
         exit();
        
         }
              
                    
            }
    }
    

    
    	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/left.tpl'); 
         
        include('view/theme/default/template/member/login.tpl');
		require('view/theme/default/template/home/right.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
    	
    ob_flush();
    break;
    
     /**
     * 
     *  account member
     * 
    */
    
    case'account':
     
       if(empty($_SESSION['name'])){
       
                  if(REWRITE =='0'){
                  header('LOCATION: dang-nhap.html');  
                  exit;
                  }else{
                  header('LOCATION: index.php?module=member&act=login');  
                  exit;
                  }
                
       }else{
                $heading_title = account;
                $title = 'SLA -';
                $title .= $heading_title;
               
              
                
                //$tongdiachicuatoi = total_address_in_mylist1($_SESSION['user_id']);
               // $tongbaibosung = total_my_additional1($_SESSION['user_id']);
                //$tongcommentcuatoi = total_my_comment1($_SESSION['user_id']);
                $meminfo = getMember($_SESSION['user_id']);
                
                $list_giaodich = getListGiaoDich($_SESSION['user_id'],0,20);
                
              
                	require('view/theme/default/template/home/header.tpl'); 
					require('view/theme/default/template/home/left.tpl');
					include('view/theme/default/template/member/account.tpl');				
                    require('view/theme/default/template/home/right.tpl');
					require('view/theme/default/template/home/footer.tpl');    
              
              }
       
      break;
    
    /**
     * 
     *  noitfy
     * 
    */
    
    case 'note':
 
    $heading_title = note;
    $title = 'SLA -';
    $title .= $heading_title;
    $mess = reg_success_read_mail;
    
  	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/left.tpl'); 
     include('view/theme/default/template/member/note.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
    break;
    
   
    /**
     * 
     *  request password
     * 
    */
    
    case 'pwd':
    ob_start();
   
    $heading_title ="Lấy mật khẩu mới";
    $button_continue ="Gửi đi";
    $captcha = 'system/captcha.php?type=string';
   
    
    if(empty($_POST['email'])){
         
         $err['exist'] = "Chưa nhập mail";
         $error_name = $err['exist'];
         
    }
   
    if($_POST['captcha'] != $_SESSION['code']){
        $_SESSION['err_catcha']='Đề nghị nhập chính xác mã xác nhận';
         $err['exist'] = "Đề nghị nhập chính xác mã xác nhận";
         $error_name = $err['exist'];
    }
   
  
    if(!$err){
            $valid = true;
     }else{
            $valid = false;
     }
   
    if(($_SERVER['REQUEST_METHOD']=='POST')&& $valid) { //start post
      
        $member = check_mail(trim($_POST['email']));
        $site_name ='SVTB JSC';
        //kiem tra thanh vi�n
        if($member){//2
               
                $user_name = $member['user_name'];
                $auth_code = trim($member['auth_code']);
               // $to = trim($member['email']);
                $to = $_POST['email'];
                $from = 'svtbjsc@gmail.com'; //site mail
                
                //get site info in database
                // get auth_code and email in database to senmail for member
                //start send mail
                   // date_default_timezone_set('Bangkok, Hanoi, Jakarta');
                $subject ="Yeu cau mat khau moi tren ".$site_name;
                $content = $user_name." thân mến!<br>";
                $content .= 'Email này được gửi từ Danh bạ Sơn La<br>';
                $content .= "Bấm vào <a href =".$site_url."index.php?module=member&act=resetpwd&em=".$to."&au=".$auth_code.">day </a> để lấy lại mật khẩu mới";
                $content .= "<br> hoặc dán địa chỉ :".$site_url."index.php?module=member&act=resetpwd&em=".$to."&au=".$auth_code." vào trình duyệt";
                //end send mail
                //start send mail
                $type ='gmail';
                $mail = new PHPMailer(true); 
		$mail->IsSMTP(); 
		$mail->SMTPDebug  = 2;                     // enables SMTP debug information (for testing)
		$mail->SMTPAuth   = true;                  // enable SMTP authentication
		$mail->SMTPSecure = "ssl";                 // sets the prefix to the servier
		 $mail->Host       = "smtp.gmail.com";      // sets GMAIL as the SMTP server
		$mail->Port       = 465;                   // set the SMTP port for the GMAIL server
			       $mail->Username   = "huongliem88@gmail.com";  // GMAIL username
			       $mail->Password   = "kmfboughqsiemcgd";            // GMAIL password
			       $mail->AddReplyTo('svtbjsc@gmail.com', 'SVTB');
			       $mail->AddReplyTo('svtbjsc@gmail.com', 'SVTB');
			       $mail->AddAddress($to, $user_name);
                               $mail->SetFrom($from, $site_name);
			       $mail->Subject = $subject;
			       $mail->AltBody = 'To view the message, please use an HTML compatible email viewer!'; 
			       $mail->Body = $content;
			  
			  $mail->Send();
			 
			
                // end send mail 
                  $_SESSION['member_email'] = $_POST['email'];   
                  // thong bao nhan dc mot email 
                  header('LOCATION: index.php?module=member&act=mess&n=rsp');   
                  exit(); 
        
         } else {//2
          
            $_SESSION['err_mail']='Email không tồn tại';
            header('LOCATION: index.php?module=member&act=pwd');  
            exit();
        
         }//2
        
    }// end post
    
    	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/left.tpl'); 
     include('view/theme/default/template/member/pwd.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
    ob_flush();
    break;
    
    /**
     * 
     *  reset password
     * 
    */
    
    case 'resetpwd':
    ob_start();
    
 
   
    $heading_title ="Thông báo";
    //get info from url
    $get_auth_code = trim($_GET['au']); // auth code
    $get_email_encoded = trim($_GET['em']); //email encode
    $check_authencation = check_auth_code($get_email_encoded, $get_auth_code);
    
    if(!$check_authencation){
        
        $_SESSION['invalid'] ='Không tồn tại địa chỉ vừa rồi';
        header( 'location: index.php?module=notification&act=error_url');
        exit();
        
    } else {
        
    $new_auth_code = auth_code();//make new auth code
    $new_pwd = make_pwd(); // make new pwd string
    $hash_new_pwd = hash('sha256', $new_pwd); // hash new pwd string to insert in database
    update_new_pwd_and_auth_code($get_email_encoded, $new_auth_code, $hash_new_pwd);
    //get info to send
    $to = $check_authencation['email']; //get mail for security
    //$to = $get_email_encoded;
    $from = $email;
    $user_name = $check_authencation['user_name'];
    $authencation = SMTP_AUTH;
    $title  ="Mật khẩu mới của bạn trên ".$site_name;
    $content = "Mật khẩu mới của " .$user_name. " trên" .$site_name." là ".$new_pwd.""; 
    //end send mail
    
    $type ='gmail';
    $mail = new PHPMailer(true); 
		
    
    $mail->IsSMTP(); 
    
    $mail->SMTPDebug  = 0;                     // enables SMTP debug information (for testing)
    $mail->SMTPAuth   = true;                  // enable SMTP authentication
    $mail->SMTPSecure = "ssl";                 // sets the prefix to the servier
    $mail->Host       = "smtp.gmail.com";      // sets GMAIL as the SMTP server
    $mail->Port       = 465;                   // set the SMTP port for the GMAIL server
    $mail->Username   = "huongliem88@gmail.com";  // GMAIL username
    $mail->Password   = "kmfboughqsiemcgd";            // GMAIL password
    $mail->AddReplyTo('svtbjsc@gmail.com', 'SVTB');
    			       
    $mail->AddReplyTo('svtbjsc@gmail.com', 'SVTB');
    $mail->AddAddress($to, $user_name);
    $mail->SetFrom($from, $site_name);
    $mail->Subject = $title;
    $mail->AltBody = 'To view the message, please use an HTML compatible email viewer!'; 
    $mail->Body = $content;
    $mail->Send(); 
    header( 'location: index.php?module=notification&act=rsps'); // reset pass thanh cong
    exit();
        
    }
    	require('view/theme/default/template/home/header.tpl'); 
    	require('view/theme/default/template/home/right.tpl'); 
     include('view/theme/default/template/member/reset_pwd.tpl');
    	require('view/theme/default/template/home/footer.tpl');    
    ob_flush();
    break;
    
    /**
     *
     *  case LOGOUT
     *  destroy all session of member and direction member to login page
    */
    
    case 'logout':
    
     session_destroy();
    if(REWRITE=='0'){
    header('LOCATION: ./index.php?module=home'); 
    exit();
    }else{
    header('LOCATION: ./index.html'); 
    exit();    
    }

    
    
    
    //session_destroy();
    //if(REWRITE=='0'){
    //header('LOCATION: ./index.php?module=home'); 
    //exit();
    //}else{
    //header('LOCATION: ./dang-nhap.html'); 
    //exit();    
    //}
    break;
    
    
   case 'napthe':
 
    ob_start();
    if(empty($_SESSION['name'])){
       
               header('LOCATION: ./index.php?module=member&act=login'); 
                  exit;
                
    }
    else { //start isset session
   
    $text_agree = agree;
    $heading_title = edit_profile;
    $button_continue = update;
    $username = user_name;
    $email = email;
    $account_info = account_info;
    $title = 'SLA -';
    $title .= $heading_title;
    $naptienvaotaikhoan = nap_tien_vao_tai_khoan;
    $text_napthe = text_nap_the;
    
    $list_nknt = getListNhatKiNapThe($_SESSION['user_id'], 0, 50);
    
    require('view/theme/default/template/home/header.tpl'); 
    require('view/theme/default/template/home/left.tpl'); 
     require('view/theme/default/template/home/right.tpl'); 
    include('view/theme/default/template/member/napthe.tpl');
     
    require('view/theme/default/template/home/footer.tpl');    
    
    }//end seession
    ob_flush();
    break;
    
      case'giao_dich':
     
       if(empty($_SESSION['name'])){
       
                  if(REWRITE =='0'){
                  header('LOCATION: dang-nhap.html');  
                  exit;
                  }else{
                  header('LOCATION: index.php?module=member&act=login');  
                  exit;
                  }
                
       }else{
                $heading_title = account;
                $title = 'SLA -';
                $title .= $heading_title;
               
              
                
                //$tongdiachicuatoi = total_address_in_mylist1($_SESSION['user_id']);
               // $tongbaibosung = total_my_additional1($_SESSION['user_id']);
                //$tongcommentcuatoi = total_my_comment1($_SESSION['user_id']);
                $meminfo = getMember($_SESSION['user_id']);
                
                $list_giaodich = getListGiaoDich($_SESSION['user_id'],0,20);
                
              
                	require('view/theme/default/template/home/header.tpl'); 
                    require('view/theme/default/template/home/left.tpl'); 
    			require('view/theme/default/template/home/right.tpl'); 
                        include('view/theme/default/template/member/giaodich.tpl');
    	                require('view/theme/default/template/home/footer.tpl');    
              
              }
       
      break;
     	
   case 'card':
      
      // include('system/napthe/ajax/card.php');
	// lay thong tin tu gamebank - muc tich hop website
	session_start();
error_reporting(E_ALL^E_NOTICE);
error_reporting(E_ERROR);


//Lấy thông tin từ Gamebank tại https://sv.gamebank.vn/user/tich-hop-the-cao
$merchant_id = '39202'; // interger
$api_user = "58c7498fbeb59"; // string
$api_password = "255352980da75c3b3a3e9ebbbda8a4f1"; // string

//Truyền dữ liệu thẻ
$pin = $_POST['pin']; // string
$seri = $_POST['seri']; // string

$price_guest = $_POST['price_guest']; // interger
$card_type = $_POST['card_type_id']; // interger
$note = $_POST['note'];
$ma_bao_mat = $_POST['ma_bao_mat'];

/**
 * Card_type = 1 => Viettel
 * Card_type = 2 => Mobiphone
 * Card_type = 3 => Vinaphone
 * Card_type = 4 => Gate
 * Card_type = 5 => VTC (vcoin)
 * Card_type = 6 => Vietnammobile
 * Card_type = 7 => Zing
 * Card_type = 8 => Bit
 * Card_type = 9 => Megacard
 * Card_type = 10 => Oncash
 
**/

if($ma_bao_mat != $_SESSION['code_security']) {
     echo json_encode(array('code' => 1, 'msg' => "Sai mã bảo mật"));
     exit();
}

$return = cardCharging($seri,$pin,$card_type,$price_guest,$note,$merchant_id,$api_user,$api_password);

// nap the thanh cong
if($return['code'] === 0 && $return['info_card'] >= 10000) {
    echo json_encode(array('code' => 0, 'msg' => "Nạp thẻ thành công mệnh giá " .  $return['info_card']));
	
					$id = $_SESSION['user_id'];
                    $member = getMember($id);
                    insertNhatKiNapThe($pin, $seri,  $return['info_card'], $card_type);
                    //cong them tien vao tai khoan
                    $sodumoi =   $member['so_du_tk'] + $return['info_card'];
                    tang_so_du($id,$sodumoi);
}
else {
    // get thong bao loi
    echo json_encode(array('code' => 1, 'msg' => $return['msg']));
	insertNhatKiNapThe($pin, $seri, $return['info_card'], $card_type);
}

function _isCurl()
{
	return function_exists('curl_version');
}

function cardCharging($seri,$pin,$card_type,$price_guest,$note,$merchant_id,$api_user,$api_password)
{
	if (_isCurl()) {
		$fields = array(
			'merchant_id' => $merchant_id,
			'pin' => $pin,
			'seri' => $seri,
			'price_guest' => $price_guest,
			'card_type' => $card_type,
			'note' => $note
		);
		$ch = curl_init("https://sv.gamebank.vn/api/card");
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_DIGEST);
		curl_setopt($ch, CURLOPT_TIMEOUT, 120);
		curl_setopt($ch, CURLOPT_USERPWD, $api_user . ":" . $api_password);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
		$result = curl_exec($ch);
		$result = json_decode($result);

		$return = array(
			'code' => $result->code,
			'msg' => $result->msg,
			'info_card' => $result->info_card,
			'transaction_id' => $result->transaction_id,
		);
		
	} else {
		//Trường hợp máy chủ chưa bật cURL
		$result =  file_get_contents("http://sv.gamebank.vn/api/card2?merchant_id=".$merchant_id."&api_user=".trim($api_user)."&api_password=".trim($api_password)."&pin=".trim($pin)."&seri=".trim($seri)."&card_type=".intval($card_type)."&price_guest=".$price_guest."&note=".urlencode($note)."");   
		$result = str_replace("\xEF\xBB\xBF",'',$result); 
		$result = json_decode($result);
		$return = array(
			'code' => $result->code,
			'msg' => $result->msg,
			'info_card' => $result->info_card,
			'transaction_id' => $result->transaction_id,
		);
	}
	return $return;
}



      break;
    
    //thong bao
    case'mess':
    
    ob_start();
    $action = 'index.php?module=member&act=login';
    $heading_title =login;
    $title = 'SLA -';
    $title .= $heading_title;
    include('system/textlink.php');
 
    
        if(($_SESSION['name'])){
       
                //  header('LOCATION: '.$url_account);  
                 // exit;
                
       }
      
    if($_REQUEST['n']=='rsp'){   
    $mess="Vui long truy cap email de kich hoat tai khoan";   
    }
    require('view/theme/default/template/home/header.tpl'); 
    require('view/theme/default/template/home/right.tpl'); 
    include('view/theme/default/template/member/thongbao.tpl');
    require('view/theme/default/template/home/footer.tpl');    
    	
    ob_flush();
    break;
    
       
}


?>