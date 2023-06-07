<?php
/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
defined('DSVH') or die('Restricted access');
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
 
if((!$_SESSION['admin'])){
  header('LOCATION: index.php?module=member&act=login');  
  exit();
}
//include('controller/c_thongke.php');     
include ('model/m_tinhoatdong.php');
$page = $_GET['act'];
 switch($page){
 
     case 'tien_do':
     get_file('language/tinhoatdong/del_tinhoatdong.php');
     $heading_title = "Tien do xu ly";
     $link_list = 'index.php?module=tinhoatdong&act=list';
     $id = $_REQUEST['id'];
     
     $list_tiendoxuly = get_list_tien_do_xu_ly($id);
 
      
     require('view/template/tinhoatdong/tiendoxuly.tpl');
  
     exit();
 
 
    case 'tra_ve':
     get_file('language/tinhoatdong/del_tinhoatdong.php');
     $heading_title = "Y kien xu ly";
     $link_list = 'index.php?module=tinhoatdong&act=list';
     $id = $_REQUEST['id'];
     
     $trangthai = $_SESSION['role_key'].'_'.'tra_ve';
     
     
     if($_SERVER['REQUEST_METHOD']=='POST'){
     update_kiem_duyet($id,$trangthai); //cho ve trang thai gui  
     insert_tien_do_xu_ly($_SESSION['can_bo_id'], $id, "Tra ve cho y kien xu ly");       
     //chen y kien xu ly
     $_POST['duyet_uid'] = $_SESSION['can_bo_id'];
     $_POST['tin_id']  = $id;
     insert_y_kien_xu_ly($_POST);
        // cho nguoi gui
     $_SESSION['success'] = send_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     }
      
     require('view/template/tinhoatdong/btv_trave.tpl');
  
     exit();
 
 
     case 'xuat_ban':
     get_file('language/tinhoatdong/del_tinhoatdong.php');
     $link_list = 'index.php?module=tinhoatdong&act=list';
     $id = $_REQUEST['id'];
     //update thong tin trang thai cua nguoi gui
     
     update_kiem_duyet($id,'xuat_ban'); //cho ve trang thai gui
       
     insert_tien_do_xu_ly($_SESSION['can_bo_id'], $id, "Xuat ban");  
         
     $_SESSION['success'] = send_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
 
  
     case 'go_bai':
     
     get_file('language/tinhoatdong/del_tinhoatdong.php');
     $link_list = 'index.php?module=tinhoatdong&act=list';
     $id = $_REQUEST['id'];
     //update thong tin trang thai cua nguoi gui
     
     update_kiem_duyet($id,'go_bai'); //cho ve trang thai gui
       
     insert_tien_do_xu_ly($_SESSION['can_bo_id'], $id, "Go bai khong XB");  
         
     $_SESSION['success'] = send_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     
     exit();
    
 
     case 'tbt_huy_gui_duyet':
     get_file('language/tinhoatdong/del_tinhoatdong.php');
     $link_list = 'index.php?module=tinhoatdong&act=list';
     $id = $_REQUEST['id'];
     //update thong tin trang thai cua nguoi gui
     
     update_kiem_duyet($id,'tbt_tra'); //cho ve trang thai gui
     
      insert_tien_do_xu_ly($_SESSION['can_bo_id'], $id, "Tra bai lai");  
     
     $_SESSION['success'] = send_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
 
 
     case 'btv_huy_gui_duyet':
     get_file('language/tinhoatdong/del_tinhoatdong.php');
     $link_list = 'index.php?module=tinhoatdong&act=list';
     $id = $_REQUEST['id'];
     //update thong tin trang thai cua nguoi gui
     
     update_kiem_duyet($id,'btv_sua'); //cho ve trang thai gui
     insert_tien_do_xu_ly($_SESSION['can_bo_id'], $id, "Huy gui duyet");  
     
     $_SESSION['success'] = send_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;  
 
   
     case 'btv_gui_duyet':
     get_file('language/tinhoatdong/del_tinhoatdong.php');
     $link_list = 'index.php?module=tinhoatdong&act=list';
     $id = $_REQUEST['id'];
     //update thong tin trang thai cua nguoi gui
     
     update_kiem_duyet($id,'btv_gui'); //cho ve trang thai gui
      insert_tien_do_xu_ly($_SESSION['can_bo_id'], $id, "Gui duyet");  
      
     $_SESSION['success'] = send_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;  
 
 
    case 'nhan_kiem_duyet':
     get_file('language/tinhoatdong/del_tinhoatdong.php');
     $link_list = 'index.php?module=tinhoatdong&act=list';
     $id = $_REQUEST['id'];
     
     $trangthai = $_SESSION['role_key'].'_'.'nhan';
     update_kiem_duyet($id,$trangthai); //cho ve trang thai gui
      insert_tien_do_xu_ly($_SESSION['can_bo_id'], $id, "Nhan kiem duyet");  
     // cho nguoi gui
     $_SESSION['success'] = send_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;  
 
     case 'gui_duyet':
     get_file('language/tinhoatdong/del_tinhoatdong.php');
     $link_list = 'index.php?module=tinhoatdong&act=list';
     $id = $_REQUEST['id'];
     //update thong tin trang thai cua nguoi gui
     update_kiem_duyet($id,'gui'); //cho ve trang thai gui
     insert_tien_do_xu_ly($_SESSION['can_bo_id'], $id, "Gui duyet");  
     $_SESSION['success'] = send_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;  
 
  case 'huy_gui':
     get_file('language/tinhoatdong/del_tinhoatdong.php');
     $link_list = 'index.php?module=tinhoatdong&act=list';
     $id = $_REQUEST['id'];
   
     update_kiem_duyet($id,'chua'); //cho ve trang thai chua gui
      insert_tien_do_xu_ly($_SESSION['can_bo_id'], $id, "Khong gui nua");  
     $_SESSION['success'] = cancel_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;  
 
 case 'del_quy_trinh':
    
     $link_list = 'index.php?module=tinhoatdong&act=quy_trinh';
     $id = $_REQUEST['id'];
   
    del_quy_trinh($id);
     $_SESSION['success'] = del_success;
    
     header('LOCATION: '.$link_list);  
     exit();
         
  break;       
         
 
 case'gui_nhan':
        //$output = '<option value="FALSE"> -- </option>';
        $results = get_list_roles_sub($_GET['ben_a']);
        foreach ($results as $result) {
        	
        $output .= '<option value="' . $result['role_key'] . '"';
	        if (isset($_GET['ben_a']) && ($_GET['ben_a'] == $result['ben_a'])) {
	      		$output .= ' selected="selected"';
	   	}
	
	    	$output .= '>' . $result['role_name'] . '</option>';
    	} 
        
		if (!$results) {
			if (!$_GET['ben_a']) {
		  		$output .= '<option value="0" selected="selected">' . "Chon co" . '</option>';
			} else {
				$output .= '<option value="0">' . "chon 0 co" . '</option>';
			}
		}
	
	    echo $output;
    break;
 
 
 
    case 'quy_trinh':
    //Get language
    require('language/tinhoatdong/list_quytrinh.php');
    $heading_title = heading_title;
    $title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ma_tin_hoat_dong = ma_tin_hoat_dong;
    $ten_tin_hoat_dong = ten_tin_hoat_dong;
    $thao_tac = thao_tac;
    $link_add ='index.php?module=tinhoatdong&act=add_quy_trinh';
    
   
    $list_quy_trinh = get_list_quy_trinh(0,100);
    $total = total_quy_trinh();
  
        
    require('view/template/tinhoatdong/list_quytrinh.tpl');
    break;
 
 
    case 'add_quy_trinh':
    //Get language
    require('language/tinhoatdong/add_quytrinh.php');
    $heading_title = heading_title;
    $title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ma_tin_hoat_dong = ma_tin_hoat_dong;
    $ten_tin_hoat_dong = ten_tin_hoat_dong;
    $thao_tac = thao_tac;
    $link_add ='index.php?module=tinhoatdong&act=quy_trinh';
    $list_quy_trinh = get_list_quy_trinh(0,100);
    $total = total_quy_trinh();
    $list_ben_a = get_list_roles(0,100);
    
    if($_SERVER['REQUEST_METHOD']=='POST'){
     
    insert_quy_trinh($_POST);
    
    header('LOCATION: '.$link_list);
    }
    
   
    require('view/template/tinhoatdong/edit_quytrinh.tpl');
    break;
 
 
    case 'list':
    //Get language
    require('language/tinhoatdong/list_tinhoatdong.php');
    $heading_title = heading_title;
    $title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ma_tin_hoat_dong = ma_tin_hoat_dong;
    $ten_tin_hoat_dong = ten_tin_hoat_dong;
    $thao_tac = thao_tac;
    $link_add ='index.php?module=tinhoatdong&act=add';
    
    if($_POST['selected']==""){
        $err['exist'] = chua_chon;
        $error_name = $err['exist'];
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
      $limit = 20;
      $start = ($page - 1) * $limit; 
      
    //kiem tra du lieu cua from
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid){
      foreach($_POST['selected'] as $id){
        $tinhoatdong = gettinhoatdong($id);
         if($tinhoatdong['file']){
           unlink('../data/image/tinhoatdong/'.$tinhoatdong['file']);
         }
         deltinhoatdong($id);
       }  
   
    //chuyen huong ve list
    header('LOCATION: '.$link_list);
    }
    
    //tim kiem
     if(trim($_POST['ten_tin_hoat_dong'])==""){
         $err1['exist'] = chua_nhap_ten;
         $error1_name = $err1['exist'];
     }
   
     if(!$err1){
            $valid1 = true;
     }else{
            $valid1 = false;
     }
     
    if(isset($_SESSION['user_id'])) {
     $uid = $_SESSION['user_id'];
    }
    
    $list_chuyenmuc = get_list_chuyen_muc_cua_user($uid);
    
     
     if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid1){
        
        $list_tinhoatdong = getlisttinhoatdongvoithamso($_POST, $_SESSION['can_bo_id'], $start,$limit);
        $total = total2($_SESSION['can_bo_id'], $_POST);
        
      }else{
   
       if($_SESSION['role_key']=='pv'){
        $list_tinhoatdong = getListtinhoatdong($_SESSION['can_bo_id'], $start, $limit);
        $total = total($_SESSION['can_bo_id']);
        }
        
        if($_SESSION['role_key']=='btv'){
        $list_tinhoatdong =  getlisttinhoatdongtheotrangthaivachuyenmuc($trangthai,$chuyenmuc, $start, $limit);
        $total = total($_SESSION['can_bo_id']);
        }
        
        if($_SESSION['role_key']=='tbt'){
      
          $total = total_all_news();
          
        }
  
    }
    
    $paging = new Pagination();
    $paging->total = $total;
    $paging->limit = $limit;
    $paging->url = "index.php?module=tinhoatdong&act=list&page={page}";
    $paging->page = $page;
    $pagination = $paging->render();
    
    //echo $_SESSION['role_key'];  for debug by phanvanliem@gmail.com
     
    require('view/template/tinhoatdong/'.$_SESSION['role_key'].'_list_tinhoatdong.tpl');
    break;
	
    //case them chuc danh
    case 'add':
    require('language/tinhoatdong/add_tinhoatdong.php');
    $heading_title = heading_title;
    $title = heading_title;
    $ma_tin_hoat_dong = ma_tin_hoat_dong;
    $ten_tin_hoat_dong = ten_tin_hoat_dong;
    $motachitiet = mo_ta_chi_tiet;
    $motachung = mo_ta_chung;
    $hinhdaidien = hinh_dai_dien;
    
    //$list_danhmuc = getListdanhmuc(0,50);
    $list_danhmuc = get_list_cha();
    
    if(isset($_SESSION['can_bo_id'])) {
     $uid = $_SESSION['can_bo_id'];
    }
    
    $list_chuyenmuc = get_list_chuyen_muc_cua_user($uid);
    
    $link_list = 'index.php?module=tinhoatdong&act=list';
    
    if($_POST['tieu_de']==""){
        $err['exist'] = chua_nhap_ten;
        $error_name = $err['exist'];
             }
    if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
    }
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    
    if($_SESSION['role_key']=="pv"){
     $_POST['kiem_duyet'] = 'chua';
    }
    
    if($_SESSION['role_key']=="btv"){
     $_POST['kiem_duyet'] = 'btv_sua';
    }
    
     if($_SESSION['role_key']=="tbt"){
     $_POST['kiem_duyet'] = 'tbt_sua';
    }
    
    
    inserttinhoatdong($_POST);
    $liid = mysql_insert_id();
    insert_tien_do_xu_ly($_SESSION['can_bo_id'], $liid, "Viet bai");
    $list_tiendoxuly = get_list_tien_do_xu_ly($id);
    
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/tinhoatdong/edit_tinhoatdong.tpl');
    break;
    
    //case sua dan toc
    case 'edit':
    require('language/tinhoatdong/edit_tinhoatdong.php');
    $heading_title = heading_title;
    $title = heading_title;
    $ma_tin_hoat_dong = ma_tin_hoat_dong;
    $ten_tin_hoat_dong = ten_tin_hoat_dong;
    $motachitiet = mo_ta_chi_tiet;
    $motachung = mo_ta_chung;
    $hinhdaidien = hinh_dai_dien;
    //$list_danhmuc = getListdanhmuc(0,50);
    $list_danhmuc = get_list_cha();
    $link_list = 'index.php?module=tinhoatdong&act=list';
    $id = $_REQUEST['id'];
    $tinhoatdong = gettinhoatdong($id);
    //$_POST['file'] = $tinhoatdong['file'];
    $catdetail = getcat($tinhoatdong['cat_id']);
    $cha_id = $catdetail['cha_id'];
    if(isset($_SESSION['can_bo_id'])) {
     $uid = $_SESSION['can_bo_id'];
    }
    
    $list_chuyenmuc = get_list_chuyen_muc_cua_user($uid);
    
    $list_ykxl = get_list_ykxl($id);
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
      
    edittinhoatdong($id, $_POST);
    $_SESSION['success'] = edit_success;
    
    if($_SESSION['role_key']=="btv"){
     $trangthai = $_SESSION['role_key'].'_'.'sua';
     update_kiem_duyet($id,$trangthai); //cho ve trang thai gui
      insert_tien_do_xu_ly($_SESSION['can_bo_id'], $id, "Sua bai");
     }
     
     if($_SESSION['role_key']=="tbt"){
     $trangthai = $_SESSION['role_key'].'_'.'sua';
     update_kiem_duyet($id,$trangthai); //cho ve trang thai gui
      insert_tien_do_xu_ly($_SESSION['can_bo_id'], $id, "Sua bai");
     }
     
     if($_SESSION['role_key']=="pv"){
     $trangthai = 'chua';
     update_kiem_duyet($id,$trangthai); //cho ve trang thai gui
     insert_tien_do_xu_ly($_SESSION['can_bo_id'], $id, "Sua bai");
     }
     
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/tinhoatdong/edit_tinhoatdong.tpl');
    break; 
    
    case 'del':
    get_file('language/tinhoatdong/del_tinhoatdong.php');
    $link_list = 'index.php?module=tinhoatdong&act=list';
    $id = $_REQUEST['id'];
    $tinhoatdong = gettinhoatdong($id);
    if($tinhoatdong['avatar']){
           unlink('./data/image/tinhoatdong/'.$tinhoatdong['avatar']);
         }
    deltinhoatdong($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;  
    
    case'cat':
        //$output = '<option value="FALSE"> -- </option>';
        $results = get_list_cat($_GET['cha_id']);
        foreach ($results as $result) {
        	
        $output .= '<option value="' . $result['ma_danh_muc'] . '"';
	        if (isset($_GET['cat_id']) && ($_GET['cat_id'] == $result['ma_danh_muc'])) {
	      		$output .= ' selected="selected"';
	   	}
	
	    	$output .= '>' . $result['ten_danh_muc'] . '</option>';
    	} 
        
		if (!$results) {
			if (!$_GET['cat_id']) {
		  		$output .= '<option value="0" selected="selected">' . "Chon co" . '</option>';
			} else {
				$output .= '<option value="0">' . "chon 0 co" . '</option>';
			}
		}
	
	    echo $output;
    break;
    
    
}
?>