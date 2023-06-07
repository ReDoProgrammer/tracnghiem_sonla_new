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
            <td class="left" width="50"><?php echo $hinh_anh; ?></td>
            <td class="left" width="200">
            <a href="<?php echo $sort_order; ?>"> <?php echo $tieu_de; ?></a></td>
            <td class="left" width="150"><?php echo $ho_ten; ?></td>
            <td class="left" width="150"><?php echo $phone; ?></td>
            <td class="left" width="250"><?php echo $dia_chi; ?></td>
            <td class="left" width="150"><?php echo $email; ?></td>
            <td class="left" width="250"><?php echo $thanh_toan; ?></td>
            <td class="left" width="250"><?php echo $gia_san_pham; ?></td>
			<td class="left" width="250"><?php echo $time; ?></td>
            <td class="right" width="150"><?php echo $cot_thao_tac; ?></td>
          </tr>
        </thead>
        <tbody>
         
          <?php if ($list_cart) { ?>
          <?php foreach ($list_cart as $cart) { ?>
          <tr>
           <td style="text-align: center;"><?php if ($cart['id_cart']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $cart['id_cart']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $cart['id_cart']; ?>" />
              <?php } ?></td>

             <?php if($cart['hinh_anh']){?>
            <td class="left" width="50">
              <a href="<?php echo $cart['hinh_anh']; ?>"class="thickbox" rel="shadowbox">
             <img src ="<?php echo $cart['hinh_anh'];?>" class="bimg" width="50" height ="50"/>
             </a>
             </td>
            <?php } else{?>
           <td class="left" width="50"> <img src ="../data/images/no_image.jpg" class="bimg" width="50" height ="50"/></td>
            <?php } ?>
            <td class="left"><?php echo $cart['tieu_de']; ?></td>
            <td class="left"><?php echo $cart['ten_ban']; ?></td>
            <td class="left"><?php echo $cart['phone']; ?></td>
            <td class="left"><?php echo $cart['dia_chi']; ?></td>
            <td class="left"><?php echo $cart['email']; ?></td>
            <td class="left">
            <?php if($cart['thanh_toan']=='1') {echo "Chuyển khoản ATM " ;}
            else if($cart['thanh_toan']=='2'){echo "Tiền mặt (Thanh toán trực tiếp)" ;}
            else if($cart['thanh_toan']=='3'){echo "Chuyển tiền qua bưu điện " ;}
            ?>
            </td>
            <td class="left">
            <?php if($cart['gia']) {?>
                                    <font color="red"><?php echo number_format($cart['gia'],0,',',','); ?></font>  VNĐ
                                                <?php } else{?>
                                    <b>Liên hệ</b>
                                    <?php } ?>
            </td>
			<td class="left"><?php echo $cart['time']; ?></td>
            <td class="right" width="80">
            [ <a href="index.php?module=datphong&act=<?php echo "view";?>&id=<?php echo $lienhe['ma_dat_phong']; ?>"><?php echo "Xem"; ?></a> ]
             [ <a href="javascript:confirmDelete('index.php?module=cart&act=del&id=<?=$cart['id_cart']?>')"  ><?php echo "Xóa"; ?></a>]
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