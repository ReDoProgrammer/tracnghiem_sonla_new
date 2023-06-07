<div class="modal" tabindex="-1" role="dialog" id="modalConfigExam">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-aqua">
                <h5 class="modal-title" style="font-weight:bold; color:white;"><i class="fa fa-cog text-warning"
                        aria-hidden="true"></i> Cấu hình đề thi gồm <span id="totalQuestions"
                        style="color:red; font-weight:bold;"></span> câu hỏi</h5>
            </div>
            <div class="modal-body">
                <div id="divConfig">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Chủ đề</th>
                                <th scope="col">Tỉ lệ% (<span id="spPercent">0</span>)</th>
                            </tr>
                        </thead>
                        <tbody id="tblConfig"></tbody>
                    </table>
                </div>

                <div class="form-group">
                    <span class="error fw-bold" id="msgErrorConfig" style="padding-left:10px;"></span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnSaveConfigs">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>
                    &nbsp;&nbsp; Xác nhận &nbsp;&nbsp;
                </button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<link href="assets/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet">
<script src="assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
