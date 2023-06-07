<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

    
function getlistvb1($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM van_ban order by
        van_ban_id desc  limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getListlienketweb($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM lien_ket_web
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getListtinhoatdong($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_hoat_dong order by
        tin_hoat_dong_id desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
     
function getlisttinhoatdongtop($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_hoat_dong order by
        tin_hoat_dong_id desc  limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    } 
function getListtinhoatdonglienquan($start, $limit, $ten)
    {
        $local_list = mysql_query("SELECT * FROM tin_hoat_dong where ten_tin_hoat_dong like '%".$ten."%'
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
//ham lay du lieu phong ban theo id
function gettinhoatdong($id)
    {
    $pro = mysql_query("select * from tin_hoat_dong where tin_hoat_dong_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
function totaltinhoatdong(){
   $result = mysql_query("select * from tin_hoat_dong",dbconnect());
    return mysql_num_rows($result);
}
//me va be
function getListmevabe($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM me_va_be order by me_va_be_id desc
         limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
  
function getlistmevabetop($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM me_va_be order by
        me_va_be_id desc  limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
  
function getListmevabelienquan($start, $limit, $ten)
    {
        $local_list = mysql_query("SELECT * FROM me_va_be where ten_me_va_be like '%".$ten."%'
         limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu phong ban theo id
function getmevabe($id)
    {
    $pro = mysql_query("select * from me_va_be where me_va_be_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }

function totalmevabe(){
   $result = mysql_query("select * from me_va_be",dbconnect());
    return mysql_num_rows($result);
}
//list 
function getListabout($start,$limit)
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
//ham lay du lieu 
function getabout($id)
    {
    $pro = mysql_query("select * from about
    where id_about = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
  

function getListchuongtrinhhoc($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM chuong_trinh_hoc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
//ham lay du lieu 
function getchuongtrinhhoc($id)
    {
    $pro = mysql_query("select * from chuong_trinh_hoc
    where id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    } 

function getListchedosinhhoat($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM che_do_sinh_hoat
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
//ham lay du lieu 
function getchedosinhhoat($id)
    {
    $pro = mysql_query("select * from che_do_sinh_hoat
    where id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
//list chuc danh
function getListgiaoan($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM giao_an  
        limit ".(int)$start.",".(int)$limit."", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
function getListgiaoanrand($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM giao_an order by RAND()  
        limit ".(int)$start.",".(int)$limit."", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
//ham lay du lieu phong ban theo id
function getgiaoan($id)
    {
    $pro = mysql_query("select * from giao_an where giao_an_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
function totalgiaoan(){
   $result = mysql_query("select * from giao_an",dbconnect());
    return mysql_num_rows($result);
}

function update_count($tbl, $feild, $param, $view, $id){
        mysql_query("update ".$tbl." set 
          ".$feild." = '".$view."'
          where ".$param." = '".(int)$id."'", dbconnect());
    }   

//album anh
function getListalbumanh($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM album_anh
         order by album_anh_id desc  limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

//ham lay du lieu phong ban theo id
function getalbumanh($id)
    {
    $pro = mysql_query("select * from album_anh where album_anh_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 function totalalbumanh(){
   $result = mysql_query("select * from album_anh",dbconnect());
    return mysql_num_rows($result);
}   

function getListnews2($catid, $start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM tin_tuc
        where dm_id = '".$catid."' and dang_tin ='1'
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
    
    function getListdmhienthi($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM dm_news where hien_thi='1'
		   order by
        sap_xep asc
  
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
     function getListnews3($catid, $start, $limit)
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
    
?>