<?php

/**
 * @author honestphan
 * @copyright 2011
 * This class build by honest. Auto load file with controller
 * Creat date: 26/03/2011
 */
 defined('SLA') or die('Restricted access');
 
  //load file config follwing  by modules name//
  //get config file match controller
  if(($_REQUEST['module']==$_REQUEST['module'])&&($_REQUEST['module'] != "")){
    
      $file_name = $_REQUEST['module'];
      include('config/'.$file_name."."."php");  
      
    
  }else{
      // in case non-controller 
      // get all files in config foder
      getAllFile('config');
    
  }





?>