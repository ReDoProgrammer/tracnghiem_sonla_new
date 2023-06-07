      <div class="row row-ex body">
            <div class="col col-ex col-sm-12 col-12 pr-0 col-9">
                <div class="container-fluid container-fluid-ex">
                    <div class="row row-ex">
                        <div class="col col-ex p-0">
                            <div class="card card-box list-news-box">
                                <div class="card-header">
                                    <span><img src='view/theme/default/image/icon-pen.png'></span>
                                    <span class="title">Đăng Ký Chứng Thư Số Online</span>
                                  
                                </div>
                                <div class="card-body">
                                    <div  data-src="wow">
<style>
    .col-ex.col-9 {
        max-width: 100%;
        flex: 100%;
        padding-right: 13px!important;
    }
</style>

<div class="card-body" style="padding:13px">
<div class="fqa" data-src="wow">
<style>

    .search-form {
        padding: 13px;
    }
    .search-form input,
    .search-form select {
        padding: 6px 13px;
        font-size: 13px;
        line-height: 1;
        border-radius: 0;
        max-height: 30px;
    }
    .search-form button {
        padding: 4px 14px;
        font-size: 13px;
        border-radius: 0;
    }
    .list-question-item .item {
        border-bottom: none;
    }
</style>

 <form id="ask-form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" name="myForm" class="search-form fqa" onclick="return validateForm()">          

<div id="alert-result" class="alert alert-info w-100" style="display: none;" role="alert">Gửi góp ý thành công</div>
  <div class="tab-pane active" id="congdan"">
  
  
			
   <div class="legend-box ">
							<div class="legend-head">
								<span class="txt">Địa chỉ Email </span>
							</div>
<div class="legend-body" style="display: block;">
<div class="row">
<div class="col-sm-6 col-xs-12">
<div class="input-group">
<span class="input-group-addon">@</span>
<input class="form-control" name="email" id="email" type="text" placeholder="@sonla.gov.vn" value="<?php echo $_SESSION['email'];?>" />
										
</div>
 <?php if ($error_email2) { ?>
            <span class="error">
			<?php echo $error_email2; ?></span>
          <?php } ?>  	 
</div>

<div class="col-sm-5 col-xs-12">
	<label class="label-warning oep-label-red">Email sẽ đươc sử dụng làm tài khoản </label>					
</div>

</div>
</div>


