<?php

/**
 * @author nbinh88
 * @copyright 2017
 */
 
//defined('DSVH') or die('Restricted access');

 function totallienhe1(){
   $result = mysql_query("select * from lien_he ",dbconnect());
    return mysql_num_rows($result);
}

 function totaladv2(){
   $result = mysql_query("select * from adv ",dbconnect());
    return mysql_num_rows($result);
}

 function totaldmnews2(){
   $result = mysql_query("select * from dm_news ",dbconnect());
    return mysql_num_rows($result);
}

 function totalnews2(){
   $result = mysql_query("select * from tin_tuc where dm_id = '59'",dbconnect());
    return mysql_num_rows($result);
}

function totalbbt2(){
   $result = mysql_query("select * from bbt",dbconnect());
    return mysql_num_rows($result);
}

function totalthongbao2(){
   $result = mysql_query("select * from thong_bao",dbconnect());
    return mysql_num_rows($result);
}

function totalabout2(){
   $result = mysql_query("select * from about",dbconnect());
    return mysql_num_rows($result);
}

function totalhoi2(){
   $result = mysql_query("select * from hoi",dbconnect());
    return mysql_num_rows($result);
}

function totaltraloi2(){
   $result = mysql_query("select * from hoi where tra_loi",dbconnect());
    return mysql_num_rows($result);
}



function getListbbt1($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM bbt
    order by
    id_bbt desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }

function getListnkht($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM nhat_ky
    order by
    id desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }

 function get_list_tien_do_xu_ly2($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM tien_do_xu_ly  
	left join regedit ON regedit.id_regedit = tien_do_xu_ly.uid 
	left join thong_tin on thong_tin.id_thongtin = tien_do_xu_ly.tin_id 
    order by
    tdxl_id desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
	

 function total_hs_theohuyenthi($ht){
   $result = mysql_query("SELECT * FROM thong_tin WHERE huyen = '".$ht."' ",dbconnect());
    return mysql_num_rows($result);
}
	
 function total_hs_theokhuvuc($kv){
   $result = mysql_query("SELECT * FROM thong_tin WHERE khu_vuc = '".$kv."' ",dbconnect());
    return mysql_num_rows($result);
}

 function total_hs_theotrangthai($tt){
   $result = mysql_query("SELECT * FROM thong_tin WHERE tinh_trang = '".$tt."' ",dbconnect());
    return mysql_num_rows($result);
}

 function get_trang_thai1($id)
    {
    $pro = mysql_query("select * from trang_thai where trang_thai_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }

 function all_hs(){
   $result = mysql_query("select * from thong_tin",dbconnect());
    return mysql_num_rows($result);
}

function totalmember4(){
   $result = mysql_query("select * from members ",dbconnect());
    return mysql_num_rows($result);
}

function getListmember4($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM members
    order by
    id desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }

function getListlienhe1($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM lien_he
    order by
    ma_lien_he desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
function getListlienhe3($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM lien_he where view='0'
    order by
    ma_lien_he desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
	
	
function totallhview(){
   $result = mysql_query("select * from lien_he where view = '0'",dbconnect());
    return mysql_num_rows($result);
}	
	
	function getListcts123($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM thong_tin
    order by
    id_thongtin desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }  
	
	function getListhoidap1($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM hoi
    order by
    id_hoi desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    } 
	
	 function totalhoidap2(){
   $result = mysql_query("select * from hoi",dbconnect());
    return mysql_num_rows($result);
}

	 function totalhoidap1(){
   $result = mysql_query("select * from hoi where tra_loi",dbconnect());
    return mysql_num_rows($result);
}
	
	

function getListctsview($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM cts where view='0'
    order by
    id_cts desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }  	

	 function totalctsview(){
   $result = mysql_query("select * from cts where view = '0'",dbconnect());
    return mysql_num_rows($result);
}
	
 function totalcts1(){
   $result = mysql_query("select * from cts",dbconnect());
    return mysql_num_rows($result);
}

 function totalcts2(){
   $result = mysql_query("select * from cts where tochuc_canhan_id = '1'",dbconnect());
    return mysql_num_rows($result);
}
 function totalcts3(){
   $result = mysql_query("select * from cts where tochuc_canhan_id = '2'",dbconnect());
    return mysql_num_rows($result);
}
function getmember4($id)
    {
    $pro = mysql_query("select * from members where id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
	
	
	 function totaltinbai(){
   $result = mysql_query("select * from tin_tuc",dbconnect());
    return mysql_num_rows($result);
}

 function totalvanban1(){
   $result = mysql_query("select * from van_ban",dbconnect());
    return mysql_num_rows($result);
}

 function totalvideo1(){
   $result = mysql_query("select * from quay_phim",dbconnect());
    return mysql_num_rows($result);
}

 function totalalbum1(){
   $result = mysql_query("select * from ten_album",dbconnect());
    return mysql_num_rows($result);
}

function total_logs(){
   $result = mysql_query("select * from nhat_ky",dbconnect());
    return mysql_num_rows($result);
}

function gethethong(){
    $result = mysql_query("select * from he_thong", dbconnect());
    return mysql_fetch_array($result);
}

       
?>