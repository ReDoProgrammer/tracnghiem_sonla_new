<?php include('view/template/common/header.tpl'); ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($_SESSION['success']) { ?>
<div class="success"><?php echo $_SESSION['success']; ?></div>
<?php } unset($_SESSION['success']); ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('./view/image/order.png');"><?php echo $heading_title; ?></h1>
<div class="buttons"><a onclick="location = '<?php echo $link_edit; ?>'" class="button"><span><?php echo $button_edit; ?></span></a></div>
  </div>
  <div class="content">
    <form action="" method="post" enctype="multipart/form-data" id="form">
      <table class="list">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
            <td class="left">
             
              <a href="<?php echo $sort_order; ?>"><?php echo $tieu_de; ?></a>
              </td>
             <td class="left" width="180">
              <a href="<?php echo $sort_name; ?>"><?php echo $thoi_gian; ?></a></td>
         
             </td>
            <td class="right"><?php echo $cot_thao_tac; ?></td>
          </tr>
        </thead>
        <tbody>
         
          <?php if ($list_baohanh) { ?>
          <?php foreach ($list_baohanh as $baohanh) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
              <?php } ?></td>

            
            <td class="left"><?php echo $baohanh['tieu_de']; ?></td>
            <td class="left"><?php echo $baohanh['thoi_gian']; ?></td>
            <td class="right" width="80">
            [ <a href="index.php?module=baohanh&act=<?php echo "edit";?>&id=<?php echo $baohanh['bao_hanh_id']; ?>"><?php echo "Sửa"; ?></a> ]
            [ <a href=".../index.php?module=baohanh&act=<?php echo "view";?>&id=<?php echo $baohanh['bao_hanh_id']; ?>"><?php echo "Xem"; ?></a> ]
            </td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </form>
    <div class="pagination"><?php echo $pagination; ?></div>
  </div>
</div>

<script type="text/javascript" src="./theme/javascript/jquery/ui/ui.datepicker.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#date').datepicker({dateFormat: 'dd-mm-yy'});
});
//--></script>
<?php include('view/template/common/footer.tpl'); ?>