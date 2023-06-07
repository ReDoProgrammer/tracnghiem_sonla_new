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
    <h1 style="background-image: url('./view/image/order.png');"><?php echo "Danh sách báo cáo vi phạm"; ?></h1>
    <div class="buttons"><a onclick="location = '<?php echo $link_add; ?>'" class="button"><span><?php echo $button_add; ?></span></a><a onclick="$('#form').attr('action', '<?php echo $delete; ?>'); $('#form').attr('target', '_self'); $('#form').submit();" class="button"><span><?php echo $button_delete; ?></span></a></div>
  </div>
  <div class="content">
    <form action="" method="post" enctype="multipart/form-data" id="form">
    <div style="padding-bottom: 5px;">
    
    </div>
      <table class="list">
        <thead>
          <tr>
         
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
            <td class="left" width="250">  
            <a href="<?php echo $sort_order; ?>"> <?php echo "Tên danh mục"; ?></a></td>
            <td class="left" width="150">  
            <a href="<?php echo $sort_order; ?>"> <?php echo $tieu_de; ?></a></td>
            <td class="left">  
            <a href="<?php echo $sort_order; ?>"> <?php echo "Nội dung"; ?></a></td>
            <td class="left" width="120">  
            <a href="<?php echo $sort_order; ?>"> <?php echo "Người Gửu"; ?></a></td>
            
            <td class="left" width="140">
            <a href="<?php echo $sort_name; ?>"><?php echo "Thời gian gửu"; ?></a></td>
         
            
            <td class="right" width=""><?php echo $cot_thao_tac; ?></td>
          </tr>
        </thead>
        <tbody>
         
          <?php if ($list_baocao) { ?>
          <?php foreach ($list_baocao as $baocao) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
              <?php } ?></td>

                
            
            <td class="left"><?php echo $baocao['tieu_de']; ?></td>
            <td class="left">
          <?php if($baocao['tieu_de_id']=='1') {echo "Link download lỗi";}
            else if($baocao['tieu_de_id']=='2'){echo "Không có password" ;}
            else if($baocao['tieu_de_id']=='3'){echo "Không hiện hình ảnh" ;}
            else if($baocao['tieu_de_id']=='4'){echo "Ly do khác" ;}
             ?>
            </td>
            <td class="left"><?php echo $baocao['noi_dung']; ?></td>
            <?php if($baocao['tai_khoan']){?>
            <td class="left"><?php echo $baocao['tai_khoan']; ?></td>
            <?php } else{?>
            <td class="left"><font color="red"><?php echo "Khách vãng lai"; ?></font></td>
            <?php } ?>
            <td class="left"><?php echo $baocao['time']; ?></td>
   
            <td class="right" width="80">
           
            [ <a href="javascript:confirmDelete('index.php?module=categories&act=xoa&id=<?=$baocao['id_bao_cao']?>')"  ><?php echo "Xóa"; ?></a>]
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