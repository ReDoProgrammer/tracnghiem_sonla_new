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
    <div class="buttons"><a onclick="location = '<?php echo $link_add; ?>'" class="button"><span><?php echo $button_add; ?></span></a><a onclick="$('#form').attr('action', '<?php echo $delete; ?>'); $('#form').attr('target', '_self'); $('#form').submit();" class="button"><span><?php echo $button_delete; ?></span></a></div>
  </div>
  <div class="content">
    <form action="" method="post" enctype="multipart/form-data" id="form">
      <table class="list">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
            
             <td class="left">
              <a href="<?php echo $sort_name; ?>"><?php echo $ten_album_anh; ?></a></td>
              <td>Người đăng</td>
             <td class="center">
              <a href="<?php echo $sort_name; ?>"><?php echo $thao_tac; ?></a></td>
          </tr>
        </thead>
        <tbody>
         
          <?php if ($list_albumanh) { ?>
          <?php foreach ($list_albumanh as $albumanh) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $albumanh['album_anh_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $albumanh['album_anh_id']; ?>" />
              <?php } ?></td>
              

           <td class="left"><?php echo  $albumanh['ten_album_anh']; ?></td>
           <td><?php echo  $albumanh['ten_can_bo']; ?></td>
           
             <td class="center" width="50">
            [ <a href="index.php?module=albumanh&act=<?php echo "edit";?>&id=<?php echo $albumanh['album_anh_id']; ?>"><?php echo "Sửa"; ?></a> ]
            <!--
            [ <a href="javascript:confirmDelete('index.php?module=albumanh&act=del&id=<?=$albumanh['album_anh_id']?>')"  ><?php echo "Xóa"; ?></a>]
            -->
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
<?php include('view/template/common/footer.tpl'); ?>