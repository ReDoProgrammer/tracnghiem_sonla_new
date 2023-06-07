<div id="content">
  <div class="top1">
  <div class="left"></div>
  <div class="right"></div>
  <div class="center">
    <div class="heading"><?php echo $heading_title;?></div>
  </div>
</div>
<div class="middle1">

<?php if($success) {?>
<div class ="success">
<?php echo $success;?>
</div>
<?php } ?>


<?php if($err['oldpass']) { ?>
<div class ="warning">
<?php echo $err['oldpass'];?>
</div>
<?php } ?>

<?php if($err['pass']) { ?>
<div class ="warning">
<?php echo $err['pass']; ?>
</div>
<?php } ?>


<?php if($err['repass']) { ?>
<div class ="warning">
<?php echo $err['repass'];?>
</div>
<?php } ?>




 <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="create" onsubmit="return validate(this);">
     
      <div class="group6">
        <table>
         <tr>
            <td width="150"><?php echo $mat_khauhientai; ?></td>
            <td><input type="password" name="oldpass"  /></td>
          </tr>
          <tr>
            <td width="150"><?php echo $mat_khau_moi; ?></td>
            <td><input type="password" name="pass" /></td>
          </tr>
          <tr>
            <td width="150"><?php echo $xac_nhan_mat_khau; ?></td>
            <td><input type="password" name="repass" /></td>
          </tr>

        </table>
      </div>
      
      <div class="btn" align="center">
        <table>
          <tr>
          <!--
          <td align="right" width="5"><a onclick="$('#create').submit();" class="button"><span><?php echo $button_continue; ?></span></a></td>
          -->
          <td>
          <p align="center"><input type="submit" value="Cập nhật" name="submit" /> </p> 
          </td>
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
