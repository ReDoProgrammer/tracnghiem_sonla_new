var exam_id = '';
var user_id = '';
var exam_date;
var total_times = 0;
var current_times = 0;





$(function () {

    $('#scrolldiv').hide();
    $('.TriSea-technologies-Switch').hide();
    $('#freeRemaining').hide();
    $('#navPagination').hide();
    var id = getUrlParameter('id');
    if (parseInt(id) && id > 0) {
        LoadExamSummary(id);
    }
    $('#NumberOfCandidates').hide();



    $('#showQuestion').scroll(function () {
        // var showQuestionTop = $(this).scrollTop();
        // var showQuestionBottom = showQuestionTop + $(this).height();

        // $("#showQuestion div.test").each(function () {
        //     var showQuestionOffset = $(this).offset().top;
        //     var scrollTop = $(this).scrollTop();

        //     $("#showQuestion div.test").each(function () {
        //         var testOffset = $(this).offset().top - showQuestionOffset;

        //         if (testOffset <= scrollTop) {
        //             var testId = $(this).attr("id");
        //             $(`#questionsPagination li a.active`).removeClass('active');
        //             $(`#questionsPagination li#${testId} a`).addClass('active');
        //         }
        //     });
        // });
    });
})



var questions = [];
var current_question_id = -1;//câu hỏi hiện tại đang được chọn
var current_index = -1;//chỉ số của câu hỏi hiện tại trong mảng
var single = true;
var duration = 0;
var exam_id = -1;
var timeOut = false;

$('#btnSaveExamResult').click(async function (e) {
    e.preventDefault();

    let spent_duration = $('.ex_duration').data('duration') - localStorage.getItem('duration');


    let forecast_candidates = 0;


    if ($('#ex_title').data('forecast_candidates') == 1) {
        let forecast = $('#txtNumberOfCandidate').val();
        if (!isInteger(forecast) || forecast < 1) {
            Swal.fire({
                icon: 'warning',
                title: 'Tham gia dự đoán!',
                text: 'Vui lòng nhập số thí sinh mà bạn dự đoán tham gia thi'
            })
            $('#txtNumberOfCandidate').select();
            return;
        }
        forecast_candidates = parseInt($('#txtNumberOfCandidate').val());
    }



    let submited = true;

    //chỉ kiểm tra các câu hỏi chưa làm khi thời gian làm bài chưa hết
    if (!timeOut) {
        let uncheckIds = $("ul#questionsPagination li a:not(.done)").map(function () {
            return $(this).text();
        }).get();
        if (uncheckIds.length > 0) {
            submited = false;
            await Swal.fire({
                title: 'Bạn vẫn muốn nộp bài?',
                html: "<h4>Bạn chưa trả lời hết câu hỏi [<span class='text-danger fw-bold'>" + uncheckIds.join(', ') + "]</span></h4>",
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Xác nhận nộp',
                cancelButtonText: 'Tiếp tục làm bài'
            }).then((result) => {
                if (result.isConfirmed) {
                    submited = true;
                }
            })
        }
    }



    if (submited) {

        $.ajax({
            url: 'controller/exam/save-result.php',
            type: 'post',
            data: {
                exam_id,
                result: questions,
                spent_duration,
                times: $('#btnOpenExam span.exam_times').text(),
                exam_date,
                forecast_candidates
            },
            success: function (data) {
                console.log(data)
                if (data.statusCode == 201) {
                    localStorage.clear();
                    clearInterval(countdownInterval);
                    Swal.fire({
                        title: `${data.title}`,
                        showDenyButton: true,
                        showCancelButton: false,
                        confirmButtonText: 'Xem lại bài thi',
                        denyButtonText: `Tới trang chủ`,
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = `index.php?module=examination&act=history-detail&id=${data.content}`;
                        } else if (result.isDenied) {
                            window.location.href = 'index.php?module=home&act=index';
                        }
                    })
                }
            },
            error: function (xhr, status, error) {
                console.log(xhr, error, status);
            }
        })
    }
})


