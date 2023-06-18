<div class="modal" tabindex="-1" role="dialog" id="modalImport">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-aqua">
                <h5 class="modal-title"><i class="fa fa-question" aria-hidden="true"></i> <span class="text-info"
                        style="font-weight:bold; color:white;">Import file Excel</span></h5>
            </div>
            <div class="modal-body">
                <input type="file" id="excelfile" accept=".xls,.xlsx" style="margin-bottom:20px;"/>
                <div class="form-group mdlImport">
                    <label>Chủ đề</label>
                    <select class="selectpicker form-control slTopics"  data-live-search="true" id="slTopicsInImporting">
                    </select>
                </div>
                <div class="table-responsive" style="display:block; height:450px; overflow-y:scroll; margin-top:10px;">
                    <table id="exceltable" class="table table-bordered table-striped table-hover"
                        style="margin-bottom: 0;">
                        <tbody></tbody>
                    </table>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnSubmitImport">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>
                    &nbsp;&nbsp; Xác nhận &nbsp;&nbsp;
                </button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script src="assets/dist/xlsx/js/xlsx.full.min.js"></script>
