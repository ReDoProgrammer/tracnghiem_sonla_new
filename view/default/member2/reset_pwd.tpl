


<div id="content">
  <div class="top">
  <div class="left"></div>
  <div class="right"></div>
  <div class="center">
    <div class="heading"><?php echo $heading_title;?></div>
  </div>
</div>
<div class="middle">
 <form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post" enctype="multipart/form-data" id="create">
      <p><?php echo $text_account_already; ?></p>
      <b style="margin-bottom: 2px; display: block;"><?php echo $account_info; ?></b>
      <div style="background: #F7F7F7; border: 1px solid #DDDDDD; padding: 10px; margin-bottom: 10px;">
        <table>
        
           <tr>
            <td>Ma bao mat</td>
            <td><img src="<?php echo $captcha; ?>"></td>
          </tr>
          
          <tr>
            <td>Nhap ma bao mat</td>
            <td><input type="text" name="captcha" size="10" /> 
            <?php if ($_SESSION['err_catcha']) { ?>
              <span class="error"><?php echo $_SESSION['err_catcha']; 
              ?></span>
              <?php } if($ec !=1) {unset($_SESSION['err_catcha']);}?>
            </td>
          </tr>
          <tr>
            <td><span class="required"></span> Email</td>
            <td><input type="text" name="email" size="60" />
              <?php if ($_SESSION['err_mail']) { ?>
              <span class="error"><?php echo $_SESSION['err_mail']; ?></span>
              <?php } if($em !=1) {unset($_SESSION['err_mail']);}?></td>
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
        <div class="bottom">
	<div class="left"></div>
	<div class="right"></div>
	<div class="center"></div>
	</div>

 </div>
 
 <script type="text/javascript" src="./admin/theme/javascript/jquery/ui/ui.datepicker.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#age').datepicker({dateFormat: 'dd-mm-yy'});
});
//--></script>
<!-- and main -->
