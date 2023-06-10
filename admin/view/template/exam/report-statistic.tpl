<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>

<div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
    <section class="content-header">
        <h1 style="font-size: 20px; font-family: Roboto Condensed">
            Báo cáo & thống kê
        </h1>
        <ol class="breadcrumb">
            <li><a href="index.php?module=home">Trang Chủ</a></li>
            <li class="active">Báo cáo & thống kê</li>
        </ol>
    </section>
    <section class="content animated fadeIn">
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-warning">
                    <div class="box-body">
                        <div class="row">   
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-right" style="margin-top:5px">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="ckbMax" name="ckbMax" checked>
                                <label class="form-check-label">Chỉ lấy bài thi điểm cao nhất</label>
                            </div>
                        </div>                         
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="margin-top:5px">
                                <div class="input-group input-group-sm">                                    
                                    <select class="selectpicker" id="slExams" data-live-search="true" multiple></select>
                                    <select class="selectpicker" id="slUnits" data-live-search="true" multiple></select>
                                    <span class="input-group-btn">   
                                        <button class="btn btn-warning btn-flat" id="btnSearch">
                                            <i class="fa fa-search" aria-hidden="true"></i>
                                            Load
                                        </button>
                                        <button class="btn btn-info bg-info btn-flat btn-margin ml-2" id="btnExportExcel">
                                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>
                                            Xuất Excel
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
                                        style="margin-bottom: 0;" id="tableData">
                                        <thead>
                                            <tr>
                                                <th class="text-center">
                                                    STT
                                                </th>
                                                <th>Tên đăng nhập</th>
                                                <th class="text-left">
                                                    Họ tên
                                                </th>                                                
                                                <th class="text-center">
                                                    Giới tính
                                                </th>
                                                <th class="text-center">
                                                    Ngày sinh
                                                </th>
                                                <th class="text-center">
                                                    Điện thoại
                                                </th>
                                                <th class="text-center">
                                                    Email
                                                </th>
                                                <th class="text-center">
                                                    Nghề nghiệp
                                                </th>
                                                <th class="text-center">
                                                    Đơn vị công tác
                                                </th>
                                                <th class="text-center">
                                                    Chức vụ
                                                </th>
                                                <th class="text-center">
                                                    Cuộc thi
                                                </th>                                               
                                                <th class="text-center">
                                                   Lần thi
                                                </th>
                                                 <th class="text-center">
                                                    Điểm số
                                                </th>
                                                 <th class="text-center">
                                                    Ngày thi
                                                </th>
                                                 <th class="text-center">
                                                   Thời gian làm bài
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="tblData">
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
                                        <div class="form-group text-right">
                                            <label>Số dòng:</label>
                                            <select class="form-control" style="width:100px; margin-left:10px;"
                                                id="slPageSize">
                                                <option>10</option>
                                                <option>50</option>
                                                <option>100</option>
                                                <option>500</option>
                                                <option>All</option>
                                            </select>                                           
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
<script src="assets/dist/js/xlsx.full.min.js"></script>
<script src="assets/dist/js/jquery.table2excel.min.js"></script>
<script src="assets/js/customize/exam/js-list.js"></script>
<script src="assets/js/customize/workplace/js-provinces-workplaces.js"></script>
<script src="assets/js/customize/exam/js-report.js"></script>

<style>
  table {
    border-collapse: collapse;
  }

  th, td {
    border: 1px solid black;
    padding: 8px;
  }
</style>



