<?php

/**
 * @author honestphan
 * @copyright 2011
 */
 // no direct access
defined('DSVH') or die('Restricted access');
include('model/m_thongke.php');
//session_start();
$sid = session_id();
$seo = 1;
//$_SESSION['online']= $sid;
//them tong so nguoi da truy cap tu truoc den nay
$total_u_view  = total_user_view();
$total_p_view = total_page_view();

//if($_SESSION['online'])
$check_sid = check_sid($sid);
if(!$check_sid){
$tuv = $total_u_view+1;
$tpv =$total_p_view+1;
update_statics($tuv,$tpv);
}else{
$tuv  = $total_u_view;
$tpv =$total_p_view+1;
update_statics($tuv,$tpv);
}

$user_name = $_SESSION['user'];
if(empty($user_name)){
    $user_name ='guest';
}
$ip = $_SERVER['REMOTE_ADDR'];
$ref ="http://".eregi_replace("/$","",(getenv(HTTP_HOST)?getenv(HTTP_HOST):$_SERVER['HTTP_HOST']).(getenv(REQUEST_URI)?getenv(REQUEST_URI):$_SERVER['REQUEST_URI']));
//include('../model/m_statistics.php');
$now = mktime();
$exp = 60*10;
$old_time = $now - $exp;

insert_online($now,$ip,$sid,$user_name,$ref);
del_exp_online($old_time);

$users_view_this_page = view_this_page($ref);
$user_online_by_ip = user_online_by_ip();
$user_online_by_sid = user_online_by_sid();


if(empty($total_u_view)){
    insert_statics('1','1');
}

//$tpv = $total_p_view +1;
//update_statics($tuv,$tpv);

$canbo_list = listAdmin();

?>