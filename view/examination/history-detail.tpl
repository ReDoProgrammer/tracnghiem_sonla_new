<?php include('view/common/header.tpl'); ?>

<div class="row">
    <div class="col-sm-18 col-md-17 col-sm-push-6 col-md-push-7">
        <div id="OnlineTestDoTest" class="OnlineTestDoTest">            
            <div id="boxfirst" class="toggle_list_q">
                <h1 class="exTitle"></h1>
                <div class="body-result-1">
                    <div class="total_point">
                        <span class="color-orange size-18"><b>ĐIỂM SỐ</b></span>
                        <b class="color-orange size-20" id="exMarks"></b>
                    </div>
                    <div class="result-question">
                        <h3>Kết quả thi: <span class="exTitle"></span></h3>
                        <div class="box-50">
                            <p>
                                Số câu đã làm: <b style="margin-left: 40px;"><span id="exChoosed"></span> / <span id="exTotalQuestions"></span> câu </b> <br>
                                Thời gian làm bài: <b style="margin-left: 22px;"><span id="exSpentDuration"></span> / <span id="exDuration"></span> phút</b>
                            </p>
                        </div>
                        <p style="margin-top: 15px;margin-bottom: 0" class="sum-result">
                            <span class="aw_correct"></span> Đúng: <b id="exCorrect"></b>
                            <span class="aw_not_correct"></span> Sai: <b id="exWrong"></b>
                            <span class=""></span> Chưa chọn: <b id="exUnchoosed"></b>
                        </p>
                        <h4 style="margin-top: 15px;margin-bottom: 0" id="hasForeCast" class="text-info">
                            Dự đoán số thí sinh: <span id="forecast_candidate" style="font-weight:bold; color:red;"></span>
                            </h4>
                    </div>
                </div>
                <div class="body-result-2 list-question-number2 toggle_list_q">
                    <ul id="ulPagination"></ul>
                </div>
            </div>
            <div id="showQuestions" class="boxtest">
                <p>
                    <strong>Phần thi trắc nghiệm</strong>
                </p>
                
            </div>

        </div>
        <div class="clearfix"></div>
    </div>
    <div class="col-sm-6 col-md-7 col-sm-pull-18 col-md-pull-17">
       <?php include('view/common/children/profile.tpl')?>
    </div>
</div>
<?php include('view/common/footer.tpl'); ?>
<link rel="stylesheet" href="assets/css/examination/onlinetest.css">
<script src ="assets/js/examination/js-history-detail.js"></script>
<script src="assets/js/onlinetest.js?t=1683896486"></script>