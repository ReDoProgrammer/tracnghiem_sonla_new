<div class="modal" tabindex="-1" role="dialog" id="modalExam">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-aqua">
                <h5 class="modal-title"><i class="fa fa-question" aria-hidden="true"></i> <span class="text-info"
                        style="font-weight:bold; color:white;" id="modalTitle">Add or
                        update exam</span></h5>
            </div>
            <div class="modal-body">

                <div class="form-group">
                    <label>Tên cuộc thi <span class="style2">(*)</span></label>
                    <input type="text" class="form-control" id="txtTitle" placeholder="Tên cuộc thi" />
                </div>

                <div class="form-group">
                    <label>Mô tả cuộc thi <span class="style2">(*)</span></label>
                    <textarea id="txaDescription" class="form-control" name="txaDescription" rows="2"
                        placeholder="Mô tả cuộc thi"></textarea>
                </div>

                <hr />

                <div class="row">
                    <div class="form-group col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <label>Hình Ảnh Đại Diện</label>
                        <a class="pull-right" style="cursor:pointer" onclick="BrowseServer();"><i
                                class="fa fa-paperclip"></i> Chọn hình
                            ảnh</a>
                        <input id="xFilePath" name="hinh_anh" class="form-control" type="text" value="" readonly>
                    </div>
                    <div class="form-group col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <label>Thời lượng [Phút]<span class="style2">(*)</span></label>
                        <input id="txtDuration" class="form-control intOnly" type="text" />
                    </div>
                    <div class="form-group col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <label>Số câu hỏi<span class="style2">(*)</span></label>
                        <input id="txtNumberOfQuestions" class="form-control intOnly" type="text" />
                    </div>
                    <div class="form-group col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <label>Thang điểm<span class="style2">(*)</span></label>
                        <input id="txtMarkPerQuestion" class="form-control floatOnly" type="text" />
                    </div>
                </div>

                <hr />

                <div class="row">
                    <div class="form-group col-xs-2 col-sm-2 col-md-2 col-lg-2"> 
                        <label>Lần thi</label>
                        <input type="number" value="1" class="form-control" id="txtTimes"/>
                    </div>
                    <div class="form-group col-xs-5 col-sm-5 col-md-5 col-lg-5"> 
                        <label>Ngày Bắt đầu<span class="style2">(*)</span></label>                    
                        <div class='input-group date'  style="z-index:20000000000000;">
                        <input type='text' class="form-control" id='dtpBegin'/>
                        <span class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </span>
                        </div>
                    </div>
                    <div class="form-group col-xs-5 col-sm-5 col-md-5 col-lg-5">  
                        <label>Ngày Kết thúc<span class="style2">(*)</span></label>                    
                        <div class='input-group date'  style="z-index:20000000000000;">
                        <input type='text' class="form-control" id='dtpEnd'/>
                        <span class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </span>
                        </div>
                    </div>                    
                </div>

                <hr />

                <div class="form-group row">                    
                    <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                        <label class="checkbox-inline" style="font-weight:bold;"><input type="checkbox" value=""
                                id="ckbHotExam">Tiêu điểm</label>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                        <label class="checkbox-inline" style="font-weight:bold;"><input type="checkbox" value=""
                                id="ckbForeCastCandidates">Dự đoán số thí sinh</label>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                        <label class="checkbox-inline" style="font-weight:bold;"><input type="checkbox" value=""
                                id="ckbRandomQuestions">Đảo câu hỏi</label>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                        <label class="checkbox-inline" style="font-weight:bold;"><input type="checkbox" value=""
                                id="ckbRandomOptions">Đảo đáp án</label>
                    </div>
                </div>
                <div class="panel panel-info">
                    <div class="panel-heading fw-bold">Cấu hình cuộc thi - <span id="totalPercent">0</span>%</div>
                    <div class = "panel-body" id="configs" style="height:200; overflow-y: scroll;"></div>
                </div>

                <hr/>

                <div class="form-group">
                    <label>Quy chế cuộc thi <span class="style2">(*)</span></label>
                    <textarea id="txaRegulation" class="form-control" name="txaRegulation" rows="2"
                        placeholder="Mô tả cuộc thi"></textarea>
                </div>

                <div class="form-group">
                    <span class="error fw-bold" id="errNoChecked"></span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnSaveChanges">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>
                    &nbsp;&nbsp; Xác nhận &nbsp;&nbsp;
                </button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<link href="assets/plugins/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script src="assets/plugins/datetimepicker/moment.min.js"></script>
<script src="assets/plugins/datetimepicker/bootstrap-datetimepicker.min.js"></script>
