<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add cau hoi
function inserthoi($local){
    mysql_query("insert hoi set 
    title = '".$local['title']."',
    file = '".$local['file']."',
    link = '".$local['link']."',
    author = '".$local['author']."',
    tag = '".$local['tag']."',
    tra_loi = '".$local['tra_loi']."',
    loai_cau_hoi = '".$local['loai_cau_hoi']."',
	dia_chi = '".$local['dia_chi']."',
    noi_dung = '".$local['noi_dung']."',
	email = '".$local['email']."',
    time = NOW(),
    edit_time = NOW()
    ",
    dbconnect());
}

function getListhoi($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM hoi order by
    id_hoi desc
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
function getlisttk($title, $start, $limit)
    {
          $local_list = mysql_query("SELECT * FROM hoi 
    where title like '%".$title."%'

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
	
  function totalhoi2($phantrang){
    $result = mysql_query("select * from hoi where title like '%".$phantrang."%'",dbconnect());
    return mysql_num_rows($result);

    }  

    
//ham lay du lieu tu cau hoi
function gethoi($id)
    {
    $pro = mysql_query("select * from hoi where id_hoi = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function edithoi($id, $local)
{
    mysql_query("update hoi 
    set title ='".$local['title']."',
    file = '".$local['file']."',
    tag = '".$local['tag']."',
    author = '".$local['author']."',
	dien_thoai = '".$local['dien_thoai']."',
    link = '".$local['link']."',
    tra_loi = '".$local['tra_loi']."',
    loai_cau_hoi = '".$local['loai_cau_hoi']."',
	dia_chi = '".$local['dia_chi']."',
    noi_dung = '".$local['noi_dung']."',
	email = '".$local['email']."',
    edit_time = NOW()
    where id_hoi = '".(int)$id."'", 
    dbconnect());
}  
 
   
// xoa thu muc
 function delhoi($id){
    mysql_query("delete from hoi where id_hoi= '".(int)$id."'", dbconnect());
}
function total(){
   $result = mysql_query("select * from hoi",dbconnect());
    return mysql_num_rows($result);
}
// phan trang
 function totalhoi(){
   $result = mysql_query("select * from hoi",dbconnect());
    return mysql_num_rows($result);
}   
?>