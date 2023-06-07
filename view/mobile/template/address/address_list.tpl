<div class="heading"><?php echo $heading_title;?> (<?php echo $_SESSION['name']; ?>)</div>
<div class="middle">
 <div class="bg">
       <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
         <table class="list_for_mem">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
            <td class="left">
          <?php echo "Tên địa chỉ"; ?>
            </td>
            <td class="date">
           <?php echo "Sửa lần cuối"; ?>
              </td>
              
            <td class="actions"><?php echo "Thao tác"; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($list) { ?>
          <?php foreach ($list as $address) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($local['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $address['info_address_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $address['info_address_id']; ?>" />
              <?php } ?></td>
            <td class="left"><?php echo $address['info_address_name'];?></td>
            <td class="left"><?php echo $address['last_edit'];?> </td>
           
            <td class="right"><?php //foreach ($actions as $action) { ?>
              [ <a href= "?m=address&act=edit&id=<?=$address['info_address_id']?>"  ><?php echo "Sua"; ?></a>]
              [ <a href= "javascript:confirmDelete('?m=address&act=del&id=<?=$address['info_address_id']?>')"  ><?php echo "Xoa"; ?></a>]
              <?php //}// ?></td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="5"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
       <div class="pagination"><?php echo $pagination; ?></div>
       </form>
      </div>
     
   </div>
</div>
 
<script type="text/javascript"><!--
function confirmDelete(delUrl) {
   if (confirm("Ban co chac chan la muon xoa bai viet nay")) {
     document.location = delUrl;
}
}
</script>
<!-- and main -->
