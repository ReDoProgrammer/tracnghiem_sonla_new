<?php include('view/common/header.tpl'); ?>

<div class="col-xs-24 col-sm-24 col-md-4 col-lg-4">
</div>
<div class="col-xs-24 col-sm-24 col-md-18 col-lg-18">
    <div class="panel panel-primary">
        <div class="panel-heading">Thiết lập tài khoản</div>
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-24 col-sm-8 col-md-8 col-lg-8">
                    <img src="/assets/imagesimages/gui/logo-doan.png" id="avatar" style="width:100%; height:auto; max-height:260px;"/>
                </div>
                <div class="col-xs-24 col-sm-16 col-md-16 col-lg-16">
                    <div class="row">
                         <div class="form-group col-xs-24 col-sm-24 col-md-12 col-lg-12">
                            <label>Tài khoản</label>
                            <input type:text class="form-control" id="txtUsername" disabled/>
                        </div>
                        <div class="form-group col-xs-24 col-sm-24 col-md-12 col-lg-12">
                            <label>Họ tên</label>
                            <input type:text class="form-control" id="txtFullname"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-xs-24 col-sm-24 col-md-12 col-lg-12">
                            <label>Điện thoại</label>
                            <input type:text class="form-control" id="txtPhone" />
                        </div>
                         <div class="form-group col-xs-24 col-sm-24 col-md-12 col-lg-12">
                            <label>Email</label>
                            <input type:text class="form-control" id="txtPhone" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12 form-group">
                            <label>Tỉnh, thành phố</label>
                            <select class="form-control" id="slProvinces"></select>
                        </div>
                        <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12 form-group">
                            <label>Quận, huyện</label>
                            <select class="form-control" id="slDistricts"></select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12 form-group">
                            <label>Xã, phường</label>
                            <select class="form-control" id="slWards"></select>
                        </div>
                        <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12 form-group">
                            <label>Địa chỉ</label>
                            <input type:text class="form-control" id="txtAddress"/>
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