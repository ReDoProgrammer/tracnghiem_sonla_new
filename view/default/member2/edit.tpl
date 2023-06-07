<div id="content_right">
<div class="box">
  <div class="box-heading">Kho phần mềm</div>
  <div class="box-content">

<div class="middle">
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
      <p><?php echo $text_account_already; ?></p>
      <b style="margin-bottom: 2px; display: block;"><?php echo $account_info; ?></b>
      <div class="group2">
        <table>
          <tr>
            <td width="150"><span class="required"></span> <?php echo $username; ?></td>
            <td><?php echo $member['user_name'];?>
              <?php if ($_SESSION['error_userName']) { ?>
              <span class="error"><?php echo $_SESSION['error_userName'];?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required"></span>Email</td>
            <td><?php echo $member['email']; ?>
              <?php if ($error_email) { ?>
              <span class="error"><?php echo $error_email; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required"></span>Mật khẩu cũ</td>
            <td><input type="password" name="old_password"/>
              <?php if ($error_password) { ?>
              <span class="error"><?php echo $error_password; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td>Mật khẩu mới</td>
            <td><input type="password" name="password"  /></td>
          </tr>
           <tr>
            <td>Xác nhận mật khẩu</td>
            <td><input type="password" name="re_password" /></td>
          </tr>
         </table>
      </div>
      <b style="margin-bottom: 2px; display: block;">Hồ sơ cá nhân</b>
      <div class="group2">
        <table>
<?php if($_SESSION['fbuid']) { ?>
          <tr>
           <td width="150">Hình đại diện</td>
           <td>  <img src="https://graph.facebook.com/<?php echo $_SESSION['fbuid']; ?>/picture"  height="100"> </td>
          <tr>
 <?php } ?>
          <tr>
            <td width="150">Tên đầy đủ</td>
            <td><input type="text" name="fullName" value="<?php echo $member['full_name']; ?>" /></td>
          </tr>
          <tr>
              <td><?php echo "Ngày sinh"; ?></td>
              <td><input type="text" name="age" value="<?php echo $member['age']; ?>" id="age" /></td>
          </tr>
          <tr>
            <td width="150">Gới tính</td>
            <td><?php if ($member['gender']==1) { ?>
              <input type="radio" name="gender" value="1" checked="checked" />
              <?php echo "Nam"; ?>
              <input type="radio" name="gender" value="0" />
              <?php echo "Nữ"; ?>
              <?php } else { ?>
              <input type="radio" name="gender" value="1" />
              <?php echo "Nam"; ?>
              <input type="radio" name="gender" value="0" checked="checked" />
              <?php echo "Nữ"; ?>
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
              <td><textarea cols="60" rows="5" name="address" ><?php echo $member['address']; ?></textarea>
                <?php if ($error_address) { ?>
                <span class="error"><?php echo $error_address; ?></span>
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
              <td><?php echo "Thẻ mô tả"; ?></td>
              <td><input type="mobilephone" name="description_meta" value="<?php echo $member['mobilephone']; ?>" />
                <?php if ($error_mobilephone) { ?>
                <span class="error"><?php echo $error_mobilephone; ?></span>
                <?php  } ?></td>
           </tr>

        </table>
      </div>
      <div class="buttons">
        <table>
          <tr>
            <td align="right"><a onclick="$('#create').submit();" class="button"><span><?php echo $button_continue; ?></span></a></td>
          </tr>
        </table>
      </div>
    </form>
</div>
           </div><!-- end botom -->
</div><!-- end content -->
</div>
 
<script type="text/javascript" src="./admin/theme/javascript/jquery/ui/ui.datepicker.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#age').datepicker({dateFormat: 'dd-mm-yy'});
});
//--></script>
<!-- and main -->
