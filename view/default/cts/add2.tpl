<div class="box-reg-container">
    <div class="container">
        <h1 class="title">Đăng ký tài khoản chữ ký số Online</h1>
        <ul class="tabs">
            <li class="active">
                <a href="#congdan" data-toggle="tab">Cá Nhân - Tổ Chức</a>

            </li>
          
        </ul>
        <div class="tab-content">
		
	 <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" name="myForm" onclick="return validateForm()">              

            <div class="tab-pane active" id="congdan"">
	
			  <div class="row">
			  
			  
				
				 <div class="legend-box">
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
	 
</div>

<div class="col-sm-5 col-xs-12">
	<label class="label-warning oep-label-red">Email sẽ đươc sử dụng làm tài khoản </label>					
</div>

</div>
</div>
</div>
				
                    <div class="col-sm-6 col-xs-12">
                        <div class="form-group">
                            <div class="label-text">
                                Họ Và Tên:
								 <span class="red">*</span>
                            </div>
                            <div class="input">
                                <input name="ho_ten" type="text" maxlength="255" id="ho_ten" value="<?php echo $_SESSION['ten'];?>" class="form-control" />
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
                                <input name="so_cmt" type="text" maxlength="255" id="socmt" value="<?php echo $_SESSION['socmt'];?>" class="form-control" />
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
                                <input name="ten_co_quan" type="text" maxlength="255" id="ten_co_quan" class="form-control" value="<?php echo $_SESSION['tencoquan'];?>" />
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
                                <input name="dien_thoai" type="text" maxlength="255" id="dien_thoai" class="form-control" value="<?php echo $_SESSION['dienthoai'];?>" />
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
				  <?php if ($error_tochuccanhan) { ?>
            <span class="error"><?php echo $error_tochuccanhan; ?></span>
          <?php } ?>  						
                                        
                                    </div>
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
                <div class="legend-box" style="display: none">
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
                 
                                    <input name="email1" class="form-control" type="text" value="value="<?php echo $_SESSION['email1'];?>"" />
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





 

			
				
				
                <div class="actions tright">
                   
                     
                    <button type="submit" class="btn btn-success" value="submit">Đăng ký </button>
                        <span class="btn btn-default" onclick="javascript: history.go(-1);"  >Quay lại</span>
                </div>
            </div>
				</form>
				

           



        </div>
    </div>
</div>

<script type="text/javascript">
// JavaScript Document
function validateForm() {
//Email phải được điền chính xác
var email=document.forms["myForm"]["email"].value;
var aCong=email.indexOf("@");
var dauCham = email.lastIndexOf(".");
if (email == "") {
alert("Email không được để trống");
return false;
}
else if ((aCong<1) || (dauCham<aCong+2) || (dauCham+2>email.length)) {
alert("Email bạn điền không chính xác");
return false;
}
//Họ phải được điền
var ho_ten = document.forms["myForm"]["ho_ten"].value;
if (ho_ten == "") {
alert("Họ không được để trống");
return false;
}
//Nhập số điện thoại
var so_cmt = document.forms["myForm"]["so_cmt"].value;
var kiemTracmt = isNaN(so_cmt);
if (so_cmt == "") {
alert("So CMT không được để trống");
return false;
}
if (kiemTracmt == true) {
alert("So CMT phải để ở định dạng số");
return false;
}
//Tên phải được điền
var ten = document.forms["myForm"]["ten"].value;
if (ten == "") {
alert("Tên không được để trống");
return false;
}


//Nhập số lượng muốn mua
var soLuong = document.forms["myForm"]["soLuong"].value;
var kiemTraSL = isNaN(soLuong);
if ((soLuong == "") || (soLuong <= 0)) {
alert("Số lượng không được để trống và phải lớn hơn 0");
return false;
}
if (soLuong > 100) {
alert("Số lượng mua không được lớn hơn 100");
return false;
}
if (kiemTraSL == true) {
alert("Số lượng mua phải để ở định dạng số");
return false;
}
//Chọn ngày nhận hàng
var nm = document.forms["myForm"]["ngaymua"].value;
if (nm == "") {
alert("Ngày không được để trống");
return false;
}
//Chọn kiểu thanh toán
var ck = document.getElementById("ck");
var tt = document.getElementById("tt");
if ((ck.checked == false) && (tt.checked == false)) {
alert("Bạn phải chọn một kiểu thanh toán");
return false;
}
}
</script>
