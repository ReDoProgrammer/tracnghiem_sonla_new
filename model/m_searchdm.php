<?php

/**
 * @author cd4design.net
 * @copyright 2013
 */

//tim kiem san pham
    function getListtimkiemdm($dm, $start, $limit)

    {

    $local_list = mysql_query("SELECT * FROM categories 

    where tieu_de like '%".$dm."%'

    order by

    ma_cat desc

    limit ".(int)$start.",".(int)$limit."

        ", dbconnect());

        $result = array();

        while ($local = mysql_fetch_array($local_list)){

            $result []= $local;

        }

        return $result;

    }
//phan trang tim kiem san pham
    function totaltimkiemdm($phantrang){
    $result = mysql_query("select * from categories where tieu_de like '%".$phantrang."%'",dbconnect());
    return mysql_num_rows($result);

    }  

    
?>