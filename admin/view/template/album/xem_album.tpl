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
    <!-- begin mom and kid  -->	
     <div class="top1">
	 <div class="left"> </div>
	 <div class="right"></div>
	 <div class="center">
	 </div>
	 </div>


      <div class="middle"> 

      <div class ="box-content">
                      <div class="box-product">
 	    <?php foreach($list_hinhanh as $hinhanh) { ?>
		   <div>
		        
                         <?php if($hinhanh['hinh_anh']) {?>
<a href="<?php echo $hinhanh['hinh_anh']; ?>" class="thickbox" rel="shadowbox">              
      <img src ="<?php echo $hinhanh['hinh_anh'];?>" class="bimg" width="140" height ="100" style="border: 4px solid #ebebeb; box-shadow: 2px 1px 6px 1px #000000;"/> </a>
                        
                         <?php } ?>
		        
		     <td align="center"><br>
            [ <a href="index.php?module=album&act=<?php echo "editanh";?>&id=<?php echo $hinhanh['ma_anh']; ?>"><?php echo "Sửa"; ?></a> ]
            [ <a href="javascript:confirmDelete('index.php?module=album&act=xoaanh&id=<?=$hinhanh['ma_anh']?>')"  ><?php echo "Xóa"; ?></a>]
            </br></td>
            
		     </div>
         <?php } ?>

		 </div>
	</div>

      </div>


	<div class="bottom">
	  <div class="left"></div>
	  <div class="right"></div>
	  <div class="center"></div>
	</div>  

<!-- end feature -->
    
  </div>
</div>

<script type="text/javascript" src="./theme/javascript/jquery/ui/ui.datepicker.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#date').datepicker({dateFormat: 'dd-mm-yy'});
});
//--></script>
<?php include('view/template/common/footer.tpl'); ?>