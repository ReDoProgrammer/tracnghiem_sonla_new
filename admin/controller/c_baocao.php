<?php

/**
 * @author nbinh88@gmail.com
 * @copyright 2013
 */
 
define( 'DSVH', 1 );

session_start(); 
if((!$_SESSION['admin'])){
    header('LOCATION: index.php?module=member&act=login');  
    exit();
}
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_baocao.php');

//include('controller/c_block.php');

$page = $_GET['act'];
 switch($page){
	 
	  case 'logs':
    //Get language
    require('language/thongtin/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $theo_danh_muc = theo_danh_muc;
    $tieu_de = tieu_de;
    $link_tai = link_tai;
    $kieu_file = kieu_file;
    $mb = mb;
    $thoi_gian = thoi_gian;

    $hinh_anh = hinh_anh;
    $cot_thao_tac = thao_tac;
	
	 $ref="http://".eregi_replace("/$","",(getenv(HTTP_HOST)?getenv(HTTP_HOST):$_SERVER['HTTP_HOST']).(getenv(REQUEST_URI)?getenv(REQUEST_URI):$_SERVER['REQUEST_URI']));
	 $_SESSION['back'] = $ref;
	 $link_add ='index.php?module=thongtin&act=add';


     //lay thong tin lang 
        $timkiem = tim_kiem;
        $socmt = so_cmt;
        
        //lấy danh sach bang tin
        //assign input data from form to the SESSION
        //$_SESSION['ten'] = $_POST['ho_ten'];
        //$_SESSION['so_cmt'] = $_POST['so_cmt'];
        //$_SESSION['tochuc_canhan_id'] = $_POST['tochuc_canhan_id'];

		if($_REQUEST['page']==""){
         $page = 1;
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 20;
        $start = ($page - 1) * $limit;
        
     
    	$_SESSION['tu'] = (int)$_GET['tu'];
		$_SESSION['den'] = (int)$_GET['den'];
		$_SESSION['khu_vuc'] = (int)$_GET['khu_vuc'];
		$_SESSION['trang_thai'] = (int)$_GET['trang_thai'];
		$_SESSION['huyen'] = (int)$_GET['huyen'];
		
		$list_trangthai = get_list_trang_thai();
	    $list_diaphuong = get_list_dia_phuong();
		$list_huyen = get_list_huyen(0,15);
    	
		$data['tu'] = (int)$_GET['tu'];
		$data['den'] = (int)$_GET['den'];
		$data['khu_vuc'] = (int)$_GET['khu_vuc'];
		$data['trang_thai'] = (int)$_GET['trang_thai'];
		$data['huyen'] = (int)$_GET['huyen'];
     
	    $list_nhatky = get_list_nhat_ky($start,$limit);
	    $total = total_nhat_ky();
		
	  
       if($_GET['excel']){
		    $list_nhatky = get_list_nhat_ky($start,$limit);
			$total = total_nhat_ky();
	   }
	   
	   // $list_thongtin = getListthongtin($start,$limit);
       // $total = totalthongtin();
        
		//$this_time = vntime_now();
		//$action ="Xem nhật ký";
		//$action_name = "view_report";
		//$agent = $_SERVER['HTTP_USER_AGENT'];
		//$aip = $_SERVER['REMOTE_ADDR'];
		//write_logs($action, $action_name, $agent, $aip, $this_time);
	  
	  
		
		if($_GET['excel']){
			//xuất word
			     
		
				header("Content-type: application/vnd.ms-word");
				header("Content-Disposition: attachment;Filename=ds_".$tenfileword.".doc");
				echo "<html>";
				echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">";
				//echo "<body>";	 
				include('view/template/thongtin/export_select.tpl');
				//echo "</body>";
				echo "</html>"; 
			
			
		}
		
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=baocao&act=logs&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();

    require('view/template/baocao/report_nhatky.tpl');  
    break;
	
	 
	 
    case 'tongquan':
    //Get language
    require('language/cts/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $theo_danh_muc = theo_danh_muc;
    $tieu_de = tieu_de;
    $link_tai = link_tai;
    $kieu_file = kieu_file;
    $mb = mb;
    $thoi_gian = thoi_gian;

    $hinh_anh = hinh_anh;
    $cot_thao_tac = thao_tac;
	
	 $ref="http://".eregi_replace("/$","",(getenv(HTTP_HOST)?getenv(HTTP_HOST):$_SERVER['HTTP_HOST']).(getenv(REQUEST_URI)?getenv(REQUEST_URI):$_SERVER['REQUEST_URI']));
	 $_SESSION['back'] = $ref;
		//$link_add ='index.php?module=cts&act=add';
		
			   
        $id = $_REQUEST['id'];
        $cts = getcts($id);
		//lay thong tin lang 
        $timkiem = tim_kiem;
        $socmt = so_cmt;
		
         $link_export_w = './index.php?module=baocao&act=export&t=doc';
        
		//lấy danh sach bang tin
       //assign input data from form to the SESSION
		$_SESSION['startday'] = $_POST['startday'];
        $_SESSION['endday'] = $_POST['endday'];
        $startday = $_POST['startday'];
        $endday = $_POST['endday'];
        $_SESSION['canhantochuc'] = $_POST['tochuc_canhan_id'];

		  if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 30;
        $start = ($page - 1) * $limit;
   
		
		
		 if(isset($_POST['tim_kiem'])){   
		if($startday && $endday){
		
            $starttime = explode("/",$startday);
	    $_POST['starttime'] = $starttime = gmmktime(0,0,0,$starttime[1],$starttime[0],$starttime[2]);
    	    $endtime = explode("/",$endday);
     	    $_POST['endtime']=  $endtime = gmmktime(0,0,0,$endtime[1],$endtime[0],$endtime[2]);
		//	echo $starttime; die;
     	    $list_baocao = getListbaocao($_POST,$limit,$start);
			//$total = tt($_POST,$limit,$start);
     	    }
     	    else {
			$list_baocao = getListbaocao($_POST,$limit,$start);
			//$total = tt($_POST,$limit,$start);
	    }
        } else {
	    $list_baocao = getListbaocao($_POST,$limit,$start);
           // $total = totalnews();
        
	    }
		
		
		
		
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=tongquan&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();

    require('view/template/baocao/tongquan.tpl');  
    break;
	
	
	case'listbydm':
        
        $cha= $_REQUEST['cha'];
        $tendanhmuc = getdanhmuccts($cha);
        
        // $_SESSION['donvi_id'] = $_POST['donvi_id'];
       // $_SESSION['linhvuc_id'] = $_POST['linhvuc_id'];
        
        if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 10;
        $start = ($page - 1) * $limit;
        
         $theodanhmuc = $_REQUEST['cha'];
        //layx ma danh muc o tren urrl 
        //index.php?module=tintuc&act=listbytype&catid=<?php echo $list['ma_danh_muc']
          
       
    	
        $list_cts = getListdmcts($theodanhmuc,$start, $limit);
        if(!$list_cts){
           header('LOCATION: index.php?module=cts&act=list');  
           exit(); 
        }
       $total = totaltheomadanhmuc($theodanhmuc);//tinh tong
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=cts&act=listbydm&cha=".$cha."&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
       
        
        $heading_title = title;
        $title = $tendanhmuc['title'];
		require('view/template/cts/list.tpl');  
        break;
               
          
    
    //case them can bo
    case 'add':
    session_start();
    require ('language/cts/add.php');
    
     $heading_title = heading_title;
     $tieu_de = tieu_de;
     $theo_danh_muc = theo_danh_muc;
     $hinh_anh = hinh_anh;
     $link_anh = link_anh;
     $drive = drive;
     $link_tai = link_tai;
     $kieu_file = kieu_file;
     $mediafire = mediafire;
     $fshare = fshare;
     $mb = mb;
     $mo_ta = mo_ta;
     $pass = pass;
    
     $link_list = 'index.php?module=cts&act=list';
         
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
    
     //$list_danhmuc = getListDanhmuc(0,50);
     
     $list_chude = getListchude(0,50);
    
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    insertcts($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
 
    require('view/template/cts/add.tpl');
    break;
    //case them can bo
    case 'edit':
    require ('language/cts/edit.php');
    
     $heading_title = heading_title;
	 $tieu_de = tieu_de;
     $theo_danh_muc = theo_danh_muc;
     $hinh_anh = hinh_anh;
     $link_anh = link_anh;
     $link_tai = link_tai;
     $kieu_file = kieu_file;
     $mediafire = mediafire;
     $fshare = fshare;
     $mb = mb;
     $drive = drive;
     $mo_ta = mo_ta;
     $pass = pass;
    // $list_danhmuc = getListDanhmuc(0,50);
     // $list_chude = getListchude(0,50);
    $link_list = 'index.php?module=cts&act=list';
    $id = $_REQUEST['id'];
    $cts = getcts($id);
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editcts($id, $_POST);
	//update_view($id,'1');
	//insert_view_log($id);
	
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/cts/edit.tpl');
    break;
    // xoa   
    case 'del':
    get_file('language/cts/del.php');
    $link_list = 'index.php?module=cts&act=list';
    $id = $_REQUEST['id'];
    delcts($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;
    
    
    
    case 'error':
    //Get language
    require('language/cts/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $theo_danh_muc = theo_danh_muc;
    $tieu_de = tieu_de;
    $link_tai = link_tai;
    $kieu_file = kieu_file;
    $mb = mb;
    $thoi_gian = thoi_gian;

    $hinh_anh = hinh_anh;
    $cot_thao_tac = thao_tac;
$link_add ='index.php?module=cts&act=add';

if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 30;
        $start = ($page - 1) * $limit;
        
                   
        $list_baocao = getListbaocao($start, $limit);
        
        $total = totalbaocao();
    
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=cts&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();

    require('view/template/cts/baocao.tpl');  
    break;
    
        // xoa   
    case 'xoa':
    get_file('language/cts/del.php');
    $link_list = 'index.php?module=cts&act=error';
    $id = $_REQUEST['id'];
    delbaocao($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;
	
	 case'view':

        $catid = $_REQUEST['cm'];
        $catdetail = getcattin($catid);
        
       $ref="http://".eregi_replace("/$","",(getenv(HTTP_HOST)?getenv(HTTP_HOST):$_SERVER['HTTP_HOST']).(getenv(REQUEST_URI)?getenv(REQUEST_URI):$_SERVER['REQUEST_URI']));
	 $_SESSION['back'] = $ref;  
            //$tongdiachicuatoi = total_address_in_mylist1($_SESSION['user_id']);
            // $tongbaibosung = total_my_additional1($_SESSION['user_id']);
            //$tongcommentcuatoi = total_my_comment1($_SESSION['user_id']);
				   
        $id = $_REQUEST['id'];
        $cts = getcts($id);
		
        if(!$cts){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
				
		update_view($id,'1');
		insert_view_log($id);
		
		
		if(isset($_POST['title'])){
		   $valid = true;  
		}
		//send mail
		if(!$err){
          $valid = true;    
        }
         else{
           $valid = false;
         }
    
        $link_list = 'index.php?module=cts&act=view&cm='.$catid.'&id='.$id;
    
		if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
		{
		//insertcts($_POST);
		$_SESSION['success'] = send_mail_success;
		$_SESSION['warning'] = '';
		//chuyen huong ve list
		header('LOCATION: '.$link_list);    
		}else{
			$_SESSION['warning'] = wr;
			$_SESSION['success']='';
		}
		
							
			//$member1 = getmember($_SESSION['user_id']);
                
            //  $list_giaodich = getListGiaoDich($_SESSION['user_id'],0,20);
                
              
    
             include('view/template/cts/view.tpl');
         
              
        
       
      break;
	
	
    case 'active':
    $id = $_GET['id'];
    set_status($id,1);
    header('LOCATION: '.'index.php?module=cts&act=list');  
     exit();
    break;
    
    case 'deactive':
    $id = $_GET['id'];
    set_status($id,0);
     header('LOCATION: '.'index.php?module=cts&act=list');  
     exit();
    break;
	
	
		case'export':

         
		 //lấy danh sach bang tin
       //assign input data from form to the SESSION
		$_SESSION['startday'] = $_POST['startday'];
        $_SESSION['endday'] = $_POST['endday'];
        $startday = $_POST['startday'];
        $endday = $_POST['endday'];
        $_SESSION['canhantochuc'] = $_POST['tochuc_canhan_id'];

		  if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 3000;
        $start = ($page - 1) * $limit;
   
		
		
		 if(isset($_POST['tim_kiem'])){   
		if($startday && $endday){
		
            $starttime = explode("/",$startday);
	    $_POST['starttime'] = $starttime = gmmktime(0,0,0,$starttime[1],$starttime[0],$starttime[2]);
    	    $endtime = explode("/",$endday);
     	    $_POST['endtime']=  $endtime = gmmktime(0,0,0,$endtime[1],$endtime[0],$endtime[2]);
		//	echo $starttime; die;
     	    $list_baocao = getListbaocao($_POST,$limit,$start);
			//$total = tt($_POST,$limit,$start);
     	    }
     	    else {
			$list_baocao = getListbaocao($_POST,$limit,$start);
			//$total = tt($_POST,$limit,$start);
	    }
        } else {
	    $list_baocao = getListbaocao($_POST,$limit,$start);
           // $total = totalnews();
        
	    }
		
      
	    //require('view/template/baocao/tongquan.tpl');  
       //include('view/template/cts/export.tpl');
	    $type = $_GET['t'];
	    switch($type){
            
        case 'doc':
           
        header("Content-type: application/vnd.ms-word");
        header("Content-Disposition: attachment;Filename=ds_".$tenfileword.".doc");
        echo "<html>";
        echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">";
        //echo "<body>";
         
         include('view/template/baocao/rp_tongquan.tpl');
        
        //echo "</body>";
        echo "</html>"; 
           
            
        break;
       
        case 'pdf':
        $title = make_alias(heading_title ." ".kien_truc." ");
        $heading_title = title ." ".kien_truc."";
        echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">";
        include('view/template/cts/export.tpl');
        break;    
        }

      break;   
	  
	  
	  
	  
	  
	  


 }

?>