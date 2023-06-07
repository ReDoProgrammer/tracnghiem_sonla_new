<?php

/**
 * @author phpDesigner 7
 * @copyright 2012
 */
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_phongban.php');
$page = $_GET['act'];
 switch($page){
    case 'list':
    //Get language
    require('language/phongban/list_phongban.php');
    $heading_title = heading_title;
    $button_add = button_add;
    $button_edit = button_edit;
    $button_delete = button_delete;
    
    $ma_phong_ban = ma_phong_ban;
    $ten_phong_ban = ten_phong_ban;
    $thao_tac = thao_tac;
    $link_add ='index.php?module=phongban&act=add';
    
    $list_phongban = getListPhongBan();
        

    require('view/template/phongban/list_phongban.tpl');
    break;
    
    //case them phong ban
    case 'add':
    require('language/phongban/add_phongban.php');
    $heading_title = heading_title;
    $ma_phong_ban = ma_phong_ban;
    $ten_phong_ban = ten_phong_ban;
    $link_list = 'index.php?module=phongban&act=list';
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    insertPhongban($_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
    
    
    require('view/template/phongban/add_phongban.tpl');
    break;
    
        //case sua phong ban
    case 'edit':
    require('language/phongban/edit_phongban.php');
    $heading_title = heading_title;
    $ma_phong_ban = ma_phong_ban;
    $ten_phong_ban = ten_phong_ban;
    $link_list = 'index.php?module=phongban&act=list';
    $id = $_REQUEST['id'];
    $phongban = getPhongban($id);
    
    
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    editPhongban($id, $_POST);
    $_SESSION['success'] = edit_success;
    //chuyen huong ve list
    header('LOCATION: '.$link_list);    
    }
        
    require('view/template/phongban/edit_phongban.tpl');
    break;
    
    case 'del':
    get_file('language/phongban/del_phongban.php');
    $link_list = 'index?module=phongban&act=list';
    $id = $_REQUEST['id'];
    delphongban($id);
     $_SESSION['success'] = del_success;
    //chuyen huong ve list
     header('LOCATION: '.$link_list);  
     exit();
         
    
    break;

 }
    

?>