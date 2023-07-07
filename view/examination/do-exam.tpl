<?php include('view/common/header.tpl'); ?>
<div class="row">
    <div class="col-sm-18 col-md-17 col-sm-push-6 col-md-push-7">
        <div id="OnlineTestDoTest" class="OnlineTestDoTest">
            <div class="OnlineTestDoTestbox">
                <?php 
                    include('components/summary.tpl');
                    include('components/content.tpl');
                ?>
                <div class="form-inline mb-5" style="margin-bottom:10px;" id="NumberOfCandidates">
                    <div class="form-group">
                        <label for="candidate">Theo bạn có bao nhiêu người tham gia thi trong kỳ này?</label>
                        <input type="text" class="form-control required ml-5" style="text-align:right; padding-right:20px;" id="txtNumberOfCandidate">
                        <span id="msgNumberOfCandidates"></span>
                    </div>
                </div>
            </div>
            <div id="freeRemaining" class="summury-info co_dinh text-center ">
                Thời gian còn lại: 
                <div class="timer" data-seconds-left="6000" data-timeout="5993">
                    <span class="remainTime"></span>
                    <div class="clearDiv"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-7 col-sm-pull-18 col-md-pull-17">
        <?php include('view/common/children/profile.tpl'); ?>
        <?php include('components/pagination.tpl'); ?>
        <div class="clearfix"> </div>
    </div>
</div>

<?php include('view/common/footer.tpl'); ?>

<link rel="stylesheet" href="assets/css/examination/style.css">
<link rel="stylesheet" href="assets/css/examination/onlinetest.css">
<link rel="stylesheet" href="assets/css/pretty-switch.css">
<script src="assets/js/examination/js-examination.js"></script>

<style>
    .swal-wide{
        width:850px !important;
    }
</style>