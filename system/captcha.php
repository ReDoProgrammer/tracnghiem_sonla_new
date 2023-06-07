<?php

    /**
     * @author honestphan
     * @copyright 2011
     */
  
    
    $type =$_REQUEST['type'];
    switch($type){
        
    case 'string':
    session_start();
    $captcha = imagecreatefromgif('cross.gif');
    //set some variables
    $black = imagecolorallocate($captcha, 0, 0, 0);
    $white = imagecolorallocate($captcha, 225, 225, 225);
    $red = imagecolorallocate($captcha, 225, 0, 0);
    $font = 'keyster.ttf';
    
    //random stuff
    $string = md5(microtime() * mktime());
    $text = substr($string, 0, 5);
    
    $_SESSION['code'] = $text;
    //create some stupid stuff
    
    imagettftext($captcha, 14, 5, 5, 25, $red, $font, $text);
    
    // begin to create image
    header('content-type: image/png');
    imagepng($captcha);
    
    //clean up
    imagedestroy($captcha);
    break;
    
    /**
     *  Creat on 14/04/2011 by honestphan
     *  math captcha basic on total 2 digital
     *  You can relace + by -, *, :
     *  
     * */
     
    case 'math':
    session_start();
    $captcha = imagecreatefromgif('cross.gif');
    //set some variables
    $black = imagecolorallocate($captcha, 0, 0, 0);
    $white = imagecolorallocate($captcha, 225, 225, 225);
    $red = imagecolorallocate($captcha, 225, 0, 0);
    $font = 'arial.ttf';
    
    //get random  2 so
    $a = rand(1,27);
    $b = rand(10,43);
    $tong = $a + $b;
    $text = $a."+".$b."= ?";
    $_SESSION['code'] = $tong;
    
    //creat image
    imagettftext($captcha, 14, 0, 5, 20, $red, $font, $text);
    
    // begin to create image
    header('content-type: image/png');
    imagepng($captcha);
    
    //clean up
    imagedestroy($captcha);
    break;
 }


?>