<?php

/**
 * @author nbinh88@gmail.com
 * @copyright 27/08/2013
 */
 
     function getcattin($id)
    {
    $pro = mysql_query("select * from cts where tochuc_canhan_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
 
 
 // kiem tra da ton tai
 function check_email($m){
    $sql = "SELECT * FROM cts where email = '".$m."' limit 1 ";
    $location = mysql_query($sql, dbconnect());
    return mysql_num_rows($location);

}
 

     //ham tim kiem su dung m?nh de where va like
    function getListctsVoiThamSoNangCao1($hoten, $start, $limit)

    {

    $local_list = mysql_query("SELECT * FROM cts 
    where ho_ten like '%".$hoten."%'

    order by

    id_cts desc

    limit ".(int)$start.",".(int)$limit."

        ", dbconnect());

        $result = array();

        while ($local = mysql_fetch_array($local_list)){

            $result []= $local;

        }

        return $result;

    }

    function totaltkmember($phantrang){
    $result = mysql_query("select * from regedit where tai_khoan like '%".$phantrang."%'",dbconnect());
    return mysql_num_rows($result);

    }  
//het tim kiem san pham 	 
	 
function getListbaocao($local,$limit,$start){
     
        $sql = "select * from cts
     
        WHERE LCASE(tochuc_canhan_id) like LCASE('%".$local['tochuc_canhan_id']."%')";
 
         if($local['startday'] && $local['endday']){

            //$sql="SELECT time FROM tin_tuc ORDER BY time DESC";
             $sql.=" and publish_date BETWEEN '".$local['starttime']."' AND '".$local['endtime']."' ";
        
       }

        $sql .= " order by id_cts desc limit ".(int)$start.",".(int)$limit."";
        
        $local_list = mysql_query($sql, dbconnect());    
        
        $result = array();
        while ($local = mysql_fetch_array($local_list)){
        $result[] = $local;
      
      }
      
    return $result;
}

 function totaltt($local,$limit,$start){
     
     if($local){
        
      $sql = "select * from cts
        
        WHERE LCASE(ho_ten) like LCASE('%".($local['ho_ten'])."%')";
 
		 
        if($local['tochuc_canhan_id']){
        $sql .= " AND tochuc_canhan_id = '".$local['tochuc_canhan_id']."'";
        }
        
          if($local['startday'] && $local['endday']){
            
             $sql.=" and publish_date BETWEEN '".$local['starttime']."' AND '".$local['endtime']."' ";
        }
        
        $result = mysql_query($sql, dbconnect());    
       
      }
       return mysql_num_rows($result);

}

function tt($local,$limit,$start){
     
     if($local){
        
      $sql = "select * from tin_tuc
       
        WHERE LCASE(tieu_de) like LCASE('%".$local['tieu_de']."%')";
        
        if($local['id_dm_nho']!=""){
            
            $sql .= "and id_dm_nho = '".$local['id_dm_nho']."'";
        }
        
        if($local['dm_id']!=""){
            
            $sql .= "dm_id = '".$local['dm_id']."'";
        }
        if($local['ky_hop_id']!=""){
            
            $sql .= "ky_hop_id = '".$local['ky_hop_id']."'";
        }
        if($local['tac_gia']!=""){
            
            $sql .= "and lcase(tac_gia) like lcase('%".$local['tac_gia']."%')";
        }
        
        if($local['startday'] && $local['endday']){
            
             $sql.=" and publish_date BETWEEN '".$local['starttime']."' AND '".$local['endtime']."' ";
        }
        
        $result = mysql_query($sql, dbconnect());    
         
      }
    return mysql_num_rows($result);

}
 




function getdanhmuccts($id)
    {
    $pro = mysql_query("select * from cts
    where tochuc_canhan_id = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    } 

//tinh tong ban ghi day la phan tính  tông
 function totaltheomadanhmuc($catid){
   $result = mysql_query("select * from cts where tochuc_canhan_id = '".$catid."'",dbconnect());
   return mysql_num_rows($result);
  
} 	

    
  
    
//ham lay du lieu
function getcts($id)
    {
    $pro = mysql_query("select * from cts where id_cts = '".(int)$id."'", dbconnect());
    return mysql_fetch_array($pro);
    }
//cap nhat trong thu muc sua
 
 
?>