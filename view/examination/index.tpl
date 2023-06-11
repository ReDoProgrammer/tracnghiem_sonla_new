<?php include('view/common/header.tpl');?>
<div id="exams_list"></div>
<div class="row">
    <div class="col-xs-16 col-sm-16 col-md-16 col-lg-16">
        <ul class="pagination pagination-sm" id="pagination" style="margin-top:0 !important;"></ul>
    </div>
    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 text-right form-inline">
        <div class="form-group text-right">
            <label>Số dòng:</label>
            <select class="form-control" style="width:100px; margin-left:10px;" id="slPageSize">
                <option>10</option>
                <option>50</option>
                <option>100</option>
                <option>500</option>
                <option>All</option>
            </select>
        </div>
    </div>
</div>
<?php include('view/common/footer.tpl');?>
<script src="assets/js/examination/js-index.js"></script>
<style>
    #exams_list {
        height: 370px;
        overflow-y: scroll;
    }   
</style>