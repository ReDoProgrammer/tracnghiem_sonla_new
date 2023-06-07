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
            <td class="left" width="50">
                <a href="<?php echo $sort_order; ?>"> <?php echo $hinh_anh; ?></a>
            </td>
              <td class="left"> 
              <a href="<?php echo $sort_order; ?>"><?php echo "STT"; ?></a>
            </td>
            <td class="left"> 
              <a href="<?php echo $sort_order; ?>"><?php echo "Họ và tên"; ?></a>
            </td>
             <td class="left"> 
              <a href="<?php echo $sort_order; ?>"><?php echo "Điện thoại"; ?></a>
            </td>
              <td class="left"> 
              <a href="<?php echo $sort_order; ?>"><?php echo "Email"; ?></a>
            </td>
             <td class="left" width="100"> 
              <a href="<?php echo $sort_order; ?>"><?php echo "Chức vụ"; ?></a>
            </td>
            
            <td class="left" width="180">
              <a href="<?php echo $sort_name; ?>"><?php echo "Phòng ban"; ?></a></td>     
            </td>
            <td class="right"><?php echo $cot_thao_tac; ?></td>
          </tr>
        </thead>
        <tbody>
         
          <?php if ($list_danhba) { ?>
          <?php foreach ($list_danhba as $danhba) { ?>
          <tr>
           <td style="text-align: center;">
              <input type="checkbox" name="selected[]" value="<?php echo $danhba['id_danhba']; ?>" />
             </td>

                <?php if($tintuc['hinh_anh']){?>
            <td class="left" width="50">
              <a href="<?php echo $tintuc['hinh_anh']; ?>"class="thickbox" rel="shadowbox">
              <img src ="<?php echo $tintuc['hinh_anh'];?>" class="bimg" width="50" height ="50"/>
             </a>
             </td>
            <?php } else{?>
              <td class="left" width="50">

              <img src ="../data/images/no_image.jpg" class="bimg" width="50" height ="50"/>

           </td>
            <?php } ?>
            <td class="left"><?php echo $danhba['stt']; ?></td>
            <td class="left"><?php echo $danhba['ho_ten']; ?></td>
            <td class="left"><?php echo $danhba['dien_thoai']; ?></td>
            <td class="left"><?php echo $danhba['email']; ?></td>
            <td class="left"><?php echo $danhba['chuc_vu']; ?></td>
            <td class="left"><?php echo $danhba['tieu_de']; ?></td>
            <td class="right" width="80">
            [ <a href="index.php?module=danhba&act=<?php echo "edit";?>&id=<?php echo $danhba['id_danhba']; ?>"><?php echo "Sửa"; ?></a> ]
            [ <a href="javascript:confirmDelete('index.php?module=danhba&act=del&id=<?=$danhba['id_danhba']?>')"  ><?php echo "Xóa"; ?></a>]
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