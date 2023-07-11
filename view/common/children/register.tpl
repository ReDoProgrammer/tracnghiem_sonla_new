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
                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                    <div class="avatar">
                        <div class="content">
                            <img src="http://placehold.it/175x180" style="width:100%; height:auto; max-height:175px;"/>
                            <button class="btn btn-xs btn-warning btnImportAvatar">
                                <i class="fa fa-camera" aria-hidden="true"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-16 col-lg-16">
                    <div class="form-group">
                        <input type="text" class="form-control required input txtFullname"
                            placeholder="Họ và tên (VD: Nguyễn Văn A)" id="txtFullname" name="txtFullname"/>
                        <span class="text-danger fw-bold msgValidation" id="msgFullname"></span>
                    </div>
                    <div class="form-group">
                        <input type="text" class="required form-control txtUsername tooltip-current" placeholder="Tên đăng nhập"
                            name="txtUsername" id="txtUsername"/>
                        <span class="text-danger fw-bold msgValidation" id="msgUsername"></span>
                    </div>
                    <div class="form-group">
                        <input type="password" autocomplete="off" class="password required form-control txtPassword"
                            placeholder="Mật khẩu" id="txtPassword" maxlength="32"  data-mess="Mật khẩu phải từ 8 đến 32 ký tự">
                        <span class="text-danger fw-bold msgValidation" id="msgPassword"></span>
                    </div>

                    <div class="form-group">
                        <input type="password" class="form-control txtConfirmPassword"
                            placeholder="Lặp lại mật khẩu"
                            id="txtConfirmPassword" maxlength="32">
                        <span class="text-danger fw-bold msgValidation" id="msgConfirmPassword"></span>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-xs-24 col-sm-12 col-md-12 col-lg-12 mt-5">
                    <input type="email" class="required form-control txtEmail" 
                    placeholder="Email" id="txtEmail"/>
                    <span class="text-danger fw-bold msgValidation" id="msgEmail"></span>
                </div>
                <div class="form-group col-xs-24 col-sm-12 col-md-12 col-lg-12 mt-5">
                    <input type="text" class="form-control required input txtPhone" 
                    placeholder="Điện thoại" id="txtPhone" />
                    <span class="text-danger fw-bold msgValidation" id="msgPhone"></span>
                </div>
            </div>


            <div class="row">
                <div class="form-group col-xs-24 col-sm-12 col-md-12 col-lg-12 get_gender">
                    <div class="form-group radio-box required input btn-group col-sm-24 gender">
                        <label class="radio-box" style="margin-right: 5px;"> <input type="radio" name="gender" value="N"
                                class="input rbtN" >
                            N/A </label>
                        <label class="radio-box" style="margin-right: 5px;"> <input type="radio" name="gender" value="M"
                                class="input rbtM"  checked="checked">
                            Nam </label>
                        <label class="radio-box" style="margin-right: 0px;"> <input type="radio" name="gender" value="F"
                                class="input rbtF" >
                            Nữ </label>
                    </div>
                </div>
                <div class="form-group  col-xs-24 col-sm-12 col-md-12 col-lg-12 get_birthdate">
                    <div class="input-group">
                        <input type="text" class="form-control datepicker required txtBirthdate"
                            data-provide="datepicker" style="z-index: 1 !important;" placeholder="Ngày tháng năm sinh"
                            value="31/01/2000" readonly="readonly" onchange="validErrorHidden(this);"
                            onfocus="datepickerShow(this);" data-mess="" />
                        <span class="input-group-addon pointer" onclick="button_datepickerShow(this);">
                            <em class="fa fa-calendar"></em> </span>
                    </div>
                </div>
            </div>
           
            <?php include('subs/address.tpl');?>


            <div class="row">
                <div class="form-group col-xs-24 col-sm-24 col-md-24 col-lg-24 get_workplace">
                    <label>Đơn vị</label>
                    <select class="form-control selectpicker slWorkPlaces" data-live-search="true"></select>
                </div>
            </div>

             <div class="row get_workingunit">
                <div class="form-group col-xs-24 col-sm-24 col-md-24 col-lg-24 mt-5">
                    <label>Đơn vị công tác</label>
                    <input type="text" class="form-control txtWorkingUnit" placeholder="Đơn vị công tác" value=""/>
                </div> 
            </div>

            <div class="row">
                <div class="form-group col-xs-24 col-sm-12 col-md-12 col-lg-12 get_job">
                     <label>Nghề nghiệp</label>
                    <select class="form-control slJobs"></select>
                </div>
                <div class="form-group col-xs-24 col-sm-12 col-md-12 col-lg-12 get_position">
                    <label>Chức vụ</label>
                    <input type="text" placeholder="Chức vụ" class="form-control required" id="txtPosition"/>
                </div>
            </div>





            <br>
            <div class="clearfix"></div>

            <div class="row">
                <div class="form-group col-xs-24 col-sm-24 col-md-24 col-lg-24 text-center check-box required"
                    data-mess="">
                    <input type="checkbox" id="ckbAgreement"/>Tôi đồng ý với
                    <a onclick="ShowRegisterRules()"><span class="btn btn-default btn-xs">Quy định đăng ký thành
                            viên</span></a><br/>
                    <span class="text-danger fw-bold msgValidation" id="msgAgreement"></span>
                </div>
                
            </div>

            <div class="row">
                <div class="text-center margin-bottom-lg col-xs-24 col-sm-24 col-md-24 col-lg-24">
                    <input type="button" value="Thiết lập lại" class="btn btn-default" />
                    <button class="btn btn-primary btnSubmitRegister">
                        <i class="fa fa-user-plus" aria-hidden="true"></i>
                        Đăng ký tài khoản
                    </button>
                </div>
            </div>


        </div>
    </div>
</div>
<script type="text/javascript" src="assets/js/member/js-register.js?t=1683896486"></script>
<link rel="StyleSheet" href="assets/css/member/register.css?t=1683896486">