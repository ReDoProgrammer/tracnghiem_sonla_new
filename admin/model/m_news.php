<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
 
 //het tim kiem san pham 	 
	 
function getListtknews($local,$limit,$start){
     
        $sql = "select * from tin_tuc
     
        WHERE LCASE(tieu_de) like LCASE('%".$local['tieu_de']."%')";
 
          if($local['dm_id']){
        $sql .= " AND dm_id = '".$local['dm_id']."'";
        }
        $sql .= " order by id_news desc limit ".(int)$start.",".(int)$limit."";
        
        $local_list = mysql_query($sql, dbconnect());    
        
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
        $result[] = $local;
      
      }
      
    return $result;
}

 function totaltt($local,$limit,$start){
     
     if($local){
        
      $sql = "select * from tin_tuc
        
        WHERE LCASE(tieu_de) like LCASE('%".($local['tieu_de'])."%')";
             
		 
        if($local['dm_id']){
        $sql .= " AND dm_id = '".$local['dm_id']."'";
        }
        
        
        
        $result = mysql_query($sql, dbconnect());    
       
      }
       return mysql_num_rows($result);

}
 
 
//add can bo
function insertnews($local){
    mysql_query("insert tin_tuc set 
    tieu_de = '".clean($local['tieu_de'])."',
    hinh_anh = '".clean($local['hinh_anh'])."',
    mo_ta = '".clean($local['mo_ta'])."',
    tag = '".clean($local['tag'])."',
    file = '".$local['file']."',
    kiem_duyet = 'xuat_ban',
	regedit_id = '".$_SESSION['user_id']."', 
    tac_gia = '".clean($local['tac_gia'])."',
    nguon_tin = '".clean($local['nguon_tin'])."',
    tin_chay = '".$local['tin_chay']."',
    noi_bat = '".$local['noi_bat']."',
    dm_id = '".$local['dm_id']."',
	tin_lanh_dao = '".$local['tin_lanh_dao']."',
    id_dm_nho = '".$local['id_dm_nho']."',
    noi_dung = '".$local['noi_dung']."',
    time = NOW()
    ",
    dbconnect());
}

function getListnews($start, $limit)
    {
    $local_list = mysql_query("SELECT * FROM tin_tuc
    LEFT JOIN dm_news ON tin_tuc.dm_id = dm_news.id
    left join regedit on tin_tuc.regedit_id  = regedit.id_regedit  
    LEFT JOIN dm_nho ON tin_tuc.id_dm_nho = dm_nho.dm_nho_id
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

function getListdm($start, $limit)
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
    
//ham lay du lieu tu can bo
function getnews($id)
    {
    $pro = mysql_query("select * from tin_tuc where id_news = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
function editnews($id, $local)
{
    mysql_query("update tin_tuc 
    set tieu_de ='".clean($local['tieu_de'])."',
    hinh_anh = '".clean($local['hinh_anh'])."',
    tag = '".clean($local['tag'])."',
    mo_ta = '".clean($local['mo_ta'])."',
    noi_bat = '".$local['noi_bat']."',
    dm_id = '".$local['dm_id']."',
	edit_user = '".$_SESSION['user_id']."', 
	tin_chay = '".$local['tin_chay']."',
	tin_lanh_dao = '".$local['tin_lanh_dao']."',
    tac_gia = '".clean($local['tac_gia'])."',
    nguon_tin = '".$local['nguon_tin']."',
    id_dm_nho = '".$local['id_dm_nho']."',
    kiem_duyet = 'xuat_ban',
    file = '".$local['file']."',
    noi_dung = '".$local['noi_dung']."'

    where id_news = '".(int)$id."'", 
    dbconnect());
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


// tinh trang kiem duyet
function set_status($id,$status){
    mysql_query("update tin_tuc set 
    dang_tin = '".$status."'
    where id_news ='".$id."'", dbconnect());
}
?>