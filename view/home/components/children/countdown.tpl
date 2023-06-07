 <div class="col-md-8">
    <section class="countdown-clock ">
        <div class="mb-15 text-center title_count_down">
            Thời gian còn lại của cuộc thi
        </div>
        <div class="flip-clock-wrapper">
            <div class="row text-center dem_nguoc">
                <div id="countdown">
                    <div class="countdown-count">
                        <div class="single-count">
                            <span class="num-time mau_4caf50" id="days">2</span>
                            <span class="num-time mau_4caf50" id="days1">0</span>
                            <div class="bao_time">
                                <div class="mau_4caf50">
                                    Ngày
                                </div>
                            </div>
                        </div>
                        <div class="single-count">
                            <span class="num-time mau_2196f3" id="hours">1</span>
                            <span class="num-time mau_2196f3" id="hours1">1</span>
                            <div class="bao_time">
                                <div class="mau_2196f3">
                                    Giờ
                                </div>
                            </div>
                        </div>
                        <div class="single-count">
                            <span class="num-time mau_3f51b5" id="minutes">2</span>
                            <span class="num-time mau_3f51b5" id="minutes1">6</span>
                            <div class="bao_time">
                                <div class="mau_3f51b5">
                                    Phút
                                </div>
                            </div>
                        </div>
                        <div class="single-count">
                            <span class="num-time mau_f44336" id="seconds">5</span>
                            <span class="num-time mau_f44336" id="seconds1">5</span>
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
            <a class="btn btn-lg btn-default" href="/rule" title="Quy chế cuộc thi">
                Quy chế
            </a>
            <a class="btn btn-lg btn-danger" data-type="notStart"
                href="/vi/onlinetest/dotest/tesst-14.html" title="tesst">
                Vào thi
            </a>
        </div>
    </section>
</div>


<script type="text/javascript">
    (function () {
        const second = 1000,
            minute = second * 60,
            hour = minute * 60,
            day = hour * 24;
        let birthday = "June 23, 2023 00:00:00",
            countDown = new Date(birthday).getTime(),
            x = setInterval(function () {
                let now = new Date().getTime(),
                    distance = countDown - now;
                document.getElementById("days").innerText = (String(Math.floor((distance / (day)))).charAt(1)) ? String(Math.floor((distance / (day)))).charAt(0) : 0,
                    document.getElementById("days1").innerText = (String(Math.floor((distance / (day)))).charAt(1)) ? String(Math.floor((distance / (day)))).charAt(1) : String(Math.floor((distance / (day)))).charAt(0),
                    document.getElementById("hours").innerText = (String(Math.floor((distance % (day)) / (hour))).charAt(1)) ? String(Math.floor((distance % (day)) / (hour))).charAt(0) : 0,
                    document.getElementById("hours1").innerText = (String(Math.floor((distance % (day)) / (hour))).charAt(1)) ? String(Math.floor((distance % (day)) / (hour))).charAt(1) : String(Math.floor((distance % (day)) / (hour))).charAt(0),
                    document.getElementById("minutes").innerText = (String(Math.floor((distance % (hour)) / (minute))).charAt(1)) ? String(Math.floor((distance % (hour)) / (minute))).charAt(0) : 0,
                    document.getElementById("minutes1").innerText = (String(Math.floor((distance % (hour)) / (minute))).charAt(1)) ? String(Math.floor((distance % (hour)) / (minute))).charAt(1) : String(Math.floor((distance % (hour)) / (minute))).charAt(0),
                    document.getElementById("seconds").innerText = (String(Math.floor((distance % (minute)) / second)).charAt(1)) ? String(Math.floor((distance % (minute)) / second)).charAt(0) : 0,
                    document.getElementById("seconds1").innerText = (String(Math.floor((distance % (minute)) / second)).charAt(1)) ? String(Math.floor((distance % (minute)) / second)).charAt(1) : String(Math.floor((distance % (minute)) / second)).charAt(0);

                //do something later when date is reached
                if (distance < 0) {
                    let headline = document.getElementById("headline"),
                        countdown = document.getElementById("countdown"),
                        content = document.getElementById("content");

                    headline.innerText = "It's my birthday!";
                    countdown.style.display = "none";
                    content.style.display = "block";

                    clearInterval(x);
                }
                //seconds
            }, 0)
    }());
</script>
<script type="text/javascript">
    // $('#cuoc_thi_da_ket_thuc').owlCarousel({
    //     loop: true,
    //     margin: 0,
    //     responsiveClass: true,
    //     autoplay: true,
    //     autoplayTimeout: 5000,
    //     autoplayHoverPause: true,
    //     nav: true,
    //     dots: true,
    //     responsive: {
    //         0: {
    //             items: 1
    //         },
    //         600: {
    //             items: 2
    //         },
    //         900: {
    //             items: 3
    //         },
    //         1200: {
    //             items: 3
    //         },
    //     }
    // })

</script>
