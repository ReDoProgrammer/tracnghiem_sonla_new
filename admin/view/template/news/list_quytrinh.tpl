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
            
             <td class="center" width="10">
 		ID
             </td>
              <td class="center" width="50">Bên A</td>
              <td class="center" width="50"> Hành động</td>
               <td class="center" width="50">Bên B</td>
              
             <td class="center" width="10">
              Thao tác</td>
          </tr>
        </thead>
        <tbody>
         
          <?php if ($list_quy_trinh) { ?>
          <?php foreach ($list_quy_trinh as $quytrinh) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $quytrinh['tin_hoat_dong_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $quytrinh['tin_hoat_dong_id']; ?>" />
              <?php } ?></td>
              
 
            <td class="left"><?php echo  $quytrinh['quy_trinh_id']; ?></td>
            <td class="left"><?php echo  $quytrinh['ben_a']; ?></td>
            <td class="left"> <?php echo $quytrinh['hanh_dong']; ?></td>
            <td class="left"><?php echo  $quytrinh['ben_b']; ?></td>
            
           
             <td class="center" width="40">
        
            
            [ <a href="javascript:confirmDelete('index.php?module=tinhoatdong&act=del_quy_trinh&id=<?=$quytrinh['quy_trinh_id']?>')"  ><?php echo "Xóa"; ?></a>]
            
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