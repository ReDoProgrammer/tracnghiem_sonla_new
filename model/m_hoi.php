<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo

 function getListtkcauhoi($sp, $start, $limit)

    {

    $local_list = mysql_query("SELECT * FROM hoi 

    where title like '%".$sp."%'

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
    
    
function inserthoidap($local){
    mysql_query("insert hoi set 
	title = '".$local['title']."',
    author = '".$local['author']."',
	dia_chi = '".$local['dia_chi']."',
	noi_dung = '".$local['noi_dung']."',
	dien_thoai = '".$local['dien_thoai']."',
    time = NOW(),
    email = '".$local['email']."'",
    dbconnect());
} 

function getListhoidap($start, $limit)
    {
        $local_list = mysql_query("SELECT * FROM hoi
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
  function gethoidap($id)
    {
    $pro = mysql_query("select * from hoi
    where id_hoi = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
    
 //tinh tong ban ghi day la phan tính  tông
 function totalhoidap(){
   $result = mysql_query("select * from hoi",dbconnect());
   return mysql_num_rows($result);
   
}     
?>