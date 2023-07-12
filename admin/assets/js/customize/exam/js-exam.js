var page = 1;
var search = "";
var index = 0;
var examId = 0;
var number_of_questions = 0;
var pageSize = 10;// giá trị mặc định của kích thước trang
$(function () {
    LoadData();
})
function ExamDetail(id) {
    examId = id;
    detail(id);
    $('#btnSaveChanges').hide();  
    $('#modalTitle').text('Thông tin cuộc thi');  
}
function EditExam(id) {
    examId = id;
    detail(id);   
    $('#modalTitle').text('Cập nhật cuộc thi');
}

function SetStatistic(id){

    $.ajax({
        url:'controller/exam/set-statistic.php',
        type:'post',
        data:{id},
        success:function(data){
            if(data.statusCode == 200){
                $.toast({
                    heading: 'Information',
                    text: data.title,
                    icon: data.icon,
                    loader: true,        // Change it to false to disable loader
                    loaderBg: '#9EC600'  // To change the background
                })
                LoadData();
            }
        }
    })
}


function SetForeCastCandidates(id){
    $.ajax({
        url:'controller/exam/set-forecast-candidates.php',
        type:'post',
        data:{id},
        success:function(data){
            if(data.statusCode == 200){
                $.toast({
                    heading: 'Information',
                    text: data.title,
                    icon: data.icon,
                    loader: true,        // Change it to false to disable loader
                    loaderBg: '#9EC600'  // To change the background
                })
                LoadData();
            }
        }
    })
}

function detail(id) {
    $.ajax({
        url: 'controller/exam/detail.php',
        type: 'get',
        data: { id },
        success: function (data) {
            console.log(data);
            if (data.statusCode == 200) {
                let exam = data.content;
                $('#txtTitle').val(exam.title);
                CKEDITOR.instances['txaDescription'].setData(exam.description);
                CKEDITOR.instances['txaRegulation'].setData(exam.regulation);
                $('#xFilePath').val(exam.thumbnail);
                $('#txtDuration').val(exam.duration);
                $('#txtNumberOfQuestions').val(exam.number_of_questions);
                $('#txtMarkPerQuestion').val(exam.mark_per_question);
                $('#txtTimes').val(exam.times);

                // $('#dtpBegin').datepicker("setDate" , '19/06/2023 21:35')
                $('#dtpBegin').val(exam.begin);
                $('#dtpEnd').val(exam.end);

                $('#ckbHotExam').prop('checked', exam.is_hot == 1);
                $('#ckbForeCastCandidates').prop('checked', exam.forecast_candidates == 1);
                $('#ckbRandomOptions').prop('checked', exam.random_options == 1);
                $('#ckbRandomQuestions').prop('checked', exam.random_questions == 1);
                
                $('#modalExam').modal();
            }
        }
    })
}

