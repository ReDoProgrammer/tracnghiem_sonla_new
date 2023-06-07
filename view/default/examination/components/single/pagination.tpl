 <div id="scrolldiv">
    <div class="sticky">
        <div class="process-exam hidden-xs">
             <p class="mg-0">
                <b>Lần thi</b>
                <span
                    style="width: 1px;display: inline-block;height: 16px;margin: 0 13px -1px 94px;background: #fff;"></span>
                <b style="color: #fff;font-size: 22px;"> 
                <span class="onlinetest-clock">
                    <span  id="current_times">1</span>/
                    <span  id="total_times">2</span>
                </span></b>
            </p>
            <p class="mg-0">
                <b>Thời gian còn lại</b>
                <span
                    style="width: 1px;display: inline-block;height: 16px;margin: 0 13px -1px 17px;background: #fff;"></span>
                <b style="color: #fff;font-size: 22px;"> 
                <span class="onlinetest-clock">
                    <span class="timer" id="remainTime">00:00:00</span>
                </span></b>
            </p>
            <p class="so_cau_da_lam">
                <b>Số câu đã làm</b>
                <span
                    style="width: 1px;display: inline-block;height: 16px;margin: 0 15px 0 38px;background: #fff;"></span>
                <b style="color: #fff; font-size: 22px;"><span id="answered_questions">0</span>/<span id="total_questions">100</span></b>
            </p>
           
        </div>
        <div class="list-question-number  toggle_list_q">
            <p class="mg-0 color-blue text-center title-list-q"><b>CÂU HỎI</b></p>
            <div class="scrollbar">
                <ul id="questionsPagination"></ul>
            </div>
            
            <p class="text-center">
                <button class="btn-onclick submit-exam" id="btnSaveExamResult">
                    <b>Nộp bài</b>
                </button>
            </p>
        </div>
        <div id="countxyx" style="font-size: 12px;font-weight:bold"></div>

    </div>
</div>

<script src="assets/js/examination/save-examination-result.js"></script>