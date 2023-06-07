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
    <div class="buttons"><a onclick="location = '<?php echo $link_add; ?>'" class="button"><span><?php echo $save ?></span></a><a onclick="$('#form').attr('action', '<?php echo $delete; ?>'); $('#form').attr('target', '_self'); $('#form').submit();" class="button"><span><?php echo $delete; ?></span></a></div>
  </div>
  <div class="content">
    <form action="" method="post" enctype="multipart/form-data" id="form">
      <table class="list">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
            <td class="left">
             
              <a href="<?php echo $sort_order; ?>"> <?php echo $cot1; ?></a>
              </td>
             <td class="left">
              <a href="<?php echo $sort_name; ?>"><?php echo $cot2; ?></a></td>
         
            <td class="left">
              <a href="<?php echo $sort_date_added; ?>"><?php echo $cot3; ?></a>
            </td>
            <td class="left">
              <a href="<?php echo $sort_total; ?>"><?php echo $cot4; ?></a>
             </td>
            <td class="right"><?php echo $cot5; ?></td>
          </tr>
        </thead>
        <tbody>
         
          <?php if ($list) { ?>
          <?php foreach ($list as $hoso) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
              <?php } ?></td>
            <td class="right" width="30"><?php echo $address['info_address_id']; ?></td>
            <td class="left"><?php echo  $address['info_address_name']; ?></td>
           
            <td class="left" align="center" width="50"><?php if($hoso['active']=='1'){ ?>
            <a href="index.php?module=address&act=<?php echo "deactive";?>&id=<?php echo $address['info_address_id']; ?>"> <img src="./theme/image/active.png" alt ="Hoạt động" title="Bấm để ngưng kích hoạt"/></a>
            <?php } else{?>
            <a href="index.php?module=address&act=<?php echo "active";?>&id=<?php echo $address['info_address_id']; ?> title ="Bấm để kích hoạt">
            <img src="./theme/image/de_active.png" alt ="Không hoạt động"/>
            </a>
            <?php }?></td>
            
            <td class="left" width="120"><?php echo $hoso['add_date']; ?></td>
            <td class="right" width="80">
            [ <a href="index.php?module=address&act=<?php echo "edit";?>&id=<?php echo $address['info_address_id']; ?>"><?php echo "Sửa"; ?></a> ]
            [ <a href="javascript:confirmDelete('index.php?module=address&act=del&id=<?=$address['info_address_id']?>')"  ><?php echo "Xóa"; ?></a>]
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