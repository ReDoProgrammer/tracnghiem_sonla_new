<hr/>
<div class="panel panel-info">
    <div class="panel-heading">
        <div class="text-center">
             <h2 class="fw-bold text-info" style="font-size:1.8rem;color:#ec1d32;">SỐ LIỆU THỐNG KÊ</h2>
            <p id="e_title" class="fw-bold text-primary"></p>             
        </div>
       
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-xs-24 col-sm-24 col-md-6 col-lg-6 form-group">
                <label>Chọn tỉnh thành</label>
                <select class="form-control" id="slProvinces"></select>
            </div>
            <div class="col-md-18 col-lg-18"></div>
        </div>
        <div class="row text-center">
            <h2 id = "h2Notice" class="text-danger">KHÔNG CÓ DỮ LIỆU VỀ CUỘC THI CỦA TỈNH NÀY</h2>
        </div>
        <canvas id="combinedChart" style="max-height:520px; margin-bottom:10px;"></canvas>
        
    </div>
</div>


<!-- Modal -->
<div id="modalChart" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body">
         <table class="table table-bordered table-stripped">
            <thead>
            <tr>
                <th>#</th>
                <th>Đơn vị công tác</th>
                <th>Số người tham gia</th>
                <th>Điểm trung bình</th>
            </tr>
            </thead>
            <tbody id="tblStat"></tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


 <hr/>
 <script src="assets/plugins/chart/chart.js"></script>
 <script src="assets/plugins/chart/chartjs-plugin-datalabels.js"></script>
 <script src="assets/js/home/js-chart.js"></script>
 
