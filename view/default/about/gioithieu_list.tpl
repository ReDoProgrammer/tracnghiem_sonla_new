<div id="content">
  <div class="top1">
  <div class="left"></div>
  <div class="right"></div>
  <div class="center">
    <div class="heading"><?php echo $heading_title;?></div>
  </div>
</div>
<div class="middle">
       <?php if ($_SESSION['warning']) { ?>
<div class="warning"><?php echo $_SESSION['warning']; ?></div>
<?php }  unset($_SESSION['warning']);?>
<?php if ($_SESSION['success']) { ?>
<div class="success"><?php echo $_SESSION['success']; ?></div>
<?php } unset($_SESSION['success']); ?>

      <p><?php echo "Xin chào"; ?><b> <?php echo $_SESSION['name']; ?> </b>  </p>
      <b style="margin-bottom: 2px; display: block;"><?php echo $heading_title;?></b>
     <?php if($_SESSION['success']){?> <div class="success"> <?php echo $_SESSION['success']; ?></div> <?php }?>
       <?php unset($_SESSION['success']); ?>
 <div class="group2">
          <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
         Tất cả: <a onclick="$('form').submit();"> Xóa </a>
         <table class="list_for_mem">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
            <td class="left">
              <a href="<?php echo $sort_country; ?>"><?php echo "Tên địa chỉ "; ?></a>
            </td>
            <td class="date">
              <a href="<?php echo $sort_name; ?>"><?php echo "Sửa lần cuối"; ?></a>
              </td>
              
            <td class="actions"><?php echo "Thao tác"; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($list) { ?>
          <?php foreach ($list as $address) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($local['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $address['info_address_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $address['info_address_id']; ?>" />
              <?php } ?></td>
            <td class="left"><?php echo $address['info_address_name'];?></td>
            <td class="left"><?php echo $address['last_edit'];?> </td>
           
            <td class="right"><?php //foreach ($actions as $action) { ?>
              [ <a href= "?m=address&act=edit&id=<?=$address['info_address_id']?>"  ><?php echo "Sua"; ?></a>]
              [ <a href= "javascript:confirmDelete('?m=address&act=del&id=<?=$address['info_address_id']?>')"  ><?php echo "Xoa"; ?></a>]
              <?php //}// ?></td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="5"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
       <div class="pagination"><?php echo $pagination; ?></div>
       </form>
      </div>
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

<!-- and main -->
