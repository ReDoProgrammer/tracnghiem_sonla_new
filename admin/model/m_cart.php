<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */

function getListcart()
    {
    $local_list = mysql_query("SELECT * FROM cart
    left join san_pham ON san_pham.id_sp = cart.tieu_de_id
	order by id_cart desc
    ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)){
        $result []= $local;
    }
    return $result;
    }
    
    
//ham lay du lieu tu can bo
function getcart($id)
    {
    $pro = mysql_query("select * from cart where id_cart = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }  
    
// xoa thu muc
 function delcart($id){
    mysql_query("delete from cart where id_cart = '".(int)$id."'", dbconnect());
}     
?>