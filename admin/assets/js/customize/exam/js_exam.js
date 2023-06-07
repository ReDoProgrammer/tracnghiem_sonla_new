var page = 1;
var search = "";
var index = 0;
var examId = 0;
var number_of_questions = 0;
var pageSize = 10;// giá trị mặc định của kích thước trang
$(document).ready(function () {
    LoadData();
    pageSize = $('#slPageSize option:selected').text();
})

function ConfigExam(id) {
    examId = id;
    $.ajax({
        url: 'controller/exam/detail.php',
        type: 'get',
        data: { id },
        success: function (exam) {
            number_of_questions = exam.number_of_questions;
            $('#totalQuestions').text(number_of_questions);
            $('#txtNumberBasedTotal').val(number_of_questions);
            $('#modalConfigExam').modal();
            LoadTopics()
            // LoadConfigs(id);
        }
    })
}

$('#btnSearch').click(function () {
    search = $('#txtSearch').val();
    page = 1;
    index = 0;
    LoadData();
})

$('#btnAddNew').click(function () {
    $('#modalTitle').text('Thêm mới cuộc thi');
    $('#modalExam').modal();
    SetComponents(false);
})
function ChangeRandomOptions(id, random_options) {
    console.log({ id, random_options })
    $.ajax({
        url: 'controller/exam/change-random-options.php',
        type: 'post',
        data: { id, random_options },
        success: function (data) {
            console.log(data);
            if (data.statusCode == 200) {
                index = (page - 1) * pageSize;
                LoadData();
            }
        }
    })
}
function ChangeHotExam(id, is_hot) {
    $.ajax({
        url: 'controller/exam/change-hot.php',
        type: 'post',
        data: { id, is_hot },
        success: function (data) {
            console.log(data);
            if (data.statusCode == 200) {
                index = (page - 1) * pageSize;
                LoadData();
            }
        }
    })
}

function LoadData() {
    $.ajax({
        url: 'controller/exam/list.php',
        type: 'get',
        data: { page, search, pageSize },
        success: function (exams) {
            $('#tblData').empty();
            index = pageSize == 'All' ? 1 : (page - 1) * pageSize;
            exams.forEach(e => {
                let tr = `<tr id = "${e.id}" style="${e.is_hot == 1 ? 'background:#E8560D; color:white; font-weight:bold;' : ''}">`;
                tr += `<td class="text-center" style="width: 2%;"> ${++index} </td>`;
                tr += `<td ><img src="${e.thumbnail}" class="img-thumbnail" alt="${e.title}" style="width:100px; height:70px !important;"></td>`
                tr += `<td style="font-weight:bold; color: #3393FF"> ${e.title} </td>`;
                tr += `<td class="text-center">${e.duration}</td>`;
                tr += `<td class="text-center">${e.number_of_questions}</td>`;
                tr += `<td class="text-center">${e.mark_per_question}</td>`;
                tr += `<td class="text-center">${e.times}</td>`;

                tr += `<td class="text-right">${e.begin}</td>`;
                tr += `<td class="text-right">${e.end}</td>`;
                tr += `<td class="text-center">`
                tr += ` <div class="form-group" >
                            <input type="checkbox" onClick="ChangeHotExam(${e.id},${e.is_hot})" ${e.is_hot == 1 ? 'checked' : ''}></label>
                        </div>`;
                tr += `</td>`;

                tr += `<td class="text-center">`
                tr += ` <div class="form-group" >
                            <input type="checkbox" ${e.random_options == 1 ? 'checked' : ''} onClick="ChangeRandomOptions(${e.id},${e.random_options})" ${e.random_options == 1 ? 'checked' : ''}></label>
                        </div>`;
                tr += `</td>`;

                tr += `<td class="text-center" style="white-space:nowrap; width: 10%;">`;
                tr += `<button onClick = "ConfigExam(${e.id})" ><i class="fa fa-cog text-warning" aria-hidden="true"></i></button>`;
                tr += ` <button name="btnDetail"><i class="fa fa-info-circle" aria-hidden="true" style="color: green;"></i></button> `;
                tr += ` <button name="btnEdit"><i class="fa fa-pencil-square-o" style="color: blue;"></i></button> `;
                tr += ` <button name = "btnDelete"><i class="fa fa-trash-o" style="color: red;"></i></button> `;
                tr += `</td>`;
                tr += `</tr>`;
                $('#tblData').append(tr);
            })
            Pagination();
        }
    })
}

