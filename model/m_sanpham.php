<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
defined('DSVH') or die('Restricted access');

 //ham tim kiem su dung m?nh de where va like
    function getListtksanpham($tieude, $start, $limit)

    {

    $local_list = mysql_query("SELECT * FROM san_pham

    where tieu_de like '%".$tieude."%'

    order by

    id_sp desc

    limit ".(int)$start.",".(int)$limit."

        ", dbconnect());

        $result = array();

        while ($local = mysql_fetch_array($local_list)){

            $result []= $local;

        }

        return $result;

    }

function getListsanpham($start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM san_pham order by
        id_sp desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
 function getListtheodanhmucsp($danh_muc,$start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM  san_pham where muc_id = '".$danh_muc."' 
		
		order by
        id_sp desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
   function getListsplienquan($danh_muc1,$start,$limit)
    {
        $local_list = mysql_query("SELECT * FROM  san_pham where muc_id = '".$danh_muc1."' order by
        id_sp desc
        limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }  
 //lay du lieu mot tin tuc   theo id (ma tin tuc))
 
  function getsanpham($id)
    {
    $pro = mysql_query("select * from san_pham
    where id_sp = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
 
 function getdanhmuc($id)
    {
    $pro = mysql_query("select * from danh_muc_sp
    where id_danh_muc = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi day la phan tính  tông
 function totalsanpham(){
   $result = mysql_query("select * from san_pham",dbconnect());
   return mysql_num_rows($result);
   
}   

//tinh tong ban ghi day la phan tính  tông
 function totaltheomadanhmuc($danh_muc){
   $result = mysql_query("select * from san_pham where muc_id = '".$danh_muc."'",dbconnect());
   return mysql_num_rows($result);
  
}   
function luotview($soluong,$ma){
    mysql_query("update san_pham set luot_xem_id = '".$soluong."' 
           where id_sp  = '".$ma."'");
}


    
?>