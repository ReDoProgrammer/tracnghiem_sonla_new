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
    
     <div style="padding-bottom: 5px;">
    <tr><td>Tìm kiếm sản phẩm: </td> <td> <input size="60" type="text" name="tieu_de" /></td>  <input type="submit" value="Search"/>
     <?php if ($error_tensp) { ?>
<span class="error"><?php echo $error_tensp; ?></span>
<?php } ?>
    </tr>
    </div>
    
      <table class="list">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
           <td class="left" width="50">
          
            <a href="<?php echo $sp['hinh_anh']; ?>"class="thickbox" rel="shadowbox"> <?php echo $hinh_anh; ?></a>
              </td>
            <td class="left">  
            <a href="<?php echo $sort_order; ?>"> <?php echo $ten_san_pham; ?></a>
              </td>
              <td class="left" width="140">  
            <a href="<?php echo $sort_order; ?>"> <?php echo "Theo danh mục" ?></a>
              </td>          
              <td class="left" width="100">  
            <a href="<?php echo $sort_order; ?>"> <?php echo $gia_san_pham; ?></a>
              </td>
              <td class="left" width="70">  
            <a href="<?php echo $sort_order; ?>"> <?php echo $so_luong; ?></a>
              </td>
              <td class="left" width="70">  
            <a href="<?php echo $sort_order; ?>"> <?php echo $dung_luong; ?></a>
              </td>
               <td class="left" width="70">  
            <a href="<?php echo $sort_order; ?>"> <?php echo "Kho hang"; ?></a>
              </td>
             <td class="left" width="140">
              <a href="<?php echo $sort_name; ?>"><?php echo $thoi_gian; ?></a></td>
         
            <td class="right"><?php echo $cot_thao_tac; ?></td>
          </tr>
        </thead>
        <tbody>
         
          <?php if ($list_sanpham) { ?>
          <?php foreach ($list_sanpham as $sp) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
              <?php } ?></td>

                <?php if($sp['hinh_anh']){?>
            <td class="left" width="50">
              <a href="<?php echo $sp['hinh_anh']; ?>"class="thickbox" rel="shadowbox width=500">
             <img src ="<?php echo $sp['hinh_anh'];?>" class="bimg" width="50" height ="50"/>
             </a>
             </td>
            <?php } else{?>
           <td class="left" width="50"> <img src ="../data/images/no_image.jpg" class="bimg" width="50" height ="50"/></td>
            <?php } ?>
            
            
            <td class="left"><?php echo $sp['tieu_de']; ?></td>
            <td class="left"><?php echo $sp['ten_danh_muc_sp']; ?></td>
            <td class="left"><?php echo number_format($sp['gia'],0,'.','.'); ?> VNĐ</td>
            <td class="left"><?php echo $sp['so_luong']; ?></td>
            <td class="left"><?php echo $sp['dung_luong']; ?></td>
            
            <td class="left" align="center">
            
            <?php if($sp['kho_hang']=='0'){ ?>
            <a href="index.php?module=sanpham&act=<?php echo "active";?>&id=<?php echo $sp['id_sp']; ?>"> <img src="./view/image/active.png" alt ="Hoạt động" title="Bấm để ngưng kích hoạt"/></a>
            <?php } else{?>
			
            <a href="index.php?module=sanpham&act=<?php echo "deactive";?>&id=<?php echo $sp['id_sp']; ?>"> 
            <img src="./view/image/de_active.png" title ="Bấm để kích hoạt" alt ="Không hoạt động"/>
            </a>
            <?php }?>
            
            </td>
            
            
            <td class="left"><?php echo $sp['time']; ?></td>
            
            <td class="right" width="80">
            [ <a href="index.php?module=sanpham&act=<?php echo "edit";?>&id=<?php echo $sp['id_sp']; ?>"><?php echo "Sửa"; ?></a> ]
            <?php if(($_SESSION['phan_quyen']=='1')) {?> 
            [ <a href="javascript:confirmDelete('index.php?module=sanpham&act=del&id=<?=$sp['id_sp']?>')"  ><?php echo "Xóa"; ?></a>]
            <?php } ?>
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