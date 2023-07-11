<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>


<div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
    <section class="content-header">
        <h1 style="font-size: 20px; font-family: Roboto Condensed">
            Quản lý thành viên
        </h1>
        <ol class="breadcrumb">
            <li><a href="index.php?module=home">Trang Chủ</a></li>
            <li class="active">Thành viên</li>
        </ol>
    </section>
    <section class="content animated fadeIn">
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-warning">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8" style="margin-top:5px">
                                <select class="form-control selectpicker" id="slProvincesWorkplaces" data-live-search="true"></select>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="margin-top:5px">
                                <div class="input-group input-group-sm">
                                    <input type="text" class="form-control" id="txtSearch"
                                        placeholder="Từ khóa tìm kiếm thành viên" />
                                    <span class="input-group-btn">
                                        <button class="btn btn-info btn-flat" id="btnSearch">
                                            <i class="fa fa-search" aria-hidden="true"></i>
                                            Tìm Kiếm!
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-success" style="margin-top:5px">
                            <div class="panel-body">
                                <div id="result" class="table-responsive"
                                    style="display:block; height:370px; overflow-y:scroll;">
                                    <table class="table table-bordered table-striped table-hover"
                                        style="margin-bottom: 0;">
                                        <thead>
                                            <tr>
                                                <th class="text-center" style="padding-top: 20px;padding-bottom: 20px">
                                                    STT
                                                </th>
                                                <th class="text-left">
                                                    Tài khoản
                                                </th>                                                
                                                <th class="text-center">
                                                    Họ tên
                                                </th>
                                                <th>Giới tính</th>
                                                <th>Ngày sinh</th>
                                                <th class="text-center">
                                                    Điện thoại
                                                </th>
                                                <th class="text-center">
                                                    Email
                                                </th>
                                                <th>Địa chỉ</th>
                                                <th>Đơn vị</th>
                                                <th>Đơn vị công tác</th>
                                                <th>Nghề nghiệp</th>
                                                <th>Chức vụ</th>
                                                <th class="text-center">
                                                    Ngày tham gia
                                                </th>
                                                <th class="text-center">
                                                    Đăng nhập lần cuối
                                                </th>
                                                <th class="text-center">                                                   
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="tblData">
                                        </tbody>
                                    </table>
                                </div>                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<?php include('modal-detail.tpl');?>
 <?php include('view/template/common/footer.tpl'); ?>
 <script src="assets/js/customize/member/js-list.js"></script>
