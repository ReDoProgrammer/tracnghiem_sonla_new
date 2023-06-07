<?php

/**
 * @author huuvung
 * @copyright 2012
 */
 
//defined('DSVH') or die('Restricted access');

    
 function totalnews1(){
   $result = mysql_query("select * from tin_tuc",dbconnect());
    return mysql_num_rows($result);
}

 function totalhoi1(){
   $result = mysql_query("select * from hoi",dbconnect());
    return mysql_num_rows($result);
}
 function totalcart1(){
   $result = mysql_query("select * from cts",dbconnect());
    return mysql_num_rows($result);
}
 function totaldownload1(){
   $result = mysql_query("select * from cts",dbconnect());
    return mysql_num_rows($result);
}
function totalmember1(){
   $result = mysql_query("select * from members where role_id = '1'",dbconnect());
    return mysql_num_rows($result);
}

 function totalavid(){
   $result = mysql_query("select * from san_pham where muc_id = '6'",dbconnect());
    return mysql_num_rows($result);
}
 function totalvector(){
   $result = mysql_query("select * from san_pham where muc_id = '0'",dbconnect());
    return mysql_num_rows($result);
}

     
       
       
?>