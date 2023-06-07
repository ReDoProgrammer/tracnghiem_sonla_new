 <div class="dang_nhap_home">       
    <div class="nv-info margin-bottom"
        data-default="Hãy đăng nhập tài khoản để vào làm bài dự thi">Hãy đăng nhập tài
        khoản để vào làm bài dự thi</div>
    <div class="form-detail">
        <div class="form-group loginstep1">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user fa-lg"></i></span>
                <input type="text" class="required form-control"
                    id="txtUsernameOrEmail"
                    placeholder="Tên đăng nhập hoặc email"/>
            </div>
        </div>

        <div class="form-group loginstep1">
            <div class="input-group">
                <span class="input-group-addon"><i
                        class="fa fa-key fa-lg fa-fix"></i></span>
                <input type="password" class="required form-control" id="txtLoginPassword"
                    placeholder="Mật khẩu"  maxlength="100"/>
            </div>
        </div>

        <div class="alert alert-danger" id="divLoginMsg">
                <strong>Warning!</strong> <span></span>
        </div>
        <div class="text-center margin-bottom-lg">
            <button class="bsubmit btn btn-primary" id="btnLoginWithUsernameOrEmail">Đăng nhập</button>
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modalRegister">Đăng ký tài khoản</button>
        </div>
    </div>      
</div>
