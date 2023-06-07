<?php
/**
 * @author honestphan
 * @copyright 2011
 *
 * This config file was genarated by honest
 * don't change any text
**/
defined('SLA') or die('Restricted access');
define('DIRECTORY_SEPARATOR','/');
define('DIR_CACHE', 'E:\F\AppServ\www\da/caching/');


        //system config
define('CHAR_SET', config('char_set'));
define('GOOGLE_ANALYTICS', config('google_analytics'));
define('REWRITE', config('rewrite'));
define('CACHE_SETTING', config('cache_setting'));
define('CACHE_TYPE', config('cache_type'));
define('MAIL_ACTIVE', config('active_mail'));
define('LOGIN_2_POST', config('login_2_post'));
define('GUEST_COMMENT', config('guest_comment'));
define('MAINTAIN_WEB', config('maintain_web'));
        
define('MAIL_TYPE',config('mail_type'));

        //mail-smtp config
define('SMTP_STATUS', config('smtp'));   
   // value 1:on , 0:off    
define('SMTP_SECURE', config('secure'));  
define('HOST_MAIL', config('host_mail'));   // defaul: localhost
define('SMTP_PORT',config('sever_port'));   // 25 
define('SMTP_AUTH', config('auth_smtp')); 
define('SMTP_USER_NAME', config('user_name_smtp'));
define('SMTP_PASSWORD', config('pwd'));
        
        // gmail - smtp config
define('GMAIL_STATUS', config('gmail'));
define('GMAIL_ACCOUNT', config('gmail_account'));
define('GMAIL_PASS', config('gmail_pwd'));

        //upload config
define('IMAGE_UPLOAD', config('upload_images'));
define('IMAGE_MAX_SIZE', config('max_size'));
define('IMAGES_W_LOGO', config('width_logo'));
define('IMAGES_H_LOGO', config('height_logo'));
define('IMAGES_TYPE', config('img_type'));
define('WATER_MARK', config('water_mark'));
define('WATER_TEXT', config('water_text'));

        //template
define('TEMPLATE', config('template'));
define('MOBILE_DETECT', config('mobile_detect'));
define('CKEDITOR', config('ckeditor'));
define('BBCODE', config('bbcode'));
define('DATE_FORMAT1', config('date_format'));
define('MAX_RECORD', config('record'));
define('FEATURE_ADDRESS_RECORD', config('feature_address'));
define('RANDOM_ADDRESS_RECORD', config('random_address'));
define('VIEW_MUCH_ADDRESS_RECORD', config('view_much_address'));
define('BEST_ADDRESS_RECORD', config('best_address'));
define('LASTEST_ADDRESS_RECORD', config('lastest_address'));
        //security
define('MAX_LOGIN', config('max_login'));
define('KEYWORD', config('keyword'));
define('MIN_USER_NAME', config('min_uname'));
define('MIN_PASSWORD', config('min_pwd'));
define('TIME_POST', config('time_post'));
define('GET_BLOCK', config('get_block'));
define('CAPTCHA', config('captcha'));
define('FLOOD', config('flood')); 
define('SPAM_REGISTER', config('spam_register'));

        //scores
define('SCORE_POST', config('score_post'));
define('SCORE_COMMENT', config('score_comment'));
define('CSORE_DEL', config('score_del'));
define('SCORE_AUTH', config('score_auth'));
define('SCORE_MAP', config('score_map'));

?>