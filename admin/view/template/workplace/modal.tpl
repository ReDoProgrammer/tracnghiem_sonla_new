<div class="modal" tabindex="-1" role="dialog" id="modalWP">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-aqua">
                <h5 class="modal-title"><i class="fa fa-question" aria-hidden="true"></i> <span class="text-info"
                        style="font-weight:bold; color:white;" id="modalTitle">Add or
                        update question</span></h5>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Tên đơn vị công tác <span class="style2">(*)</span></label>
                    <input type:text class="form-control" id="txtName" />
                </div>  

                <div class="row">
                    <div class="form-group col-xs-12 col-sm-12 col-md-4 col-lg-4">
                        <label>Điện thoại <span class="style2">(*)</span></label>
                        <input type:text class="form-control" id="txtPhone" />
                    </div> 
                    <div class="form-group col-xs-12 col-sm-12 col-md-4 col-lg-4">
                        <label>Fax</label>
                        <input type:text class="form-control" id="txtFax" />
                    </div> 
                    <div class="form-group col-xs-12 col-sm-12 col-md-4 col-lg-4">
                        <label>Email <span class="style2">(*)</span></label>
                        <input type:email class="form-control" id="txtEmail" />
                    </div>
                </div>    

                <div class="row">
                    <div class="form-group col-xs-12 col-sm-12 col-md-4 col-lg-4">
                        <label>Tỉnh, thành phố <span class="style2">(*)</span></label>
                        <select class="form-control selectpicker" id="slProvinces" ></select>
                    </div> 
                   <div class="form-group col-xs-12 col-sm-12 col-md-4 col-lg-4">
                        <label>Quận, huyện <span class="style2">(*)</span></label>
                        <select class="form-control selectpicker" id="slDistricts" ></select>
                    </div>
                    <div class="form-group col-xs-12 col-sm-12 col-md-4 col-lg-4">
                        <label>Xã, phường <span class="style2">(*)</span></label>
                        <select class="form-control selectpicker" id="slWards" ></select>
                    </div>
                </div>   

                <div class="form-group">
                    <label>Địa chỉ chi tiết</label>
                    <input type:text class="form-control" id="txtAddress" />
                </div>          

                <div class="form-group">
                    <span class="error" id="errMsg"></span>
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

