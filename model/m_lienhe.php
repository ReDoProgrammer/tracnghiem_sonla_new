<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertLienhe($local){
    mysql_query("insert lien_he set 
    tieu_de = '".$local['tieu_de']."',
    ten = '".$local['ten']."',
	dia_chi = '".$local['dia_chi']."',
	noi_dung = '".$local['noi_dung']."',
	dien_thoai = '".$local['dien_thoai']."',
    email = '".$local['email']."',
    time = NOW()
    ",
    dbconnect());
}    
?>