<?php

/**
 * @author honestphan
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_baohanh.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/baohanh/list_baohanh.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $tieu_de = tieu_de;
    $thoi_gian = thoi_gian;
    $cot_thao_tac = cot_thao_tac;
$link_add ='index.php?module=baohanh&act=add';

$list_baohanh = getListBaohanh();

    require('view/template/baohanh/list_baohanh.tpl');  
    break;
    
    

    //case edit
    case 'edit':
    require('language/baohanh/edit_baohanh.php');
    $heading_title = heading_title;
    $tieu_de = tieu_de;
    $noi_dung = noi_dung;
    $thoi_gian = thoi_gian;
    $link_list = 'index.php?module=baohanh&act=list';
    $id = $_REQUEST['id'];
    $baohanh = getBaohanh($id);
    
    
   if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editBaohanh($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    
    require('view/template/baohanh/edit_baohanh.tpl');
    break; 
    
    case 'del':
    get_file('language/tintuc/del_tintuc.php');
    $link_list = 'index?module=tintuc&act=list';
    $id = $_REQUEST['id'];
    delTintuc($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;



 }
    // xoa
    

?>