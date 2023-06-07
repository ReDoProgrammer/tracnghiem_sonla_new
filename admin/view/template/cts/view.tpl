<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Thông Tin Đăng Ký
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=cts&act=list">Thông Tin</a></li>
        <li class="active"> <?php if($cts['tochuc_canhan_id']=='1') {echo "Cá Nhân" ;}
											else if($cts['tochuc_canhan_id']=='2'){echo "Tổ Chức" ;}
									?></li>
    </ol>

            </section>
          
		
		  
		  

		  <?php if($cts['tochuc_canhan_id']=='1') { ?>
		   <!-- Main content -->
    <section class="content">		<?php if($_SESSION['success']) {?>
			<div class="success">Đã gửi thư thành công!</div>		 <?php } ?>		<?php if($_SESSION['warning']) {?>			<div class="warning">Lỗi gửi thư, nhập đủ thông tin!</div>		 <?php } ?>
      <div class="row">
       
        <!-- /.col -->
        <div class="col-md-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab">Thông Tin Cá Nhân</a></li>
              <li><a href="#timeline" data-toggle="tab">Xem File Word</a></li>
              <li><a href="#settings" data-toggle="tab">Thông Tin Phản Hồi</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="activity">
                <!-- Post -->
                
				   <div class="box-body"> 
                            <div class="row">
                                <div class="col-md-6" id="pop1">
                                
                                    <div class="form-group">
                                        <label>Họ Và Tên: &nbsp;</label>
                                        <span id="ctl00_phContent_lblNgaysinh" class="text-center"><?php echo $cts['ho_ten']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Ngày Sinh: &nbsp;</label>
                                        <span id="ctl00_phContent_lblNoisinh" class="text-center"><?php echo $cts['ngay_sinh']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Số CMTND: &nbsp;</label>
                                        <span id="ctl00_phContent_lblGioitinh" class="text-center"><?php echo $cts['so_cmt']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Ngày Cấp: &nbsp;</label>
                                        <span id="ctl00_phContent_lblQuequan" class="text-center"><?php echo $cts['ngay_cap']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Nơi Cấp: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDiachi" class="text-center"><?php echo $cts['noi_cap']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>CQ / Đơn Vị: &nbsp;</label>
                                        <span id="ctl00_phContent_lblTongiao" class="text-center"><?php echo $cts['ten_co_quan']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Tỉnh Thành: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDantoc" class="text-center"><?php echo $cts['tinh_thanh']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Địa Chỉ: &nbsp;</label>
                                        <span id="ctl00_phContent_lblCMND" class="text-center"><?php echo $cts['dia_chi']; ?></span>
                                    </div>
                                </div>
                                <div class="col-md-6" id="pop2">
                                    <div class="form-group">
                                        <label>Cá Nhân / Tổ Chức: &nbsp;</label>
                                        <span id="ctl00_phContent_lblNgaycap" class="text-center">
										  <?php if($cts['tochuc_canhan_id']=='1') {echo "Cá Nhân" ;}
											else if($cts['tochuc_canhan_id']=='2'){echo "Tổ Chức" ;}
									?>
										</span>
                                    </div>
                                    <div class="form-group">
                                        <label>Chức Vụ: &nbsp;</label>
                                        <span id="ctl00_phContent_lblNoicap" class="text-center"><?php echo $cts['chuc_vu']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Chức Danh: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDoanvien" class="text-center"><?php echo $cts['chuc_danh']; ?></span>
                                    </div>
								<?php if($cts['chung_thu_cu']){?>
                                    <div class="form-group">
                                        <label>Chứng Thư Cũ: &nbsp;</label> 
                                        <span id="ctl00_phContent_lblDangvien" class="text-center">Không</span>
                                    </div>
								<?php } ?>
                                   
                                    <div class="form-group">
                                        <label>Điện thoại: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDienthoai" class="text-center"><?php echo $cts['dien_thoai']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Email: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDidong" class="text-center"><?php echo $cts['email']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label> Ghi Chú: &nbsp;</label>
                                        <span id="ctl00_phContent_lblEmail" class="text-center"><?php echo $cts['ghi_chu']; ?></span>
                                    </div>
									
									 <div class="form-group">
                                        <label>Thời gian đăng ký: &nbsp;</label>
                                        <span id="" class="text-center"><?php echo date_format(date_create($cts['time']),'H:i:s - d/m/Y'); ?></span>
                                    </div>
									 <div class="form-group">
                                        <label>Sửa lần cuối: &nbsp;</label>
                                        <span id="" class="text-center"><?php echo date_format(date_create($cts['edit_time']),'H:i:s - d/m/Y'); ?></span>
                                    </div>
									
									
                                </div>
                                   
                          
                              
                            </div>
                            </div><!-- /.box-body -->      
							
				
				
                <!-- /.post -->

             

              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="timeline">
              <div class="box box-primary">
<h3 class="box-title">Chi tiết

</h3>

</div>
			  <div class="box-body">
<div class="row">
		


 <div style="display: block;">
                  
                             <div class="form-group">
							 

<body>
<table width="1024">
  <tr>
    <td width="395" valign="top"><p align="center">UBND    T&#7880;NH S&#416;N LA<br />
            <strong>S&#7902; TH&Ocirc;NG TIN V&Agrave; TRUY&#7872;N    TH&Ocirc;NG</strong></p></td>
    <td width="584" valign="top"><p align="center"><strong>C&#7896;NG H&Ograve;A X&Atilde; H&#7896;I CH&#7910; NGH&#296;A VI&#7878;T NAM</strong><strong><br />
      </strong><strong>&#272;&#7897;c l&#7853;p - T&#7921; do - H&#7841;nh ph&uacute;c<br />
      </strong></p></td>
  </tr>
</table>
<p align="center"><strong>DANH S&Aacute;CH</strong> <br />
    <strong>&#272;&#7873; ngh&#7883;  c&#7845;p ch&#7913;ng th&#432; s&#7889; cho c&aacute; nh&acirc;n</strong><br />
    <em>(ban h&agrave;nh k&egrave;m theo C&ocirc;ng v&#259;n s&#7889;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  /
	STTTT-CNTT <br>ngày   <?php echo date_format(date_create($cts['time']),'d'); ?>    tháng   <?php echo date_format(date_create($cts['time']),'m'); ?>   năm   <?php echo date_format(date_create($cts['time']),'Y'); ?>     của Sở TT&TT tỉnh Sơn La)</em></p>
<p align="center">K&iacute;nh  g&#7917;i: C&#7909;c C&#417; y&#7871;u  &#272;&#7843;ng v&agrave; Ch&iacute;nh quy&#7873;n - Ban C&#417; y&#7871;u Ch&iacute;nh ph&#7911;.<br />
  S&#7889; l&#432;&#7907;ng &#273;&#259;ng k&yacute;: <?php echo $cts['id_cts'];?> <br /><br />
  Danh s&aacute;ch &#273;&#259;ng k&yacute;: C&#7845;p ch&#7913;ng th&#432; s&#7889; cho c&aacute; nh&acirc;n</p>
<table border="1" cellspacing="0" cellpadding="0" width="1024">
  <tr>
    <td width="1"><br /></td>
    <td width="53"><p align="center"><strong>STT</strong><strong> </strong></p></td>
    <td width="139"><p align="center"><strong>H&#7885; t&ecirc;n</strong><strong> </strong></p></td>
    <td width="85"><p align="center"><strong>Ng&agrave;y sinh</strong><strong> </strong></p></td>
    <td width="120"><p align="center"><strong>S</strong><strong>&#7889; </strong><strong>CMND/ H&#7897; chi&#7871;u/</strong><strong>ng&agrave;y c&#7845;p</strong><strong> / n&#417;i c&#7845;p</strong><strong> </strong></p></td>
    <td colspan="2"><p align="center"><strong>T&ecirc;n c&#417; quan, &#273;&#417;n     v&#7883;</strong><strong> </strong></p></td>
    <td width="70"><p align="center"><strong>T&#7881;nh/ Th&agrave;nh ph&#7889;</strong><strong> </strong></p></td>
    <td width="75"><p align="center"><strong>Ch&#7913;c v&#7909;</strong><strong> </strong></p></td>
    <td width="128"><p align="center"><strong>Ch&#7913;c danh c&#7911;a ng&#432;&#7901;i c&oacute; th&#7849;m quy&#7873;n (1)</strong><strong> </strong></p></td>
    <td width="104"><p align="center"><strong>&#272;&#7883;a ch&#7881; th&#432; &#273;i&#7879;n     t&#7917;</strong><strong> </strong></p></td>
    <td width="50"><p align="center"><strong>S</strong><strong>&#7889; </strong><strong>ch&#7913;ng th</strong><strong>&#432; </strong><strong>s&#7889; c&#361; (n&#7871;u c&oacute;</strong><strong>)</strong></p></td>
    <td colspan="2"><p align="center"><strong>Ghi ch&uacute;</strong></p></td>
  </tr>
  <tr>
    <td width="1" height="41"></td>
    <td width="53" align="center">
      <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?>
 </td>
    <td width="139"><p><?php echo $cts['ho_ten'];?></p></td>
    <td width="85"><p align="center"><?php echo $cts['ngay_sinh'];?></p></td>
    <td width="120"><p align="center"><?php echo $cts['so_cmt'];?></br><?php echo $cts['ngay_cap'];?></br><?php echo $cts['noi_cap'];?></p></td>
    <td colspan="2"><p align="center"><?php echo $cts['ten_co_quan'];?></p></td>
    <td width="70"><p align="center"><?php echo $cts['tinh_thanh'];?></p></td>
    <td width="75"><p align="center"><?php echo $cts['chuc_vu'];?></p></td>
    <td width="128"><p align="center"><?php echo $cts['chuc_danh'];?></p></td>
    <td width="104"><p align="center"><?php echo $cts['email'];?></p></td>
    <td width="50"><p align="center"><?php echo $cts['chung_thu_cu'];?></p></td>
    <td colspan="2"><p align="center"><?php echo $cts['ghi_chu'];?></p></td>
  </tr>

 
  <tr>
    <td colspan="6" valign="top"><p align="center"><strong>&nbsp;</strong></p>
        <p align="center"><strong>Ng&#432;&#7901;i l&#7853;p</strong><strong><br />
        </strong></p>
      <p align="center"><em>&nbsp;</em></p>
    <p align="center"><strong>&#272;&agrave;m Quang Trung</strong> </p></td>
    <td colspan="7" valign="top"><p align="center"><strong>S&#7902; TH&Ocirc;NG TIN V&Agrave; TRUY&#7872;N TH&Ocirc;NG</strong><br />
            <strong>KT.GI&Aacute;M &#272;&#7888;C</strong><br />
            <strong>PH&Oacute; GI&Aacute;M &#272;&#7888;C</strong></p>
        <p align="center"><em>&nbsp;</em></p>
    <p align="center"><strong>Ph&#7841;m Qu&#7889;c Chinh</strong><strong> </strong></p></td>
    <td width="164"></td>
  </tr>
</table>
<p><em>&nbsp;</em></p>
</body>





</div>						 						 
                                  
                                    <div class="form-group">
                                        <table width="100%">
                                            <tr>
                                                <td>
<a onclick="location = '<?php echo $link_export_w;?>'" class="btn bg-aqua btn-flat btn-margin"><i class="fa fa-floppy-o"></i>&nbsp;&nbsp;Xuất word</a>
                                                   
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <button onclick="quay_lai_trang_truoc()" class="btn btn-primary btn-flat btn-block">
                                                        <i class="fa fa-save"></i> Quay Lại
                                                    </button>
                                                </td>
                                            </tr>
                                        </table>
                                
                                        
                                    </div>
                               

</div>

</div>			 
</div>			  
			  
			  
			  
			  
			  
			  
              </div>
              <!-- /.tab-pane -->

              <div class="tab-pane" id="settings">
                    <form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" >
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Email Người Nhận</label>

                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="inputName" placeholder="Name" name="nguoi_nhan" value="<?php echo $cts['email']; ?>">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="inputEmail" name="nguoi_gui" placeholder="Email">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Tiêu Đề</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="tieu_de"  id="inputName" placeholder="Name">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputExperience"  class="col-sm-2 control-label">Nội Dung</label>

                    <div class="col-sm-10">
                      <textarea class="form-control" name="noi_dung" id="inputExperience" placeholder="Nội dung thư nhập tại đây"></textarea>
                    </div>
                  </div><!--
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Skills</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputSkills" placeholder="Skills">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> I agree to the <a href="#">terms and conditions</a>
                        </label>
                      </div>
                    </div>
                  </div>-->
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" id="form" class="btn btn-danger">Gửu thông tin</button>
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
		  
		  
		 <?php }
		 else if($cts['tochuc_canhan_id']=='2') { ?>
				   <!-- Main content -->
    <section class="content">

      <div class="row">
       
        <!-- /.col -->
        <div class="col-md-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab">Thông Tin Tổ Chức</a></li>
              <li><a href="#timeline" data-toggle="tab">Xem File Word</a></li>
              <li><a href="#settings" data-toggle="tab">Thông Tin Phản Hồi</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="activity">
                <!-- Post -->
                
				   <div class="box-body"> 
                            <div class="row">
							
							<div class="legend-box">
<div class="legend-head">
<span class="txt">Thông Tin Người Quản Lý </span>
</div>
<div class="legend-body" style="display: block;">
<div class="row">


                                <div class="col-md-6" id="pop1">
                                    
									

									
									
                                    
                                    <div class="form-group">
                                        <label>Họ Và Tên: &nbsp;</label>
                                        <span id="ctl00_phContent_lblNgaysinh" class="text-center"><?php echo $cts['ho_ten']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Ngày Sinh: &nbsp;</label>
                                        <span id="ctl00_phContent_lblNoisinh" class="text-center"><?php echo $cts['ngay_sinh']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Số CMTND: &nbsp;</label>
                                        <span id="ctl00_phContent_lblGioitinh" class="text-center"><?php echo $cts['so_cmt']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Ngày Cấp: &nbsp;</label>
                                        <span id="ctl00_phContent_lblQuequan" class="text-center"><?php echo $cts['ngay_cap']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Nơi Cấp: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDiachi" class="text-center"><?php echo $cts['noi_cap']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>CQ / Đơn Vị: &nbsp;</label>
                                        <span id="ctl00_phContent_lblTongiao" class="text-center"><?php echo $cts['ten_co_quan']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Tỉnh Thành: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDantoc" class="text-center"><?php echo $cts['tinh_thanh']; ?></span>
                                    </div>
                                   
                                </div>
								
								
								
                                <div class="col-md-6" id="pop2">
                                    <div class="form-group">
                                        <label>Cá Nhân / Tổ Chức: &nbsp;</label>
                                        <span id="ctl00_phContent_lblNgaycap" class="text-center">
										  <?php if($cts['tochuc_canhan_id']=='1') {echo "Cá Nhân" ;}
											else if($cts['tochuc_canhan_id']=='2'){echo "Tổ Chức" ;}
									?>
										</span>
                                    </div>
                                   
                                   
                                    <div class="form-group">
                                        <label>Thời gian đăng ký: &nbsp;</label>
                                        <span id="" class="text-center"><?php echo date_format(date_create($cts['time']),'H:i:s - d/m/Y'); ?></span>
                                    </div>
									 <div class="form-group">
                                        <label>Địa Chỉ: &nbsp;</label>
                                        <span id="ctl00_phContent_lblCMND" class="text-center"><?php echo $cts['dia_chi']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Điện thoại: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDienthoai" class="text-center"><?php echo $cts['dien_thoai']; ?></span>
                                    </div>
									
                                    <div class="form-group">
                                        <label>Email: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDidong" class="text-center"><?php echo $cts['email']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label> Ghi Chú: &nbsp;</label>
                                        <span id="ctl00_phContent_lblEmail" class="text-center"><?php echo $cts['ghi_chu']; ?></span>
                                    </div>
                                </div>
								
								
								


</div>
</div>
</div>


<div class="legend-box">
<div class="legend-head">
<span class="txt">Thông Tin Đăng Ký Chứng Thư Số </span>
</div>
<div class="legend-body" style="display: block;">
<div class="row">


                                <div class="col-md-6" id="pop1">
                                    
									

									
									
                                <div class="form-group">
                                        <label>Email: &nbsp;</label>
                                        <span id="ctl00_phContent_lblNoicap" class="text-center"><?php echo $cts['email']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Tên cơ quan, tổ chức (2): &nbsp;</label>
                                        <span id="ctl00_phContent_lblDoanvien" class="text-center"><?php echo $cts['coquan_congtac']; ?></span>
                                    </div>
                                </div>
								
								
								
                                <div class="col-md-6" id="pop2">
                                    
                                   
									 <div class="form-group">
                                        <label>Tỉnh Thành: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDantoc" class="text-center"><?php echo $cts['tinh_thanh']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Chứng Thư Cũ: &nbsp;</label> 
                                        <span id="ctl00_phContent_lblDangvien" class="text-center">Không</span>
                                    </div>
                                  
                                  
                                  
                                </div>
								
								
								


</div>
</div>
</div>
							
                                   
                          
                              
                            </div>
                            </div><!-- /.box-body -->      
							
				
				
                <!-- /.post -->

             

              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="timeline">
              <div class="box box-primary">
<h3 class="box-title">Chi tiết

</h3>

</div>
			  <div class="box-body">
<div class="row">
	
<div id="pop6" style="display: block;">
                  
                             <div class="form-group">
							 

<body>
<table  width="1024">
  <tr>
    <td width="395" valign="top"><p align="center">UBND    T&#7880;NH S&#416;N LA<br />
            <strong>S&#7902; TH&Ocirc;NG TIN V&Agrave; TRUY&#7872;N    TH&Ocirc;NG</strong></p></td>
    <td width="584" valign="top"><p align="center"><strong>C&#7896;NG H&Ograve;A X&Atilde; H&#7896;I CH&#7910; NGH&#296;A VI&#7878;T NAM</strong><strong><br />
      </strong><strong>&#272;&#7897;c l&#7853;p - T&#7921; do - H&#7841;nh ph&uacute;c<br />
      </strong></p></td>
  </tr>
</table>
<p align="center"><strong>DANH S&Aacute;CH</strong> <br />
    <strong>&#272;&#7873; ngh&#7883;  c&#7845;p ch&#7913;ng th&#432; s&#7889; cho </strong><strong>c&#417; quan, t&#7893; ch&#7913;c</strong><br />
    <em>(ban h&agrave;nh k&egrave;m theo C&ocirc;ng v&#259;n s&#7889;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  /STTTT-CNTT 
	ngày   <?php echo date_format(date_create($cts['time']),'d'); ?>    tháng   <?php echo date_format(date_create($cts['time']),'m'); ?>   năm   <?php echo date_format(date_create($cts['time']),'Y'); ?>;&nbsp;c&#7911;a S&#7903; TT&amp;TT t&#7881;nh S&#417;n La)</em></p>
<p align="center">K&iacute;nh  g&#7917;i: C&#7909;c C&#417; y&#7871;u  &#272;&#7843;ng v&agrave; Ch&iacute;nh quy&#7873;n - Ban C&#417; y&#7871;u Ch&iacute;nh ph&#7911;.<br />
  S&#7889; l&#432;&#7907;ng &#273;&#259;ng k&yacute;: &nbsp;&nbsp;&lt;t&#7921; &#273;&#7897;ng l&#7845;y theo s&#7889; th&#7913; t&#7921;&gt; thu&ecirc; bao<br />
  Danh s&aacute;ch &#273;&#259;ng k&yacute;: C&#7845;p ch&#7913;ng th&#432; s&#7889; cho t&#7893; ch&#7913;c</p>
<table border="1" cellspacing="0" cellpadding="0" width="1024">
  <tr>
    <td width="1"><br /></td>
    <td width="33" rowspan="2"><p align="center"><strong>STT</strong></p></td>
    <td colspan="6"><p align="center"><strong>Th&ocirc;ng tin ng&#432;&#7901;i qu&#7843;n l&yacute; ch&#7913;ng th&#432; s&#7889;</strong></p></td>
    <td colspan="3"><p align="center"><strong>Th&ocirc;ng tin &#273;&#259;ng k&yacute; ch&#7913;ng th&#432; s&#7889;</strong></p></td>
    <td colspan="2"><p align="center"><strong>S&#7889; </strong><strong>ch&#7913;ng th&#432; s&#7889; c&#361; </strong></p></td>
  </tr>
  <tr>
    <td width="1"></td>
    <td width="76"><p align="center"><strong>H&#7885; t&ecirc;n</strong></p></td>
    <td width="79"><p align="center"><strong>Ng&agrave;y sinh</strong></p></td>
    <td width="122"><p align="center"><strong>S&#7889; CMND/ Ng&agrave;y c&#7845;p/ N&#417;i c&#7845;p</strong></p></td>
    <td width="91"><p align="center"><strong>C&#417; quan, t&#7893; ch&#7913;c c&ocirc;ng t&aacute;c (1</strong><strong>)</strong></p></td>
    <td colspan="2"><p align="center"><strong>&#272;&#7883;a ch&#7881; th&#432; &#273;i&#7879;n t&#7917;</strong></p></td>
    <td width="125"><p align="center"><strong>T&ecirc;n c&#417; quan, t&#7893; ch&#7913;c (2)</strong></p></td>
    <td width="100"><p align="center"><strong>T&#7881;nh/ Th&agrave;nh ph&#7889;</strong></p></td>
    <td width="93"><p align="center"><strong>&#272;&#7883;a ch&#7881; th&#432; &#273;i&#7879;n t&#7917;</strong></p></td>
    <td  width="93"><p align="center"><strong>&nbsp;</strong></p></td>
  </tr>
  <tr>
    <td width="1"></td>
    <td width="33"><p align="center"><?php echo $cts['id_cts'];?></p></td>
    <td width="76"><p align="center"><?php echo $cts['ho_ten'];?></p></td>
    <td width="79"><p align="center"><?php echo $cts['ngay_sinh'];?></p></td>
    <td width="122"><p align="center"><?php echo $cts['so_cmt'];?></br><?php echo $cts['ngay_cap'];?></br><?php echo $cts['noi_cap'];?></p></td>
    <td width="91"><p align="center"><?php echo $cts['ten_co_quan'];?></p></td>
    <td colspan="2"><p align="center"><?php echo $cts['email'];?></p></td>
    <td width="125"><p align="center"><?php echo $cts['coquan_congtac'];?></p></td>
    <td width="100"><p align="center"><?php echo $cts['tinh_thanh'];?></p></td>
    <td width="93"><p align="center"><?php echo $cts['email1'];?></p></td>
    <td colspan="2"><p align="center"><?php echo $cts['chung_thu_cu'];?></p></td>
  </tr>
  <tr>
    <td colspan="7" valign="top"><p align="center"><strong>&nbsp;</strong><strong>Ng&#432;&#7901;i l&#7853;p</strong><strong><br />
        </strong></p>
      <p align="center"><em>&nbsp;</em></p>
      <p align="center">&nbsp;</p>
    <p align="center"><strong>&#272;&agrave;m Quang Trung</strong> </p></td>
    <td colspan="6" valign="top"><p align="center"><strong>S&#7902; TH&Ocirc;NG TIN V&Agrave; TRUY&#7872;N TH&Ocirc;NG</strong><br />
            <strong>KT.GI&Aacute;M &#272;&#7888;C</strong><br />
            <strong>PH&Oacute; GI&Aacute;M &#272;&#7888;C</strong></p>
        <p align="center"><em>&nbsp;</em></p>
    <p align="center">&nbsp;</p>
    <p align="center"><strong>Ph&#7841;m Qu&#7889;c Chinh</strong><strong> </strong></p></td>
  </tr>
</table>
<p><em>&nbsp;</em></p>
</body>





</div>							 	



                                  
                                    <div class="form-group">
                                        <table width="100%">
                                            <tr>
                                                <td>
                                                    

<a onclick="location = '<?php echo $link_export_w;?>'" class="btn btn-danger btn-flat btn-block"><i class="fa fa-file-word-o"></i>&nbsp;&nbsp;Xuất word</a>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <button onclick="quay_lai_trang_truoc()" class="btn btn-primary btn-flat btn-block">
                                                        <i class="fa fa-save"></i> Quay Lại
                                                    </button>
                                                </td>
                                            </tr>
                                        </table>
                                
                                        
                                    </div>
                               

</div>

</div>			 
</div>			  
			  
			  
			  
			  
			  
			  
              </div>
              <!-- /.tab-pane -->

              <div class="tab-pane" id="settings">
                <form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" >
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Email Người Nhận</label>

                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="inputName" placeholder="Name" name="toi" value="<?php echo $cts['email']; ?>">
                    </div>
                  </div>
				  <!--
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                    </div>
                  </div>
				  -->
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Tiêu Đề</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="tieu_de"  id="inputName" placeholder="Name">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputExperience"  class="col-sm-2 control-label">Nội Dung</label>

                    <div class="col-sm-10">
                      <textarea class="form-control" name="noi_dung" id="inputExperience" placeholder="Nội dung thư nhập tại đây"></textarea>
                    </div>
                  </div><!--
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Skills</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputSkills" placeholder="Skills">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> I agree to the <a href="#">terms and conditions</a>
                        </label>
                      </div>
                    </div>
                  </div>-->
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" id="form" class="btn btn-danger">Gửu thông tin</button>
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
		 
		    <?php } ?>
		  
		  
		  
		  
        </div>
        



<?php include('view/template/common/footer.tpl'); ?>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>

  <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
    <script>
  $( function() {
    $( "#datepicker1" ).datepicker();
  } );
  </script>
  
  <script>
      function quay_lai_trang_truoc(){
          history.back();
      }
  </script>
  