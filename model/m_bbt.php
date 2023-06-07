<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertbbt($local){
    mysql_query("insert bbt set 
    tieu_de = '".$local['tieu_de']."',
    ho_ten = '".$local['ho_ten']."',
	dia_chi = '".$local['dia_chi']."',
    email = '".$local['email']."',
    dien_thoai = '".$local['dien_thoai']."',
    files = '".$local['files']."',
	mo_ta = '".$local['mo_ta']."',
	noi_dung = '".$local['noi_dung']."',
    time = NOW()
    ",
    dbconnect());
}    
?>