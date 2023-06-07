<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Thông Tin Thành Viên
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=categories&act=list">Thông Tin</a></li>
        <li class="active"><?php echo $member['ho_ten']; ?></li>
    </ol>

            </section>
          
		  
		  
		  
		  
		  
		   <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
			<?php if($member['avatar']){?>
              <img class="profile-user-img img-responsive img-circle" src="<?php echo $member['avatar']; ?>" alt="User profile picture">
			  <?php } else { ?>
			   <img class="profile-user-img img-responsive img-circle" width="128" src="./view/image/no-avatar.jpg" alt="User profile picture" />
			  <?php } ?>

              <h3 class="profile-username text-center"><?php echo $member['tai_khoan']; ?></h3>

              <p class="text-muted text-center"><?php echo $member['ho_ten']; ?></p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Email:</b> <a class="pull-right"><?php echo $member['email']; ?></a>
                </li>
                <li class="list-group-item">
                  <b>Điện Thoại:</b> <a class="pull-right"><?php echo $member['mobile']; ?></a>
                </li>
                <li class="list-group-item">
                  <b>Ngày Sinh:</b> <a class="pull-right"><?php echo $member['ngay_sinh']; ?></a>
                </li>
				 <li class="list-group-item">
                  <b>Ngày Tham Gia:</b> <a class="pull-right"><?php echo $member['ngay_tham_gia']; ?></a>
                </li>
              </ul>

              <a href="index.php?module=member&act=<?php echo "cpw";?>&id=<?php echo $member['id_regedit']; ?>" class="btn btn-primary btn-block"><b>Thay Đổi Mật Khẩu</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
        
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab">Thông Tin Cá Nhân</a></li>
              <li><a href="#timeline" data-toggle="tab">Sửa Thông Tin Cá Nhân</a></li>
              <li><a href="#settings" data-toggle="tab">Settings</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="activity">
                <!-- Post -->
                
				   <div class="box-body"> 
                            <div class="row">
                                <div class="col-md-6" id="pop1">
								
								 
                                    <div class="form-group">
                                        <label>Họ Và Tên: &nbsp;</label>
                                        <span id="ctl00_phContent_lblNgaysinh" class="text-center"><?php echo $member['ho_ten']; ?></span>
                                    </div>
                                    
                                    
                                    <div class="form-group">
                                        <label>Ngày sinh: &nbsp;</label>
                                        <span id="ctl00_phContent_lblNgaysinh" class="text-center"><?php echo $member['ngay_sinh']; ?></span>
                                    </div>
                                  
                                    <div class="form-group">
                                        <label>Giới tính: &nbsp;</label>
                                        <span id="ctl00_phContent_lblGioitinh" class="text-center">Nam</span>
                                    </div>
                                    <div class="form-group">
                                        <label>Điện Thoại: &nbsp;</label>
                                        <span id="ctl00_phContent_lblQuequan" class="text-center"><?php echo $member['may_ban']; ?></span>
                                    </div>
									 <div class="form-group">
                                        <label>Di động: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDidong" class="text-center"><?php echo $member['mobile']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Địa chỉ: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDiachi" class="text-center"><?php echo $member['dia_chi']; ?></span>
                                    </div>
                                   
                                   
                                  
                                </div>
                                <div class="col-md-6" id="pop2">
                                    <div class="form-group">
                                        <label>Quyền Hạn: &nbsp;</label>
                                        <span id="ctl00_phContent_lblNgaycap" class="text-center">
														  
				<?php if($member['phan_quyen']=='1') {echo "Quản trị Website" ;}
			else if($member['phan_quyen']=='2'){echo "Phát triển Website" ;}
  ?>
										</span>
                                    </div>
                                 
                                    <div class="form-group">
                                        <label>Ngày Tham gia: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDoanvien" class="text-center"><?php echo date_format(date_create($member['ngay_tham_gia']),'d-m-Y');?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Đang Nhập Lần Cuối: &nbsp;</label> 
                                        <span id="ctl00_phContent_lblDangvien" class="text-center"><?php echo date_format(date_create($member['time_login']),'H:i:s | d/m/Y');?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Website: &nbsp;</label>
                                        <span id="" class="text-center"><?php echo $member['web']; ?></span>
                                    </div>
                                    <div class="form-group">
                                        <label>Yahoo Messenger: &nbsp;</label>
                                        <span id="ctl00_phContent_lblDienthoai" class="text-center"><?php echo $member['yahoo']; ?></span>
                                    </div>
                                   
                                    <div class="form-group">
                                        <label> Địa Chỉ Email: &nbsp;</label>
                                        <span id="ctl00_phContent_lblEmail" class="text-center"><?php echo $member['email']; ?></span>
                                    </div>
                                </div>
                                   
                               
                    
                            </div>
                            </div><!-- /.box-body -->      
							
				
				
                <!-- /.post -->

             

                <!-- Post -->
              
                <!-- /.post -->
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="timeline">
              <div class="box box-primary">
<h3 class="box-title">Chi tiết</h3>
</div>
			  <div class="box-body">
			    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" onclick="return validate(this);">




</form>		  
	
			 
</div>	


	  
			  
			  
			  
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
		  
		  
		  
		  
		  
		  
		  
        </div>
        



<?php include('view/template/common/footer.tpl'); ?>


  