function DeleteExam(id) {
    Swal.fire({
        title: 'Bạn có chắc muốn xóa bài thi này?',
        showDenyButton: false,
        showCancelButton: true,
        confirmButtonText: 'Xác nhận xóa',
        cancelButtonText: `Để tôi suy nghĩ lại`,
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            $.ajax({
                url: 'controller/exam/delete.php',
                type: 'post',
                data: { id },
                success: function (data) {
                    if (data.statusCode == 200) {
                        Swal.fire({
                            position: 'top-end',
                            icon: data.icon,
                            title: data.title,
                            showConfirmButton: false,
                            timer: 200
                        })
                        LoadData();
                    }
                }
            })
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
    $('#dtpBegin').datetimepicker({
        defaultDate: new Date(),
        format: 'DD/MM/YYYY HH:mm',
        minDate: new Date()
    });
    $('#dtpEnd').datetimepicker({
        format: 'DD/MM/YYYY HH:mm',
        minDate: new Date()
    });
    $('#modalTitle').text('Thêm mới cuộc thi');
    $('#modalExam').modal();

    SetComponents(false);
})
function ChangeRandomOptions(id) {
    $.ajax({
        url: 'controller/exam/change-random-options.php',
        type: 'post',
        data: { id },
        success: function (data) {
            if (data.statusCode == 200) {
                LoadData();
            }
        }
    })
}
function ChangeHotExam(id) {
    $.ajax({
        url: 'controller/exam/change-hot.php',
        type: 'post',
        data: { id },
        success: function (data) {
            if (data.statusCode == 200) {
                LoadData();
            }
        }
    })
}

function ChangeRandomQuestions(id) {
    $.ajax({
        url: 'controller/exam/change-random-questions.php',
        type: 'post',
        data: { id },
        success: function (data) {
            if (data.statusCode == 200) {
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
        success: function (data) {
            $('#tblData').empty();
            index = pageSize == 'All' ? 0 : (page - 1) * pageSize;
            exams = data.content;
            exams.forEach(e => {
                let tr = `<tr id = "${e.id}" style="${e.is_hot == 1 ? 'background:#E8560D; color:white; font-weight:bold;' : ''}">`;
                tr += `<td class="text-center" style="width: 2%;"> ${++index} </td>`;
                tr += `<td ><img src="${e.thumbnail.length>0?e.thumbnail:'/assets/imagesimages/no-thumbnail.jpg'}" alt="${e.title}" style="width:100px; height:60px !important;"></td>`
                tr += `<td style="font-weight:bold; color: #3393FF" class="text-nowrap"> ${e.title} </td>`;
                tr += `<td class="text-center">${e.duration}</td>`;
                tr += `<td class="text-center">${e.number_of_questions}</td>`;
                tr += `<td class="text-center">${e.mark_per_question}</td>`;
                tr += `<td class="text-center">${e.times}</td>`;

                tr += `<td class="text-right">${e.begin}</td>`;
                tr += `<td class="text-right">${e.end}</td>`;
                tr += `<td class="text-center text-nowrap">`;
                tr += `${e.exam_status == -1 ? '<span class="text-warning">Chưa diễn ra</span>' : e.exam_status == 0 ? '<span class="text-info">Đang diễn ra</span>' : '<span class="text-danger">Đã kết thúc</span>'}`;
                tr += `</td>`;
                
                tr += `<td class="text-center">`;
                tr += ` <div class="form-group" >
                            <input type="checkbox" onClick="SetStatistic(${e.id})" ${e.is_stat == 1 ? 'checked' : ''}></label>
                        </div>`;
                tr += `</td>`;
                tr+= '</td>';

                tr += `<td class="text-center">`
                tr += ` <div class="form-group" >
                            <input type="checkbox" ${e.exam_status != 0 ? 'disabled' : ''} onClick="ChangeHotExam(${e.id})" ${e.is_hot == 1 ? 'checked' : ''}></label>
                        </div>`;
                tr += `</td>`;
                tr += `<td class="text-center">`
                tr += ` <div class="form-group" >
                            <input type="checkbox" onClick="SetForeCastCandidates(${e.id})" ${e.forecast_candidates == 1 ? 'checked' : ''}></label>
                        </div>`;
                tr += `</td>`;

                tr += `<td class="text-center">`
                tr += ` <div class="form-group" >
                            <input type="checkbox" ${e.random_questions == 1 ? 'checked' : ''}  onClick="ChangeRandomQuestions(${e.id})" ${e.random_questions == 1 ? 'checked' : ''}></label>
                        </div>`;
                tr += `</td>`;



                tr += `<td class="text-center">`
                tr += ` <div class="form-group" >
                            <input type="checkbox" ${e.random_options == 1 ? 'checked' : ''}  onClick="ChangeRandomOptions(${e.id})" ${e.random_options == 1 ? 'checked' : ''}></label>
                        </div>`;
                tr += `</td>`;

                tr += `<td class="text-center" style="white-space:nowrap; width: 10%;">`;
                tr += ` <button name="btnDetail" onClick="ExamDetail(${e.id})"><i class="fa fa-info-circle" aria-hidden="true" style="color: green;"></i></button> `;
                tr += ` <button name="btnEdit"  onClick="EditExam(${e.id})"><i class="fa fa-pencil-square-o" style="color: blue;"></i></button> `;
                tr += ` <button name = "btnDelete"  onClick="DeleteExam(${e.id})"><i class="fa fa-trash-o" style="color: red;"></i></button> `;
                tr += `</td>`;
                tr += `</tr>`;
                $('#tblData').append(tr);
            })

            $('#pagination').empty();
            if (data.pages > 1) {
                for (i = 1; i <= data.pages; i++) {
                    $('#pagination').append(`<li class="${i == page ? 'active' : ''}"><a href="#">${i}</a></li>`);
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

$("#txtSearch").on('keyup', function (e) {
    if (e.key === 'Enter' || e.keyCode === 13) {
        $('#btnSearch').click();
    }
});

$('#modalExam').on('hidden.bs.modal', function () {
    examId = 0;

    $('#txtTitle').val('');
    CKEDITOR.instances['txaDescription'].setData('');
    CKEDITOR.instances['txaRegulation'].setData('');
    $('#xFilePath').val('');
    $('#txtDuration').val(0);
    $('#txtNumberOfQuestions').val(0);
    $('#txtMarkPerQuestion').val(0);
    $('#txtTimes').val(1);

    $('#ckbHotExam').prop('checked', false);
    $('#ckbRandomOptions').prop('checked', false);
    $('#ckbRandomQuestions').prop('checked', false);
    $('#dtpEnd').val('');
    $('#btnSaveChanges').show();
    examId = 0;
})

$(function () {
    $("input[type='number']").prop('min', 1);
    $("input[type='number']").prop('max', 10);
});

$(document).on('show.bs.modal', '#modalExam', function () {
    $('.error').hide();
    LoadTopics();
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
    let forecast_candidates = $('#ckbForeCastCandidates').is(':checked')?1:0;
    let random_questions = $('#ckbRandomQuestions').is(':checked') ? 1 : 0;
    let random_options = $('#ckbRandomOptions').is(':checked') ? 1 : 0;
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

    if (times < 0) {
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

    let totalPercent = parseInt($('#totalPercent').text());
    if(totalPercent !=100){
        $('#errNoChecked').text('Cấu hình tỉ lệ theo chủ đề không phù hợp!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }

    let dB = new Date(Date2TimeStamp(begin));
    let dE = new Date(Date2TimeStamp(begin));
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
                configs,
                begin: Date2TimeStamp(begin),
                end: Date2TimeStamp(end),
                is_hot,
                forecast_candidates,
                random_questions,
                random_options,
                regulation,
                created_by: user
            },
            success: function (data) {
                console.log(data);
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
                times,
                begin: Date2TimeStamp(begin),
                end: Date2TimeStamp(end),
                is_hot,
                forecast_candidates,
                random_questions,
                random_options,
                configs,
                regulation,
                updated_by: user
            },
            success: function (data) {
                Swal.fire({
                    position: 'top-end',
                    icon: data.icon,
                    title: data.title,
                    showConfirmButton: false,
                    timer: 1000
                })
                $('#modalExam').modal('hide');
                LoadData();
                console.log(data);
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
let configs = [];




$(document).on('change', "input.ckbConfig", function () {
    let checked = $(this).is(':checked');
    let cf_id = $(this).closest('div.config').attr('id');
    $(`#cf_${cf_id}`).prop('readonly', !checked);
    if(!checked){
        $(`#cf_${cf_id}`).val(0);
        $('input[name="txtPercent"]').keyup();
    }
})

$(document).on('keyup', "input[name='txtPercent']", function () {   
    let totalPercent = 0;
    configs = [];
    $('#configs div input[name="txtPercent"]').each(function(){
        let percent = parseInt($(this).val());  
        let id = $(this).closest('div.config').attr('id');     
        if(percent>0){
            totalPercent +=percent;
            configs.push({id,percent});
        }
    })
    $('#totalPercent').text(totalPercent);
});

function LoadTopics() {
    $.ajax({
        url: 'controller/topic/exam-configs.php',
        type: 'get',
        data:{examId},
        success: function (data) {
            $('#configs').empty();
            if(data.statusCode == 200){
                let totalPercent = 0;
                configs = [];
                data.content.forEach(cf=>{
                    totalPercent += parseInt(examId == 0?0:cf.percent==null?0:cf.percent);
                    if(examId !=0){
                        configs.push({
                            id: cf.id,
                            percent:cf.percent==null?0:cf.percent
                        });
                    }
                    let el = `<div class="row config" id="${cf.id}">
                                <div class="col-sm-10 col-xs-10 col-md-10 col-lg-10">
                                    <label class="checkbox-inline fw-bold">
                                        <input type="checkbox" value="" 
                                        ${(cf.percent!=null && cf.percent > 0 && examId > 0)?'checked':''}
                                        class="ckbConfig">
                                            ${cf.name}
                                    </label>
                                </div>
                                <div class="col-sm-2 col-xs-2 col-md-2 col-lg-2 text-right">
                                    <input type:text class="form-control 
                                    text-right txtPercent" 
                                    data-value="${examId==0?0:cf.percent==null?0:cf.percent}" 
                                    name="txtPercent" id="cf_${cf.id}"
                                    ${(examId > 0 && cf.percent!=null && cf.percent > 0 )?'':'readonly' }
                                    value = "${examId==0?0:cf.percent==null?0:cf.percent}" />
                                </div>
                            </div> <hr/>`;
                    $('#configs').append(el);
                })
                $('#totalPercent').text(totalPercent);
            }
           

        }
    })
}