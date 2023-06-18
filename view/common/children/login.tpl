<div class="dang_nhap_home">
    <div>
        <div class="nv-info margin-bottom" data-default="Hãy đăng nhập tài khoản để vào làm bài dự thi">Hãy đăng
            nhập tài khoản để vào làm bài dự thi</div>
        <div class="form-detail">
            <div class="form-group loginstep1">
                <div class="input-group">
                    <span class="input-group-addon"><em class="fa fa-user fa-lg"></em></span>
                    <input type="text" class="required form-control" placeholder="Tên đăng nhập hoặc email" value=""
                        id="txtUsernameOrEmail" maxlength="100" data-pattern="/^(.){3,}$/"
                        onkeypress="validErrorHidden(this);" data-mess="Tên đăng nhập chưa được khai báo">
                </div>
            </div>

            <div class="form-group loginstep1">
                <div class="input-group">
                    <span class="input-group-addon"><em class="fa fa-key fa-lg fa-fix"></em></span>
                    <input type="password" autocomplete="off" class="required form-control" placeholder="Mật khẩu"
                        value="" id="txtLoginPassword" maxlength="100" data-pattern="/^(.){3,}$/"
                        onkeypress="validErrorHidden(this);" data-mess="Mật khẩu đăng nhập chưa được khai báo">
                </div>
            </div>

            <div class="form-group loginstep2 hidden">
                <label class="margin-bottom">Nhập mã xác minh từ ứng dụng Google Authenticator</label>
                <div class="input-group margin-bottom">
                    <span class="input-group-addon"><em class="fa fa-key fa-lg fa-fix"></em></span>
                    <input type="text" class="required form-control" placeholder="Nhập mã 6 chữ số" value=""
                        name="nv_totppin" maxlength="6" data-pattern="/^(.){6,}$/"
                        onkeypress="validErrorHidden(this);" data-mess="Nhập mã 6 chữ số">
                </div>
                <div class="text-center">
                    <a href="javascript:void(0);" onclick="login2step_change(this);">Thử cách khác</a>
                </div>
            </div>

            <div class="form-group loginstep3 hidden">
                <label class="margin-bottom">Nhập một trong các mã dự phòng bạn đã nhận được.</label>
                <div class="input-group margin-bottom">
                    <span class="input-group-addon"><em class="fa fa-key fa-lg fa-fix"></em></span>
                    <input type="text" class="required form-control" placeholder="Nhập mã 8 chữ số" value=""
                        name="nv_backupcodepin" maxlength="8" data-pattern="/^(.){8,}$/"
                        onkeypress="validErrorHidden(this);" data-mess="Nhập mã 8 chữ số">
                </div>
                <div class="text-center">
                    <a href="javascript:void(0);" onclick="login2step_change(this);">Thử cách khác</a>
                </div>
            </div>
            <div class="text-center margin-bottom-lg">
                <button class="bsubmit btn btn-primary" type="submit" id="btnLoginWithUsernameOrEmail">Đăng nhập</button>
                <input type="button" value="Thiết lập lại" class="btn btn-default"
                    onclick="validReset(this.form);return!1;">
            </div>

            <div class="form-group">
                <div class="text-right clearfix">
                    <a href="index.php?module=member&act=register">
                        Đăng ký tài khoản
                    </a>
                </div>
            </div>
        </div>
    </div>   
</div>

<script src="assets/js/member/js-login.js"></script>