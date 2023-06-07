<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
//defined('DSVH') or die('Restricted access');

function getlistnoibanhanh1($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM noi_ban_hanh
        order by
        sap_xep ASC
         ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

	
	

function getListkhuyenhoc1($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM khuyen_hoc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }

function getListbantin($catid, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc
        where dm_id = '".$catid."'
        order by
        id_news desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getListdmtc($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM dm_tieuchi
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }

function getListdm($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM danh_muc_sp
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
	
	function getListntm1($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM dm_ntm
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }

function get1Video1(){
    $pro = mysql_query("select * from quay_phim order by
        ma_quay_phim desc
    LIMIT 1", dbconnect());
    return mysql_fetch_array($pro);
}
    

  function getListdmdownload($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM dm_download
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
	
	  function getListdownloadxemnhieu($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM download order by 
		 id_download desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
	
		  function getListtinhotro($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc where dm_id ='50' order by 
		 id_news desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
	
	  function getListtinchaytren($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc where tin_chay ='1' order by 
		 id_news desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    




function getListthutuc1($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM thu_tuc
       
        order by
        id_thutuc ASC
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

    function getListtinxemnhieu($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM tin_tuc where luot_xem_id order by
        id_news desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }


function get_list_dm_cha(){
    $local_list = mysql_query("SELECT * FROM dm_news where menu_trai ='1' order by sap_xep asc ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
	
	    function get_list_dm_cha1(){
    $local_list = mysql_query("SELECT * FROM dm_news where menu_trai='1' order by sap_xep asc ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }


function get_list_dmcon_theo_cha($idcha)
{
    $local_list = mysql_query("SELECT * FROM dm_nho where id_dm_news = '".$idcha."' order by thu_tu asc ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }

    function getListdmabout($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM about
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }

function getListvanban1($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM van_ban order by
        van_ban_id desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getListvideo2($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM quay_phim order by
        ma_quay_phim desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
    function getListvideo1($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM quay_phim where noi_bat ='1' order by
        ma_quay_phim desc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
    function getListthongtinhiephoi($catid, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc 
        where dm_id = '".$catid."'
        order by
        id_news desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getListbieumaumoi($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc 
        where dm_id = '57'
        order by
        id_news desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }


function getListtinmoi1($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc order by
        	id_news desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
    function getListtinnoibat($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc where noi_bat='1' order by
        id_news desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
	
	   function getListtinlanhdao1($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc where tin_lanh_dao='1' order by
        id_news desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
	
	    function getListtinduan($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM du_an order by
        id_duan desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }


function gethethong(){
    $result = mysql_query("select * from he_thong", dbconnect());
    return mysql_fetch_array($result);
}


    function getListalbum1($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM ten_album
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }



function getListDanhmuc($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM danh_muc
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//quang cao 

function click_view($id, $view){
        mysql_query("update adv set 
          view_id = '".$view."'
          where id_adv = '".$id."'", dbconnect());
    }    
     
function getadv($id)
    {
    $pro = mysql_query("select * from adv where id_adv = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
  
function getListslide($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM adv where lua_chon_id='1' order by
        id_adv desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }  

	
function getListcentertren($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM adv where lua_chon_id='2' order by
        id_adv desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

    
 
    
    function getabout1($id)
    {
    $pro = mysql_query("select * from about
    where id_about = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }

	
	function getListtinmois1($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc order by
        	id_news desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
	
    
?>