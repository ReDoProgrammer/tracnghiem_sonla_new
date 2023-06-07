<?php include('view/template/common/header.tpl'); ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('./view/image/country.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo "Lưu Lại"; ?></span></a><a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo "Hủy"; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
       <tr><td>Tên người dùng </td><td><b><?php echo $canbo['tai_khoan'];?></b>
        <?php if ($error_name) { ?>
            <span class="error"><?php //echo $error_name; ?></span>
            <?php } ?>
             </td></tr>


    <tr>
         <td>Danh mục tin</td>
	<td>
          <select name="id" id="cha_id" onchange="$('select[name=\'cat_id\']').load('index.php?module=tinhoatdong&act=cat&cha_id='+this.value+'&cat_id=<?php echo $tinhoatdong['cat_id'];?>');">
               <option>----------<?php echo "Lựa chọn"; ?>----------</option>
               <?php foreach ($list_danhmuc as $danhmuc){?> 
               <?php if ($danhmuc['id'] == $cha_id) { ?>
              <option value="<?php echo $danhmuc['id'] ; ?>" selected="selected"><?php echo $danhmuc['title']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $danhmuc['id']; ?>"><?php echo $danhmuc['title']; ?></option>
              <?php } ?>

              <?php } ?>
            </select>
<!--
           -
              <select name="cat_id">
              </select>
-->
            </td>
		</tr>
      </table>
    </form>

 <table class="list">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
    <td class="left" width="10">
              UID </td>        
 <td class="left">
             
              <a href="<?php echo $sort_order; ?>">Tài khoản</a>
              </td>
  <td> Họ tên </td>
            <td> Quyền </td>
         
            <td class="left" width="100">
             Mã Chuyên mục
            </td>
            <td class="left">
              Tên chuyên mục
            </td>
           
           

            <td class="right"><?php echo $cot_thao_tac; ?></td>
          </tr>
        </thead>
        <tbody>
         
          <?php if ($list_quyen_chuyen_muc) { ?>
          <?php foreach ($list_quyen_chuyen_muc as $quyen_chuyen_muc) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $quyen_chuyen_muc['qcm_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $quyen_chuyen_muc['qcm_id']; ?>" />
              <?php } ?></td>
            <td class="left"><?php echo $quyen_chuyen_muc['user_id']; ?></td>
            <td class="left"><?php echo $quyen_chuyen_muc['tai_khoan']; ?></td>
            <td class="left"><?php echo $quyen_chuyen_muc['ho_ten']; ?></td>
            <td> <?php echo $quyen_chuyen_muc['role_name']; ?> </td>
            <td class="center"><?php echo $quyen_chuyen_muc['id']; ?></td>
            <td class="left"><?php echo $quyen_chuyen_muc['title']; ?></td>
           
            
           
            <td class="right" width="50">
          
             <!--  [ <a href="index.php?module=canbo&act=<?php echo "edit";?>&id=<?php echo $quyen_chuyen_muc['cbid']; ?>"><?php echo "Sửa"; ?></a> ]-->
            
            [ <a href="javascript:confirmDelete('index.php?module=member&act=del_phan_quyen_chuyen_muc&uid=<?php echo $quyen_chuyen_muc['user_id']; ?>&qcm_id=<?=$quyen_chuyen_muc['qcm_id']?>')"  ><?php echo "Xóa"; ?></a>]
          
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


  </div><div class="bottom_button"><a onclick="$('#form').submit();" class="button"><span><?php echo "Lưu Lại"; ?></span></a><a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo "Hủy"; ?></span></a></div>
</div>
<?php include('view/template/common/footer.tpl'); ?>
<script type="text/javascript"><!--
$('select[name=\'cat_id\']').load('index.php?module=tinhoatdong&act=cat&cha_id=<?php echo $cha_id;?>&cat_id=<?php echo $tinhoatdong['cat_id']; ?>');
//--></script>