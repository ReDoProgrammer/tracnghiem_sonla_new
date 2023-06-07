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
        <div class="page panel panel-default">
            <div class="panel-body">
                <h2 class="margin-bottom-lg">Thông tin thành viên</h2>
                <div class="row">
                    <figure onclick="changeAvatar('/vi/users/avatar/upd/');"
                        class="avatar left pointer">
                        <div style="width:80px;">
                            <p class="text-center">
                                    <img src=""
                                    alt="" title="" width="80"
                                    class="img-thumbnail bg-gainsboro m-bottom pf_avatar">
                            </p>
                            <figcaption>Hình đại diện</figcaption>
                        </div>
                    </figure>
                    <div>
                        <ul class="nv-list-item xsm">
                            <li><em class="fa fa-angle-right">&nbsp;</em> Tài khoản:
                                <strong class="pf_username"></strong> (<span class="pf_email"></span>)</li>
                            <li>
                                <em class="fa fa-angle-right">&nbsp;</em> 
                                <span class="pf_role"></span>
                            </li>
                            <li>
                                <em class="fa fa-angle-right">&nbsp;</em> 
                                Đăng nhập vào: &nbsp;<span class="pf_newest_login"></span>
                            </li>
                            <li>
                                <em class="fa fa-angle-right">&nbsp;</em> 
                                Bằng IP: <span class="pf_current_ip_address"></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="table-responsive margin-bottom-lg">
            <table class="table table-bordered table-striped">
                <colgroup>
                    <col style="width:45%">
                </colgroup>
                <tbody>
                    <tr>
                        <td>Họ tên</td>
                        <td class="pf_fullname fw-bold"></td>
                    </tr>
                    <tr>
                        <td>Ngày tháng năm sinh</td>
                        <td class="pf_birthdate"></td>
                    </tr>
                    <tr>
                        <td>Giới tính</td>
                        <td class="pf_gender"></td>
                    </tr>
                    <tr>
                        <td>Điện thoại</td>
                        <td class="pf_phone"></td>
                    </tr>
                    <tr>
                        <td>Địa chỉ</td>
                        <td class="pf_address"></td>
                    </tr>
                    <tr>
                        <td>Nghề nghiệp</td>
                        <td class="pf_job">Viên chức</td>
                    </tr>
                    <tr>
                        <td>Đơn vị công tác</td>
                        <td class="pf_workplace"></td>
                    </tr>                  
                    <tr>
                        <td>Ngày tham gia</td>
                        <td class="pf_applied_date"></td>
                    </tr>
                    
                    <tr>
                        <td>Lần truy cập trước</td>
                        <td class="pf_lasttime_login"></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <ul class="nav navbar-nav">
            <li><a href="index.php?module=member&act=profile"><em
                        class="fa fa-caret-right margin-right-sm"></em>Thông tin tài khoản</a></li>
            <li><a href="index.php?module=member&act=logout"><em
                        class="fa fa-caret-right margin-right-sm"></em>Thoát</a></li>
        </ul>
    </div>
</div>
    
<?php   include('view/common/footer.tpl'); ?>

<script src="assets/js/member/js_profile.js"></script>