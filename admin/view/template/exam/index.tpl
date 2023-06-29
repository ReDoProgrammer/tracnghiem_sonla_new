<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>




<div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
    <section class="content-header">
        <h1 style="font-size: 20px; font-family: Roboto Condensed">
            Quản lý cuộc thi
        </h1>
        <ol class="breadcrumb">
            <li><a href="index.php?module=home">Trang Chủ</a></li>
            <li class="active">Cuộc thi</li>
        </ol>
    </section>
    <section class="content animated fadeIn">
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-warning">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="margin-top:5px">
                                <div class="input-group input-group-sm">
                                    <input type="text" class="form-control" id="txtSearch"
                                        placeholder="Từ khóa tìm kiếm cuộc thi" />
                                    <span class="input-group-btn">
                                        <button class="btn btn-info btn-flat" id="btnSearch">
                                            <i class="fa fa-search" aria-hidden="true"></i>
                                            Tìm Kiếm!
                                        </button>
                                    </span>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8" style="margin-top:5px">
                                <div class="row" style="margin-bottom: 5px;">
                                    <div class="col-sm-12 text-right">
                                        <button class="btn bg-aqua btn-flat btn-margin" id="btnAddNew"><i
                                                class="fa fa-plus" aria-hidden="true"></i>&nbsp;&nbsp;Thêm mới</button>
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
                                                <th class="text-center">
                                                    STT
                                                </th>
                                                <th>Thumbnail</th>
                                                <th class="text-left">
                                                    Tên cuộc thi
                                                </th>                                                
                                                <th class="text-center">
                                                    Th.Lượng
                                                </th>
                                                <th class="text-center">
                                                    Số C.H
                                                </th>
                                                <th class="text-center">
                                                    Điểm
                                                </th>
                                                <th class="text-center">
                                                    Lần thi
                                                </th>
                                                <th class="text-center">
                                                    Bắt đầu
                                                </th>                                               
                                                <th class="text-center">
                                                    Kết thúc
                                                </th> 
                                                 <th class="text-center">
                                                    Trạng thái
                                                </th>  
                                                <th class="text-center">
                                                   Thống kê
                                                </th>                                            
                                                <th class="text-center">
                                                   Tiêu điểm
                                                </th>
                                                <th class="text-center">
                                                   Dự đoán
                                                </th>
                                                 <th class="text-center">
                                                    Đảo C.H
                                                </th>
                                                  <th class="text-center">
                                                    Đảo Đ.A
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
<?php include('view/template/exam/modal.tpl'); ?>

<script src="assets/js/customize/exam/js-exam.js"></script>


