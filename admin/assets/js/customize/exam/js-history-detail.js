$(function () {
    var id = getUrlParameter('id');
    var candidate = getUrlParameter('candidate');

    if (parseInt(id) && id > 0) {
        Summary(id,candidate);
        Pagination(id);
    }

})


function Summary(id,candidate) {
    $.ajax({
        url: 'controller/exam/result-summary.php',
        type: 'get',
        data: { id,candidate },
        success: function (data) {
            if (data.statusCode == 200) {
                let exam = data.content;
                $('.exTitle').html(`[<span class="text-danger">${exam.exam_code}</span>] - <span class="text-info">${exam.title}</span>`);
                $('#exChoosed').text(exam.choosed);
                $('#exTotalQuestions').text(exam.total_questions);
                $('#exSpentDuration').text(formatDuration(exam.spent_duration));
                $('#exDuration').text(exam.duration);
                $('#exCorrect').text(exam.correct);
                $('#exWrong').text(exam.wrong);
                $('#exUnchoosed').text(exam.unchoosed);
                $('#exMarks').text(`${exam.correct * exam.mark_per_question}/${exam.mark_per_question * exam.total_questions}`);

                
                $('.member_username').text(exam.username);
                $('.member_fullname').text(exam.fullname);
                $('.member_phone').text(exam.phone);
                $('.member_email').text(exam.email);
                $('.exam_times').text(exam.times);
                if(exam.avatar.trim().length>0){
                    $('.member_avatar').attr('src',exam.avatar);
                    $('.member_avatar').attr('alt',exam.fullname);
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
                                        <b class="color-red">Thí sinh không chọn đáp án</b> 
                                    </p>`
                    } else
                        if (q.option_id != q.question_answer) {
                            option += `<p>
                                        <i class="fa fa-times color-red" style="margin-right: 10px;margin-left: 5px;"></i> 
                                        <b class="color-red">Sai</b> 
                                    </p>`;
                        }
                   
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