function LoadExamSummary(id) {
    $.ajax({
        url: 'controller/exam/summary.php',
        type: 'get',
        data: { id },
        success: function (data) {
            exam = data.content;
            if (exam.exam_status != 0) {
                $('#btnOpenExam').addClass('disabled');
            }

            total_times = exam.times;
            $('#ex_title').text(exam.title);
            $('#ex_title').attr('data-forecast_candidates', exam.forecast_candidates);
            $('#ex_title').attr('data-exam', id);
            $('.ex_thumbnail').attr('src', exam.thumbnail);
            $('.ex_begin').text(exam.begin);
            $('.ex_end').text(exam.end);
            $('.ex_duration').text(`${exam.duration} phút`);
            $('.ex_duration').attr('data-duration', exam.duration * 60);
            $('.ex_number_of_questions').text(`${exam.number_of_questions} câu`);
            $('.ex_number_of_questions').attr('data-noq', exam.number_of_questions);
            $('.ex_times').text(exam.times > 0 ? exam.times : 'Unlimit');
            $('.ex_times').attr('data-times', exam.times);
            $('.ex_mark_per_question').text(exam.mark_per_question);

            $('.ex_random_questions').html(`${exam.random_questions == 1 ? '<i class="fa fa-check-square-o"></i>' : '<i class="fa fa-square-o" aria-hidden="true"></i>'}`);
            $('.ex_random_questions').attr('data-rq', exam.random_questions);

            $('.ex_random_options').html(`${exam.random_options == 1 ? '<i class="fa fa-check-square-o"></i>' : '<i class="fa fa-square-o" aria-hidden="true"></i>'}`);
            $('.ex_random_options').attr('data-ro', exam.random_options);

            if (localStorage.getItem('duration') !== null) {
                duration = localStorage.getItem('duration');
            } else {
                duration = exam.duration * 60;
            }

            exam_id = $('#ex_title').attr('data-exam');
            user_id = localStorage.getItem('candidate');
            LoadTimes();
            if (localStorage.getItem(`exam_${user_id}_${exam_id}`) !== null) {
                $('#btnOpenExam').click();
            }
        },
        error: function (jqXHR, exception) {
            console.log(jqXHR, exception);
        }
    })
}

function LoadTimes() {
    $.ajax({
        url: 'controller/member/exam-times.php',
        type: 'get',
        data: { exam_id },
        success: function (data) {
            console.log(data);
            current_times = data.content;
            current_times++;
            if (data.statusCode == 200) {
                $('#btnOpenExam').html(`Mở bài thi lần <span class="exam_times">${++data.content}</span>`);
            }
        }
    })
}

$('#btnOpenExam').click(function () {
    if (total_times != 0 && current_times > total_times) {
        Swal.fire(
            'Số lần làm bài của bạn đã đạt mức tối đa',
            'Bạn không thể làm lại bài thi này!',
            'error'
        )
        return;
    }


    exam_date = ExamDate();
    $('#ex_summary').slideUp(500);
    $('#showQuestion').slideDown(500);
    $('#scrolldiv').show();
    $('.TriSea-technologies-Switch').show();
    $('#freeRemaining').show();
    $('#navPagination').show();

    let isForeCast = $('#ex_title').data('forecast_candidates') == 1;
    isForeCast ? $('#NumberOfCandidates').show() : $('#NumberOfCandidates').hide();
    let id = $('#ex_title').attr('data-exam');
    LoadQuestionsByExam(id);
    $('#current_times').text(current_times);
    countdown();
})

function Report(id) {
    let q = questions.find(x => x.id == id);
    console.log(q);
    Swal.fire({
        title: `<strong>Phản hồi lỗi câu hỏi <b class="text-danger">${q.title}</b></strong>`,
        html:
            `<div class="panel">            
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 form-group">
                        <label>Nhóm lỗi</label>
                        <select class="form-control" id="sllErrorType">
                            <option value="1">Lỗi tiêu đề</option>
                            <option value="2">Lỗi đáp án</option>
                            <option value="3">Lỗi khác</option>
                        </select>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-16 col-lg-16 form-group">
                        <label>Mô tả ngắn gọn về lỗi</label>
                        <input type="text" class="form-control" id="txtErrorDescription"/>
                    </div>
                </div>
            </div>            
          </div>`,
        showCloseButton: true,
        showCancelButton: true,
        focusConfirm: false,
        customClass: 'swal-wide',
        confirmButtonText:
            '<i class="fa fa-thumbs-up"></i> Great!',
        confirmButtonAriaLabel: 'Thumbs up, great!',
        cancelButtonText:
            '<i class="fa fa-thumbs-down"></i>',
        cancelButtonAriaLabel: 'Thumbs down'
    })
}

