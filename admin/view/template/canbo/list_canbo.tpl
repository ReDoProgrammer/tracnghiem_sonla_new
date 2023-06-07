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
             
              <a href="<?php echo $sort_order; ?>"> <?php echo $cot_ten; ?></a>
              </td>
             <td class="left">
              <a href="<?php echo $sort_name; ?>"><?php echo $cot_dan_toc; ?></a></td>
         
            <td class="left">
              <a href="<?php echo $sort_date_added; ?>"><?php echo $cot_chuc_danh; ?></a>
            </td>
 <td> Vai trò </td>
            <td class="left">
              <a href="<?php echo $sort_total; ?>"><?php echo $cot_phong_ban; ?></a>
            </td>
           
            <td class="left">  <?php echo $cot_ngay_sinh; ?> </td>
	   <td class="left">  <?php echo $cot_dien_thoai_nha_rieng; ?> </td>
	   <td class="left">  <?php echo $cot_dien_thoai_co_quan; ?> </td>
           <td class="left">  <?php echo $cot_di_dong; ?> </td>
           <td class="left">  <?php echo $cot_email; ?> </td>

            <td class="right"><?php echo $cot_thao_tac; ?></td>
          </tr>
        </thead>
        <tbody>
         
          <?php if ($list_canbo) { ?>
          <?php foreach ($list_canbo as $canbo) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $canbo['can_bo_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $canbo['can_bo_id']; ?>" />
              <?php } ?></td>

            
            <td class="left"><?php echo $canbo['ten_can_bo']; ?></td>
            <td class="left"><?php echo $canbo['ten_dan_toc']; ?></td>
            <td class="left"><?php echo $canbo['ten_chuc_danh']; ?></td>
            <td> <?php echo $canbo['role_name'];?> </td>
            <td class="left"><?php echo $canbo['ten_phong_ban']; ?></td>
            <td class="left"><?php echo $canbo['ngay_sinh']; ?></td>
            <td class="left"><?php echo $canbo['dien_thoai_nha_rieng']; ?></td>
            <td class="left"><?php echo $canbo['dien_thoai_co_quan']; ?></td>
            <td class="left"><?php echo $canbo['di_dong']; ?></td>
            <td class="left"><?php echo $canbo['email']; ?></td>
           
            <td class="right" width="50">
            [ <a href="index.php?module=canbo&act=<?php echo "edit";?>&id=<?php echo $canbo['cbid']; ?>"><?php echo "Sửa"; ?></a> ]
             [ <a href="index.php?module=canbo&act=<?php echo "phan_quyen_chuyen_muc";?>&uid=<?php echo $canbo['cbid']; ?>"><?php echo "PQ"; ?></a> ]
            <!--
            [ <a href="javascript:confirmDelete('index.php?module=canbo&act=del&id=<?=$canbo['can_bo_id']?>')"  ><?php echo "Xóa"; ?></a>]
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