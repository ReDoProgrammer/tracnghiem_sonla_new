<?php

/**
 * @author honestphan
 * @copyright 2012
 */
// demo for group
$page = $_GET['act'];
 switch($page){
    /**
     * case list
     * */
    case 'list':
    //Get language
    get_file('language/demo/lang_list.php');  
    //get text form file lang
    $link_add = 'index?module=demo&act=add';
    $heading_title = heading_title;
    $title = title;
    $save= button_add;
    $delete = button_del;
    $cot1= cot1;
    $cot2= cot2;
    $cot3= cot3;
    $cot4= cot4;
    $cot5= cot5;
    include('view/template/demo/list.tpl'); //goi tap tin giao dien 
    break; //ket thuc case 
    
      /**
     * case add
     * */
    
    case 'add':
    
    get_file('language/demo/lang_add.php');  // lay du lieu tu file ngon ngu
    $heading_title = heading_title;
    $link_list = 'index?module=demo&act=list';
    $title = them_ho_so;
    $save= button_add;
    $cancel = button_cancel;
    $test = test; //Bi?n = hang_do ben file lang
    
    //noi dung code tai day
    //noi dung xu li nghiep vu tai day
    //OK
    
    //ket noi dung code
    include('view/template/demo/add.tpl');  // goi lop giao dien ra
    break;
    
      /**
     * case edit
     * */
     
    case 'edit':
    get_file('language/demo/lang_edit.php');  
    $heading_title = heading_title;
    $title= heading_title;
    $save= button_add;
    $cancel = button_cancel;
    //noi dung code tai day
    
    
    include('view/template/demo/edit.tpl');
    
    break;
    
    /**
     * case del
     * */
     
    case 'del': 
    //goi ham delete
     break;
 }




?>