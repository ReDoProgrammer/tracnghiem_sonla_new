<?php

/**
 * @author honestphan
 * @copyright 2011
 */
 
  function clean_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
  }
 
 function clean($data) {
		
			$data = addslashes(htmlspecialchars($data, ENT_COMPAT, 'UTF-8'));
		
		return $data;
}

 
     function loc_tk($keywords){
   $keywords = str_replace("_","\_",$keywords);
   $keywords = str_replace("%","\@",$keywords);
   $keywords = str_replace("*","@",$keywords);
   $keywords = str_replace("-","\-",$keywords);
   $keywords = str_replace(" "," ",$keywords);
   $keywords = str_replace("'","",$keywords);
    $keywords = str_replace("<","",$keywords);
   $keywords = str_replace("=","\@",$keywords);
    return $keywords;
}


   function loc_input($keywords){
  
       $keywords = htmlentities($keywords);
   
    return $keywords;
}

function date_time2date($dt){
             $timestamp =  strtotime($dt);
             return $kq =  date("d/m/Y",$timestamp);
}
 
function tinhthoigian($nowtime, $oldtime){
      $kq = $nowtime - $oldtime;
      
      if($kq/3600 <= 1){
        
       // $string =  round($kq/60)." phut truoc";
         $string = array(
         'so' => round($kq/60),
         'chu' => 'phut'
        ) ;
    
      }
    
    if($kq/84600 <= 1 && $kq/3600 > 1){
        
      // $string = round($kq/3600)." gio truoc";
       $string = array(
         'so' => round($kq/3600),
         'chu' => 'gio'
        ) ;
        
    }
    
    if($kq/84600 >= 1 && $kq/84600 <=3){
        //$string =  round($kq/84600)." ngay truoc";
         $string = array(
         'so' => round($kq/84600),
         'chu' => 'ngay'
        ) ;
        
    }
    
    if($kq/84600 > 3){
       // $string =  date('h:i:s - d/m/Y a',$oldtime);
         $string = array(
         'so' => date('h:i:s - d/m/Y a',$oldtime),
         'chu' => '0'
        ) ;
    }
    return $string;
}

function vntime_now(){
date_default_timezone_set("Asia/Ho_Chi_Minh"); 
return $nowtime = time();
}
 
 
 function mau_sac($id){
	$kq ="";
	
	if($id =='5'){
		$kq = "green"; // da xac minh
	}
	
	
	if($id =='6'){
		$kq = "green"; // gai ngan
	}
	
	if($id =='4'){
		$kq = "red"; // tu choi
	}
	
	if($id =='3'){
		$kq = "orange"; // bo sung
	}
	
	if($id =='2'){
		$kq = "green"; // ok
	}
	
	if($id =='1'){
		$kq = "yeallow";// tiep nhan
	}
	return $kq;
} 

function doingay($string) {

   $date_n = date_create($string);
   
date_time_set($date_n,13,24);

   $kq = date_format($date_n,"d-m-Y H:i:s");
   return $kq;
}



function time_stamp_to_date($d){
  
 $kq =  date("d-m-Y",$d);
 return $kq;
 
} 


function time_stamp_to_date222($d){
  
 $kq =  date("d-m-Y H:i:s",$d);
 return $kq;
 
} 
 
 function date_to_timestamp ($date){
	date_default_timezone_set('UTC');
	$time_stamp = strtotime($date);
	return $time_stamp;
}
 
  function doi_dau($str){
    $str = trim($str);
    $str = strtolower($str);
    if(!$str) return false;
    $unicode = array(
    '/'=>'-',
    );
    foreach($unicode as $nonUnicode=>$uni) $str = preg_replace("/($uni)/i",$nonUnicode,$str);
    //$alias = $str + "." + $ex;
    return $str;
}

 function so2gach($string){
      
      $thang = substr($string,3,2);
      $ngay = substr($string,0,2);
      $nam =  substr($string,6,9);
      
      $new_string = $ngay.'-'.$thang.'-'.$nam;
      return $new_string;
 }

function dmy2Ymd($string){
      
      $thang = substr($string,3,2);
      $ngay = substr($string,0,2);
      $nam =  substr($string,6,9);
      
      $new_string = $nam.'-'.$thang.'-'.$ngay;
      return $new_string;
 }


  function mdy2dmy($string){
      
      $ngay = substr($string,3,2);
      $thang = substr($string,0,2);
      $nam =  substr($string,6,9);
      
      $new_string = $ngay.'/'.$thang.'/'.$nam;
      return $new_string;
 }
 

