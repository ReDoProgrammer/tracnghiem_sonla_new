<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
 
 
  //lít xa theo ma dm
function getListDmnhoTheoDm($madm)
    {
        $local_list = mysql_query("SELECT * FROM dm_nho
        where id_dm_news = '".$madm."'
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
 
 
//add can bo
function insertdm($local){
    mysql_query("insert dm_nho set 
    tieu_de1 = '".$local['tieu_de1']."',
    id_dm_news = '".$local['id_dm_news']."',
    thu_tu = '".$local['thu_tu']."'",
    dbconnect());
}

function getListdmnho($start,$limit)
    {
    $local_list = mysql_query("SELECT * FROM dm_nho
    LEFT JOIN dm_news ON dm_nho.id_dm_news = dm_news.id
        limit ".(int)$start.",".(int)$limit."
     ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
  
 function getdm($id)
    {
    $pro = mysql_query("select * from dm_news where id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    } 
    
//ham lay du lieu tu can bo
function getdmnho($id)
    {
    $pro = mysql_query("select * from dm_nho where dm_nho_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editdmnho($id, $local)
{
    mysql_query("update dm_nho set 
    tieu_de1 ='".$local['tieu_de1']."',
    id_dm_news = '".$local['id_dm_news']."',
    thu_tu = '".$local['thu_tu']."'
    where dm_nho_id = '".(int)$id."'", 
    dbconnect());
}   
// xoa thu muc
 function deldmnho($id){
    mysql_query("delete from dm_nho where dm_nho_id= '".(int)$id."'", dbconnect());
}


function getListdmnews1($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM dm_news 
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
           $result []= $local;
        }
        return $result;
    }   
   

?>