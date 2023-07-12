$(function () {
    $.ajax({
        url: 'controller/exam/top10exams.php',
        type: 'get',
        success: function (data) {

            if (data.statusCode == 200) {
                data.content.forEach(e => {
                    let exam = ` <div class="slide">
                                    <div class="panel panel-primary exam_item">
                                        <div class="panel-heading text-overflow text-white fw-bold">${e.title}</div>
                                        <div class="panel-body">
                                            <img src="${e.thumbnail}" class="img-thumbnail img-responsive" style="width:100%; height:100px;"/>
                                            <hr />
                                            <div class="row mt-5">
                                                <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12">Từ ngày:</div>
                                                <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12 fw-bold text-info">${e.begin}</div>
                                            </div>
                                            <div class="row mt-5">
                                                <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12">Tới ngày:</div>
                                                <div class="col-xs-24 col-sm-24 col-md-12 col-lg-12 fw-bold text-info">${e.end}</div>
                                            </div>
                                        </div>
                                        <div class="panel-footer text-center">
                                            <a href="index.php?module=examination&act=do-exam&id=${e.id}" 
                                                class="btn btn-sm ${e.exam_status == 0 ? 'btn-info' : 'btn-danger disabled'}">
                                                ${e.exam_status == 1 ? 'Đã kết thúc' : e.exam_status == 0 ? 'Đang diễn ra' : 'Chưa diễn ra'}
                                            </a>
                                        </div>
                                    </div>
                                </div>`;
                    $('#top10exams').append(exam);
                })
                slider();
            }
        }
    })

})

function slider() {
    // Auto scroll variables
    var slider = $('.slider');
    var isScrolling = false;
    var scrollInterval;
    var slideWidth = $('.slide').outerWidth();
    var currentSlideIndex = 0;

    // Auto scroll function
    function startScroll() {
        if (!isScrolling) {
            isScrolling = true;
            currentSlideIndex++;
            var newScrollLeft = currentSlideIndex * slideWidth;
            slider.animate({ scrollLeft: newScrollLeft }, 'slow', function () {
                if (currentSlideIndex === slider.find('.slide').length - 1) {
                    currentSlideIndex = 0;
                    slider.scrollLeft(0);
                }
                isScrolling = false;
            });
        }
    }

    function stopScroll() {
        isScrolling = false;
    }

    // Start auto scroll
    function startAutoScroll() {
        scrollInterval = setInterval(startScroll, 3000);
    }
    startAutoScroll();

    // Stop auto scroll on hover
    slider.on('mouseenter', function () {
        clearInterval(scrollInterval);
    }).on('mouseleave', function () {
        startAutoScroll();
    });

    // Next button
    $('.next-btn').on('click', function () {
        clearInterval(scrollInterval);
        startScroll();
        startAutoScroll();
    });

    // Prev button
    $('.prev-btn').on('click', function () {
        clearInterval(scrollInterval);
        currentSlideIndex--;
        if (currentSlideIndex < 0) {
            currentSlideIndex = slider.find('.slide').length - 1;
            slider.scrollLeft(currentSlideIndex * slideWidth);
        } else {
            var newScrollLeft = currentSlideIndex * slideWidth;
            slider.animate({ scrollLeft: newScrollLeft }, 'slow');
        }
        startAutoScroll();
    });


}