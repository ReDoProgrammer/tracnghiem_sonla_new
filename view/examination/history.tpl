<?php include('view/common/header.tpl'); ?>
   

<div class="row">
    <div class="col-sm-18 col-md-17 col-sm-push-6 col-md-push-7">
        <div id="history-content">
            <div class="panel panel-default">
                <div class="panel-heading">
                        <h3 class="panel-title" style="float:left">
                            <i class="fa fa-list"></i> 
                            Lịch sử thi của bạn
                        </h3>
                    <div class="pull-right">
                    </div>
                    <div style="clear:both"></div>
                </div>
                <div class="panel-body">
                    <div class="well">
                        <div class="input-group input-group-sm">
                            <input type="text" class="form-control" id="txtExSearch" placeholder="Tìm kiếm theo mã đề hoặc tên đề thi">
                            <span class="input-group-btn">
                                <button class="btn btn-info btn-flat" id="btnExSearch">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                    Tìm Kiếm!
                                </button>
                            </span>
                        </div>
                    </div>

                    <div style="clear:both"></div>
                   
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td class="text-center"><input name="check_all[]"
                                            type="checkbox" value="yes"
                                            onclick="$('input[name*=\'selected\']').prop('checked', this.checked);">
                                    </td>
                                    <td class="text-center"> <strong>Stt</strong></td>
                                    <td class="text-center"><a
                                            href="#"><strong>Mã đề</strong></a> </td>
                                    <td class="text-center"><a
                                            href="#"><strong>Bài thi</strong></a> </td>
                                    <td class="text-center"><a
                                            href="#"><strong>Kết quả</strong></a> </td>
                                    <td class="text-center"><a
                                            href="#"><strong>Thời gian</strong></a> </td>
                                    <td class="text-center"><a
                                            href="#"><strong>Lần thi</strong></a> </td>
                                    <td class="text-center"> <strong>Thao tác </strong>
                                    </td>
                                </tr>
                            </thead>
                            <tbody id="tblExamHistory"></tbody>
                        </table>
                    </div>
                   
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-7 col-sm-pull-18 col-md-pull-17">
        <?php include('view/common/children/profile.tpl')?>
    </div>
</div>

<?php   include('view/common/footer.tpl'); ?>

<script src = "assets/js/examination/js-history.js"></script>