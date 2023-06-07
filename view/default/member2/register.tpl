                                                        </div>
        <div class="col-md-6" id="mobile-1" style=" -webkit-box-ordinal-group: 1; -moz-box-ordinal-group: 1; box-ordinal-group: 1;">
           
			
			
			
			
			 <div class="panel panel-success ">
            <div class="panel-heading" style="background: linear-gradient(135deg, rgb(208, 228, 247) 0%, rgb(115, 177, 231) 24%, rgb(10, 119, 213) 50%, rgb(83, 159, 225) 79%, rgb(135, 188, 234) 100%);">
            <h6 class="panel-title title_head">Đăng ký Tài Khoản</h6>
        </div>
                <div class="panel-body2">
         

  <div class="module-art">
  
 <div class="form-container" data-reactid="42">
    <!-- react-empty: 43 -->
    <div class="form-title col-lg-12 col-md-12 col-xs-12">ĐĂNG KÝ TÀI KHOẢN</div>
    <div class="errorMessage" style="display: none;"></div>
    <form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post" enctype="multipart/form-data" id="create" onsubmit="return validate(this);">
         <input placeholder="Tên tài khoản" class="form-control" name="userName" type="text" value="<?php echo $member['user_name'];?>" />
		  <?php if ($err['user_name']) { ?>
              <span class="error"><?php echo $err['user_name'];?></span>
              <?php } ?>
		 <input placeholder="Nhập mật khẩu" class="form-control" type="password" name="password" />
		<span class="error"><?php echo $err_password; ?></span>
		<input placeholder="Nhập lại mật khẩu" class="form-control" type="password" name="repassword" />
 <span class="error"><?php echo $err_repassword; ?></span>  
	   <input placeholder="Địa chỉ Email" class="form-control" type="text" name="email" value="<?php echo $member['email']; ?>" />
<?php if ($err['email']) { ?>       
	   <span class="error"><?php echo $err_email; ?></span>
	   <?php } ?>
	   <input placeholder="Họ và tên" class="form-control" type="text" name="fullName" value="<?php echo $member['full_name']; ?>" />
		<input placeholder="Số điện thoại" class="form-control" type="text" name="homePhone" value="<?php echo $member['homephone']; ?>" />
		<input type="text" name="captcha" size="10"/> 
            <img src="<?php echo $captcha; ?>" class="captcha"/>
            <?php if($err_captcha){ ?>
            <span class="error"><?php echo $err_captcha;  ?></span>
            <?php } ?>
         <p style="text-align:center;color:#5f5f5f;"><strong>Lưu ý:</strong> Nhập đúng tên tài khoản viết liền không dấu, tài khoản sẽ là tên đăng nhập</p>
        <div class="form-group">

            <div class="col-lg-12 col-md-12 col-xs-12" style="padding: 0px">
                <button type="submit" class="btn btn-login" id="btn-register" style="" data-loading-text="<i class='fa fa-spinner fa-spin'></i> Đang xử lý">ĐĂNG KÝ</button>
            </div>
        </div>
        
    </form>
    <!-- react-empty: 64 -->
</div>





  
  
 </div>
 </div>
    
     
  </div> 
  
        </div>