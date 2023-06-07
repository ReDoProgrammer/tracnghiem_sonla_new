<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');


function getListalbum($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM ten_album order by
        ma_ten_album desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }

function getListtenalbum($x,$start,$limit)
    {
        if($x){
        $truyvan = "SELECT * FROM ten_album where tieu_de='".$x."' order by
        ma_ten_album desc
        limit ".(int)$start.",".(int)$limit."";
        }else{
        $truyvan = "SELECT * FROM ten_album  order by
        ma_ten_album desc
        limit ".(int)$start.",".(int)$limit."";
       }
       
        $local_list = mysql_query($truyvan, dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
 
 //lay du lieu mot tin tuc   theo id (ma tin tuc))
 //ham nay co tac dung lay danh sachhinh anh theo ma album
function getListhinhanh($id, $start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM hinh_anh where ma_album = '".$id."' order by
    ma_anh desc
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
    
    
 //tinh tong ban ghi
 function totalalbum(){
   $result = mysql_query("select * from ten_album",dbconnect());
   return mysql_num_rows($result);
   
}   

function gettenalbum($id)
    {
    $pro = mysql_query("select * from ten_album where ma_ten_album = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }

 function gethinhanh($id)
    {
    $pro = mysql_query("select * from hinh_anh where ma_anh = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    } 
 
  //tinh tong ban ghi anh
 function totalhinhanh1($catid){
    $result = mysql_query("select * from hinh_anh where ma_album = '".$catid."'",dbconnect());
   return mysql_num_rows($result);
   
}
function congdon($soluong,$ma){
    mysql_query("update ten_album set view_id = '".$soluong."' 
           where ma_ten_album = '".$ma."'");
}
   
?>