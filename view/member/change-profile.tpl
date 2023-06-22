<?php include('view/common/header.tpl'); ?>

<div class="col-xs-24 col-sm-24 col-md-4 col-lg-4">
</div>
<div class="col-xs-24 col-sm-24 col-md-18 col-lg-18">
    <div class="panel panel-primary">
        <div class="panel-heading">Thiết lập tài khoản</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-24 col-sm-8 col-md-8 col-lg-8">
                    <img src="/assets/imagesimages/gui/logo-doan.png" class="pf_avatar img-thumbnail img-responsive" style="width:100%; height:auto; max-height:260px;"/>
                </div>
                <div class="col-xs-24 col-sm-16 col-md-16 col-lg-16">
                    <div class="row">
                         <div class="form-group col-xs-24 col-sm-24 col-md-12 col-lg-12">
                            <label>Tài khoản</label>
                            <input type:text class="form-control pf_username"  disabled/>
                        </div>
                        <div class="form-group col-xs-24 col-sm-24 col-md-12 col-lg-12">
                            <label>Họ tên</label>
                            <input type:text class="form-control pf_fullname"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-xs-24 col-sm-24 col-md-12 col-lg-12">
                            <label>Điện thoại</label>
                            <input type:text class="form-control pf_phone" />
                        </div>
                         <div class="form-group col-xs-24 col-sm-24 col-md-12 col-lg-12">
                            <label>Email</label>
                            <input type:text class="form-control pf_email"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12 form-group">
                            <label>Tỉnh, thành phố</label>
                            <select class="form-control slProvinces"></select>
                        </div>
                        <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12 form-group">
                            <label>Quận, huyện</label>
                            <select class="form-control slDistricts"></select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12 form-group">
                            <label>Xã, phường</label>
                            <select class="form-control slWards"></select>
                        </div>
                        <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12 form-group">
                            <label>Địa chỉ</label>
                            <input type:text class="form-control txtAddress"/>
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
                    <input type:text class = "form-control txtWorkingUnit" placeholder = "Đơn vị, bộ phận, phòng ban"/> 
                </div>
            </div>
        </div>
        <div class="panel-footer text-right">
            <button class="btn btn-primary">
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