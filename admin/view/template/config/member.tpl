<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
<div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
    <section class="content-header">
        <h1 style="font-size: 20px; font-family: Roboto Condensed">
            Cấu hình thông tin đăng ký thành viên
        </h1>
        <ol class="breadcrumb">
            <li><a href="index.php?module=home">Trang Chủ</a></li>
            <li class="active">Cấu hình thành viên</li>
        </ol>
    </section>
    <section class="content animated fadeIn">
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-warning">
                    <div class="container">
                         <table class="table table-condensed">
                            <thead>
                            <tr>
                                <th>Trường dữ liệu</th>
                                <th>Trạng thái</th>
                            </tr>
                            </thead>
                            <tbody id="tblData"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
 <?php include('view/template/common/footer.tpl'); ?>
 <script src="assets/js/customize/config/js-member.js"></script>