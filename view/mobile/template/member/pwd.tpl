 <div id="heading"><?php echo $heading_title;?></div>
 <div class="content">
 <form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post" enctype="multipart/form-data" id="create">
      <p><?php echo $text_account_already; ?></p>
      <b style="margin-bottom: 2px; display: block;"><?php echo $account_info; ?></b>
      <div style="background: #F7F7F7; border: 1px solid #DDDDDD; padding: 10px; margin-bottom: 10px;">
        <table>
        <tr>
            <td><span class="required"></span> Email</td>
            <td><input type="text" name="email" size="40" />
              <?php if ($_SESSION['err_mail']) { ?>
              <span class="error"><?php echo $_SESSION['err_mail']; ?></span>
              <?php } if($em !=1) {unset($_SESSION['err_mail']);}?></td>
          </tr>
          <tr>
            <td>Mã bảo mật</td>
            <td><img src="<?php echo $captcha; ?>"></td>
          </tr>
          
          <tr>
            <td>Nhập mã bảo mật</td>
            <td><input type="text" name="captcha" size="10" /> 
            <?php if ($_SESSION['err_catcha']) { ?>
              <span class="error"><?php echo $_SESSION['err_catcha']; 
              ?></span>
              <?php } if($ec !=1) {unset($_SESSION['err_catcha']);}?>
            </td>
          </tr>  
        </table>
      </div>
     
      <div class="buttons">
        <table>
          <tr>
           <td><input type="submit" name="submit" value="Gửi đi"></td>
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