function Pagination() {
    $.ajax({
        url: 'controller/exam/pagination.php',
        type: 'get',
        data: { search, pageSize },
        success: function (pages) {
            $('#pagination').empty();
            if (pages <= 1) {
                $('#pagination').hide();
            } else {
                $('#pagination').show();
                for (i = 1; i <= pages; i++) {
                    if (page == i) {
                        $('#pagination').append(`<li class="active"><a href="#">${i}</a></li>`);
                    } else {
                        $('#pagination').append(`<li><a href="#">${i}</a></li>`);
                    }
                }

            }
        }
    })
}


function SetComponents(isReadOnly) {
    $('#title').prop('readonly', isReadOnly);
    if (isReadOnly) {
        $('#btnSaveChanges').hide();
    } else {
        $('#btnSaveChanges').show();
    }
}
$("#pagination").on("click", "li a", function (event) {
    event.preventDefault();
    page = $(this).text();
    LoadData();
});

$('#slPageSize').on('change', function () {
    pageSize = $('#slPageSize option:selected').text();
    page = 1;
    LoadData();
})





//phần xử lý trên modal
// $(".datepicker").datepicker({ minDate: new Date() });
$(function () {
    $('#dtpBegin').datetimepicker({
        defaultDate: new Date(),
        format: 'DD/MM/YYYY HH:mm',
        minDate: new Date()
    });
    $('#dtpEnd').datetimepicker({
        format: 'DD/MM/YYYY HH:mm',
        minDate: new Date()
    });
});
CKEDITOR.replace('txaDescription');
CKEDITOR.replace('txaRegulation');
function BrowseServer() {
    // You can use the "CKFinder" class to render CKFinder in a page:
    var finder = new CKFinder();
    finder.basePath = './assets/plugins/ckfinder/';	// The path for the installation of CKFinder (default = "/ckfinder/").
    finder.selectActionFunction = SetFileField;
    finder.popup();
}
$(".floatOnly").keypress(function (event) {
    if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
        event.preventDefault();
    }
});
$('.intOnly').keyup(function (e) {
    if (/\D/g.test(this.value)) {
        // Filter non-digits from input value.
        this.value = this.value.replace(/\D/g, '');
    }
});

$('#modalExam').on('hidden.bs.modal', function () {
    $('#title').val('');
    $('#options').empty();
    examId = 0;
})

$(function () {
    $("input[type='number']").prop('min', 1);
    $("input[type='number']").prop('max', 10);
});

$(document).on('show.bs.modal', '#modalExam', function () {
    $('.error').hide();

});


