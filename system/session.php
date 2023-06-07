<?php

/**
 * @author honestphan
 * @copyright 2011
 */
 defined('SLA') or die('Restricted access');   
   
    $sub = $_SESSION['now'] - $_SESSION['time'];
    $exp = 5;
    if($sub > $exp){
    
         session_destroy();
    
    }
    
    
    
?>