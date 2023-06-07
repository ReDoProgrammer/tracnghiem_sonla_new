<div class="modal" tabindex="-1" role="dialog" id="modalTopic">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-aqua">
                <h5 class="modal-title"><i class="fa fa-question" aria-hidden="true"></i> <span class="text-info"
                        style="font-weight:bold; color:white;" id="modalTitle">Add or
                        update question</span></h5>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Tên chủ đề <span class="style2">(*)</span></label>
                    <input type:text class="form-control" id="txtName" />
                    <span class="error" id="errTitle"></span>
                </div>               

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

