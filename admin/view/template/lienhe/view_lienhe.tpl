<style>
.hoso {
	border-collapse: collapse;
	width: 100%;
	border-top: 1px solid #DDDDDD;
	border-left: 1px solid #DDDDDD;
	margin-bottom: 20px;
}
.hoso td {
	border-right: 1px solid #DDDDDD;
	border-bottom: 1px solid #DDDDDD;
}
.hoso thead td {
	background-color: #EFEFEF;
	padding: 0px 5px;
}
.hoso thead td a, .hoso thead td {
	text-decoration: none;
	color: #222222;
	font-weight: bold;
}
.hoso tbody a {
	text-decoration: underline;
}

.hoso tbody td {
        vertical-align: middle;
	    padding: 5px 5px;
}

.tit{
    text-transform: uppercase;
    text-align: center;
    font-size: 16px;
    font-weight: bold;
    color: red;
}
</style>


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
       <tr><td><?php echo $ten_can_bo; ?></td><td><?php echo $_SESSION['tencanbo'];?>
        <?php if ($error_name) { ?>
            <span class="error"><?php echo $error_name; ?></span>
            <?php } ?>
             </td></tr>
       <tr><td><?php echo $ngay_sinh; ?></td><td><input type="text" name="ngay_sinh" id="ngaythangnam" value="<?php echo $_SESSION['ngaysinh'];?>" />
       <?php if ($error_ns) { ?>
            <span class="error"><?php echo $error_ns; ?></span>
            <?php } ?>
            </td></tr>
       <tr><td><?php echo $ten_dang_nhap; ?></td><td><input type="text" name="ten_dang_nhap" value="<?php echo  $_SESSION['tendangnhap'];?>"/>
      <?php if ($error_dn) { ?>
            <span class="error"><?php echo $error_dn; ?></span>
            <?php } ?> </td></tr>
       <tr><td><?php echo $mat_khau; ?></td><td><input type="password" name="mat_khau" value=""/>
       <?php if ($error_mk) { ?>
            <span class="error"><?php echo $error_mk; ?></span>
            <?php } ?></td></tr>
       <tr><td><?php echo $xac_nhan_mat_khau; ?></td><td><input type="password" name="xac_nhan_mat_khau" value=""/>
        <?php if ($error_mk1) { ?>
            <span class="error"><?php echo $error_mk1; ?></span>
            <?php } ?></td></tr>
        <tr>
          <td><?php echo $chuc_danh; ?></td>
          <td><select name="chuc_danh_id">
              <option value="0"><?php echo "Lựa chọn"; ?></option>
              <?php foreach ($list_chucdanh as $chucdanh) { ?>
              <?php if ($chucdanh['chuc_danh_id'] == $_SESSION['chucdanh']) { ?>
              <option value="<?php echo $chucdanh['chuc_danh_id']?>" selected="selected"><?php echo $chucdanh['ten_chuc_danh']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $chucdanh['chuc_danh_id']; ?>"><?php echo $chucdanh['ten_chuc_danh']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
                    <?php if ($error_chucdanh) { ?>
            <span class="error"><?php echo $error_chucdanh; ?></span>
            <?php } ?>
            </td>
         </tr>
                 <tr>
          <td><?php echo $phong_ban; ?></td>
          <td><select name="phong_ban_id">
              <option value="0"><?php echo "Lựa chọn"; ?></option>
              <?php foreach ($list_phongban as $phongban) { ?>
              <?php if ($phongban['phong_ban_id'] == $_SESSION['phongban']) { ?>
              <option value="<?php echo $phongban['phong_ban_id']; ?>"selected="selected"><?php echo $phongban['ten_phong_ban']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $phongban['phong_ban_id']; ?>"><?php echo $phongban['ten_phong_ban']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
            <?php if ($error_phongban) { ?>
            <span class="error"><?php echo $error_phongban; ?></span>
            <?php } ?>
            </td>
         </tr>
          <tr><td><?php echo $dia_chi; ?></td><td><textarea type="text" rows="5" cols="100" name="dia_chi"><?php echo $_SESSION['diachi'];?></textarea>
          <?php if ($error_diachi) { ?>
            <span class="error"><?php echo $error_diachi; ?></span>
            <?php } ?></td></tr>
          <tr><td><?php echo $dien_thoai_noi_bo; ?></td><td><input type="text" name="dien_thoai_noi_bo" value="<?php echo $_SESSION['dtnoibo'];?>"/>
                    <?php if ($error_noibo) { ?>
            <span class="error"><?php echo $error_noibo; ?></span>
            <?php } ?></td></tr>
          <tr><td><?php echo $dien_thoai_co_quan; ?></td><td><input type="text" name="dien_thoai_co_quan" value="<?php echo $_SESSION['dtcoquan'];?>"/>
                    <?php if ($error_coquan) { ?>
            <span class="error"><?php echo $error_coquan; ?></span>
            <?php } ?></td></tr>
          <tr><td><?php echo $dien_thoai_nha_rieng; ?></td><td><input type="text" name="dien_thoai_nha_rieng" value="<?php echo $_SESSION['dtnharieng'];?>"/>
                    <?php if ($error_nharieng) { ?>
            <span class="error"><?php echo $error_nharieng; ?></span>
            <?php } ?></td></tr>
          <tr><td><?php echo $di_dong; ?></td><td><input type="text" name="di_dong" value="<?php echo $_SESSION['dd'];?>"/>
                              <?php if ($error_dd) { ?>
            <span class="error"><?php echo $error_dd; ?></span>
            <?php } ?></td></tr>
          <tr><td><?php echo $fax; ?></td><td><input type="text" name="fax" value="<?php echo $_SESSION['fax'];?>"/></td></tr>
          <tr><td><?php echo $email; ?></td><td><input type="text" name="email" value="<?php echo $_SESSION['email'];?>"/>
          <?php if ($error_email) { ?>
            <span class="error"><?php echo $error_email; ?></span>
            <?php } ?></td></tr>
          <tr><td><?php echo $trang_thai; ?></td><td><input type="checkbox" name="trang_thai" value=""/></td></tr>
          
          <tr>
          <td><?php echo $dan_toc; ?></td>
          <td><select name="dan_toc_id">
              <option value="0"><?php echo "Lựa chon"; ?></option>
              <?php foreach ($list_dantoc as $dantoc) { ?>
              <?php if ($dantoc['dan_toc_id'] == $_SESSION['dantoc']) { ?>
              <option value="<?php echo $dantoc['dan_toc_id']; ?>" selected="selected"><?php echo $dantoc['ten_dan_toc']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $dantoc['dan_toc_id']; ?>"><?php echo $dantoc['ten_dan_toc']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
            <?php if ($error_dantoc) { ?>
            <span class="error"><?php echo $error_dantoc; ?></span>
            <?php } ?>
            </td>
         </tr>
	 <tr>
	 <td></td>
	 <td></td>
	 </tr>
	
      </table>
      
      <table class="hoso">
      <tr>
     
      <td>ten </td> <td> <?php echo $lienhe['tieu_de'];?> </td>     
      
      
      </tr>
      
      
      
      </table>
      
      
      
    </form>
  </div><div class="bottom_button"><a onclick="$('#form').submit();" class="button"><span><?php echo "Lưu Lại"; ?></span></a><a onclick="location = '<?php echo $link_list; ?>';" class="button"><span><?php echo "Hủy"; ?></span></a></div>
</div>
<?php include('view/template/common/footer.tpl'); ?>