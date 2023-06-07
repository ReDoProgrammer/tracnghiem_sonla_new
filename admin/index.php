<?php

/**
 * @author honestphan
 * @copyright 2012
 * Creat 27/02/2012
 */
define( 'DSVH', 1 );

session_start();
//ki?m tra trang ch?
//n?u không g?i modules
//di?u v? trang home
//check home url 
if($_REQUEST['module']==""){
	if($_SESSION['loged']){
	         header('LOCATION: index.php?module=home');  
	         exit();
	 } else{
   header('LOCATION: index.php?module=member&act=login');  
    exit();}
    
}

//ket noi csdl
include('model/m_db.php');

//load in system
include('../system/pagination.php');
include('../system/alias.php');
include('../system/utility.php');

//include('system/session.php');
//include('../system/config/setting.php');
include('../system/thumb.php');


//Get các controller tong quat
    $get = $_REQUEST['module'];
    $file ='controller/c_'.$get.'.php';
    //$file2 ='controller/'.$get.'/c_'.$get.'.php';
    if (file_exists($file)) {
    get_file($file);
    } else if(file_exists($file2)){
   // get_file($file2);
    }


 
?>