<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>



<div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
    <section class="content-header">
        <h1 style="font-size: 20px; font-family: Roboto Condensed">
            Ngân hàng câu hỏi
        </h1>
        <ol class="breadcrumb">
            <li><a href="index.php?module=home">Trang Chủ</a></li>
            <li class="active">Câu hỏi</li>
        </ol>
    </section>
    <section class="content animated fadeIn">
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-warning">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5 mt-5">
                                <select class="form-control  slTopics" id="slFilterTopics">
                                    <option value="All">Tất cả</option>
                                </select>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="margin-top:5px">
                                <div class="input-group input-group-sm">
                                    <input type="text" class="form-control" id="txtSearch"
                                        placeholder="Từ khóa tìm kiếm câu hỏi" />
                                    <span class="input-group-btn">
                                        <button class="btn btn-info btn-flat" id="btnSearch">
                                            <i class="fa fa-search" aria-hidden="true"></i>
                                            Tìm Kiếm!
                                        </button>
                                    </span>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3" style="margin-top:5px">
                                <div class="row" style="margin-bottom: 5px;">
                                    <div class="col-sm-12 text-right">
                                        <button class="btn bg-aqua btn-flat btn-margin" id="btnAddNew"><i
                                                class="fa fa-plus" aria-hidden="true"></i>&nbsp;&nbsp;Thêm mới</button>
                                        <button class="btn btn-success" id="btnImportExcel"><i
                                                class="fa fa-file-excel-o" aria-hidden="true"></i>&nbsp;&nbsp;Import
                                            Excel</button>
                                    </div>
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
                                                    <div class="form-check" style="width:50px;">
                                                        <input class="form-check-input check-all" type="checkbox">
                                                    </div>
                                                </th>
                                                <th class="text-left">
                                                    Chủ đề
                                                </th>
                                                <th class="text-left">
                                                    Tiêu đề
                                                </th>
                                                <th class="text-center">
                                                    Trạng Thái
                                                </th>
                                                <th class="text-center">
                                                    Ngày tạo
                                                </th>

                                                <th class="text-center">
                                                    Người tạo
                                                </th>
                                                <th class="text-center">
                                                    Thao tác
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="tblQuestions">
                                        </tbody>
                                    </table>
                                </div>

                                <hr style=" border: 1px solid #ccc; border-top: none">
                                <div class="row">
                                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                        <ul class="pagination pagination-sm" id="pagination"
                                            style="margin-top:0 !important;"></ul>
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 text-right form-inline">
                                        <span>
                                            <Button class="btn btn-sm btn-danger" disabled id="btnDeleteMany">
                                                Xóa <i class="fa fa-trash-o"></i>
                                            </Button>
                                        </span>
                                        <div class="form-group text-right">
                                            <label>Số câu hỏi:</label>
                                            <select class="form-control" style="width:100px; margin-left:10px;"
                                                id="slPageSize">
                                                <option>10</option>
                                                <option>50</option>
                                                <option>100</option>
                                                <option>500</option>
                                                <option>All</option>
                                            </select>      
                                            <button type="button" class="btn bg-green print" id="btnPrint"><i class="fa fa-print"
                                                    aria-hidden="true"></i>&nbsp;In</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>


<?php include('view/template/common/footer.tpl'); ?>
<?php include('view/template/question/modal.tpl'); ?>
<?php include('view/template/question/modalImport.tpl'); ?>

<link href="assets/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet">
<script src="assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
<script src = "assets/js/customize/question/js-question.js"></script>

