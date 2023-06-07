<?php

/**
 * @author honestphan
 * @copyright 2012
 */
 
 //G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_member.php');
require_once ('system/phpmailer/class.phpmailer.php');
//include('controller/c_block.php');

$list_action = get_list_action_module($_SESSION['user_id'], 'tai_khoan');

$u_view = false;
$u_add = false;
$u_edit = false;
$u_del = false;

	foreach($list_action as $la){
       $action = $la['action'];
       if($action == 'view'){
        $u_view = true;
       }
       if($action == 'add'){
          $u_add = true;
       }
       if($action == 'edit'){
          $u_edit = true;
       }
       if($action == 'del'){
          $u_del = true;
       }      
       if($action == 'del_pqcm'){
          $u_del_pqcm = true;
       }      
       if($action == 'my_profile'){
          $u_my_profile = true;
       }      
       if($action == 'pqcm'){
          $u_pqcm =true;
       }      
       if($action == 'add_pqcm'){
          $u_add_pqcm = true;
       }      
       if($action == 'add_module_permision'){
          $u_add_module_permision = true;
       }      
       if($action == 'del_module_permision'){
          $u_del_module_permision = true;
       }  
       if($action == 'view_module_permision'){
          $u_view_module_permision = true;
       }  	   
}

$page = $_GET['act'];
 switch($page){
	 
	     case 'del_module_permision':
    get_file('language/member/del_quyen_chuyen_muc.php');
    $uid = (int)$_REQUEST['uid'];
    $link_list = "index.php?module=member&act=add_module_permision&uid=".$uid;
    

    $id = (int)$_REQUEST['id'];
    del_module_permision($id);
    $_SESSION['success'] = del_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);  
    exit();
    break;
	 
	 
	  case 'add_module_permision':
    
    	 if(!$_SESSION['loged']){
         header('LOCATION: index.php?module=member&act=login');  
         exit();
     }
     
     if($_SESSION['phan_quyen']=='2'){
         header('LOCATION: index.php?module=home');  
         exit();
     }
     
     get_file ('language/member/add_quyen_chuyen_muc.php');
     $heading_title = heading_title;
     $title = heading_title;
     $ma_can_bo = ma_can_bo;
     $ten_can_bo = ten_can_bo;
     $ngay_sinh = ngay_sinh;
     $ten_dang_nhap = ten_dang_nhap;
     $mat_khau = mat_khau;
     $xac_nhan_mat_khau = xac_nhan_mat_khau;
     $chuc_danh = chuc_danh;
     $phong_ban = phong_ban;
     $dia_chi = dia_chi;
     $dien_thoai_noi_bo = dien_thoai_noi_bo;
     $dien_thoai_co_quan = dien_thoai_co_quan;
     $dien_thoai_nha_rieng = dien_thoai_nha_rieng;
     $di_dong = di_dong;
     $active = active;
     $deactive = deactive;
     
   
     $fax = fax;
     $email = email;
     $trang_thai = trang_thai;
     $dan_toc = dan_toc;
	 
	   
     
     $uid = (int)$_REQUEST['uid'];
     $link_list = "index.php?module=member&act=add_module_permision&uid=".$uid;
     //$link_list2 = "index.php?module=member&act=list";
     
	// if(!$u_add_module_permision){
   //  $_SESSION['warning'] = "Bạn không được quyền truy cập chức năng này";
   //   header('LOCATION: '.$link_list2);  
   //   exit();
  //  }
     
     $member = getmember($uid);
     $list_modules = get_list_modules(0,100);
     $list_quyen_modul = get_list_quyen_modul($uid, 0, 100);
	 $this_time = vntime_now();
    //kiem tra du lieu cua from
     if($_SERVER['REQUEST_METHOD']=='POST')
     {
	 //add_quyen_module($uid, $uname, $this_time, $local)
     add_quyen_module($uid, $member['tai_khoan'], $this_time, $_POST);
	 $_SESSION['gia_tri'] = $_POST['module_name'];
 $_SESSION['success'] = edit_success;
     //chuyen huong ve list
     header('LOCATION: '.$link_list);    
     }

       

		  
    require('view/template/member/add_module_permision.tpl');
    break;
	

	 
	 
    case 'list':
    
    if((!$_SESSION['loged'])||($_SESSION['phan_quyen']=='0')||($_SESSION['phan_quyen']=='2')){
         header('LOCATION: index.php?module=member&act=login');  
         exit();
    }
    
     
    //Get language
    require('language/member/list_member.php');
    
    $title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    $active = active;
     $deactive = deactive;
    $cot_ten = ten_can_bo;
    $cot_dan_toc = dan_toc;
    $mobile = mobile;
    $cap_bac = cap_bac;
    $cot_chuc_danh = chuc_danh;
    $cot_phong_ban = phong_ban;
    $cot_ngay_sinh = ngay_sinh;
    $cot_dien_thoai_nha_rieng = dien_thoai_nha_rieng;
    $cot_dien_thoai_co_quan = dien_thoai_co_quan;
    $cot_email = email;
    $cot_di_dong = di_dong;
    
    $cot_thao_tac = thao_tac;
    $link_add ='index.php?module=member&act=add';

	$_SESSION['tieude'] = $_POST['tai_khoan'];
     //if($_POST['selected']==""){
       // $err['exist'] = chua_chon;
        //$error_name = $err['exist'];
        //}
       if($_POST['tai_khoan']=="")
         {
           $err['exist'] = "Nhập từ khóa để tìm kiếm";
           $error_tentk = $err['exist']; 
        }
    if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
    }
    
    if($_REQUEST['page']==""){ $page = 1;}
    else{$page = $_REQUEST['page'];}
    
    //get input for class page
      $limit = 30;
      $start = ($page - 1) * $limit; 
      
    //kiem tra du lieu cua from
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid){
       
    
   
     $list_member = getListtkmember($_POST['tai_khoan'],$start,$limit);
    $total = totaltkmember($_POST['tai_khoan']);
     } else {
   
   
    
    $list_member = getListmember($start, $limit);
  
    $total = total();
   }
    
    $paging = new Pagination();
    $paging->total = $total;
    $paging->limit = $limit;
    $paging->url = "index.php?module=member&act=list&page={page}";
    $paging->page = $page;
    $pagination = $paging->render();
    $heading_title = heading_title." (".$total." cán bộ)";

    require('view/template/member/list_member.tpl');  
    break;
    
    //case them can bo
    case 'add':

   if((!$_SESSION['loged'])||($_SESSION['phan_quyen']=='0')){
         header('LOCATION: index.php?module=member&act=login');  
         exit();
    }
     require ('language/member/add_member.php');
     $heading_title = heading_title;
     $title = heading_title;
     $ma_can_bo = ma_can_bo;
     $tai_khoan = tai_khoan;
     $ngay_sinh = ngay_sinh;
     $ho_va_ten = ho_va_ten;
     $yahoo = yahoo;
     $phan_quyen = phan_quyen; 
     $ten_dang_nhap = ten_dang_nhap;
     $mat_khau = mat_khau;
     $xac_nhan_mat_khau = xac_nhan_mat_khau;
     $chuc_danh = chuc_danh;
     $phong_ban = phong_ban;
     $dia_chi = dia_chi;
     $avatar = avatar;
     $mobile = mobile;
     $active = active;
     $deactive = deactive;
     
     $_SESSION['fax'] = $_POST['fax'];
     $fax = fax;
     $email = email;
     $trang_thai = trang_thai;
     $dan_toc = dan_toc;
     
    
     $link_list = 'index.php?module=member&act=list';
      
      $_SESSION['phanquyen'] = $_POST['phan_quyen'];
      $_SESSION['tai_khoan'] = $_POST['tai_khoan'];
 
       if($_POST['tai_khoan']==""){
        $err['exist'] = ten_dang_nhap1;
        $error_tk = $err['exist'];
        
       }
       //kiem tra su ton tai
     $dn = check_dn(trim($_POST['tai_khoan']));
     if($dn == '1'){
        $err['exist'] = da_ton_tai;
        $error_tk = $err['exist'];
     }
    
    $_SESSION['web'] = $_POST['web'];
    $_SESSION['diachi'] = $_POST['dia_chi']; 
    $_SESSION['ngaysinh'] = $_POST['ngay_sinh'];  
    $_SESSION['yahoo'] = $_POST['yahoo']; 
     
    $_SESSION['email'] = $_POST['email'];
    if($_POST['email']==""){
        $err['exist'] = nhap_dia_chi_email;
        $error_email2 = $err['exist'];
    } else{
    //kiem tra su ton tai
     $m = check_email($_POST['email']);
     if($m == '1'){
        $err['exist'] = "Email đã có người đăng ký";
        $error_email2 = $err['exist'];
     }
     }
     
     $_SESSION['mobile'] = $_POST['mobile'];
     //kiem tra du lieu nhap mobile
      if($_POST['mobile']==""){
        $err['exist'] = "Nhập số điện thoại của bạn";
        $error_mobile = $err['exist'];
        
       }
     //kiem tra du lieu
     //$_SESSION['tenmember'] = $_POST['ten_can_bo'];
    //if($_POST['ten_can_bo']==""){
       // $err['exist'] = chua_nhap_ten;
       // $error_name = $err['exist'];
        
    //}
    /**
    $_SESSION['ngaysinh'] = $_POST['ngay_sinh'];
    
    if($_POST['ngay_sinh']=="")
    {
        $err['exist'] = nhap_ngay_sinh;
        $error_ns = $err['exist'];
    }
    **/
   
    //kiem tra du lieu
     $_SESSION['ten'] = $_POST['ho_ten'];
     if($_POST['ho_ten']==""){
        $err['exist'] = chua_nhap_ten;
        $error_name = $err['exist'];
        
        }  

     
        if($_POST['password']==""){
        $err['exist'] = yeu_cau_phai_nhap;
        $error_mk = $err['exist'];
        
    }
      if($_POST['password']!=$_POST['xac_nhan_mat_khau']){
        $err['exist'] = mat_khau_xac_nhan_khong_dung;
        $error_mk1 = $err['exist'];
    }
   
    /**
      
    $_SESSION['chucdanh'] = $_POST['chuc_danh_id'];
        if($_POST['chuc_danh_id']=="0"){
        $err['exist'] = chon_chuc_danh;
        $error_chucdanh = $err['exist'];
    }
    $_SESSION['phongban'] = $_POST['phong_ban_id'];
        if($_POST['phong_ban_id']=="0"){
        $err['exist'] = chon_phong_ban;
        $error_phongban = $err['exist'];
    
    }
  
   $_SESSION['diachi'] = $_POST['dia_chi'];
        if($_POST['dia_chi']==""){
        $err['exist'] = Nhap_dia_chi;
        $error_diachi = $err['exist'];
    }
    $_SESSION['dtnoibo'] = $_POST['dien_thoai_noi_bo'];
        if($_POST['dien_thoai_noi_bo']==""){
        $err['exist'] = Nhap_dien_thoai_noi_bo;
        $error_noibo = $err['exist'];
    }
    $_SESSION['dtcoquan'] = $_POST['dien_thoai_co_quan'];
        if($_POST['dien_thoai_co_quan']==""){
        $err['exist'] = Nhap_dien_thoai_co_quan;
        $error_coquan = $err['exist'];
        
    }
    $_SESSION['dtnharieng'] = $_POST['dien_thoai_nha_rieng'];
        if($_POST['dien_thoai_nha_rieng']==""){
        $err['exist'] = Nhap_dien_thoai_nha_rieng;
        $error_nharieng = $err['exist'];
    }
    $_SESSION['dd'] = $_POST['di_dong'];
        if($_POST['di_dong']==""){
        $err['exist'] = nhap_so_dien_thoai_di_dong;
        $error_dd = $err['exist'];
        
    }
    $_SESSION['dantoc'] = $_POST['dan_toc_id'];
        if($_POST['dan_toc_id']=="0"){
        $err['exist'] = chon_dan_toc;
        $error_dantoc = $err['exist'];
    }
    
     **/
     
    if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
    }
    //kiem tra du lieu cua from
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    $_POST['password'] = md5($_POST['password']);
    insertmember($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/member/add_member.tpl');
    break;
    
    //case them can bo
    case 'edit':
   
 if((!$_SESSION['loged'])||($_SESSION['phan_quyen']=='0')){
         header('LOCATION: index.php?module=member&act=login');  
         exit();
    }
   
    
     require ('language/member/edit_member.php');
          $heading_title = heading_title;
     $title = heading_title;
     $ma_can_bo = ma_can_bo;
     $tai_khoan = tai_khoan;
     $ngay_sinh = ngay_sinh;
     $ho_va_ten = ho_va_ten;
     $yahoo = yahoo;
     $phan_quyen = phan_quyen; 
     $ten_dang_nhap = ten_dang_nhap;
     $mat_khau = mat_khau;
     $xac_nhan_mat_khau = xac_nhan_mat_khau;
     $chuc_danh = chuc_danh;
     $email = email;
     $phong_ban = phong_ban;
     $dia_chi = dia_chi;
     $avatar = avatar;
     $mobile = mobile;
     $active = active;
     $deactive = deactive;
    //$list_chucdanh = getListChucdanh();
    //$list_phongban = getListPhongBan(); 
    //$list_dantoc = getListDantoc();
    $link_list = 'index.php?module=member&act=list';
    $id = $_REQUEST['id'];
    $member = getmember($id);
    
      //kiem tra su ton tai email
   
    //kiem tra du lieu cua from
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
		
		  if($_POST['file']=="")
           {
             $_POST['logo'] = $member['logo'];
           }   
           
           if($_POST['file1']=="")
           {
             $_POST['banner'] = $member['banner'];
           }
           
          if ((($_FILES["file"]["type"] == "image/gif")||($_FILES["file"]["type"] == "image/jpeg")|| ($_FILES["file"]["type"] == "image/pjpeg"))&& ($_FILES["file"]["size"] < 2000000))
          {
          
          if ($_FILES["file"]["error"] > 0){
           
                $_SESSION['invalid_file']='Tập tin tải lên không hợp lệ';
            
           }else{
          
            $logo = 'logo';
           
           
            $ext = end(explode(".",$_FILES["file"]["name"]));
         
            $file_logo = $logo.".".$ext;
          
            if (file_exists("../images/site/".$file_logo)){
                
                    unlink("../images/site/".$file_logo);
                    move_uploaded_file($_FILES["file"]["tmp_name"],"../images/site/".$file_logo);
                    
                    $_POST['logo'] = $file_logo;
              } else{
                
                    move_uploaded_file($_FILES["file"]["tmp_name"],"../images/site/".$file_logo);
                  
                  
                   $_POST['logo'] = $file_logo;
                 
                }
             
            }
          }
    
    editmember($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/member/edit_member.tpl');
    break;
    
    //update my prolife
    
    case 'my_prolife':
   
     if((!$_SESSION['loged'])||($_SESSION['phan_quyen']=='0')){
         header('LOCATION: index.php?module=member&act=login');  
         exit();
    }
    
     require ('language/member/edit_myprolife.php');
     $title = heading_title;
     $heading_title = heading_title;
     $ma_can_bo = ma_can_bo;
     $ten_can_bo = ten_can_bo;
     $ngay_sinh = ngay_sinh;
     $ten_dang_nhap = ten_dang_nhap;
     $mat_khau = mat_khau;
     $xac_nhan_mat_khau = xac_nhan_mat_khau;
     $chuc_danh = chuc_danh;
     $phong_ban = phong_ban;
     $dia_chi = dia_chi;
     $dien_thoai_noi_bo = dien_thoai_noi_bo;
     $dien_thoai_co_quan = dien_thoai_co_quan;
     $dien_thoai_nha_rieng = dien_thoai_nha_rieng;
     $di_dong = di_dong;
     $fax = fax;
     $email = email;
     $trang_thai = trang_thai;
     $dan_toc = dan_toc;
     $active = active;
     $deactive = deactive;
    $list_chucdanh = getListChucdanh();
    $list_phongban = getListPhongBan(); 
    $list_dantoc = getListDantoc();
    $link_list = 'index.php?module=member&act=my_prolife';
    
    $id = $_SESSION['can_bo_id'];
    
    $member = getmember($id);
    
      //kiem tra su ton tai
     $dn = check_exist_local(trim($_POST['ten_dang_nhap']));
     if($dn == '1'){
        $err['exist'] = da_ton_tai;
        $error_name = $err['exist'];
     }
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    $_POST['status'] ='1';
    editmember($id, $_POST);
    $success = edit_success;
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);
    exit();    
    }
    require('view/template/member/my_prolife.tpl');
    break;
    
    
    
    case 'del':
     if((!$_SESSION['loged'])||($_SESSION['phan_quyen']=='0')){
         header('LOCATION: index.php?module=member&act=login');  
         exit();
    }
    
    get_file('language/member/del_member.php');
    $link_list = 'index.php?module=member&act=list';
    $id = $_REQUEST['id'];
    delmember($id);
    $_SESSION['success'] = del_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);  
    exit();
    break;
    
    /**
     * 
     * This case was wiriten by ductoan
     * For member login to system
     * */
     
    case 'login':
    require ('language/member/login.php');
  
    $title = login;
    $t_username = user_name;
    $t_password = pass;
    $button_login = login;
    $text_login = login_to_control_system;
    $link_home = 'index.php?module=home';
     
    if(($_POST['uname']=="")&&($_POST['pwd']=="")){
        $err['exist'] = yeu_cau_dang_nhap;
        $error_mk = $err['exist'];
    } else{
            
            if($_POST['uname']==""){
            $err['exist'] = nhap_tk;
            $error_username = $err['exist'];
            }
            if($_POST['pwd']==""){
                $err['exist'] = nhap_mk;
                $error_mk = $err['exist'];
            } 
        
    }
    
    //$_SESSION['user_name'] = $_POST['uname'];
    
    if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
    }
   
   $pwd = loc_tk(addslashes(trim($_POST['pwd'])));
    $u = loc_tk(addslashes(trim($_POST['uname'])));
   
    //kiem tra du lieu cua from
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    //hash('sha256','mk');
    //$login_check = login($u,$pwd);
    $login_check = check_login($u,md5($pwd));
   
    //echo $login_check;
    
    if($login_check){
    $canbo = getAdmin($u,md5($pwd)); // ddang nhap thanh cong
    session_start();
    $_SESSION['admin'] = $canbo;
    // print_r($_SESSION['admin']);


    // $_SESSION['success'] = login_success; 
    // $_SESSION['loged'] = md5($canbo['ten_dang_nhap']); 
    // $_SESSION['user_id'] = $canbo['id_regedit'];  
    // $_SESSION['tai_khoan'] = $canbo['tai_khoan'];
    // $_SESSION['phan_quyen'] = $canbo['phan_quyen'];
    // $_SESSION['hoten1'] = $canbo['ho_ten'];
	// $_SESSION['logo'] = $canbo['logo'];
	// $_SESSION['thamgia'] = $canbo['time_login'];
    // $_SESSION['ma_don_vi'] = $canbo['ma_don_vi']; 
	
    
	//get infomation write to logs by liempv 21/9/2021
	$this_time = vntime_now();
	$action1 ="Đăng nhập hệ thống";
	$action_name = "login";
	$agent = $_SERVER['HTTP_USER_AGENT'];
	$aip = $_SERVER['REMOTE_ADDR'];
	write_logs($action1, $action_name, $agent, $aip, $this_time);
	
	
	//make content send mail to admin by liempv 21/9/2021
	$title = $_POST['uname']." đã đăng nhập vào hệ thống quản trị quản trị măt trận tổ quốc";
	$content = 'Hệ thống giám sát an toàn <br/>';	
	$content .= $_POST['uname'].' đã đăng nhập quản trị thành công <br/>';
	$content .= 'Vào lúc '.time_stamp_to_date222($this_time); 
	$content .= '<br/>Agent: '.$agent. " <br/> IP: " .$aip; 
	$content .= '<br/>---------------';
	$content .= '<br/>Chúng tôi xin báo cáo để bạn được biết! <br/> Trân trọng!';
	
	// send to	
	$to = '';
	$to_name = "Phan Văn Liêm";
	// start send mail
	$mail = new PHPMailer(true); // the true param means it will throw exceptions on errors, which we need to catch
	$mail->IsSMTP(); // telling the class to use SMTP

		try {

					$mail = new PHPMailer(true); 
					$mail->IsSMTP(); 
					$mail->SMTPDebug  = 0;                     // enables SMTP debug information (for testing)
					$mail->SMTPAuth   = true;                  // enable SMTP authentication
					$mail->SMTPSecure = "ssl";                 // sets the prefix to the servier
					$mail->Host       = "smtp.gmail.com";      // sets GMAIL as the SMTP server
					$mail->Port       = 465;                   // set the SMTP port for the GMAIL server
					$mail->Username   = "";  // GMAIL username
					$mail->Password   = "juqwzmdvtugmqnir";            // GMAIL password
					//$mail->AddReplyTo('nbinh88@gmail.com', 'Binh STTTT');
					//$mail->AddReplyTo('phanvanliem@gmail.com', 'Liem Phan');
					$mail->AddAddress($to, $to_name);
					$mail->AddAddress('', 'MTTQ tỉnh Sơn La');
					$mail->SetFrom('sothongtinvatruyenthongsonla@gmail.com','Sở TT&TT tỉnh Sơn La');
					$mail->CharSet = "utf-8";
					$mail->Subject = $title;
					$mail->AltBody = 'To view the message, please use an HTML compatible email viewer!'; 
					$mail->Body = $content;
					$mail->Send();
		 
		 
		} catch (phpmailerException $e) {
		  //echo $e->errorMessage(); //Pretty error messages from PHPMailer
		} catch (Exception $e) {
		  //echo $e->getMessage(); //Boring error messages from anything else!
		}
	//end send mail
	//direct to home
    header('LOCATION: '.$link_home);    
		exit();   
    } else {
    
    $error_username = thong_tin_dang_nhap_khong_dung; 
    $this_time = vntime_now();
	$action1 = $_POST['uname']."/".$_POST['pwd']." login fail"; 
	$action_name = "login";
	$agent = $_SERVER['HTTP_USER_AGENT'];
	$aip = $_SERVER['REMOTE_ADDR'];
	write_logs($action1, $action_name, $agent, $aip, $this_time);	
	
	
	$title = $_POST['uname']." đã cố đăng nhập vào hệ thống quản trị trang mặt trận tổ quốc";
	$content = 'Hệ thống giám sát an toàn <br/>';	
	$content .= $_POST['uname'].'/'. $_POST['pwd'].' đã cố đăng nhập quản trị nhưng thất bại <br/>';
	$content .= 'Vào lúc '.time_stamp_to_date222($this_time); 
	$content .= '<br/>Agent: '.$agent. "<br/> IP: " .$aip; 
	$content .= '<br/>---------------';
	$content .= '<br/>Chúng tôi xin báo cáo để bạn được biết! <br/>Trân trọng!';
		
	$to = '';
	$to_name = "Phan Văn Liêm";

	$mail = new PHPMailer(true); // the true param means it will throw exceptions on errors, which we need to catch
	$mail->IsSMTP(); // telling the class to use SMTP

	try {

		 
					$mail = new PHPMailer(true); 
					$mail->IsSMTP(); 
					$mail->SMTPDebug  = 0;                     // enables SMTP debug information (for testing)
					$mail->SMTPAuth   = true;                  // enable SMTP authentication
					$mail->SMTPSecure = "ssl";                 // sets the prefix to the servier
					$mail->Host       = "smtp.gmail.com";      // sets GMAIL as the SMTP server
					$mail->Port       = 465;                   // set the SMTP port for the GMAIL server
					$mail->Username   = "sothongtinvatruyenthongsonla@gmail.com";  // GMAIL username
					$mail->Password   = "juqwzmdvtugmqnir";            // GMAIL password
					//$mail->AddReplyTo('nbinh88@gmail.com', 'Binh STTTT');
					//$mail->AddReplyTo('phanvanliem@gmail.com', 'Liem Phan');
					$mail->AddAddress($to, $to_name);
					//$mail->AddAddress('', 'MTTQ tỉnh Sơn La');
					//$mail->SetFrom('sothongtinvatruyenthongsonla@gmail.com','Sở TT&TT tỉnh Sơn La');
					$mail->CharSet = "utf-8";
					$mail->Subject = $title;
					$mail->AltBody = 'To view the message, please use an HTML compatible email viewer!'; 
					$mail->Body = $content;
					$mail->Send();
		 
		 
		} catch (phpmailerException $e) {
		  //echo $e->errorMessage(); //Pretty error messages from PHPMailer
		} catch (Exception $e) {
		  //echo $e->getMessage(); //Boring error messages from anything else!
		}
	    //end send mail  by liempv 21/9/2021
    }
   }
    
    require('view/template/member/login_form.tpl');
    break;
    
    /**
     * 
     * case logout
     * 
     * */
    
    
    case 'logout':
	 $this_time = vntime_now();
    write_logs("Đăng xuất hệ thống ", $this_time);  
    $_SESSION['success'] = ""; 
    $_SESSION['loged'] = "";
    $_SESSION['ten_can_bo'] = "";
    $_SESSION['phan_quyen'] = "";
    $_SESSION['hoten'] = "";
    $_SESSION['tai_khoan'] = "";
    session_destroy();
    mysql_close(dbconnect());
    
    header('LOCATION: index.php?module=member&act=login');  
    exit();
    
    break;

	case 'cpw':
   
       if((!$_SESSION['loged'])||($_SESSION['phan_quyen']=='0')){
         header('LOCATION: index.php?module=member&act=login');  
         exit();
    }
	 require('language/member/list_member.php');
    $mat_khau_cu = mat_khau_cu;
    $mat_khau_moi = mat_khau_moi;
    $xac_nhan_mat_khau = xac_nhan_mat_khau;
    $heading_title ="Đổi mật khẩu mới";
    $button_continue ="Gửi đi";

    $link_list = 'index.php?module=member&act=cpw';
    $id = $_SESSION['user_id'];
    //$id = $_REQUEST['id'];
    $member = getmember($id);
    //vai loi. sao lai lay session, lay o $member
    
    //gio làm phan so sanh thi giong nhu kiem tra form dang ki thoi
    //so sanh 2 cá to day lam so sang bang java ban a chu chua lam so sanh php
    // bạn chu y de y ban chat mot chut
    // gio cung lam kieu valid form nhu hom qua thoi
    //so sánh 2 mạt khau xem trung nhau chua
    if(isset($_POST['submit'])) {
        
    if(strlen($_POST['password']) < 3){
        
        $err['pass'] = "mat khau it nhat la 4 ki tu";
    } 
    
    if($_POST['password'] != $_POST['repass']){
        $err['repass'] = "mat khau xac nhan khong dung";
    }
    
    if($_POST['oldpass']==""){
        //neu mat khau cu de trong thi bao loi va dung tat ca moi viec
       $err['oldpass'] = "yeu cau cung cap  mat khau cu";
        
    } else{
         //neu da nhap mat khau cu roi thi làm cac cong viec duoi day: so sanh mat khau cu vơi csdl cua thanh vien tuong ung
         //kiem tra mat khau cu// dung ma hoa md5 hay j md5
        $mkc = kiemtramatkhau(md5($_POST['oldpass']), $id);
        //neu mat khau nay dung so vơi trong csfl thi form valid
        if(!$mkc){
            $err['oldpass'] = "mat khau cu khong dung";
    }
    }
    
    }
   
    if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
    }    
      
    if(($_SERVER['REQUEST_METHOD']=='POST') && $valid)
    {
    $_POST['password'] = md5($_POST['password']);
     editpass($id, $_POST);
    $_SESSION['success'] = "";
    $success = "cap nhat thanh cong";
    //chuyen huong ve list
   //  echo "ok"; 
    header('LOCATION: index.php?module=member&act=logout');   
   
    }   
    
  
 
   	require('view/template/member/cpw.tpl');
  
    break;
		 case'account':
     
         if((!$_SESSION['loged'])||($_SESSION['phan_quyen']=='0')){
         header('LOCATION: index.php?module=member&act=login');  
         exit();
    }
              
                
                //$tongdiachicuatoi = total_address_in_mylist1($_SESSION['user_id']);
               // $tongbaibosung = total_my_additional1($_SESSION['user_id']);
                //$tongcommentcuatoi = total_my_comment1($_SESSION['user_id']);
				    $id = $_REQUEST['id'];
					$member = getmember($id);
					$member1 = getmember($_SESSION['user_id']);
		


			$id = $_REQUEST['id'];
			$member2 = getmember2($id);
					
	     $link_list = 'index.php?module=member&act=list';				
					   
     if($_SERVER['REQUEST_METHOD']=='POST')
    {
    
    editmember1($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
  
    }
                
              //  $list_giaodich = getListGiaoDich($_SESSION['user_id'],0,20);
                
              
    
 include('view/template/member/account.tpl');
         
              
        
       
      break;

 }
 
?>