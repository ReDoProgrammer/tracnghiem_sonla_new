$(async function () {
    var id = getUrlParameter('id');
    if (parseInt(id) && id > 0) {
        Summary(id);
        Pagination(id);
    }
    $('#hasForeCast').hide();

})


function Summary(id) {
    $.ajax({
        url: 'controller/exam/result-summary.php',
        type: 'get',
        data: { id },
        success: function (data) {
            if (data.statusCode == 200) {
                let exam = data.content;
                $('.exTitle').text(exam.title);
                $('#exChoosed').text(exam.choosed);
                $('#exTotalQuestions').text(exam.total_questions);
                $('#exSpentDuration').text(formatDuration(exam.spent_duration));
                $('#exDuration').text(exam.duration);
                $('#exCorrect').text(exam.correct);
                $('#exWrong').text(exam.wrong);
                $('#exUnchoosed').text(exam.unchoosed);
                $('#exMarks').text(`${exam.correct * exam.mark_per_question}/${exam.mark_per_question * exam.total_questions}`);
                if(exam.hasForeCast == 1){
                    $('#hasForeCast').show();
                    $('#forecast_candidate').text(`${exam.forecast_candidates} thí sinh`);
                }
            }

        }
    })
}


function Pagination(id) {
    $.ajax({
        url: 'controller/exam/result-pagination.php',
        type: 'get',
        data: { id },
        success: function (data) {
            if (data.statusCode == 200) {
                let content = data.content;
                let idx = 0;
                content.forEach(q => {
                    let li = ` <li class="q_${q.id}"><a class="${q.option_id == q.question_answer ? 'aw_correct' : q.option_id != 0 ? 'aw_not_correct' : ''}" onclick="showQuestion(${q.id})"
                    href="#${q.id}">${++idx < 10 ? '0' + idx : idx}</a></li>   `;
                    $('#ulPagination').append(li);

                    let question = `<div class="test" id="${q.id}">
                    <p class="question-info">
                        <b>Câu hỏi số ${idx < 10 ? '0' + idx : idx}</b>
                        <span class="level-question level-7">Trắc Nghiệm</span>
                        <a class="fr btn-feedback btn-onclick report" data-question_id="${q.id}">
                            <img class="not-hover" src="assets/images/icons/icon-feedback.png">
                            <img class="hover" src="assets/images/icons/icon-feedback_hover.png">
                            <span>Báo lỗi</span>
                        </a>
                    </p>
                    <div class="question fw-bold text-info" id="${q.id}">${q.title}</div>`
                    $('#showQuestions').append(question);

                })
                getOptions(content.map(x => {
                    let obj = {};
                    obj.id = x.id;
                    obj.question_answer = x.question_answer;
                    obj.option_id = x.option_id;
                    return obj;
                }));

            }
        }
    })
}

function getOptions(inputs) {
    inputs.forEach(q => {
        $.ajax({
            url: 'controller/option/get-by-question.php',
            type: 'get',
            data: { id: q.id, or: 0 },
            success: function (data) {
                if (data.statusCode == 200) {
                    let charCode = 1;
                    let option = '';
                    data.content.forEach(o => {
                        option += `<label class="${o.id == q.option_id ? o.correct == 1 ? 'checked trueanswer' : 'checked wrong' : 'wrong'}">
                                        <span class="title">${String.fromCharCode(64 + charCode++)}</span>
                                        <input class="hide checkbox" 
                                            type="checkbox" value="2" id="answer-2260-2" disabled="disabled" ${o.id == q.option_id ? 'checked="checked"' : ''}> 
                                        ${o.content}
                                    </label>`;

                    })
                    if (q.option_id == 0) {
                        option += `<p>
                                        <i class="fa fa-times color-red" style="margin-right: 10px;margin-left: 5px;"></i> 
                                        <b class="color-red">Bạn chưa chọn đáp án</b> 
                                    </p>`
                    } else
                        if (q.option_id != q.question_answer) {
                            option += `<p>
                                        <i class="fa fa-times color-red" style="margin-right: 10px;margin-left: 5px;"></i> 
                                        <b class="color-red">Sai</b> 
                                    </p>`;
                        }
                    option += `<div class="reporth">
                                    <a class="analyzes" href="javascript:void(0);" data-question_id="2352"
                                        data-token="13bdccb3991a756cf88d9a5ea72b56ea" data-login=""> Xem lời
                                        giải</a> -
                                    <a class="comment" href="javascript:void(0);" data-question_id="2352"
                                        data-token="13bdccb3991a756cf88d9a5ea72b56ea"><i
                                            class="fa fa-spinner fa-pulse fa-1x fa-fw"></i> Bình luận (<span
                                            id="getcomment-2352">0</span>)</a>
                                </div>
                                <div id="analyzesList-2352" class="commentbox hide"></div>
                                <div id="commentList-2352" class="commentbox hide"> </div>
                                </div>`;
                    $(`.test#${q.id}`).append(option);
                }
            }
        })
    })
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

function fetchData(url, data) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: url,
            type: 'get',
            data: data,
            success: function (data) {
                resolve(data);
            },
            error: function (error) {
                reject(error);
            }
        });
    });
}

function formatDuration(duration) {
    var minutes = Math.floor(duration / 60);
    var seconds = duration % 60;
    return `${minutes<10?'0'+minutes:minutes}:${seconds<10?'0'+seconds:seconds}`;
  }