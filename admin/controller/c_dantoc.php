<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng

include ('model/m_dantoc.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/dantoc/list_dantoc.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ma_dan_toc = ma_dan_toc;
	$ten_dan_toc = ten_dan_toc;
    $thao_tac = thao_tac;
 $link_add ='index.php?module=dantoc&act=add';
 
    $list_dantoc = getListDantoc();
    
    require('view/template/dantoc/list_dantoc.tpl');
    break;
	
	//case them chuc danh
	case 'add':
	require('language/dantoc/add_dantoc.php');
	$heading_title = heading_title;
    $ma_dan_toc = ma_dan_toc;
	$ten_dan_toc = ten_dan_toc;
    $link_list = 'index.php?module=dantoc&act=list';
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    insertDantoc($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    require('view/template/dantoc/add_dantoc.tpl');
    break;
    
    //case sua dan toc
    case 'edit':
    require('language/dantoc/edit_dantoc.php');
    $heading_title = heading_title;
    $ma_dan_toc = ma_dan_toc;
    $ten_dan_toc = ten_dan_toc;
    $link_list = 'index.php?module=dantoc&act=list';
    $id = $_REQUEST['id'];
    $dantoc = getDantoc($id);
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editDantoc($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/dantoc/edit_dantoc.tpl');
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