// load danh sách câu hỏi dựa vào id của đề thi
function LoadQuestionsByExam(exam_id) {

    if (localStorage.getItem(`exam_${user_id}_${exam_id}`) !== null) {
        questions = JSON.parse(localStorage.getItem(`exam_${user_id}_${exam_id}`));
    } else {
        $.ajax({
            url: 'controller/exam/load-questions.php',
            type: 'get',
            data: { exam_id },
            success: function (data) {
                console.log(data);
                if (data.statusCode == 200 && data.content.length > 0) {
                    questions = data.content;
                    $('#total_questions').text(questions.length);
                    $('#answered_questions').text(questions.filter(x => x.checked).length);
                    $('#questionsPagination').empty();

                    let idx = 1;
                    questions.forEach(q => {
                        let li = `<li id="${q.id}"><a onclick="ShowQuestion(${q.id})"
                            href="javascript:void(0);" class="${q.checked ? 'done' : ''}">${idx < 10 ? '0' + idx : idx}</a></li>`;
                        $('#questionsPagination').append(li);
                        idx++;
                    })
                    if (current_question_id > 0) {
                        $(`#questionsPagination li#${current_question_id} a`).addClass('active');
                    } else {
                        current_question_id = questions[0].id;
                    }
                    let current_question = questions.filter(x => x.id == current_question_id)[0];
                    current_index = $.inArray(current_question, questions);
                    var currentLink = $("ul#questionsPagination li a").eq(current_index);
                    currentLink.click();

                }
            }
        })
    }




}



//hiển thị nội dung của câu hỏi dựa vào id câu hỏi
function ShowQuestion(id) {
    //set class active cho câu hỏi được chọn
    $(`#questionsPagination li a.active`).removeClass('active');
    $(`#questionsPagination li#${id} a`).addClass('active');


    //lưu id của câu hỏi hiện tại
    current_question_id = id;

    let isSingle = $('#switchMode').is(':checked');// lấy mode làm bài thi
    isSingle ? $('#navPagination').show() : $('#navPagination').hide();

    $('#showQuestion').css({
        'height': null,
        'overflow-y': null
    });

    if (isSingle) {
        $('#showQuestion').empty();
        let ro = $('.ex_random_options').data('ro');
        $.ajax({
            url: 'controller/option/get-by-question.php',
            type: 'get',
            data: { id, ro },
            success: function (data) {
                if (data.statusCode == 200) {
                    //Lấy câu hỏi dựa từ mảng đã lưu dựa vào id
                    let current_question = questions.filter(x => x.id == id)[0];

                    /*
                        Kiểm tra câu hỏi đầu hoặc cuối của mảng để ẩn button
                    */
                    current_index = $.inArray(current_question, questions);

                    current_index == 0 ? $('#preQuestion').addClass('disabled') : $('#preQuestion').removeClass('disabled');
                    current_index == questions.length - 1 ? $('#nextQuestion').addClass('disabled') : $('#nextQuestion').removeClass('disabled');


                    //Lấy số thứ tự của câu hỏi
                    let number = $(`#questionsPagination li#${id} a`).text();

                    options = data.content;


                    //tiêu đề câu hỏi
                    let content = `<div class="test" id="${current_question.id}">
                                    <p class="question-info">
                                        <h4 id="${current_question.id}">Câu hỏi số ${number} - Chủ đề: <span style="color:#2e66ad; font-weight: bold;">${current_question.topic}</span></h4>
                                        <a class="fr btn-feedback btn-onclick report" id="${current_question.id}" onclick="Report(${current_question_id})">
                                                <img class="not-hover" src="assets/images/icons/icon-feedback.png">
                                                <img class="hover" src="assets/images/icons/icon-feedback_hover.png">
                                                <span>Báo lỗi</span>
                                                
                                        </a>
                                    </p>
                        <div class="question">${current_question.title}</div>`;

                    //đổ các đáp án
                    let idx = 1;
                    content += `<section id="${id}">`
                    options.forEach(o => {
                        content += `<label id="${o.id}" data-question = "${current_question.id}" 
                                            class="${current_question.checked && current_question.checked == o.id ? 'checked' : ''}">
                                            <span class="title">${String.fromCharCode(64 + idx++)}</span>
                                            <input class="hide checkbox" type="checkbox" id="${o.id}" name="${id}"> ${o.content} 
                                    </label>`

                    });
                    content += `</section>`

                    content += `</div>`;
                    $('#showQuestion').append(content);
                }
            }
        })
    } else {
        var targetDiv = $("#showQuestion div.test#" + id);

        if (targetDiv.length > 0 && $("#showQuestion").length > 0) {
            var showQuestionOffset = $("#showQuestion").offset().top;
            var targetOffset = targetDiv.offset().top - showQuestionOffset + $("#showQuestion").scrollTop() - 10;
            $("#showQuestion").animate({ scrollTop: targetOffset }, 400);
        }

    }


}
function ShowMultiQuestions() {
    $('#showQuestion').css({
        'height': '410px',
        'overflow-y': 'scroll'
    });
    console.log(questions);
    let ro = $('.ex_random_options').data('ro');
    $('#showQuestion').empty();
    let number = 1;
    questions.forEach(q => {
        $.ajax({
            url: 'controller/option/get-by-question.php',
            type: 'get',
            data: { id: q.id, ro },
            success: function (data) {
                if (data.statusCode == 200) {

                    //tiêu đề câu hỏi
                    let content = `<div class="test" id="${q.id}">
                                    <p class="question-info">
                                        <h4 id="${q.id}">Câu hỏi số ${number} - Chủ đề: <span style="color:#2e66ad; font-weight: bold;">${q.topic}</span></h4>
                                        <a class="fr btn-feedback btn-onclick report" id="${q.id}" onclick="Report(${q.id})">
                                                <img class="not-hover" src="assets/images/icons/icon-feedback.png">
                                                <img class="hover" src="assets/images/icons/icon-feedback_hover.png">
                                                <span>Báo lỗi</span>
                                                
                                        </a>
                                    </p>
                        <div class="question">${q.title}</div>`;

                    //đổ các đáp án
                    let idx = 1;
                    content += `<section id="${q.id}">`
                    options.forEach(o => {
                        content += `<label id="${o.id}" data-question = "${q.id}" 
                                            class="${q.checked && q.checked == o.id ? 'checked' : ''}">
                                            <span class="title">${String.fromCharCode(64 + idx++)}</span>
                                            <input class="hide checkbox" type="checkbox" id="${o.id}" name="${q.id}"> ${o.content} 
                                    </label>`

                    });
                    content += `</section>`

                    content += `</div>`;
                    $('#showQuestion').append(content);
                    number++;
                }
            }
        })
    })
}



