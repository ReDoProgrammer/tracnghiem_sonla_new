<?php
/**
 * Created by Ca Van Oanh.
 * User: Administrator
 * Date: 9/21/2014
 * Time: 10:22 PM
 */
session_start();
require("captcha.php");
$captcha = new Captcha();
$code = $captcha->get_and_show_image();

// Lưu code session
$_SESSION["maXacNhan"] = $code;

?>