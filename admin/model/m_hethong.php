<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
//add can bo
function insertnews($local){
    mysql_query("insert tin_tuc set 
    tieu_de = '".$local['tieu_de']."',
    hinh_anh = '".$local['hinh_anh']."',
    mo_ta = '".$local['mo_ta']."',
    noi_dung = '".$local['noi_dung']."',
    time = NOW()
    ",
    dbconnect());
}

function getListnews($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM tin_tuc order by
    id_news desc
    limit ".(int)$start.",".(int)$limit."
        ", dbconnect());
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
            $result []= $local;
        }
        return $result;
    }
    
//ham lay du lieu tu can bo
function gethethong1(){
    $result = mysql_query("select * from he_thong", dbconnect());
    return mysql_fetch_array($result);
}
//cap nhat trong thu muc sua
function edithethong($local)
{
    mysql_query("update he_thong set
    title_name ='".$local['title_name']."',
    banner = '".$local['banner']."',
    keywords = '".$local['keywords']."',
    email = '".$local['email']."',
	hddk = '".$local['hddk']."',
    di_dong = '".$local['di_dong']."',
	fax = '".$local['fax']."',
	giay_phep = '".$local['giay_phep']."',
	may_ban = '".$local['may_ban']."',
	map = '".$local['map']."',
	facebook = '".$local['facebook']."',
	chu_quan = '".$local['chu_quan']."',
    url = '".$local['url']."',
    generator = '".$local['generator']."',
    dia_chi = '".$local['dia_chi']."',
    author = '".$local['author']."',
    copyright = '".$local['copyright']."',
    description = '".$local['description']."'
    where id_he_thong = '1'", dbconnect()); 
}   
// xoa thu muc
 function delnews($id){
    mysql_query("delete from tin_tuc where id_news= '".(int)$id."'", dbconnect());
}
// phan trang
 function totalnews(){
   $result = mysql_query("select * from tin_tuc",dbconnect());
    return mysql_num_rows($result);
}   
?>