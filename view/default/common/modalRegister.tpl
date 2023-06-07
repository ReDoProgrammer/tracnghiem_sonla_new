<div id="modalRegister" class="modal fade" role="dialog">
  <div class="modal-dialog">
     <div class="panel-body modal-content">
            <h2 class="text-center margin-bottom-lg">
                Đăng ký tài khoản
            </h2>
            <div>
                <div class="nv-info margin-bottom"
                    data-default="Để đăng ký tài khoản, bạn cần khai báo tất cả các ô trống dưới đây">
                    Để đăng ký tài khoản, bạn cần khai báo tất cả các ô trống dưới đây
                </div>

                <div class="form-detail">
                    <div class="row">
                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                            <div id="avatar">   
                                <div class="content">
                                    <img src="http://placehold.it/175x180"/> 
                                    <button class="btn btn-xs btn-warning" id="btnImportAvatar"><i class="fa fa-camera" aria-hidden="true"></i></button>
                                </div>        
                            </div>
                        </div>
                        <div class="col-xs-16 col-sm-16 col-md-16 col-lg-16">
                             <div class="form-group">
                                    <input type="text" class="form-control required input" id="txtFullname"
                                        placeholder="Họ và tên (VD: Nguyễn Văn A)" value="" name="last_name" maxlength="100"
                                        data-mess="">
                            </div>
                             <div class="form-group">                        
                                <input type="text" class="required form-control" placeholder="Tên đăng nhập" value=""
                                    id="txtUsername" maxlength="30" data-pattern="/^(.){4,30}$/"
                                    onkeypress="validErrorHidden(this);"
                                    data-mess="Tên đăng nhập không hợp lệ: Tên đăng nhập chỉ được sử dụng chữ số, chữ cái, và các ký tự sau nằm giữa: gạch ngang, gạch dưới, cách trống và có từ 4 đến 30 ký tự">
                            </div>
                            <div class="form-group"> 
                                <input type="password" autocomplete="off" class="password required form-control"
                                    placeholder="Mật khẩu" value="" id="txtPassword" maxlength="32"
                                    data-pattern="/^(.){8,32}$/" onkeypress="validErrorHidden(this);"
                                    data-mess="Mật khẩu phải từ 8 đến 32 ký tự">
                            </div>

                            <div class="form-group">  
                                <input type="password" autocomplete="off" class="re-password required form-control"
                                    placeholder="Lặp lại mật khẩu" value="" id="txtConfirmPassword" maxlength="32"
                                    data-pattern="/^(.){1,}$/" onkeypress="validErrorHidden(this);"
                                    data-mess="Bạn chưa viết lại mật khẩu vào ô nhập lại mật khẩu">
                            </div>
                        </div>
                    </div>
                    
                           

                    <div class="row">
                       <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">                       
                            <input type="email" class="required form-control" placeholder="Email" value="" id="txtEmail"
                                maxlength="100" onkeypress="validErrorHidden(this);"
                                data-mess="Email chưa được khai báo">                       
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <input type="text" class="form-control required input" placeholder="Điện thoại" id="txtPhone"
                                name="custom_fields[phone]" onkeypress="validErrorHidden(this);" data-mess="" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div>
                                <div>
                                    <div class="form-group clearfix radio-box required input" data-mess="" style="padding: 6px !important;">
                                        <div class="btn-group col-sm-24">
                                            <label class="radio-box" style="margin-right: 5px;"> <input type="radio"
                                                    name="gender" id="rbtN" value="N" class="input"
                                                    onclick="validErrorHidden(this,5);">
                                                N/A </label>
                                            <label class="radio-box" style="margin-right: 5px;"> <input type="radio"
                                                    name="gender" id="rbtM" value="M" class="input"
                                                    onclick="validErrorHidden(this,5);" checked="checked">
                                                Nam </label>
                                            <label class="radio-box" style="margin-right: 0px;"> <input type="radio"
                                                    name="gender" value="F" id="rbtF" class="input"
                                                    onclick="validErrorHidden(this,5);">
                                                Nữ </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control datepicker required "
                                        data-provide="datepicker" placeholder="Ngày tháng năm sinh" value="01/01/2000"
                                        id="txtBirthdate" readonly="readonly" onchange="validErrorHidden(this);"
                                        onfocus="datepickerShow(this);" data-mess="" />
                                    <span class="input-group-addon pointer" onclick="button_datepickerShow(this);"> <em
                                            class="fa fa-calendar"></em> </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr />
                    <div class="row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <label>Tỉnh, thành phố</label>
                            <select class="form-control" id="slProvinces"></select>
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <label>Quận, huyện</label>
                            <select id="slDistricts" class="form-control"></select>
                        </div>                      
                    </div>
                    <div class="row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <label>Xã, phường</label>
                            <select class="form-control" id="slWards"></select>
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <label>Địa chỉ chi tiết</label>
                            <input type="text" class="form-control required input" placeholder="Địa chỉ" value=""
                               id="txtAddress" name="custom_fields[address]" onkeypress="validErrorHidden(this);" data-mess="" />
                        </div>
                        

                    </div>

                    <div class="row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <label>Nghề nghiệp</label>
                            <select id="slJobs" class="form-control"></select>
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <label>Chức vụ</label>
                            <select id="slPositions" class="form-control"></select>
                        </div>
                    </div>
                    <div class="row">
                         <div class="form-group col-xs-24 col-sm-24 col-md-24 col-lg-24">
                            <label>Đơn vị công tác</label>
                            <select id="slWorkPlaces" class="form-control"></select>
                        </div>
                    </div>
                   
                    <div class="alert alert-danger" id="divWarningMsg">
                        <strong>Warning!</strong> <span>12341234123</span>
                    </div>
                    <div>
                        <div>
                            <div class="form-group text-center check-box required" data-mess="">
                                <input type="checkbox" id="ckbAgreement"/>Tôi đồng ý với
                                <a><span class="btn btn-default btn-xs">Quy định đăng ký thành viên</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="text-center margin-bottom-lg">
                        <input type="button" value="Thiết lập lại" class="btn btn-default"/>
                        <button class="btn btn-primary" id="btnSubmitRegister" visible>
                            <i class="fa fa-user-plus" aria-hidden="true"></i>
                            Đăng ký tài khoản
                        </button>
                    </div>
                </div>
            </div>
        </div>
  </div>
</div>



<script type="text/javascript" src="assets/js/member/js_register.js"></script>
<link rel="StyleSheet" href="assets/css/member/register.css">