$(document).on('change', "#switchMode", function (e) {
    single = $(this).is(':checked');
    $('#modeName').text(`${single ? 'Single' : 'Multi'}`);
    $('#showQuestion').empty();// làm trống nội dung để tránh trùng lặp


    if ($(this).is(':checked')) {
        ShowQuestion(current_question_id);
    } else {
        ShowMultiQuestions();
    }

})




//sự kiện click của 2 button câu hỏi trước và tiếp theo
$(document).on('click', "#nextQuestion", function (e) {
    e.preventDefault();
    if ($(this).hasClass('disabled')) {
        return;
    }
    current_index++;
    if (current_index > questions.length - 1) {
        current_index = questions.length - 1;
    }

    ShowQuestion(questions[current_index].id);

})
$(document).on('click', "#preQuestion", function (e) {
    e.preventDefault();
    if ($(this).hasClass('disabled')) {
        return;
    }
    current_index--;

    if (current_index < 0) {
        current_index = 0;
    }

    ShowQuestion(questions[current_index].id);
})


//sự kiện click vào đáp án của câu hỏi
$(document).on('click', "#showQuestion label", function () {
    $(`section#${$(this).data('question')} label.checked`).removeClass('checked');
    $(this).addClass('checked');

    let question_id = $(this).data('question');
    let option_id = $(this).attr('id');
    let question = questions.filter(x => x.id == question_id)[0];
    question.checked = option_id;
    $(`#questionsPagination li#${question_id} a`).addClass('done');
    $('#answered_questions').text(questions.filter(x => x.checked).length);

    localStorage.setItem(`exam_${user_id}_${exam_id}`, JSON.stringify(questions));

    let crIdx = $.inArray(question, questions);
   
    if(crIdx == questions.length-1){
        $('#btnSaveExamResult').click();
    }

})

var countdownInterval;
function countdown() {

    countdownInterval = setInterval(function () {
        var hours = Math.floor(duration / 3600);
        var minutes = Math.floor((duration % 3600) / 60);
        var seconds = duration % 60;


        $('.remainTime').text(`${hours < 10 ? '0' + hours : hours}:${minutes < 10 ? '0' + minutes : minutes}:${seconds < 10 ? '0' + seconds : seconds}`);

        // Giảm số giây đi 1
        duration--;
        localStorage.setItem('duration', duration);

        // Dừng countdown nếu đã hết thời gian
        if (duration < 0) {
            clearInterval(countdownInterval);
            timeOut = true;
            $('.remainTime').text(`00:00:00`);
            $('#btnSaveExamResult').click();
        }
    }, 1000);
}

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
    return false;
};

function ExamDate() {
    let d = new Date();
    let date = d.getDate();
    let month = d.getMonth() + 1;
    let year = d.getFullYear();
    let hours = d.getHours();
    let minutes = d.getMinutes();
    let seconds = d.getSeconds();

    return `${year}-${month < 10 ? '0' + month : month}-${date < 10 ? '0' + date : date} ${hours < 10 ? '0' + hours : hours}:${minutes < 10 ? '0' + minutes : minutes}:${seconds < 10 ? '0' + seconds : seconds}`;

}

function isInteger(str) {
    // Sử dụng biểu thức chính quy để kiểm tra xem chuỗi chỉ chứa các chữ số
    return /^\d+$/.test(str);
}