$('#btnSaveChanges').click(function () {

    //get inputs value
    let title = $('#txtTitle').val().trim();
    let user = $('#userId').data('user');
    let description = CKEDITOR.instances['txaDescription'].getData();
    let thumbnail = $('#xFilePath').val();
    let duration = $('#txtDuration').val();
    let number_of_questions = $('#txtNumberOfQuestions').val();
    let mark_per_question = $('#txtMarkPerQuestion').val();
    let times = parseInt($('#txtTimes').val());
    let begin = $('#dtpBegin').val();
    let end = $('#dtpEnd').val();
    let is_hot = $('#ckbHotExam').is(':checked') ? 1 : 0;
    let random_options = $('#ckbRandomOptions').is(':checked');
    let regulation = CKEDITOR.instances['txaRegulation'].getData();


    //validation
    if (title.length == 0) {
        $('#errNoChecked').text('Vui lòng nhập tiêu đề của bài thi!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }

    if (duration.trim().length == 0) {
        $('#errNoChecked').text('Vui lòng nhập thời lượng của bài thi!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }

    if (parseInt(duration) <= 0) {
        $('#errNoChecked').text('Thời lượng của bài thi không hợp lệ!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }

    if (number_of_questions.trim().length == 0) {
        $('#errNoChecked').text('Vui lòng nhập số lượng câu hỏi của bài thi!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }

    if (parseInt(number_of_questions) <= 0) {
        $('#errNoChecked').text('Số câu hỏi của bài thi không hợp lệ!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }

    if (mark_per_question.trim().length == 0) {
        $('#errNoChecked').text('Vui lòng nhập thang điểm của bài thi!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }

    if (parseFloat(mark_per_question) <= 0) {
        $('#errNoChecked').text('Thang điểm bài thi không hợp lệ!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }

    if (times < 1) {
        $('#errNoChecked').text('Số lần thi không hợp lệ!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }

    if (begin.length < 8) {
        $('#errNoChecked').text('Vui lòng chọn ngày bắt đầu cuộc thi!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }
    if (end.length < 8) {
        $('#errNoChecked').text('Vui lòng chọn ngày kết thúc cuộc thi!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }

    let dB = new Date(begin);
    let dE = new Date(end);
    if (dE < dB) {
        $('#errNoChecked').text('Ngày kết thúc cuộc thi không thể bé hơn ngày bắt đầu');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }





    if (examId == 0) {//insert a new exam
        $.ajax({
            url: 'controller/exam/create.php',
            type: 'post',
            data: {
                title,
                description,
                thumbnail,
                duration,
                number_of_questions,
                mark_per_question,
                times,
                begin: Date2TimeStamp(begin),
                end: Date2TimeStamp(end),
                is_hot,
                random_options,
                regulation,
                created_by: user
            },
            success: function (data) {
                if (data.statusCode == 201) {
                    Swal.fire({
                        title: 'Bạn có muốn tiếp tục thêm cuộc thi khác?',
                        text: data.title,
                        icon: data.icon,
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        cancelButtonText: 'Kết thúc',
                        confirmButtonText: 'Tiếp tục'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $('#txaDescription').empty();
                            $('#title').val('');
                        } else {
                            $('#modalExam').modal('hide');
                        }
                    })
                }
            }
        })
    } else {//update an exist exam
        $.ajax({
            url: 'controller/exam/update.php',
            type: 'post',
            data: {
                id: examId,
                title,
                description,
                thumbnail,
                duration,
                number_of_questions,
                mark_per_question,
                begin,
                end,
                random_questions,
                random_options,
                is_hot,
                regulation,
                updated_by: user
            },
            success: function (data) {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: data,
                    showConfirmButton: false,
                    timer: 1000
                })
                $('#modalExam').modal('hide');
            }
        })
    }
    LoadData();
})

function Date2TimeStamp(datetime) {
    let arr = datetime.split(' ');
    let part1 = arr[0].split('/');
    let year = part1[2];
    let month = part1[1];
    let day = part1[0];

    let part2 = arr[1].split(':');
    let hour = part2[0];
    let minute = part2[1];

    return `${year}-${month}-${day} ${hour}:${minute}:00`;
}

//phần config exam
let idx = 0;
let isUpdate = false;

$('#btnSaveConfigs').click(function () {

    let user = $('#userId').data('user');

    //Lấy các giá trị đã config
    let configs = [];
    let totalPercent = 0;
    $('#tblConfig  > tr').each(function (index, tr) {
        try {
            let percent = parseFloat($(tr).find("input[name='txtPercent']").val());
            let topic_id = $(this).closest('tr').attr('id');
            totalPercent += percent;
            configs.push({topic_id,percent});
        } catch (err) {
            console.log(err);
            $('#msgErrorConfig').text('Tỉ lệ % không hợp lệ!');
            $('#msgErrorConfig').show().fadeOut(5000);
            return;
        }
    })

    if (totalPercent != 100) {
        $('#msgErrorConfig').text('Tỉ lệ % không hợp lệ!');
        $('#msgErrorConfig').show().fadeOut(5000);
        return;
    }


    //duyệt mảng configs để tiến hành insert vào csdl
    configs.forEach(c => {
        if (isUpdate) {
            console.log('update')
        } else {
            $.ajax({
                url: 'controller/exam_config/insert.php',
                type: 'post',
                data: { 
                    exam_id: examId, 
                    topic_id:c.topic_id, 
                    percent:c.percent, 
                    created_by: user },
                success: function (data) {
                    if(data.statusCode == 201){
                        Swal.fire({
                            position: 'top-end',
                            icon: data.icon,
                            title: data.title,
                            showConfirmButton: false,
                            timer: 1000
                        })
                        $('#modalConfigExam').modal('hide');
                    }else{
                        Swal.fire(
                            data.title,
                            data.content,
                            data.icon
                        )
                    }
                },
                error:function (jqXHR, exception) {
                    console.log(jqXHR)
                }
            })
        }
    })
})


$(document).on('change', "input[type='checkbox']", function () {
    let checked = $(this).is(':checked');
    var txtPercent = $(this).closest('tr').find("input[name='txtPercent']");
    if (!checked) {
        $(txtPercent).val('0');
    }
    $(txtPercent).prop('readonly', !checked);
})

$(document).on('keyup', "input[name='txtPercent']", function () {
    var flag = true;

    if (event.shiftKey == true) {
        event.preventDefault();
        flag = false;
    }

    if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46 || event.keyCode == 190) {

    } else {
        event.preventDefault();
        flag = false;
    }
    if (flag) {
        let percent = 0;
        $('#tblConfig  > tr').each(function (index, tr) {
            let val = $(tr).find("input[name='txtPercent']").val();
            if (val.trim().length > 0) {
                try {
                    percent += parseFloat(val);
                } catch {

                }
            }
        })
        if (percent > 100) {
            $('.error').text('Tỉ lệ % không thể lớn hơn 100%').fadeOut(5000);
            return;
        } else {
            $('#spPercent').text(percent);
        }

    }

});

$(document).on('show.bs.modal', '#modalConfigExam', function () {
    idx = 0;
});

//hàm load config của bài thi nếu trước đó bài thi đã được config
/*
    Cần sửa lại đoạn này
    Cho hàm chạy config trước
    Nếu đã có config thì cần dò tìm theo id config và set %
    Ngược lại thì để mặc định, k làm gì hết
*/
function LoadConfigs(exam_id) {
    $.ajax({
        url: 'controller/exam_config/list.php',
        type: 'get',
        data: { exam_id },
        success: function (configs) {
            let percent = 0;
            $('#tblConfig').empty();

            if (configs.length > 0) {
                // configs.forEach(c => {
                //     percent += parseFloat(c.percent);
                //     let tr = `<tr id="${c.topic_id}">`;
                //     tr += `<td style="width: 80%;">`;
                //     tr += `<label class="checkbox-inline" style="font-weight:bold;"><input type="checkbox" checked>${c.topic_name} (${c.count_questions})</label>`
                //     tr += `</td>`;
                //     tr += `<td style="width: 20%"><input type="text" class="form-control floatOnly" name="txtPercent" value="${c.percent}"/></td>`
                //     tr += `</tr>`;
                //     $('#tblConfig').append(tr);
                // })
                // $('#spPercent').text(percent);
            } else {
                isUpdate = false;
                LoadTopics();
            }

        }
    })
}

function LoadTopics() {
    $.ajax({
        url: 'controller/topic/list-all.php',
        type: 'get',
        success: function (topics) {
            $('#tblConfig').empty();
            topics.forEach(t => {
                let tr = `<tr id="${t.id}">`;
                tr += `<td style="width: 80%;">`;
                tr += `<label class="checkbox-inline" style="font-weight:bold;"><input type="checkbox">${t.name} (${t.questions_count})</label>`
                tr += `</td>`;
                tr += `<td style="width: 20%"><input type="text" class="form-control floatOnly" name="txtPercent" value="0"/></td>`
                tr += `</tr>`;
                $('#tblConfig').append(tr);
            })
            $('input[name="txtPercent"]').prop("readonly", true);
        }
    })
}