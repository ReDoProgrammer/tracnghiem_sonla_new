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
    <div class="buttons"><a onclick="location = '<?php echo $link_add; ?>'" class="button"><span><?php echo $button_add; ?></span></a></div>
  </div>
  <div class="content">
    <form action="" method="post" enctype="multipart/form-data" id="form">
      <table class="list">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
    <td class="left" width="10">
              UID </td>        
 <td class="left">
             
              <a href="<?php echo $sort_order; ?>"> <?php echo $cot_ten; ?></a>
              </td>
            
         
            <td class="left" width="100">
             Mã Chuyên mục
            </td>
            <td class="left">
              Tên chuyên mục
            </td>
           
           

            <td class="right"><?php echo $cot_thao_tac; ?></td>
          </tr>
        </thead>
        <tbody>
         
          <?php if ($list_quyen_chuyen_muc) { ?>
          <?php foreach ($list_quyen_chuyen_muc as $quyen_chuyen_muc) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $quyen_chuyen_muc['qcm_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $quyen_chuyen_muc['qcm_id']; ?>" />
              <?php } ?></td>
            <td class="left"><?php echo $quyen_chuyen_muc['user_id']; ?></td>
             <td class="left"><?php echo $quyen_chuyen_muc['ten_can_bo']; ?></td>
           
            <td class="left"><?php echo $quyen_chuyen_muc['cm_id']; ?></td>
            <td class="left"><?php echo $quyen_chuyen_muc['ten_danh_muc']; ?></td>
           
            
           
            <td class="right" width="50">
          
             <!--  [ <a href="index.php?module=canbo&act=<?php echo "edit";?>&id=<?php echo $quyen_chuyen_muc['cbid']; ?>"><?php echo "Sửa"; ?></a> ]-->
            
            [ <a href="javascript:confirmDelete('index.php?module=member&act=del_phan_quyen_chuyen_muc&uid=<?php echo $quyen_chuyen_muc['user_id']; ?>&qcm_id=<?=$quyen_chuyen_muc['qcm_id']?>')"  ><?php echo "Xóa"; ?></a>]
          
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