<div class="col-md-8">
    <section class="countdown-clock ">
        <div class="mb-15 text-center title_count_down" id="divTitleCountdown">
            Thời gian còn lại của cuộc thi
        </div>
        <div class="flip-clock-wrapper" id="ClockCountdown">
            <div class="row text-center dem_nguoc">
                <div id="countdown">
                    <div class="countdown-count">
                        <div class="single-count">
                            <span class="num-time mau_4caf50" id="days">0</span>
                            <span class="num-time mau_4caf50" id="days1">0</span>
                            <div class="bao_time">
                                <div class="mau_4caf50">
                                    Ngày
                                </div>
                            </div>
                        </div>
                        <div class="single-count">
                            <span class="num-time mau_2196f3" id="hours">0</span>
                            <span class="num-time mau_2196f3" id="hours1">0</span>
                            <div class="bao_time">
                                <div class="mau_2196f3">
                                    Giờ
                                </div>
                            </div>
                        </div>
                        <div class="single-count">
                            <span class="num-time mau_3f51b5" id="minutes">0</span>
                            <span class="num-time mau_3f51b5" id="minutes1">0</span>
                            <div class="bao_time">
                                <div class="mau_3f51b5">
                                    Phút
                                </div>
                            </div>
                        </div>
                        <div class="single-count">
                            <span class="num-time mau_f44336" id="seconds">0</span>
                            <span class="num-time mau_f44336" id="seconds1">0</span>
                            <div class="bao_time">
                                <div class="mau_f44336">
                                    Giây
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="button-group text-center">
            <a class="btn btn-lg btn-default" href="/rule" title="Quy chế cuộc thi" id="btnRoles">
                Quy chế
            </a>
            <a class="btn btn-lg btn-danger" data-type="notStart" href="javascript:void(0)"
                title="Chưa có cuộc thi nào" id="btnNotExam">
                Chưa có cuộc thi nào
            </a>
        </div>
    </section>
</div>

<script>
  
    $(document).ready(function () {
        $.ajax({
            url: 'controller/exam/erliest-exam.php',
            type: 'get',
            success: function (exam) {
                if(exam){
                    Countdown(new Date(exam.begin));
                    // $('#btnNotExam').hide();
                }else{
                    // $('#divTitleCountdown').hide();
                    // $('#ClockCountdown').hide();
                    // $('#btnRoles').hide();
                    $('#btnNotExam').show();
                }
            },
            error: function (err) {
                console.log(`Loi: ${err}`)
            }
        })
    })


    var timer;
    function Countdown(begin){        
        timer = setInterval(function() {
            timeBetweenDates(begin);
        }, 1000);    
    }

    function timeBetweenDates(toDate) {
        var dateEntered = toDate;
        var now = new Date();
        var difference = dateEntered.getTime() - now.getTime();

        if (difference <= 0) {
            clearInterval(timer);        
        } else {            
            var seconds = Math.floor(difference / 1000);
            var minutes = Math.floor(seconds / 60);
            var hours = Math.floor(minutes / 60);
            var days = Math.floor(hours / 24);

            hours %= 24;
            minutes %= 60;
            seconds %= 60;
            

            $('#days').text(Math.floor(days/10));
            $('#days1').text(days%10);

            $('#hours').text(Math.floor(hours/10));
            $('#hours1').text(hours%10);

            $('#minutes').text(Math.floor(minutes/10));
            $('#minutes1').text(minutes%10);

            $('#seconds').text(Math.floor(seconds/10));
            $('#seconds1').text(seconds%10);

        }
    }
</script>