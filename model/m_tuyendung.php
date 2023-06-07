<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

function getListTuyendung($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM tuyen_dung order by
        ma_tuyen_dung desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
 
 //lay du lieu mot tin tuc   theo id (ma tin tuc))
 
 function gettuyendung($id)
    {
    $pro = mysql_query("select * from tuyen_dung
    where ma_tuyen_dung = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi
 function totaltintuc(){
   $result = mysql_query("select * from tin_tuc",dbconnect());
   return mysql_num_rows($result);
   
}   



//ham lay du lieu 
function getbangtin($id)
    {
    $pro = mysql_query("select * from bang_tin
    where id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
function getinfo($alias)
    {
    $pro = mysql_query("select * from bang_tin
    where alias = '".$alias."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
//getListbangtinVoiThamSoNangCao

function getListbangtinVoiThamSoNangCao($local){
        $sql = "select * from bang_tin WHERE LCASE(title) like LCASE('%".$local['title']."%')";
         
        $local_list = mysql_query($sql, dbconnect());    
        
        $result = array();
        
        while ($local = mysql_fetch_array($local_list)){
          $result[] = $local;
        }
        return $result;
}

function totalbangtin(){
   $result = mysql_query("select * from bang_tin",dbconnect());
   return mysql_num_rows($result);
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
function getListgioithieu($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM gioi_thieu
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
//ham lay du lieu 
function getGioithieu($id)
    {
    $pro = mysql_query("select * from gioi_thieu
    where ma_gioi_thieu = '".(int)$id."'", dbconnect());
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


    
?>