<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */

function getListLienhe()
    {
    $local_list = mysql_query("SELECT * FROM lien_he", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
//ham lay du lieu tu can bo
function getLienhe($id)
    {
    $pro = mysql_query("select * from lien_he where ma_lien_he = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }  
    
// xoa thu muc
 function delLienhe($id){
    mysql_query("delete from lien_he where ma_lien_he = '".(int)$id."'", dbconnect());
}     
?>