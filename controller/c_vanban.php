<?php
ob_start();
/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

defined('DSVH') or die('Restricted access');
include('model/m_vanban.php');
include('model/counter.php');
include('language/lang_vanban.php');
include('controller/c_thongke.php');
include('controller/c_left.php');
include('controller/c_right.php');

$page = $_GET['act'];
if(($_GET['act']!='view')&&($_GET['act']!='list')){
	    header('LOCATION: ../');  
}
   switch($page){
        case 'list':
        //lay thong tin lang 
        $timkiem = tim_kiem;
        $sohieu = so_hieu;
        
        //lấy danh sach bang tin
       //assign input data from form to the SESSION
        $_SESSION['ten'] = $_POST['ten'];
        $_SESSION['so_hieu'] = $_POST['so_hieu'];
        $_SESSION['ngay_ban_hanh'] = $_POST['ngay_ban_hanh'];
        $_SESSION['noi_ban_hanh_id'] = $_POST['noi_ban_hanh_id'];
        $_SESSION['loai_van_ban_id'] = $_POST['loai_van_ban_id'];
        
		
	$_POST['ten'] = loc_tk(loc_input($_POST['ten']));
	$_POST['so_hieu'] = loc_tk(loc_input($_POST['so_hieu']));
	//$_POST['ngay_ban_hanh'] = $_POST['ngay_ban_hanh'];
	$_POST['noi_ban_hanh_id'] = (int)$_POST['noi_ban_hanh_id'];
	$_POST['loai_van_ban_id'] = (int)$_POST['loai_van_ban_id'];
		
        if($_REQUEST['page']==""){
         $page = 1;
        }
        else{
                
        $page = (int)$_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 40;
        $start = ($page - 1) * $limit;
        
        $list_loaivanban = getlistloaivanban(0, 100);
        $list_noibanhanh = getlistnoibanhanh(0,100);
    	
    	
    if($_SERVER['REQUEST_METHOD']=='POST'){
     
	    $list_vanban = getListVanBanVoiThamSoNangCao($_POST,$limit,$start);
	    $total = tt($_POST,$limit,$start);
	  
        }else{
	
	if(isset($_REQUEST['nbh'])){
    	$data['noi_ban_hanh_id'] = (int)$_REQUEST['nbh'];
    	$_SESSION['noi_ban_hanh_id'] = (int)$_REQUEST['nbh'];
    	$list_vanban = getListVanBanVoiThamSoNangCao($data,$limit,$start);
	    $total = tt($data,$limit,$start);
    	}
    	
    	
    	
    	else{
	    $list_vanban = getListvanban($start,$limit);
            $total = totalvanban();
        }
	    }
   
    	
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=vanban&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();
    
        $title = home;
    	$heading_title = home;
        
        require('view/theme/default/template/home/header.tpl'); 
        require('view/theme/default/template/vanban/vanban_list.tpl');
	   
    	require('view/theme/default/template/home/right.tpl');
        
    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
       
        case 'view':
   	//lấy danh sach bang tin
    
    	//$list_vanbanrand = getListvanbanrand(0,10);
       $list_loaivanban = getlistloaivanban(0, 100);
       $list_noibanhanh = getlistnoibanhanh(0,100);
        
        $id = (int)$_REQUEST['id'];
        $vanban_detail = getvanban($id);
        
      
       
        if(!$vanban_detail){
           header('LOCATION: index.php?module=home');  
           exit(); 
        }
        
        //d?c duôi file
        $filename = trim($vanban_detail['file']);
        $path = '.'.$filename;
        
        $ext = end(explode(".",$filename));
        
        
        //đọc đuôi file
        $filename = trim($vanban_detail['file']);
        $path = '.'.$filename;
        
        $ext = end(explode(".",$filename));
        //return ppt doc xls
        //update luot xem
        $view_old = $vanban_detail['luot_xem'];
        $view_new = $view_old +1;
        update_count($view_new, $id);
        
        $title = $vanban_detail['ten']." - ".home." ";
    	$heading_title=  home;
        
         $list_loaivanban = getlistloaivanban(0, 100);
        $list_noibanhanh = getlistnoibanhanh(0,100);
        
    	require('view/theme/default/template/home/header.tpl');
    	require('view/theme/default/template/vanban/vanban_detail.tpl');     
	
        require('view/theme/default/template/home/right.tpl'); 

    	
    	require('view/theme/default/template/home/footer.tpl');    
        break;
        
        case 'download':
        
        $id = $_REQUEST['id'];
        $vanban_detail = getvanban($id);
       
        if(!$vanban_detail){
            exit(); 
        }
        
        //các file upload được để trong 1 thư mục riêng
        $upload_dir = "."; //lấy tên file cần download từ URL
        $filename = $vanban_detail['file'];
        //thực hiện quá trình kiểm tra
        
        if(!$filename){
            exit(); 
        }
      
        $view_old = $vanban_detail['luot_tai'];
        $view_new = $view_old +1;
        update_count('van_ban','luot_tai','van_ban_id',$view_new, $id);
        //mở file để đọc với chế độ nhị phân (binary)
        $fp = fopen($upload_dir.$filename, "rb");
        //gởi header đến cho browser
        header('Content-type: application/octet-stream');
        header('Content-disposition: attachment; filename="'.$filename.'"');
        header('Content-length: ' . filesize($upload_dir.$filename));
        //đọc file và trả dữ liệu về cho browser
        fpassthru($fp);
        fclose($fp); 
         break;
 }
   ob_end_flush();  
?>