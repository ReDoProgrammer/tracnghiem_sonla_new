<?php include('view/template/common/header.tpl'); ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('./view/image/country.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo "Save"; ?></span></a><a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo "Cancel"; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        <tr>
          <td><span class="required">*</span> <?php echo "Tên hồ sơ"; ?></td>
          <td><input type="text" name="ten_ho_so" size="100" value="<?php echo $hoso['ten_ho_so']; ?>" />
            <?php if ($error_name) { ?>
            <span class="error"><?php echo $error_name; ?></span>
            <?php } ?></td>
        </tr>
    
         <tr>
          <td><span class="required"></span> <?php echo "Tên gọi khác"; ?></td>
          <td><input type="text" name="ten_goi_khac" size="100"  value="<?php echo $hoso['ten_goi_khac']; ?>" />
            <?php if ($error_name) { ?>
            <span class="error"><?php echo $error_name; ?></span>
            <?php } ?></td>
         </tr>
       
         <tr>
            <td><span class="required"></span> Huyện thị</td>
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
          
        <tr>
          <td><span class="required"></span> <?php echo "Thôn bản"; ?></td>
          <td><input type="text" name="thon_ban" size="70"  value="<?php echo $hoso['thon_ban']; ?>" />
            <?php if ($error_name) { ?>
            <span class="error"><?php echo $error_name; ?></span>
            <?php } ?></td>
        </tr>

        <tr>
          <td><span class="required"></span> <?php echo "Mô tả chung"; ?></td>
                  <td> 
                 <textarea type="text" rows="20" cols="97" name="mo_ta_chung"  id="ckeditor">
                   <?php echo $hoso['mo_ta_chung'];?>
                  </textarea>
                 </td>
          </tr>
        
           <tr>
           <td><span class="required"></span> <?php echo "Mô tả chi tiết"; ?></td>
                  <td> 
                 <textarea type="text" rows="20" cols="97" name="mo_ta_chi_tiet"  id="textarea">
                   <?php echo $hoso['mo_ta_chi_tiet'];?>
                  </textarea></td>
           </tr>
          
          <tr>
          <td><?php echo "Loại di tích" ?></td>
          <td><select name="loai_di_tich_id">
              <option value="0"><?php echo "Lựa chọn"; ?></option>
              <?php foreach ($loaiditich_list as $loaiditich) { ?>
              <?php if ($loaiditich['loai_di_tich_id'] == $editLoaiditich['loai_di_tich_id']) { ?>
              <option value="<?php echo $loaiditich['loai_di_tich_id']; ?>" selected="selected"><?php echo $loaiditich['loai_di_tich']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $loaiditich['loai_di_tich_id']; ?>"><?php echo $loaiditich['loai_di_tich']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
         </tr>

	  <tr>
          <td><?php echo "Loại hình di tích" ?></td>
          <td><select name="loai_hinh_di_tich_id">
              <option value="0"><?php echo "Lựa chọn"; ?></option>
              <?php foreach ($loaihinhditich_list as $loaihinhditich) { ?>
              <?php if ($loaihinhditich['loai_hinh_di_tich_id'] == $editLoaihinhditich['loai_hinh_di_tich_id']) { ?>
              <option value="<?php echo $loaihinhditich['loai_hinh_di_tich_id']; ?>" selected="selected"><?php echo $loaihinhditich['loai_hinh_di_tich']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $loaihinhditich['loai_hinh_di_tich_id']; ?>"><?php echo $loaihinhditich['loai_hinh_di_tich']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
         </tr>
    
           <tr>
          <td><?php echo "Phân cấp quản lý" ?></td>
          <td><select name="phan_cap_quan_ly_id">
              <option value="0"><?php echo "Lựa chọn"; ?></option>
              <?php foreach ($phancapquanly_list as $phancapquanly) { ?>
              <?php if ($phancapquanly['phan_cap_quan_ly_id'] == $editphancapquanly['phan_cap_quan_ly_id']) { ?>
              <option value="<?php echo $phancapquanly['phan_cap_quan_ly_id']; ?>" selected="selected"><?php echo $phancapquanly['phan_cap_quan_ly']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $phancapquanly['phan_cap_quan_ly_id']; ?>"><?php echo $phancapquanly['phan_cap_quan_ly']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
         </tr>


         <tr>
          <td><?php echo "Xếp hạng di tích" ?></td>
          <td><select name="xep_hang_di_tich_id">
              <option value="0"><?php echo "Lựa chọn"; ?></option>
              <?php foreach ($xephangditich_list as $xephangditich) { ?>
              <?php if ($xephangditich['xep_hang_di_tich_id'] == $editxephangditich['xep_hang_di_tich_id']) { ?>
              <option value="<?php echo $xephangditich['xep_hang_di_tich_id']; ?>" selected="selected"><?php echo $xephangditich['xep_hang_di_tich']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $xephangditich['xep_hang_di_tich_id']; ?>"><?php echo $xephangditich['xep_hang_di_tich']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
         </tr>


          <tr>
          <td><span class="required"></span> <?php echo "Năm xếp hạng"; ?></td>
          <td><input type="text" name="nam_xep_hang" id = "ngaythangnam" value="<?php echo $hoso['nam_xep_hang']; ?>" />
            <?php if ($error_name) { ?>
            <span class="error"><?php echo $error_name; ?></span>
           <?php } ?></td>
           </tr>

            <tr>
          <td><?php echo "Kiến trúc" ?></td>
          <td><select name="kien_truc_id">
              <option value="0"><?php echo "Lựa chọn"; ?></option>
              <?php foreach ($kientruc_list as $kientruc) { ?>
              <?php if ($kientruc['kien_truc_id'] == $editkientruc['kien_truc_id']) { ?>
              <option value="<?php echo $kientruc['kien_truc_id']; ?>" selected="selected"><?php echo $kientruc['kien_truc']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $kientruc['kien_truc_id']; ?>"><?php echo $kientruc['kien_truc']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
         </tr>

        <tr>
          <td><?php echo "Hiện trạng" ?></td>
          <td><select name="hien_trang_id">
              <option value="0"><?php echo "Lựa chọn"; ?></option>
              <?php foreach ($hientrang_list as $hientrang) { ?>
              <?php if ($hientrang['hien_trang_id'] == $edithientrang['hien_trang_id']) { ?>
              <option value="<?php echo $hientrang['hien_trang_id']; ?>" selected="selected"><?php echo $hientrang['hien_trang']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $hientrang['hien_trang_id']; ?>"><?php echo $hientrang['hien_trang']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
         </tr>

       <tr>
          <td><?php echo "Hiện vật trong di tích" ?></td>
          <td><select name="hien_vat_trong_di_tich_id">
              <option value="0"><?php echo "Lựa chọn"; ?></option>
              <?php foreach ($hienvattrongditich_list as $hienvattrongditich) { ?>
              <?php if ($hienvattrongditich['hien_vat_trong_di_tich_id'] == $edithienvattrongditich['hien_vat_trong_di_tich_id']) { ?>
              <option value="<?php echo $hienvattrongditich['hien_vat_trong_di_tich_id']; ?>" selected="selected"><?php echo $hienvattrongditich['hien_vat_trong_di_tich']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $hienvattrongditich['hien_vat_trong_di_tich_id']; ?>"><?php echo $hienvattrongditich['hien_vat_trong_di_tich']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
         </tr>

          <tr>
          <td><span class="required"></span> <?php echo "Cổ vật"; ?></td>
          <td><input type="text" name="co_vat" size="100"  value="<?php echo $hoso['co_vat']; ?>" />
            <?php if ($error_name) { ?>
            <span class="error"><?php echo $error_name; ?></span>
           <?php } ?></td>
           </tr>

           <tr>
          <td><span class="required"></span> <?php echo "Hiện vật mới"; ?></td>
          <td><input type="text" name="co_vat" size="100"  value="<?php echo $hoso['hien_vat_moi']; ?>" />
            <?php if ($error_name) { ?>
            <span class="error"><?php echo $error_name; ?></span>
           <?php } ?></td>
           </tr>

           
          <tr>
          <td><?php echo "Đất đai trong di tích"; ?> <span class="required"></span> </td>
                  <td> <textarea type="text" rows="5" cols="97" name="dat_dai_trong_di_tich" ></textarea></td>
          </tr>


         <tr>
          <td><?php echo "Công tác bảo vệ" ?></td>
          <td><select name="hien_vat_trong_di_tich_id">
              <option value="0"><?php echo "Lựa chọn"; ?></option>
              <?php foreach ($congtacbaove_list as $congtacbaove) { ?>
              <?php if ($congtacbaove['cong_tac_bao_ve_id'] == $editcongtacbaove['cong_tac_bao_ve_id']) { ?>
              <option value="<?php echo $congtacbaove['cong_tac_bao_ve_id']; ?>" selected="selected"><?php echo $congtacbaove['cong_tac_bao_ve']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $congtacbaove['cong_tac_bao_ve_id']; ?>"><?php echo $congtacbaove['cong_tac_bao_ve']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
         </tr>
           
          <tr>
          <td>  <span class="required"></span> <?php echo "Công tác tu bổ tôn tạo"; ?></td>
                  <td> <textarea type="text" rows="5" cols="97" name="cong_tac_tu_bo_ton_tao"></textarea></td>
          </tr>
    

         <tr><td>Tư liệu kèm theo</td>
         <td> 
          
         </a>
		
          <br/>
           <img src="view/image/attach.gif" alt="dinh kem"/><input type="file" name="file" id="file" /></td>
          </tr>
             



	 <tr>
	 <td></td>
	 <td></td>
	 </tr>
	
      </table>
    </form>
  </div>
           
 <div class="bottom_button"><a onclick="$('#form').submit();" class="button"><span><?php echo "Lưu lại"; ?></span></a><a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo "Hủy"; ?></span></a></div>

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