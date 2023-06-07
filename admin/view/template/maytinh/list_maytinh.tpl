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
          
            <a href="<?php echo $maytinh['hinh_anh']; ?>"class="thickbox" rel="shadowbox"> <?php echo $hinh_anh; ?></a>
              </td>
            <td class="left">  
            <a href="<?php echo $sort_order; ?>"> <?php echo $ten_san_pham; ?></a>
              </td>
              <td class="left" width="200">  
            <a href="<?php echo $sort_order; ?>"> <?php echo $ma_san_pham; ?></a>
              </td>
              <td class="left" width="150">  
            <a href="<?php echo $sort_order; ?>"> <?php echo $gia_san_pham; ?></a>
              </td>
             <td class="left" width="140">
              <a href="<?php echo $sort_name; ?>"><?php echo $thoi_gian; ?></a></td>
         
            <td class="left" width="120">
              <a href="<?php echo $sort_date_added; ?>"> <?php echo $kho_hang; ?>
              
              </a>
            </td>
            <td class="right"><?php echo $cot_thao_tac; ?></td>
          </tr>
        </thead>
        <tbody>
         
          <?php if ($list_maytinh) { ?>
          <?php foreach ($list_maytinh as $maytinh) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
              <?php } ?></td>

                <?php if($maytinh['hinh_anh']){?>
            <td class="left" width="50">
              <a href="<?php echo $maytinh['hinh_anh']; ?>"class="thickbox" rel="shadowbox width=500">
             <img src ="<?php echo $maytinh['hinh_anh'];?>" class="bimg" width="50" height ="50"/>
             </a>
             </td>
            <?php } else{?>
           <td class="left" width="50"> <img src ="../data/images/no_image.jpg" class="bimg" width="50" height ="50"/></td>
            <?php } ?>
            
            
            <td class="left"><?php echo $maytinh['ten_san_pham']; ?></td>
            <td class="left"><?php echo $maytinh['ma_san_pham']; ?></td>
            <td class="left"><?php  echo number_format($maytinh['gia_san_pham'],0,'.','.'); ?> VNĐ</td>
            <td class="left"><?php echo $maytinh['thoi_gian']; ?></td>
            <td class="left">
           
            <?php  if($maytinh['kho_hang']=='1') { echo "Còn hàng";} 
            else if($maytinh['kho_hang']=='0') { echo "Hết hàng";} 
            else if($maytinh['kho_hang']=='2') { echo "Đợi vài ngày";}
            
            
            ?>
             
            
            </td>
            <td class="right" width="80">
            [ <a href="index.php?module=maytinh&act=<?php echo "edit";?>&id=<?php echo $maytinh['ma_may_tinh']; ?>"><?php echo "Sửa"; ?></a> ]
            [ <a href="javascript:confirmDelete('index.php?module=maytinh&act=del&id=<?=$maytinh['ma_may_tinh']?>')"  ><?php echo "Xóa"; ?></a>]
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