</div>
	
			  <div class="row">
			  
			  
				
				
                    <div class="col-sm-6 col-xs-12">
                        <div class="form-group">
                            <div class="label-text">
                                Họ Và Tên:
								 <span class="red">*</span>
                            </div>
                            <div class="input">
                                <input name="ho_ten" type="text" maxlength="255" id="ho_ten" value="<?php echo $_SESSION['hoten'];?>" class="form-control" />
								<?php if ($error_hoten) { ?>
            <span class="error">
			<?php echo $error_hoten; ?></span>
          <?php } ?>  
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-12">
                        <div class="form-group">
                            <div class="label-text">
                                Ngày Sinh:
                                    <span class="red">*</span>
                            </div>
                            <div class="input">
                                <input name="ngay_sinh" type="text" maxlength="255" id="datepicker" value="<?php echo $_SESSION['ngaysinh'];?>" id="ngay_sinh" class="form-control" />
                           <?php if ($error_ns) { ?>
            <span class="error">
			<?php echo $error_ns; ?></span>
          <?php } ?>  
						   </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-xs-12">
                        <div class="form-group">
                            <div class="label-text">
                                Số CMT:
                                    <span class="red">*</span>
                            </div>
                            <div class="input">
                                <input name="so_cmt" type="text" maxlength="255" id="socmt" value="<?php echo $_SESSION['cmt'];?>" class="form-control" />
                            <?php if ($error_cmt) { ?>
            <span class="error">
			<?php echo $error_cmt; ?></span>
          <?php } ?> 
						   </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-xs-12">
                        <div class="form-group">
                            <div class="label-text">
                                Ngày Cấp:
                                    <span class="red">*</span>
                            </div>
                            <div class="input">
                                <input name="ngay_cap" type="text" maxlength="255" id="datepicker1" id="ngay_cap" value="<?php echo $_SESSION['ngaycap'];?>" class="form-control" />
                            <?php if ($error_ngaycap) { ?>
            <span class="error">
			<?php echo $error_ngaycap; ?></span>
          <?php } ?> 
						   </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-xs-12">
                        <div class="form-group">
                            <div class="label-text">
                                Nơi Cấp:
                                    <span class="red">*</span>
                            </div>
                            <div class="input">
                                <input name="noi_cap" type="text" maxlength="255" id="noi_cap" class="form-control" value="<?php echo $_SESSION['noicap'];?>" />
                             <?php if ($error_noicap) { ?>
            <span class="error">
			<?php echo $error_noicap; ?></span>
          <?php } ?> 
							</div>
                        </div>
                    </div>
					 <div class="col-sm-7 col-xs-12">
                        <div class="form-group">
                            <div class="label-text">
                                Tên Cở Quan - Đơn Vị:
                                    <span class="red">*</span>
                            </div>
                            <div class="input">
                                <input name="ten_co_quan" type="text" maxlength="255" id="ten_co_quan" class="form-control" value="<?php echo $_SESSION['tencq'];?>" />
                            				 <?php if ($error_tencq) { ?>
            <span class="error">
			<?php echo $error_tencq; ?></span>
          <?php } ?> 
							</div>
                        </div>
                    </div>
					  <div class="col-sm-5 col-xs-12">
                        <div class="form-group">
                            <div class="label-text">
                                Tỉnh - Thành Phố:
                                    <span class="red">*</span>
                            </div>
                            <div class="input">
                                <input name="tinh_thanh" type="text" maxlength="255" id="tinh_thanh" class="form-control" value="<?php echo $_SESSION['tinhthanh'];?>" />
                             <?php if ($error_tinhthanh) { ?>
            <span class="error">
			<?php echo $error_tinhthanh; ?></span>
          <?php } ?> 
							</div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-12">
                        <div class="form-group">
                            <div class="label-text">
                                Chức Vụ:
                                    <span class="red">*</span>
                            </div>
                            <div class="input">
                                <input name="chuc_vu" type="text" maxlength="255" id="chuc_vu" class="form-control" value="<?php echo $_SESSION['chucvu'];?>" />
                            <?php if ($error_chucvu) { ?>
            <span class="error">
			<?php echo $error_chucvu; ?></span>
          <?php } ?> 
							</div>
                        </div>
                    </div>
					 <div class="col-sm-6 col-xs-12">
                        <div class="form-group">
                            <div class="label-text">
                                Chức Danh Thẩm Quyền:
                                    <span class="red">*</span>
                            </div>
                            <div class="input">
                                <input name="chuc_danh" type="text" maxlength="255" id="chuc_danh" class="form-control" value="<?php echo $_SESSION['chucdanh'];?>" />
                              <?php if ($error_chucdanh) { ?>
            <span class="error">
			<?php echo $error_chucdanh; ?></span>
          <?php } ?> 
							</div>
                        </div>
                    </div>
					 <div class="col-sm-6 col-xs-12">
                        <div class="form-group">
                            <div class="label-text">
                                Địa Chỉ:
                                    <span class="red">*</span>
                            </div>
                            <div class="input">
                                <input name="dia_chi" type="text" maxlength="255" id="dia_chi" class="form-control" value="<?php echo $_SESSION['diachi'];?>" />
                            <?php if ($error_diachi) { ?>
            <span class="error">
			<?php echo $error_diachi; ?></span>
          <?php } ?> 
							</div>
                        </div>
                    </div>
					 <div class="col-sm-3 col-xs-12">
                        <div class="form-group">
                            <div class="label-text">
                                Di Động:
                                    <span class="red">*</span>
                            </div>
                            <div class="input">
                                <input name="dien_thoai" type="text" maxlength="255" id="dien_thoai" class="form-control" value="<?php echo $_SESSION['didong'];?>" />
                           <?php if ($error_didong) { ?>
            <span class="error">
			<?php echo $error_didong; ?></span>
          <?php } ?> 

						   </div>
                        </div>
                    </div>
					 <div class="col-sm-3 col-xs-12">
                        <div class="form-group">
                            <div class="label-text">
                                Máy Bàn:
                                   
                            </div>
                            <div class="input">
                                <input name="may_ban" type="text" maxlength="255" id="" class="form-control" value="<?php echo $_SESSION['mayban'];?>" />
                            </div>
                        </div>
                    </div>
					
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#ddlPassport").change(function () {
            if ($(this).val() == "2") {
                $("#dvPassport").show();
            } else {
                $("#dvPassport").hide();
            }
        });
    });
