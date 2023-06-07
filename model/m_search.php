<?php

/**
 * @author cd4design.net
 * @copyright 2013
 */

//tim kiem san pham
    function getListtimkiemnews($sp, $start, $limit)

    {

    $local_list = mysql_query("SELECT * FROM tin_tuc 

    where tieu_de like '%".$sp."%'

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
//phan trang tim kiem san pham
    function totaltimkiemnews($phantrang){
    $result = mysql_query("select * from tin_tuc where tieu_de like '%".$phantrang."%'",dbconnect());
    return mysql_num_rows($result);

    }  

    
?>