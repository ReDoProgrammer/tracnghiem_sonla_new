<?php

/**
 * @author honestphan
 * @copyright 2011
 */

// no direct access
defined('DSVH') or die('Restricted access');

function update_fbuid($fbuid, $email){
    mysql_query("update members set fb_uid = '".$fbuid."' where email = '".$email."'", dbconnect());
    }
       
function check_fbuid($fbuid){
   $result = mysql_query("select user_name from members where fb_uid ='".escape($fbuid)."' limit 1",dbconnect());
    return mysql_fetch_array($result);  
}

function getMemberByEmail($id){
    $sql = "SELECT * FROM members where email = '".$id."'";
    $result = mysql_query($sql, dbconnect());
    return mysql_fetch_array($result);
} 

function addMember($member){
        mysql_query("insert into members set user_name ='". escape($member['userName']) ."', 
          user_type = '".(int)$member['userType']."',
          fb_uid = '".$member['fb_uid']."',
          password = '".escape($member['password'])."',
          email = '".escape($member['email'])."',
          full_name = '".escape($member['fullName'])."',
          ip = '".escape($member['ip'])."',
          age = '".$member['age']."',
          gender= '".(int)$member['gender']."',
          homephone = '".escape($member['homePhone'])."',
          mobilephone = '".escape($member['mobilePhone'])."',
          address = '".escape($member['address'])."',
          auth_code = '".escape($member['authCode'])."',
          register_date = NOW(),
          last_login = '".$member['lastLogin']."',
          score = '".$member['score']."',
          active = '1'
          ", dbconnect()); 
}


function editMember($id, $member){
    mysql_query("update members set 
          password = '".escape($member['password'])."',
          full_name = '".escape($member['fullName'])."',
          ip = '".escape($member['ip'])."',
          age = '".$member['age']."',
          gender= '".(int)$member['gender']."',
          homephone = '".escape($member['homePhone'])."',
          mobilephone = '".escape($member['mobilePhone'])."',
          address = '".escape($member['address'])."',
          edit_date = NOW(),
          last_login = '".escape($member['lastLogin'])."',
          score ='".escape($member['score'])."'
          where user_id = '".(int)$id."'", dbconnect());
    }
    
function tang_so_du($id, $sodu){
    mysql_query("update members set 
          so_du_tk = '".$sodu."'
          where user_id = '".(int)$id."'", dbconnect());
    }    
    

function insertNhatKiNapThe($code, $seri, $status, $type){
          mysql_query("insert into nhat_ki_nap_the set 
          user_id ='". escape($_SESSION['user_id'])."', 
          date = NOW(), 
          code ='". escape($code)."', 
          seri ='". escape($seri)."', 
          status ='". escape($status)."', 
          type = '".(int)$type."'
          ", dbconnect()); 
}



function getListNhatKiNapThe($uid, $start,$limit) {
    $sql = "SELECT * FROM nhat_ki_nap_the where user_id ='".$uid."' order by id desc limit ".(int)$start.", ".(int)$limit."";
    $list = mysql_query($sql,dbconnect());
    $result = array();
    while($user = mysql_fetch_array($list)){
        $result[] = $user;
    }
    return $result;   
}

function getListGiaoDich($uid, $start,$limit) {
    $sql = "SELECT * FROM giao_dich where user_id ='".$uid."' order by id desc limit ".(int)$start.", ".(int)$limit."";
    $list = mysql_query($sql,dbconnect());
    $result = array();
    while($user = mysql_fetch_array($list)){
        $result[] = $user;
    }
    return $result;   
}


function insert_time_login($id, $ip){
    mysql_query("update members set 
          ip = '".$ip."',
          last_login = NOW()
          where user_id = '".(int)$id."'", dbconnect());
    }
 
    
function delMember($id){
   $sql = "DELETE FROM members where user_id = '".(int)$id."'";
    mysql_query($sql,dbconnect());
} 


function getMember($id){
    $sql = "SELECT * FROM members where user_id = '".(int)$id."'";
    $result = mysql_query($sql, dbconnect());
    return mysql_fetch_array($result);
} 

function login($username,$pwd){
    $sql = "SELECT * FROM members where user_name = '".escape($username)."' and password ='".escape($pwd)."' and active ='1'";
    $result = mysql_query($sql, dbconnect());
    return mysql_fetch_array($result);
}

   
function getListMember($start,$limit) {
    $sql = "SELECT * FROM members order by register_date limit ".(int)$start.", ".(int)$limit."";
    $list = mysql_query($sql,dbconnect());
    $result = array();
    while($user = mysql_fetch_array($list)){
        $result[] = $user;
    }
    return $result;
    
}
function totalMem(){
   $result = mysql_query("select * from members",dbconnect());
    return mysql_num_rows($result);
} 

function check_user_name($username){
    $result = mysql_query("select user_name from members where user_name ='".$username."' limit 1",dbconnect());
    return mysql_fetch_array($result);  
}

function check_mail($email){
   $result = mysql_query("select email, user_name, auth_code from members where email ='".$email."' limit 1 ",dbconnect());
   return mysql_fetch_array($result); 
}  

function check_auth_code($email, $auth_code){
    $result = mysql_query("select user_name, email, auth_code, user_id from members where email ='".escape($email)."' and auth_code = '".$auth_code."' limit 1 ",dbconnect());
    return mysql_fetch_array($result);  
}
function update_new_auth_code($email, $auth_code){
    mysql_query("update members set 
         auth_code = '".escape($auth_code)."'
         where email = '".escape($email)."'", dbconnect());
    }
    
function update_new_pwd_and_auth_code($email, $auth_code, $pwd){
    mysql_query("update members set 
         auth_code = '".escape($auth_code)."',
         password = '".escape($pwd)."'
         where email = '".escape($email)."'", dbconnect());
    }  

function update_active($email, $auth_code, $active){
    mysql_query("update members set 
         auth_code = '".escape($auth_code)."',
         active = '".(int)$active."'
         where email = '".escape($email)."'", dbconnect());
    }

function total_address_in_mylist1($user_id){
    $sql = "SELECT * FROM info_address where user_id = '".(int)$user_id."'";
    $list =mysql_query($sql,dbconnect());
    $tt =mysql_num_rows($list);
    return $tt;
}  
   
function total_my_additional1($user_id){
    $sql = "SELECT * FROM info_additional where user_id = '".(int)$user_id."'";
    $list =mysql_query($sql,dbconnect());
    $tt =mysql_num_rows($list);
    return $tt;
} 
   
function total_my_comment1($user_id){
    $sql = "SELECT * FROM comments where user_id = '".(int)$user_id."'";
    $list =mysql_query($sql,dbconnect());
    $tt =mysql_num_rows($list);
    return $tt;
} 
      
       
?>