<div id="heading"><?php echo $heading_title;?></div>
<div class="content">
                 <?php if ($_SESSION['update_success']) {?>
                 <div class ="success">
                 <?php echo $_SESSION['update_success'];?>
                 </div>
                 <?php  } if($update!='1') { unset( $_SESSION['update_success']);}?>
                
                  <?php if($_SESSION['err_oldpass']){?>
                  <div class ="success">
                  <?php  echo  $_SESSION['err_oldpass']; if($op!='1'){unset($_SESSION['err_oldpass']);}?>
                  </div>
                 <?php }?>
                 
                  <?php if($_SESSION['err_pass']){?>
                  <div class ="success">
                 
                  <?php echo $_SESSION['err_pass']; if($rp!='1') {unset($_SESSION['err_pass']);}?>
                  </div>
                 <?php }?>
                 
<form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post" enctype="multipart/form-data" id="create">
    <b style="margin-bottom: 2px; display: block;"><?php echo $account_info; ?></b>
      <div class="bg">
        <table>
          <tr>
            <td width="150"><span class="required">*</span> <?php echo $username; ?></td>
            <td><input type="text" name="userName" readonly="1" value="<?php echo $member['user_name'];?>" />
              <?php if ($_SESSION['error_userName']) { ?>
              <span class="error"><?php echo $_SESSION['error_userName'];?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> Email</td>
            <td><input type="text" name="email" readonly="1" value="<?php echo $member['email']; ?>" />
              <?php if ($error_email) { ?>
              <span class="error"><?php echo $error_email; ?></span>
              <?php } ?></td>
          </tr>
         
          <tr>
            <td><span class="required"></span>Old Password</td>
            <td><input type="password" name="old_password"/>
              <?php if ($error_password) { ?>
              <span class="error"><?php echo $error_password; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td>New PassWord</td>
            <td><input type="password" name="password"  /></td>
          </tr>
           <tr>
            <td>Re PassWord</td>
            <td><input type="password" name="re_password" /></td>
          </tr>
          
        </table>
      </div>
      <b style="margin-bottom: 2px; display: block;">Hồ sơ cá nhân</b>
      <div class="bg">
        <table>
          <tr>
            <td width="150">Tên đầy đủ</td>
            <td><input type="text" name="fullName" value="<?php echo $member['full_name']; ?>" /></td>
          </tr>
         
         <tr>
              <td><?php echo "Ngày sinh"; ?></td>
              <td><input type="text" name="age" value="<?php echo $member['age']; ?>" id="age" /></td>
         </tr>
          
          <tr>
            <td width="150">Giới tính</td>
            <td><?php if ($member['gender']==1) { ?>
              <input type="radio" name="gender" value="1" checked="checked" />
              <?php echo "Nam"; ?>
              <input type="radio" name="gender" value="0" />
              <?php echo "Nu"; ?>
              <?php } else { ?>
              <input type="radio" name="gender" value="1" />
              <?php echo "nam"; ?>
              <input type="radio" name="gender" value="0" checked="checked" />
              <?php echo "nu"; ?>
              <?php } ?></td>
          </tr>
        <tr>
              <td><?php echo "Home phone"; ?></td>
              <td><input type="homephone" name="homePhone" value="<?php echo $member['homephone']; ?>"  />
                <br />
                <?php if ($error_homephone) { ?>
                <span class="error"><?php echo $error_homephone; ?></span>
                <?php  } ?></td>
            </tr>
            <tr>
              <td><?php echo "Mobile phone"; ?></td>
              <td><input type="mobilephone" name="mobilePhone" value="<?php echo $member['mobilephone']; ?>" />
                <?php if ($error_mobilephone) { ?>
                <span class="error"><?php echo $error_mobilephone; ?></span>
                <?php  } ?></td>
            </tr>
    
              <tr>
              <td><?php echo "Địa chỉ"; ?></td>
              <td><textarea cols="32" rows="5" name="address" ><?php echo $member['address']; ?></textarea>
                <?php if ($error_address) { ?>
                <span class="error"><?php echo $error_address; ?></span>
                <?php  } ?></td>
            </tr>
         
        </table>
      </div>
      <div class="buttons">
        <table>
          <tr>
            <td align="right"><input type="submit" name="submit" value="Gửi đi"/></td>
          </tr>
        </table>
      </div>
    </form>
 </div>
</div>
<script type="text/javascript" src="./admin/theme/javascript/jquery/ui/ui.datepicker.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#age').datepicker({dateFormat: 'dd-mm-yy'});
});
//--></script>
<!-- and main -->
