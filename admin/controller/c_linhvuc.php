<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

include ('model/m_linhvuc.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/linhvuc/list.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
	$ten_chuc_danh = ten_chuc_danh;
    $ma_chuc_danh = ma_chuc_danh;
    $thao_tac = thao_tac;
 $link_add ='index.php?module=linhvuc&act=add';
 
    $list_linhvuc = getListlinhvuc();
    
    require('view/template/linhvuc/list.tpl');
    break;
	
	//case them chuc danh
	case 'add':
	require('language/linhvuc/add.php');
	$heading_title = heading_title;
	$ten_chuc_danh = ten_chuc_danh;
	$ma_chuc_danh = ma_chuc_danh;
    $link_list = 'index.php?module=linhvuc&act=list';
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    insertlinhvuc($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/linhvuc/add.tpl');
    break;
    
    //case sua chuc danh
    case 'edit':
    require('language/linhvuc/edit.php');
    $heading_title = heading_title;
    $ten_chuc_danh = ten_chuc_danh;
    $ma_chuc_danh = ma_chuc_danh;
    $link_list = 'index.php?module=linhvuc&act=list';
    $id = $_REQUEST['id'];
    $linhvuc = getlinhvuc($id);
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editlinhvuc($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/linhvuc/edit.tpl');
    break; 
    
    case 'del':
    get_file('language/linhvuc/del.php');
    $link_list = 'index?module=linhvuc&act=list';
    $id = $_REQUEST['id'];
    dellinhvuc($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;  
}
?>