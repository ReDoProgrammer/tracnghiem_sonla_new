<div class="modal" tabindex="-1" role="dialog" id="modalQuestion">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-aqua">
                <h5 class="modal-title"><i class="fa fa-question" aria-hidden="true"></i> <span class="text-info"
                        style="font-weight:bold; color:white;" id="modalTitle">Add or
                        update question</span></h5>
            </div>
            <div class="modal-body">
                <div class="form-group mdlAddOrUpdate">
                    <label>Chủ đề</label>
                    <select class="selectpicker form-control slTopics"  data-live-search="true" id="slTopics">
                    </select>
                </div>

                <div class="form-group">
                    <label>Nội dung câu hỏi <span class="style2">(*)</span></label>
                    <textarea id="title" class="form-control"
                        style="height:50px; max-height:100px; max-width:100%"></textarea>
                    <span class="error" id="errTitle"></span>
                </div>
                <hr/>
                <div class="form-check">
                    <input class="form-check-input" id="ckbUseCKEditor" disabled type="checkbox" name="${optName}" value="">
                    <label class="form-check-label">Sử dụng trình soạn thảo</label>
                </div>
                <div id='options'>
                </div>
                <button class="btn bg-aqua" id="btnAddOption"><i class="fa fa-plus" aria-hidden="true"></i> Thêm đáp
                    án</button>

                <div class="form-group">
                    <span class="error" id="errNoChecked"></span>
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

