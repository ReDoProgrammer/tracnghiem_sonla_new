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
                                            <a href="index.php?module=examination&act=do-exam&id=${e.id}" class="btn btn-sm btn-info">Tham gia
                                                thi</a>
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

    // Clone the slides
    var firstSlide = $('.slide:first-child');
    var clonedFirstSlide = firstSlide.clone();
    slider.append(clonedFirstSlide);

    // Auto scroll function
    function startScroll() {
        if (!isScrolling) {
            isScrolling = true;
            slider.animate({ scrollLeft: '+=' + firstSlide.outerWidth() }, 'slow', function () {
                if (slider.scrollLeft() === 0) {
                    slider.scrollLeft(firstSlide.outerWidth());
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
    });

    // Resume auto scroll on mouseleave
    slider.on('mouseleave', function () {
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
        slider.animate({ scrollLeft: '-=' + firstSlide.outerWidth() }, 'slow', function () {
            if (slider.scrollLeft() === 0) {
                var lastSlide = $('.slide:last-child');
                slider.prepend(lastSlide);
                slider.scrollLeft(firstSlide.outerWidth());
            }
            startAutoScroll();
        });
    });
}