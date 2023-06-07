<?php include('view/common/header.tpl'); ?>
<div class="row">
    <div class="col-md-24">
    </div>
</div>
<div class="row">
    <div class="col-md-12">
    </div>
    <div class="col-md-12">
    </div>
</div>
<div class="row">
    <div class="col-md-24">
        <div class="page">
            <h2 class="margin-bottom-lg margin-top-lg">Thiết lập tài khoản</h2>
            <ul class="users-menu nav nav-pills margin-bottom">
                <li class="">
                    <a data-toggle="tab" data-location="/vi/users/editinfo/basic/"
                        href="#edit_basic">Cơ bản</a>
                </li>
                <li class="">
                    <a data-toggle="tab" href="#edit_avatar"
                        data-location="/vi/users/editinfo/avatar/">Hình đại diện</a>
                </li>
                <li class="">
                    <a data-toggle="tab" data-location="/vi/users/editinfo/email/"
                        href="#edit_email">Email</a>
                </li>
                <li class="active">
                    <a data-toggle="tab" data-location="/vi/users/editinfo/password/"
                        href="#edit_password">Mật khẩu</a>
                </li>
                <li>
                    <a href="/vi/two-step-verification/">Xác thực hai bước</a>
                </li>
                <li class="">
                    <a data-toggle="tab" data-location="/vi/users/editinfo/question/"
                        href="#edit_question">Câu hỏi bảo mật</a>
                </li>
                <li class="">
                    <a data-toggle="tab" data-location="/vi/users/editinfo/others/"
                        href="#edit_others">Khác</a>
                </li>
                <li class="">
                    <a data-toggle="tab" data-location="/vi/users/editinfo/safemode/"
                        href="#edit_safemode">Chế độ an toàn</a>
                </li>
            </ul>

            <div class="tab-content margin-bottom-lg">

                <div id="edit_basic" class="tab-pane fade ">
                    <div class="page panel panel-default">
                        <div class="panel-body bg-lavender">
                            <form action="/vi/users/editinfo/basic/" method="post" role="form"
                                class="form-horizontal" onsubmit="return reg_validForm(this);"
                                autocomplete="off" novalidate="">
                                <div class="nv-info margin-bottom" data-default=""
                                    style="display:none"></div>
                                <div class="form-detail">
                                    <div class="form-group">
                                        <label for="last_name"
                                            class="control-label col-md-6 text-normal">Họ và tên đệm
                                            (VD: Nguyễn Văn....)</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control required input"
                                                placeholder="Họ và tên đệm (VD: Nguyễn Văn....)"
                                                value="Lã Văn" name="last_name" maxlength="100"
                                                onkeypress="validErrorHidden(this);" data-mess="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="first_name"
                                            class="control-label col-md-6 text-normal">Tên (VD:
                                            A)</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control required input"
                                                placeholder="Tên (VD: A)" value="Binh"
                                                name="first_name" maxlength="100"
                                                onkeypress="validErrorHidden(this);" data-mess="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="gender"
                                            class="control-label col-md-6 text-normal">Giới
                                            tính</label>
                                        <div class="col-md-12">
                                            <div class="clearfix radio-box required input"
                                                data-mess="">
                                                <label class="radio-box"> <input type="radio"
                                                        name="gender" value="N" class="input"
                                                        onclick="validErrorHidden(this,5);"> N/A
                                                </label>
                                                <label class="radio-box"> <input type="radio"
                                                        name="gender" value="M" checked="checked"
                                                        class="input"
                                                        onclick="validErrorHidden(this,5);"> Nam
                                                </label>
                                                <label class="radio-box"> <input type="radio"
                                                        name="gender" value="F" class="input"
                                                        onclick="validErrorHidden(this,5);"> Nữ
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="birthday"
                                            class="control-label col-md-6 text-normal">Ngày tháng
                                            năm sinh</label>
                                        <div class="col-md-4">
                                            <input type="text"
                                                class="form-control calendar-icon datepicker required "
                                                name="birthday" value="10/01/1991"
                                                readonly="readonly" onfocus="datepickerShow(this);"
                                                data-mess="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="birthday"
                                            class="control-label col-md-6 text-normal">Địa
                                            chỉ........</label>
                                        <div class="col-md-12">
                                            <textarea class="form-control  input"
                                                placeholder="Địa chỉ........" name="sig"
                                                onkeypress="validErrorHidden(this);"
                                                data-mess="">Thủ đo</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="view_mail"
                                            class="control-label col-md-6 text-normal">Hiển thị
                                            email</label>
                                        <div class="col-md-4">
                                            <select name="view_mail" class="form-control">
                                                <option value="0">Không</option>
                                                <option value="1">Có</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <input type="hidden" name="checkss"
                                                value="8ec69c9bcb6f243508e13f6f3877c794">
                                        </div>
                                        <div class="col-md-10">
                                            <input type="button" value="Thiết lập lại"
                                                class="btn btn-default"
                                                onclick="validReset(this.form);return!1;">
                                            <input type="submit" class="btn btn-primary"
                                                value="Chấp nhận">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="edit_avatar" class="tab-pane fade ">
                    <div class="page panel panel-default">
                        <div class="panel-body bg-lavender">
                            <div class="margin-bottom">
                                <img id="myavatar" class="img-thumbnail bg-gainsboro"
                                    src="assets/images/logo_d511t31j_1.png" width="80" height="80"
                                    data-default="/themes/khoahocchocon/images/users/no_avatar.png">
                            </div>
                            <div>
                                <button type="button" class="btn btn-primary btn-xs margin-right-sm"
                                    onclick="changeAvatar('/vi/users/avatar/src/');">
                                    Thay đổi hình đại diện
                                </button>
                                <button type="button" class="btn btn-danger btn-xs" id="delavatar"
                                    onclick="deleteAvatar('#myavatar','8ec69c9bcb6f243508e13f6f3877c794',this)">
                                    Xóa
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="edit_email" class="tab-pane fade ">
                    <div class="page panel panel-default">
                        <div class="panel-body bg-lavender">
                            <form action="/vi/users/editinfo/email/" method="post" role="form"
                                class="form-horizontal"
                                onsubmit="return changemail_validForm(this);" autocomplete="off"
                                novalidate="">
                                <div class="nv-info margin-bottom">
                                    <p>Để thay đổi email, bạn cần thực hiện tuần tự các bước sau
                                        đây:</p>
                                    <p>1.Khai báo lại mật khẩu<br>2.Khai báo địa chỉ email
                                        mới<br>3.Click vào nút Gửi Mã xác minh<br>4.Kiểm tra mail
                                        thông báo Mã xác minh được gửi đến địa chỉ mà bạn vừa khai
                                        báo, sau đó nhập mã này vào ô Mã xác minh<br>5.Click vào nút
                                        Chấp nhận.</p>
                                </div>
                                <div class="nv-info-default hidden">
                                    <p>Để thay đổi email, bạn cần thực hiện tuần tự các bước sau
                                        đây:</p>
                                    <p>1.Khai báo lại mật khẩu<br>2.Khai báo địa chỉ email
                                        mới<br>3.Click vào nút Gửi Mã xác minh<br>4.Kiểm tra mail
                                        thông báo Mã xác minh được gửi đến địa chỉ mà bạn vừa khai
                                        báo, sau đó nhập mã này vào ô Mã xác minh<br>5.Click vào nút
                                        Chấp nhận.</p>
                                </div>

                                <div class="form-detail">
                                    <div class="form-group">
                                        <div class="col-md-6 text-right">
                                            Email hiện tại:
                                        </div>
                                        <div class="col-md-12">
                                            <strong>hungthducphong2910@gmail.com</strong>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="password"
                                            class="control-label col-md-6 text-normal">Mật
                                            khẩu</label>
                                        <div class="col-md-12">
                                            <input type="password" autocomplete="off"
                                                class="required form-control" placeholder="Mật khẩu"
                                                value="" name="password" maxlength="32"
                                                data-pattern="/^(.){8,32}$/"
                                                onkeypress="validErrorHidden(this);"
                                                data-mess="Mật khẩu đăng nhập chưa được khai báo">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="email"
                                            class="control-label col-md-6 text-normal">Email
                                            mới</label>
                                        <div class="col-md-12">
                                            <input type="email" class="required form-control"
                                                placeholder="Email mới" value="" name="email"
                                                maxlength="100" onkeypress="validErrorHidden(this);"
                                                data-mess="Email chưa được khai báo">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="verifykey"
                                            class="control-label col-md-6 text-normal">Mã xác
                                            minh</label>
                                        <div class="col-md-12">
                                            <div class="input-group">
                                                <input type="text" class="form-control"
                                                    placeholder="Mã xác minh" value=""
                                                    name="verifykey" maxlength="32"
                                                    data-pattern="/^[a-zA-Z0-9]{32,32}$/"
                                                    onkeypress="validErrorHidden(this);"
                                                    data-mess="Mã xác minh chưa được khai báo">
                                                <span class="input-group-btn">
                                                    <button type="button"
                                                        class="send-bt btn btn-warning pointer"
                                                        onclick="verkeySend(this.form);">
                                                        Gửi mã xác minh
                                                    </button></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <input type="hidden" name="checkss"
                                                value="8ec69c9bcb6f243508e13f6f3877c794">
                                            <input type="hidden" name="vsend" value="0">
                                        </div>
                                        <div class="col-md-10">
                                            <input type="button" value="Thiết lập lại"
                                                class="btn btn-default"
                                                onclick="validReset(this.form);return!1;">
                                            <input type="submit" class="btn btn-primary"
                                                value="Chấp nhận">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="edit_password" class="tab-pane fade in active">
                    <div class="page panel panel-default">
                        <div class="panel-body bg-lavender">
                            <form action="/vi/users/editinfo/password/" method="post" role="form"
                                class="form-horizontal" onsubmit="return reg_validForm(this);"
                                autocomplete="off" novalidate="">
                                <div class="nv-info margin-bottom" data-default=""
                                    style="display:none"></div>

                                <div class="form-detail">
                                    <div class="form-group">
                                        <label for="nv_password"
                                            class="control-label col-md-6 text-normal">Mật khẩu
                                            cũ</label>
                                        <div class="col-md-12">
                                            <input type="password" autocomplete="off"
                                                class="required form-control"
                                                placeholder="Mật khẩu cũ" value=""
                                                name="nv_password" maxlength="32"
                                                data-pattern="/^(.){8,32}$/"
                                                onkeypress="validErrorHidden(this);"
                                                data-mess="Chú ý: Bạn cần khai báo tất cả các ô có đánh dấu hoa thị (*).">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="new_password"
                                            class="control-label col-md-6 text-normal">Mật khẩu
                                            mới</label>
                                        <div class="col-md-12">
                                            <input type="password" autocomplete="off"
                                                class="required form-control"
                                                placeholder="Mật khẩu mới" value=""
                                                name="new_password" maxlength="32"
                                                data-pattern="/^(.){8,32}$/"
                                                onkeypress="validErrorHidden(this);"
                                                data-mess="Trường này là bắt buộc.">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="re_password"
                                            class="control-label col-md-6 text-normal">Nhập lại mật
                                            khẩu mới</label>
                                        <div class="col-md-12">
                                            <input type="password" autocomplete="off"
                                                class="required form-control"
                                                placeholder="Nhập lại mật khẩu mới" value=""
                                                name="re_password" maxlength="32"
                                                data-pattern="/^(.){8,32}$/"
                                                onkeypress="validErrorHidden(this);"
                                                data-mess="Trường này là bắt buộc.">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <input type="hidden" name="checkss"
                                                value="8ec69c9bcb6f243508e13f6f3877c794">
                                        </div>
                                        <div class="col-md-10">
                                            <input type="button" value="Thiết lập lại"
                                                class="btn btn-default"
                                                onclick="validReset(this.form);return!1;">
                                            <input type="submit" class="btn btn-primary"
                                                value="Chấp nhận">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="edit_question" class="tab-pane fade ">
                    <div class="page panel panel-default">
                        <div class="panel-body bg-lavender">
                            <form action="/vi/users/editinfo/question/" method="post" role="form"
                                class="form-horizontal" onsubmit="return reg_validForm(this);"
                                autocomplete="off" novalidate="">
                                <div class="nv-info margin-bottom"
                                    data-default="Để thay đổi câu hỏi bảo mật, bạn cần khai báo lại mật khẩu.">
                                    Để thay đổi câu hỏi bảo mật, bạn cần khai báo lại mật khẩu.
                                </div>

                                <div class="form-detail">
                                    <div class="form-group">
                                        <label for="nv_password"
                                            class="control-label col-md-6 text-normal">Mật
                                            khẩu</label>
                                        <div class="col-md-12">
                                            <input type="password" autocomplete="off"
                                                class="required form-control" placeholder="Mật khẩu"
                                                value="" name="nv_password" maxlength="32"
                                                data-pattern="/^(.){8,32}$/"
                                                onkeypress="validErrorHidden(this);"
                                                data-mess="Mật khẩu đăng nhập chưa được khai báo">
                                        </div>
                                    </div>

                                    <div class="form-group rel">
                                        <label for="question"
                                            class="control-label col-md-6 text-normal">Nghề
                                            Nghiệp</label>
                                        <div class="col-md-12">
                                            <div class="input-group">
                                                <input type="text" class="form-control  input"
                                                    placeholder="Nghề Nghiệp" value=""
                                                    name="question" maxlength="255"
                                                    data-pattern="/^(.){3,}$/"
                                                    onkeypress="validErrorHidden(this);"
                                                    data-mess="Bạn chưa khai báo câu hỏi bảo mật">
                                                <span class="input-group-btn"
                                                    onclick="showQlist(this);">
                                                    <button type="button"
                                                        class="btn btn-default pointer"><em
                                                            class="fa fa-caret-down fa-lg"></em></button>
                                                </span>
                                            </div>
                                            <div class="qlist" data-show="no">
                                                <ul>
                                                    <li>
                                                        <a href="javascript:void(0);"
                                                            onclick="addQuestion(this);">Doanh
                                                            nghiệp</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);"
                                                            onclick="addQuestion(this);">Công chức,
                                                            Viên chức</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);"
                                                            onclick="addQuestion(this);">Nhân
                                                            viên</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);"
                                                            onclick="addQuestion(this);">Người lao
                                                            động</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);"
                                                            onclick="addQuestion(this);">Giáo
                                                            viên</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);"
                                                            onclick="addQuestion(this);">Học
                                                            sinh</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:void(0);"
                                                            onclick="addQuestion(this);">Khác</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="answer"
                                            class="control-label col-md-6 text-normal">Đơn vị công
                                            tác ......</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control  input"
                                                placeholder="Đơn vị công tác ......" value=""
                                                name="answer" maxlength="255"
                                                data-pattern="/^(.){3,}$/"
                                                onkeypress="validErrorHidden(this);"
                                                data-mess="Bạn chưa nhập câu Trả lời của câu hỏi">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <input type="hidden" name="checkss"
                                                value="8ec69c9bcb6f243508e13f6f3877c794">
                                        </div>
                                        <div class="col-md-10">
                                            <input type="button" value="Thiết lập lại"
                                                class="btn btn-default"
                                                onclick="validReset(this.form);return!1;">
                                            <input type="submit" class="btn btn-primary"
                                                value="Chấp nhận">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="edit_others" class="tab-pane fade ">
                    <div class="page panel panel-default">
                        <div class="panel-body bg-lavender">
                            <form action="/vi/users/editinfo/others/" method="post" role="form"
                                class="form-horizontal" onsubmit="return reg_validForm(this);"
                                autocomplete="off" novalidate="">
                                <div class="nv-info margin-bottom"
                                    data-default="Chú ý: Bạn cần khai báo tất cả các ô có đánh dấu hoa thị (*).">
                                    Chú ý: Bạn cần khai báo tất cả các ô có đánh dấu hoa thị (*).
                                </div>

                                <div class="form-detail">

                                    <div class="form-group">
                                        <label class="control-label col-md-6 text-normal">Điện
                                            thoại</label>
                                        <div class="col-md-18">
                                            <input type="text" class="form-control required input"
                                                placeholder="Điện thoại" value="0978910999"
                                                name="custom_fields[phone]"
                                                onkeypress="validErrorHidden(this);" data-mess="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-6 text-normal">Địa
                                            chỉ</label>
                                        <div class="col-md-18">
                                            <input type="text" class="form-control required input"
                                                placeholder="Địa chỉ" value="ha noi"
                                                name="custom_fields[address]"
                                                onkeypress="validErrorHidden(this);" data-mess="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-6 text-normal">Chức
                                            vụ</label>
                                        <div class="col-md-18">
                                            <select name="custom_fields[unit]"
                                                class="form-control required input"
                                                onchange="validErrorHidden(this);" data-mess="">
                                                <option value="1"> Công chức </option>
                                                <option value="2" selected="selected"> Viên chức
                                                </option>
                                                <option value="7"> Giáo viên </option>
                                                <option value="8"> Học sinh </option>
                                                <option value="9"> Người lao động </option>
                                                <option value="10"> Công an </option>
                                                <option value="11"> Bác sỹ </option>
                                                <option value="12"> Bộ đội </option>
                                                <option value="13"> Cán bộ </option>
                                                <option value="14"> Khác </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-6 text-normal">Đơn vị
                                            công tác</label>
                                        <div class="col-md-18">
                                            <input type="text" class="form-control required input"
                                                placeholder="Đơn vị công tác" value="222"
                                                name="custom_fields[donvi]"
                                                onkeypress="validErrorHidden(this);" data-mess="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-6 text-normal">Cơ sở
                                            đoàn</label>
                                        <div class="col-md-18">
                                            <select name="custom_fields[congdoan]"
                                                class="form-control required input"
                                                onchange="validErrorHidden(this);" data-mess="">
                                                <option value="20"> Lựa Chọn cơ sở Đoàn </option>
                                                <option value="2"> Thành đoàn Sơn La </option>
                                                <option value="1" selected="selected"> Huyện đoàn
                                                    Thuận Châu </option>
                                                <option value="3"> Huyện đoàn Mường La </option>
                                                <option value="4"> Huyện đoàn Quỳnh Nhai </option>
                                                <option value="5"> Huyện đoàn Sông Mã </option>
                                                <option value="6"> Huyện đoàn Sốp Cộp </option>
                                                <option value="7"> Huyện đoàn Mai Sơn </option>
                                                <option value="8"> Huyện đoàn Bắc Yên </option>
                                                <option value="9"> Huyện đoàn Phù Yên </option>
                                                <option value="10"> Huyện đoàn Yên Châu </option>
                                                <option value="11"> Huyện đoàn Mộc Châu </option>
                                                <option value="12"> Huyện đoàn Vân Hồ </option>
                                                <option value="13"> Đoàn trường Đại học Tây Bắc
                                                </option>
                                                <option value="14"> Đoàn trường Cao đẳng Sơn La
                                                </option>
                                                <option value="15"> Đoàn trường Cao đẳng Y tế Sơn La
                                                </option>
                                                <option value="16"> Đoàn Thanh niên Công an tỉnh
                                                </option>
                                                <option value="17"> Đoàn Thanh niên BCH Bộ đội Biên
                                                    Phòng tỉnh </option>
                                                <option value="18"> Đoàn Thanh niên BCH Quân sự tỉnh
                                                </option>
                                                <option value="19"> Đoàn khối cơ quan và doanh
                                                    nghiệp tỉnh </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <input type="hidden" name="checkss"
                                                value="8ec69c9bcb6f243508e13f6f3877c794">
                                        </div>
                                        <div class="col-md-10">
                                            <input type="button" value="Thiết lập lại"
                                                class="btn btn-default"
                                                onclick="validReset(this.form);return!1;">
                                            <input type="submit" class="btn btn-primary"
                                                value="Chấp nhận">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="edit_safemode" class="tab-pane fade ">
                    <div class="page panel panel-default">
                        <div class="panel-body bg-lavender">
                            <form action="/vi/users/editinfo/safemode/" method="post" role="form"
                                class="form-horizontal" onsubmit="return reg_validForm(this);"
                                autocomplete="off" novalidate="">
                                <h2 class="margin-bottom-lg text-center"><em
                                        class="fa fa-shield fa-lg margin-right text-danger"></em>Bật
                                    chế độ an toàn</h2>
                                <div class="nv-info margin-bottom">
                                    <p><strong>Chế độ an toàn đang ở trạng thái tắt!</strong></p>
                                    <p>- Nếu không có nhu cầu chỉnh sửa thông tin tài khoản, bạn nên
                                        bật chế độ này. Nó sẽ giúp cho bạn tránh được những thay đổi
                                        ngoài ý muốn.</p>
                                    <p>- Khi bạn kích hoạt chế độ an toàn, hệ thống sẽ gửi đến email
                                        của bạn một mã xác minh. Mã xác minh này cũng được dùng để
                                        tắt chế độ an toàn. Nó có hiệu lực trong khoảng thời gian
                                        giữa hai lần bật - tắt. Sau khi bạn tắt chế độ an toàn, mã
                                        xác minh này sẽ vô giá trị.</p>
                                    <p>- Để bật chế độ an toàn, bạn hãy thực hiện theo các bước sau:
                                    </p>
                                    <p>1.Khai báo lại mật khẩu đăng nhập<br>2.Click vào nút Gửi mã
                                        xác minh<br>3.Kiểm tra mail thông báo Mã xác minh và chép mã
                                        đó vào ô Mã xác minh dưới đây<br>4.Click vào nút Chấp nhận.
                                    </p>
                                </div>
                                <div class="nv-info-default hidden">
                                    <p><strong>Chế độ an toàn đang ở trạng thái tắt!</strong></p>
                                    <p>- Nếu không có nhu cầu chỉnh sửa thông tin tài khoản, bạn nên
                                        bật chế độ này. Nó sẽ giúp cho bạn tránh được những thay đổi
                                        ngoài ý muốn.</p>
                                    <p>- Khi bạn kích hoạt chế độ an toàn, hệ thống sẽ gửi đến email
                                        của bạn một mã xác minh. Mã xác minh này cũng được dùng để
                                        tắt chế độ an toàn. Nó có hiệu lực trong khoảng thời gian
                                        giữa hai lần bật - tắt. Sau khi bạn tắt chế độ an toàn, mã
                                        xác minh này sẽ vô giá trị.</p>
                                    <p>- Để bật chế độ an toàn, bạn hãy thực hiện theo các bước sau:
                                    </p>
                                    <p>1.Khai báo lại mật khẩu đăng nhập<br>2.Click vào nút Gửi mã
                                        xác minh<br>3.Kiểm tra mail thông báo Mã xác minh và chép mã
                                        đó vào ô Mã xác minh dưới đây<br>4.Click vào nút Chấp nhận.
                                    </p>
                                </div>

                                <div class="form-detail">
                                    <div class="form-group">
                                        <label for="nv_password"
                                            class="control-label col-md-6 text-normal">Mật
                                            khẩu</label>
                                        <div class="col-md-14">
                                            <div class="input-group">
                                                <span class="input-group-addon"><em
                                                        class="fa fa-key fa-lg fa-fix"></em></span>
                                                <input type="password" autocomplete="off"
                                                    class="required form-control"
                                                    placeholder="Mật khẩu" value=""
                                                    name="nv_password" maxlength="32"
                                                    data-pattern="/^(.){8,32}$/"
                                                    onkeypress="validErrorHidden(this);"
                                                    data-mess="Mật khẩu đăng nhập chưa được khai báo">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="safe_key"
                                            class="control-label col-md-6 text-normal">Mã xác
                                            minh</label>
                                        <div class="col-md-14">
                                            <div class="input-group">
                                                <span class="input-group-addon"><em
                                                        class="fa fa-shield fa-lg"></em></span>
                                                <input type="text" class="required form-control"
                                                    placeholder="Mã xác minh" value=""
                                                    name="safe_key" maxlength="32"
                                                    data-pattern="/^[a-zA-Z0-9]{32,32}$/"
                                                    onkeypress="validErrorHidden(this);"
                                                    data-mess="Trường này là bắt buộc.">
                                                <span class="input-group-btn"><input type="button"
                                                        value="Gửi mã xác minh"
                                                        class="safekeySend btn btn-warning"
                                                        onclick="safekeySend(this.form);"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <input type="hidden" name="checkss"
                                                value="8ec69c9bcb6f243508e13f6f3877c794">
                                        </div>
                                        <div class="col-md-10">
                                            <input type="button" value="Thiết lập lại"
                                                class="btn btn-default"
                                                onclick="validReset(this.form);return!1;">
                                            <button class="bsubmit btn btn-primary" type="submit">
                                                Chấp nhận
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <ul class="nav navbar-nav">
                <li>
                    <a href="/vi/users/main/"><em
                            class="fa fa-caret-right margin-right-sm"></em>Thông tin thành viên</a>
                </li>
                <li>
                    <a href="/vi/users/memberlist/"><em
                            class="fa fa-caret-right margin-right-sm"></em>Danh sách thành viên</a>
                </li>
                <li>
                    <a href="/vi/users/logout/"><em
                            class="fa fa-caret-right margin-right-sm"></em>Thoát</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<?php   include('view/common/footer.tpl'); ?>