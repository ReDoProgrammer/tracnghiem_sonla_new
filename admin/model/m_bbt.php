<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add cau bbt
function insertbbt($local){
    mysql_query("insert bbt set 
    title = '".$local['title']."',
    file = '".$local['file']."',
    link = '".$local['link']."',
    author = '".$local['author']."',
    tag = '".$local['tag']."',
    tra_loi = '".$local['tra_loi']."',
    loai_cau_bbt = '".$local['loai_cau_bbt']."',
	dia_chi = '".$local['dia_chi']."',
    noi_dung = '".$local['noi_dung']."',
	email = '".$local['email']."',
    time = NOW(),
    edit_time = NOW()
    ",
    dbconnect());
}

function getListbbt($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM bbt order by
    id_bbt desc
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
          $local_list = mysql_query("SELECT * FROM bbt 
    where title like '%".$title."%'

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
	
  function totalbbt2($phantrang){
    $result = mysql_query("select * from bbt where title like '%".$phantrang."%'",dbconnect());
    return mysql_num_rows($result);

    }  

    
//ham lay du lieu tu cau bbt
function getbbt($id)
    {
    $pro = mysql_query("select * from bbt where id_bbt = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editbbt($id, $local)
{
    mysql_query("update bbt 
    set title ='".$local['title']."',
    file = '".$local['file']."',
    tag = '".$local['tag']."',
    author = '".$local['author']."',
	dien_thoai = '".$local['dien_thoai']."',
    link = '".$local['link']."',
    tra_loi = '".$local['tra_loi']."',
    loai_cau_bbt = '".$local['loai_cau_bbt']."',
	dia_chi = '".$local['dia_chi']."',
    noi_dung = '".$local['noi_dung']."',
	email = '".$local['email']."',
    edit_time = NOW()
    where id_bbt = '".(int)$id."'", 
    dbconnect());
}  
 
   
// xoa thu muc
 function delbbt($id){
    mysql_query("delete from bbt where id_bbt= '".(int)$id."'", dbconnect());
}
function total(){
   $result = mysql_query("select * from bbt",dbconnect());
    return mysql_num_rows($result);
}
// phan trang
 function totalbbt(){
   $result = mysql_query("select * from bbt",dbconnect());
    return mysql_num_rows($result);
}   
?>