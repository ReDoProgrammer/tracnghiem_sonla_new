<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');


//list tap chi moi 



function getListadvtop($start,$limit)
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
	
	function getListquangba($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM adv where lua_chon_id='5' order by
        vi_tri desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
	
		function getListcenter1($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM adv where lua_chon_id='2' order by
        vi_tri desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getListadvrighttop($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM adv where lua_chon_id='3' order by
        id_adv desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
	
	function getListadvright($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM adv where lua_chon_id='4' order by
        id_adv desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getListthongbao1($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM thong_bao order by
        id_thongbao desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getListnews1($start,$limit)
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

function click_lienket($id, $view){
        mysql_query("update lien_ket set 
          click = '".$view."'
          where id_lien_ket = '".$id."'", dbconnect());
    }    
     
function getlienket1($id)
    {
    $pro = mysql_query("select * from lien_ket where id_lien_ket = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
function getListlienket($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM lien_ket order by
        id_lien_ket desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//get list theo chu de

function getListchude($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM chu_de
    limit ".(int)$start.",".(int)$limit."
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
?>