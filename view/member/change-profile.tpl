<?php include('view/common/header.tpl'); ?>

<div class="col-xs-24 col-sm-24 col-md-4 col-lg-4">
</div>
<div class="col-xs-24 col-sm-24 col-md-18 col-lg-18">
    <div class="panel panel-primary">
        <div class="panel-heading">Thiết lập tài khoản</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-24 col-sm-8 col-md-8 col-lg-8">
                    <img src="/assets/imagesimages/gui/logo-doan.png" 
                    class="pf_avatar img-thumbnail img-responsive" id="pf_avatar"
                    style="width:100%; height:auto; max-height:260px;"/>
                </div>
                <div class="col-xs-24 col-sm-16 col-md-16 col-lg-16">
                    <div class="row">
                         <div class="form-group col-xs-24 col-sm-24 col-md-12 col-lg-12">
                            <label>Tài khoản</label>
                            <input type:text class="form-control pf_username"  disabled data-userid/>
                        </div>
                        <div class="form-group col-xs-24 col-sm-24 col-md-12 col-lg-12">
                            <label>Họ tên</label>
                            <input type:text class="form-control pf_fullname" id="pf_fullname"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-xs-24 col-sm-12 col-md-12 col-lg-12 get_gender">
                            <div class="form-group radio-box required input btn-group col-sm-24 gender">
                                <label class="radio-box" style="margin-right: 5px;"> 
                                    <input type="radio" name="gender" value="N"
                                        class="input rbtN" id="rbtN">
                                    N/A </label>
                                <label class="radio-box" style="margin-right: 5px;"> 
                                    <input type="radio" name="gender" value="M" id="rbtM"
                                        class="input rbtM" checked="checked">
                                    Nam </label>
                                <label class="radio-box" style="margin-right: 0px;"> <input type="radio" name="gender" value="F"
                                        class="input rbtF" id="rbtF">
                                    Nữ </label>
                            </div>
                        </div>
                        <div class="form-group  col-xs-24 col-sm-12 col-md-12 col-lg-12 get_birthdate">
                            <div class="input-group">
                                <input type="text" class="form-control datepicker required txtBirthdate" data-provide="datepicker"
                                    style="z-index: 1 !important;" placeholder="Ngày tháng năm sinh" value="31/01/2000" readonly="readonly"
                                    onchange="validErrorHidden(this);" onfocus="datepickerShow(this);" data-mess="" id="txtBirthdate">
                                <span class="input-group-addon pointer" onclick="button_datepickerShow(this);">
                                    <em class="fa fa-calendar"></em> </span>
                            </div>
                        </div>
                    </div>



                    <div class="row">
                        <div class="form-group col-xs-24 col-sm-24 col-md-12 col-lg-12">
                            <label>Điện thoại</label>
                            <input type:text class="form-control pf_phone" id="pf_phone" />
                        </div>
                         <div class="form-group col-xs-24 col-sm-24 col-md-12 col-lg-12">
                            <label>Email</label>
                            <input type:text class="form-control pf_email" id="pf_email"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12 form-group">
                            <label>Tỉnh, thành phố</label>
                            <select class="form-control slProvinces" id="slProvinces"></select>
                        </div>
                        <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12 form-group">
                            <label>Quận, huyện</label>
                            <select class="form-control slDistricts" id="slDistricts"></select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12 form-group">
                            <label>Xã, phường</label>
                            <select class="form-control slWards" id="slWards"></select>
                        </div>
                        <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12 form-group">
                            <label>Địa chỉ</label>
                            <input type:text class="form-control txtAddress" id="txtAddress"/>
                        </div>
                    </div>
                    
                </div>
            </div>

            <div class="row">
                <div class="col-xs-24 col-sm-12 col-md-8 col-lg-8 form-group">
                    <label>Nghề nghiệp</label>
                    <select class="form-control" id="slJobs"></select>
                </div>
                <div class="col-xs-24 col-sm-12 col-md-8 col-lg-8 form-group">
                    <label>Đơn vị công tác</label>
                    <select class="form-control" id="slWorkplaces"></select>
                </div>
                <div class="col-xs-24 col-sm-12 col-md-8 col-lg-8 form-group">
                    <label>Chức vụ</label>
                    <select class="form-control" id="slPositions"></select>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-24 col-sm-24 col-md-24 col-lg-24 form-group">
                    <label>Bộ phận, phòng ban</label>
                    <input type:text class = "form-control txtWorkingUnit" id="txtWorkingUnit"
                    placeholder = "Đơn vị, bộ phận, phòng ban"/> 
                </div>
            </div>
        </div>
        <div class="panel-footer text-right">
            <button class="btn btn-primary" id="btnSaveChanges">
                <i class="fa fa-floppy-o" aria-hidden="true"></i>
                Lưu thay đổi
            </button>
        </div>

    </div>
</div>
<div class="col-xs-24 col-sm-24 col-md-4 col-lg-4">
</div>

<?php   include('view/common/footer.tpl'); ?>
<script src="assets/js/member/js-change-profile.js"></script>