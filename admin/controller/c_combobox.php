<?php

/**
 * @author honestphan
 * @copyright 2012
 */

//defined('DSVH') or die('Restricted access');

include('model/m_combobox.php');

$page = $_GET['act'];
 switch($page){
   
    case 'danhmuccon':
        $output = '<option value=""> -- </option>';
		$results = listDanhmuccon($_GET['ma_cha']);
        
        foreach ($results as $result) {
        	
        $output .= '<option value="' . $result['ma_loai'] . '"';
	        if (isset($_GET['ma_loai']) && ($_GET['ma_loai'] == $result['ma_loai'])) {
	      		$output .= ' selected="selected"';
	   	}
	
	    	$output .= '>' . $result['ten_loai'] . '</option>';
    	} 
        
		if (!$results) {
			if (!$_GET['ma_loai']) {
		  		$output .= '<option value="0" selected="selected">' . "Chon co" . '</option>';
			} else {
				$output .= '<option value="'.$_SESSION['xa_id'].'">' . "chon 0 co" . '</option>';
			}
		}
	
	    echo $output;
       break;
     
      
       case 'zones2':
        $output = '<option value="FALSE"> -- </option>';
		$results = listXa($_GET['parent_id']);
        
        foreach ($results as $result) {
        	
        $output .= '<option value="' . $_SESSION['xa_id'] . '"';
	        if (isset($_GET['dia_phuong_id']) && ($_GET['dia_phuong_id'] == $result['dia_phuong_id'])) {
	      		$output .= ' selected="selected"';
	   	}
	
	    	$output .= '>' . $result['ten_dia_phuong'] . '</option>';
    	} 
        
		if (!$results) {
			if (!$_GET['dia_phuong_id']) {
		  		$output .= '<option value="0" selected="selected">' . "Chon co" . '</option>';
			} else {
				$output .= '<option value="'.$_SESSION['xa_id'].'">' . "chon 0 co" . '</option>';
			}
		}
	
	    echo $output;
     break;
       
}

?>