// function getfile in folder
function getAllFile($folder){
    if ($handle = opendir($folder)) {
        while (false !== ($file = readdir($handle))) {
            if ($file != "." && $file != "..") {
               include('config/'.$file);
            }
        }
        closedir($handle);
    }
}


function make_random_string(){
     $i = rand(1,10);
     $length = rand(5,22);
     $str = "abcdefghijkmnqrstuvxyztw0123456789";
     $sub_string = substr($str,$i,$length);
     return $string_output = md5($sub_string); 
}

function make_pwd(){
    $i = rand(0,12);
    $md5string = make_random_string();
    $string = substr($md5string,0,7);
    $char ="@^$&<>?*!~^()";
    $get2char = substr($char,$i,1); 
    $pwd = $get2char.$string;
    return $pwd;
}


function start_time_genpages(){
    $load_time = microtime(); 
    $load_time = explode(' ',$load_time); 
    $load_time = $load_time[1] + $load_time[0]; 
    $page_start = $load_time; 
}

function show_time_genpage(){
    $load_time = microtime(); 
    $load_time = explode(' ',$load_time); 
    $load_time = $load_time[1] + $load_time[0]; 
    $page_end = $load_time; 
    $final_time = ($page_end - $page_start); 
    return $page_load_time = number_format($final_time, 4, '.', ''); 
    
}
// make authencation code 
// 13/04/2011
function auth_code(){
    $input = make_random_string();
    $output = md5($input);
    return $output;
}


// ma hoa
function encrypt($value, $key) {
		for ($i = 0; $i < strlen($value); $i++) {
			$char = substr($value, $i, 1);
			$keychar = substr($key, ($i % strlen($key)) - 1, 1);
			$char = chr(ord($char) + ord($keychar));
			$output .= $char;
		} 
		return base64_encode($output); 
	}
// giai ma 
function decrypt($value, $key) {
	    $value = base64_decode($value);
        for ($i = 0; $i < strlen($value); $i++) {
			$char = substr($value, $i, 1);
			$keychar = substr($key, ($i % strlen($key)) - 1, 1);
			$char = chr(ord($char) - ord($keychar));
			$output .= $char;
		}
		return $output;
	}
 
 function valid_email($email){
	    return eregi("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$", $email);
        }   
 function check_length($object,$min, $max){
      if ((strlen(utf8_decode($object)) < $min) || (strlen(utf8_decode($object)) > $max)) {
      $rs = fasle;
      }
  	return $rs;   	
}

function date_change($time)
{
        $time= mktime($time);
        $time =  date("d-m-Y h:i",$time);
	$str_ta = array (
	"Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun",
	"am", "pm",":","Jan",
	"Feb","Mar","Apr","May","Jul","Jun","Aug","Sep","Oct","Nov","Dec",
	" /","/ "
	);
	$str_tv = array ("Th? hai", "Th? ba", "Th? t?","Th? n?m", "Th? sáu", "Th? b?y", "Ch? nh?t", 
	" sáng", " chi?u",
	":","/01/","/02/","/03/","/04/","/05/","/06/","/07/","/08/","/09/","/10/","/11/","/12/",
	"/","/"
	
	);
	return str_replace($str_ta,$str_tv ,$time);

}

function get_template($file){
      if (file_exists($file)) {
			include($file);
      }else{
        exit('Error: Tap tin <color=\'red\'>  ' . $file . ' </color> khong ton tai, vui long xem lai di cung!');
  	}	
}

function get_file($file){
      if (file_exists($file)) {
			include($file);
      }else{
        exit('Error: Tap tin <color=\'red\'>' . $file . '</color> khong ton tai vui long xem lai!');
  	}	
}
//lay duong dan anh thumnai thu nho
function get_thumnai($chuoi){
    $thumnai_folder ="/data/_thumbs/Images";
    $newstring = substr($chuoi,12);
    $kq = $thumnai_folder.$newstring;
    return $kq;
}
// chuoi cat chu tieng viet trong php
    function cut_string($str,$len,$more){
    if ($str=="" || $str==NULL) return $str;
    if (is_array($str)) return $str;
    $str = trim($str);
    if (strlen($str) <= $len) return $str;
    $str = substr($str,0,$len);
    if ($str != "") {
    if (!substr_count($str," ")) {
    if ($more) $str .= " ...";
    return $str;
    }
    while(strlen($str) && ($str[strlen($str)-1] != " ")) {
    $str = substr($str,0,-1);
    }
    $str = substr($str,0,-1);
    if ($more) $str .= " ...";
    }
    return $str;
    } 
?>