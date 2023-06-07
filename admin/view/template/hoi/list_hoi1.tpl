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
  <div class="search">
    <form action="" method="post" enctype="multipart/form-data" id="form">
    <table>
    <tr>
    <td width=""><b><?php echo title;?></b></td>  <td><input type="text" name="title"  class="validate[required] text-input tk timkiem_" id="title" /></td>
	<td rowspan="2" width="200">  <input type="submit" onclick="$('#form').submit();"  value="<?php echo tim_kiem; ?>" class="btntk_" id="form" />  </td>
     </tr>
   
    </table>
    </form>
    
   </div>
  <div class="content">
    <form action="" method="post" enctype="multipart/form-data" id="form">
      <table class="list">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
          
            
            <td class="left"> 
              <a href="<?php echo $sort_order; ?>"><?php echo $title; ?></a>
            </td>
            <td class="left"> 
              <a href="<?php echo $sort_order; ?>">Trả lời</a>
            </td>
             <td class="left"> 
              <a href="<?php echo $sort_order; ?>"><?php echo $author; ?></a>
            </td>
             <td class="left" width="100"> 
              <a href="<?php echo $sort_order; ?>"><?php echo $luot_xem; ?></a>
            </td>
            
            <td class="left" width="180">
              <a href="<?php echo $sort_name; ?>">Thời gian hỏi</a></td>     
            </td>
            <td class="right"><?php echo $cot_thao_tac; ?></td>
          </tr>
        </thead>
        <tbody>
         
          <?php if ($list_hoi) { ?>
          <?php foreach ($list_hoi as $hoi) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
              <?php } ?></td>

                
            <td class="left"><?php echo $hoi['title']; ?></td>
            <?php if($hoi['tra_loi']){ ?>
            <td class="left">Đã trả lời</td>
               <?php } else { ?>
              <td class="left"><?php echo "Chưa"; ?></td>  
            <?php } ?>
            <?php if($hoi['author']){ ?>
            <td class="left"><?php echo $hoi['author']; ?></td>
            <?php } else { ?>
              <td class="left"><?php echo "Đang cập nhập...."; ?></td>  
            <?php } ?>
            <td class="left"><?php echo $hoi['view']; ?></td>
            <td class="left"><?php echo date_format(date_create($hoi['time']),'H:i:s - d/m /Y');?></td>
            <td class="right" width="100">
            [ <a href="index.php?module=hoi&act=<?php echo "edit";?>&id=<?php echo $hoi['id_hoi']; ?>"><?php echo "Trả lời"; ?></a> ]
            [ <a href="javascript:confirmDelete('index.php?module=hoi&act=del&id=<?=$hoi['id_hoi']?>')"  ><?php echo "Xóa"; ?></a>]
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