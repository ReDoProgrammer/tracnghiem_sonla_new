<?php

/**
 * @author nbinh88@gmail.com
 * @copyright 2013
 */
if((!$_SESSION['admin'])){
    header('LOCATION: index.php?module=member&act=login');  
    exit();
}
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_dmnho.php');
$page = $_GET['act'];
 switch($page){
    
    
     case 'danhsachdmnhotheodm':
        
        $output = '<option value="FALSE"> -- </option>';
		$results = getListDmnhoTheoDm($_GET['dm_id']);
        
        foreach ($results as $result) {
        	
            $output .= '<option value="'.$result['dm_nho_id'].'"';
	        if(isset($_GET['id_dm_nho']) && ($_GET['id_dm_nho'] == $result['dm_nho_id'])) {
	      	$output .= 'selected="selected"';
	   	}
	
	    	$output .= '>' . $result['tieu_de1'] . '</option>';
    	} 
        
		if (!$results) {
			if (!$_GET['id_dm_nho']) {
		  		$output .= '<option value="0" selected="selected">' . "Chon co" . '</option>';
			} else {
				$output .= '<option value="0">' . "chon 0 co" . '</option>';
			}
		}
	
	    echo $output;
    
    break;
    
    
    case 'list':
    //Get language
    require('language/dm/list_danhmuc.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ten_loai = ten_loai;
    $mo_ta = mo_ta;
    $thu_tu = thu_tu;
    $cot_thao_tac = cot_thao_tac;
    
$link_add ='index.php?module=dmnho&act=add';

    if($_REQUEST['page']==""){
        $page = 1;
        $start =1;
        
        }
        else{
                
        $page = $_REQUEST['page'];
             
        }
       //get input for class page
        $limit = 20;
        $start = ($page - 1) * $limit;
        //$list_huyen = getListHuyen(0,20);
        $list_dm = getListdmnho($start, $limit);
        
        //$total = totalxa();
        // paging
        $paging = new Pagination();
        $paging->total = $total;
        $paging->limit = $limit;
        $paging->url = "index.php?module=xa&act=list&page={page}";
        $paging->page = $page;
        $pagination = $paging->render();

    require('view/template/dmnho/list_dm.tpl');  
    break;
    
    //case them tuyen dung
    case 'add':
    require ('language/dm/add_danhmuc.php');
    
     $heading_title = heading_title;
     $ten_loai = ten_loai;
     $danh_muc_cha = danh_muc_cha;
     $thu_tu = thu_tu;

        
     $link_list = 'index.php?module=dmnho&act=list';
     $list_dmnews1 = getListdmnews1(0,50);
	 
     $_SESSION['tt'] = $_POST['thu_tu']; 
     $_SESSION['dm'] = $_POST['tieu_de1'];
         if($_POST['tieu_de1']=="")
         {
            $err['exist'] = ten_danh_muc;
            $error_dm = $err['exist'];
         }
         
     if(!$err){
        $valid = true;    
    }
    else{
        $valid = false;
         }     
    if(($_SERVER['REQUEST_METHOD']=='POST')&&$valid)
    {
    insertdm($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/dmnho/add_dm.tpl');
    break;
    
    //case edit
    case 'edit':
    require('language/dmnho/edit_danhmuc.php');
    $heading_title = heading_title;
    $ten_loai = ten_loai;
    $danh_muc_cha = danh_muc_cha;
    $thu_tu = thu_tu;
    $link_list = 'index.php?module=dmnho&act=list';
    
    
    $list_dmnews1 = getListdmnews1(0,50);
    $id = $_REQUEST['id'];
    $dmnews = getdmnho($id);
     
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editdmnho($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/dmnho/edit_dm.tpl');
    break; 
    
    case 'del':
    get_file('language/dm/del_danhmuc.php');
    $link_list = 'index?module=dmnho&act=list';
    $id = $_REQUEST['id'];
    deldmnho($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;



 }
    // xoa
    

?>