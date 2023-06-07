<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

include ('model/m_chucdanh.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/chucdanh/list_chucdanh.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
	$ten_chuc_danh = ten_chuc_danh;
    $ma_chuc_danh = ma_chuc_danh;
    $thao_tac = thao_tac;
 $link_add ='index.php?module=chucdanh&act=add';
 
    $list_chucdanh = getListChucdanh();
    
    require('view/template/chucdanh/list_chucdanh.tpl');
    break;
	
	//case them chuc danh
	case 'add':
	require('language/chucdanh/add_chucdanh.php');
	$heading_title = heading_title;
	$ten_chuc_danh = ten_chuc_danh;
	$ma_chuc_danh = ma_chuc_danh;
    $link_list = 'index.php?module=chucdanh&act=list';
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    insertChucdanh($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/chucdanh/add_chucdanh.tpl');
    break;
    
    //case sua chuc danh
    case 'edit':
    require('language/chucdanh/edit_chucdanh.php');
    $heading_title = heading_title;
    $ten_chuc_danh = ten_chuc_danh;
    $ma_chuc_danh = ma_chuc_danh;
    $link_list = 'index.php?module=chucdanh&act=list';
    $id = $_REQUEST['id'];
    $chucdanh = getChucdanh($id);
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editChucdanh($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/chucdanh/edit_chucdanh.tpl');
    break; 
    
    case 'del':
    get_file('language/chucdanh/del_chucdanh.php');
    $link_list = 'index?module=chucdanh&act=list';
    $id = $_REQUEST['id'];
    delchucdanh($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;  
}
?>