</script>
					
					  <div class="col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>Cá Nhân - Tổ Chức <span class="style2">(*)</span></label>
                                    <div class="input-group" style="width:100%">
                                        <select name="tochuc_canhan_id" class="form-control" id="ddlPassport">
										
						<option value="false"><?php echo "Lựa chọn"; ?></option>
						
						      <?php if($_SESSION['canhantochuc']=='1'){ ?>
          <option value="1" selected="selected"><?php echo "Cá Nhân"; ?></option>
          <?php } else { ?>
          <option value="1"><?php echo "Cá Nhân"; ?></option>
          <?php } ?>
          <?php if($_SESSION['canhantochuc']=='2'){ ?>
          <option value="2" selected="selected"><?php echo "Tổ Chức"; ?></option>
          <?php } else { ?>
          <option value="2"><?php echo "Tổ Chức"; ?></option>
          <?php } ?> 
							
										</select>
				 						
                                        
                                    </div>
									 <?php if ($error_tochuccanhan) { ?>
            <span class="error"><?php echo $error_tochuccanhan; ?></span>
          <?php } ?>  
                                </div>
                            </div>
							
							
				  <div class="col-md-6">
                                <div class="form-group">
                                    <label>Gói cước đăng ký</label>
                                    <div class="input-group" style="width:100%">
                                  
                                            <select name="goi_dang_ky" class="form-control">
			<option>----------<?php echo "Lựa chọn"; ?>----------</option>
							
							 <?php if($_SESSION['goidangky']=='1'){ ?>
          <option value="1" selected="selected"><?php echo "Đăng Ký Mới"; ?></option>
          <?php } else { ?>
          <option value="1"><?php echo "Đăng Ký Mới"; ?></option>
          <?php } ?>
          <?php if($_SESSION['goidangky']=='2'){ ?>
          <option value="2" selected="selected"><?php echo "Gia Hạn Đăng Ký"; ?></option>
          <?php } else { ?>
          <option value="2"><?php echo "Gia Hạn Đăng Ký"; ?></option>
          <?php } ?> 

			</select>
                                     
                                        
                                    </div>
                               
                                </div>
                            </div>
								



 </div>
                <div class="legend-box" id="dvPassport" style="display: none">
                    <div class="down">
                    </div>
                    <div class="legend-head">
                        <span class="txt">Mẫu Tổ Chức - Thông Tin Quản Lý Chứng Thư Số
                        </span>
                    </div>
                    <div class="legend-body">

<div class="row">
 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Địa chỉ thư điện tử:</label>
                 
                                    <input name="email1" class="form-control" type="text" value="<?php echo $_SESSION['email1'];?>" />
                                </div>
                                    
                            </div>
 <div class="col-md-6">
                                <div class="form-group">
                                    <label>Cơ quan, tổ chức công tác</label>
                 
                                    <input name="coquan_congtac" class="form-control" type="text" value="<?php echo $_SESSION['coquancongtac'];?>" />
                                </div>
                                    
                            </div>
							
								 <div class="col-md-12">
                                <div class="form-group">
                                    <label>Số chứng thư số cũ</label>
                 
                                    <input name="chuc_thu_cu" class="form-control" type="text" value="<?php echo $_SESSION['chungthucu'];?>" />
                                </div>
                                    
                            </div>

</div>
				</div>

                </div>
				
				
 
   
      <div class="col-md-12">
                        <div class="form-group">
                            <div class="label-text">
                                Ghi Chú:
                            </div>
                           <textarea class="form-control" name="ghi_chu" placeholder="" rows="3" <?php echo $_SESSION['ghichu'];?>></textarea>
                        </div>
                    </div>





 

			
				
				
           <div class="form-group row row-ex">
<div class="col col-ex col-sm-3">
<button class="btn btn-default" onclick="backList()">Quay lại</button>
</div>
<div class="col col-ex col-sm-9">
<button class="btn btn-default" type="reset" value="reset">Nhập lại</button>
<button class="btn btn-success" type="submit" value="submit" onclick="submitQuestion()">Gửi Đăng Ký</button>
</div>
</div>
            </div>
				</form>
</form>









</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       
        </div>