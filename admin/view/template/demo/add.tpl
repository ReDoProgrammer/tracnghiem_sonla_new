<?php include('view/template/common/header.tpl'); ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('./view/image/country.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $save; ?></span></a><a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo $cancel; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        
        <!-- cac control-->
        <!-- text box-->
         <tr>
          <td><span class="required">*</span> <?php echo "Input text"; ?></td>
          <td><input type="text" name="ten_ho_so" size="100" value="<?php echo $hoso['ten_ho_so']; ?>" />
            <?php if ($error_name) { ?>
            <span class="error"><?php echo $error_name; ?></span>
            <?php } ?></td>
        </tr>
       
         <!-- text box-->
         <tr>
          <td><span class="required">*</span> <?php echo "Input pwd"; ?></td>
          <td><input type="password" name="mat_khau" size="100" value="<?php echo $hoso['ten_ho_so']; ?>" />
            <?php if ($error_name) { ?>
            <span class="error"><?php echo $error_name; ?></span>
            <?php } ?></td>
        </tr>

        <!-- combobox-->
         <tr>
            <td><span class="required"></span>Selection box 2 cấp</td>
            <td><select name="huyen_id" id="huyen_id" onchange="$('select[name=\'xa_id\']').load('index.php?m=selection&act=zones&huyen_id='+this.value+'&xa_id=<?php echo $hoso['xa_id'];?>');">
                <option value="FALSE"><?php echo "---"; ?></option>
                <?php foreach ($list_huyen as $huyen) { ?>
                <?php if ($huyen['location_id'] == $parent) { // edit la de sua?> 
                <option value="<?php echo $paren['location_id']; ?>" selected="selected"><?php echo $paren['location']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $paren['location_id']; ?>"><?php echo $paren['location']; ?></option>
                <?php } ?>
                <?php } ?>
               </select>
                - Xã 
                <select name="location_id">
                </select>
           </td>
          </tr>
          
        <!-- text area ckeditor simple-->

        <tr>
          <td><span class="required"></span> <?php echo "Ckeditor đơn giản"; ?></td>
                  <td> 
                 <textarea type="text" rows="20" cols="97" name="mo_ta_chung"  id="ckeditor">
                   <?php echo $hoso['mo_ta_chung'];?>
                  </textarea>
                 </td>
          </tr>
       
        <!-- text area ckeditor full -->

           <tr>
           <td><span class="required"></span> <?php echo "Ckeditor full"; ?></td>
                  <td> 
                 <textarea type="text" rows="20" cols="97" name="mo_ta_chi_tiet"  id="textarea">
                   <?php echo $hoso['mo_ta_chi_tiet'];?>
                  </textarea></td>
           </tr>
          
         <!-- textbox date time picker -->

          <tr>
          <td><span class="required"></span> <?php echo "Input date picker"; ?></td>
          <td><input type="text" name="nam_xep_hang" id = "ngaythangnam" value="<?php echo $hoso['nam_xep_hang']; ?>" />
            <?php if ($error_name) { ?>
            <span class="error"><?php echo $error_name; ?></span>
           <?php } ?></td>
           </tr>

      

          <tr>
          <td><span class="required">*</span> <?php echo "Yêu cầu phải nhập"; ?></td>
          <td><input type="text" name="co_vat" size="100"  value="<?php echo $hoso['co_vat']; ?>" />
            <?php if ($error_name) { ?>
            <span class="error"><?php echo $error_name; ?></span>
           <?php } ?></td>
           </tr>

             <!-- text area simple-->

          <tr>
          <td><?php echo "Text area đơn giản"; ?> <span class="required"></span> </td>
                  <td> <textarea type="text" rows="5" cols="97" name="dat_dai_trong_di_tich" ></textarea></td>
          </tr>

             <!-- attach file-->
         <tr><td>File brows</td>
         <td> <img src="view/image/attach.gif" alt="dinh kem"/><input type="file" name="file" id="file" /></td>
          </tr>
             
                      <!-- combobox1-->
        <tr>
         <td>combobox 1</td>
        <td><select name="active">
                  <?php if ($address['active']=='0') { ?>
                  <option value="1" ><?php echo "Bật"; ?></option>
                  <option value="0" selected="selected"><?php echo "Tắt"; ?></option>
                  <?php } else { ?>
                  <option value="1" selected="selected"><?php echo "Bật"; ?></option>
                  <option value="0"><?php echo "Tắt"; ?></option>
                  <?php } ?>
            </select></td>
            </tr>
         <tr>
    <!-- radio-->
   <tr><td>radio</td>
      <td>
     
      <input type="radio" name="status" value="<?php echo $vl; ?>" checked> <?php echo $key;?>
     
      <input type="radio" name="status" value="<?php echo $vl; ?>"> <?php echo $key;?>
     
      </td>
    <tr>
  <!-- them mot textbox  test -->
       <!-- text box-->
         <tr>
          <td><span class="required">*</span> <?php echo $test; ?></td>
          <td><input type="text" name="test" size="100" value="" />
            <?php if ($error_name) { ?>
            <span class="error"><?php echo $error_name; ?></span>
            <?php } ?></td>
        </tr>


	 <tr>
	 <td></td>
	 <td></td>
	 </tr>
	
      </table>
    </form>
  </div>
           
 <div class="bottom_button"><a onclick="$('#form').submit();" class="button"><span><?php echo $save; ?></span></a><a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo $cancel; ?></span></a></div>

</div>
<?php include('view/template/common/footer.tpl'); ?>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
		//<![CDATA[
				CKEDITOR.replace( 'ckeditor',
				{
					extraPlugins : 'uicolor',
					toolbar :
					[
						[ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink','-','Image' ],
						[ 'UIColor' ]
					]
				});

                                CKEDITOR.replace( 'motachitiet',
				{
					extraPlugins : 'uicolor',
					toolbar :
					[
						[ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink','-','Image' ],
						[ 'UIColor' ]
					]
				});

		//]]>
</script>

<script type="text/javascript">
CKEDITOR.replace('textarea', {

});
</script>

<script type="text/javascript">
		//<![CDATA[
				

                                CKEDITOR.replace( 'datdaitrongditich',
				{
					extraPlugins : 'uicolor',
					toolbar :
					[
						[ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink','-','Image' ],
						[ 'UIColor' ]
					]
				});




		//]]>
</script>
        
<script type="text/javascript" src="view/javascript/jquery/ui/ui.datepicker.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#ngaythangnam').datepicker({dateFormat: 'dd-mm-yy'});
});
//--></script>