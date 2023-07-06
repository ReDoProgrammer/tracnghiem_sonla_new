<?php include('view/common/header.tpl'); ?>

<div class="col-xs-24 col-sm-24 col-md-4 col-lg-4">
</div>
<div class="col-xs-24 col-sm-24 col-md-18 col-lg-18">
    <div class="panel panel-primary">
        <div class="panel-heading">Đổi mật khẩu</div>
        <div class="panel-body">
           <div class="row">
                <div class="col-md-8 col-lg-8"></div>
                <div class="col-xs-24 col-sm-24 col-md-8 col-lg-8 form-group">
                    <label>Mật khẩu hiện tại:</label>
                    <input type="password" class="form-control" id="txtCurrentPassword"/>
                    <span class="text-danger fw-bold msgValidation" id="msgCurrentPassword"></span>
                </div>
                <div class="col-md-8 col-lg-8"></div>
           </div>
           <div class="row">
                <div class="col-md-8 col-lg-8"></div>
                <div class="col-xs-24 col-sm-24 col-md-8 col-lg-8 form-group">
                    <label>Mật khẩu mới:</label>
                    <input type="password" class="form-control" id="txtNewPassword"/>
                    <span class="text-danger fw-bold msgValidation" id="msgNewPassword"></span>
                </div>
                <div class="col-md-8 col-lg-8"></div>
           </div>
           <div class="row">
                <div class="col-md-8 col-lg-8"></div>
                <div class="col-xs-24 col-sm-24 col-md-8 col-lg-8 form-group">
                    <label>Xác nhận mật khẩu mới:</label>
                    <input type="password" class="form-control" id="txtConfirmNewPassword"/>
                    <span class="text-danger fw-bold msgValidation" id="msgConfirmNewPassword"></span>
                </div>
                <div class="col-md-8 col-lg-8"></div>
           </div>

            
        </div>
        <div class="panel-footer text-right">
            <button class="btn btn-primary" id="btnSaveChanges">
                <i class="fa fa-floppy-o" aria-hidden="true"></i>
                Xác nhận đổi mật khẩu
            </button>
        </div>

    </div>
</div>
<div class="col-xs-24 col-sm-24 col-md-4 col-lg-4">
</div>

<?php   include('view/common/footer.tpl'); ?>
<script src="assets/js/member/js-change-password.js"></script>