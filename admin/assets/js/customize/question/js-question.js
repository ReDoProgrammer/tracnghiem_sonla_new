var page = 1;
var search = "";
var index = 0;
var questId = 0;
var pageSize = 10;// giá trị mặc định của kích thước trang
var options = [];
var questions = [];

$(function () {
    LoadQuestions();

    $.ajax({
        url: 'controller/topic/list.php',
        type: 'get',
        data: {
            page: 1,
            search: '',
            pageSize: 'All'
        },
        success: function (data) {
            if (data.statusCode == 200) {
                let topics = data.content;
                topics.forEach(t => {
                    $('.slTopics').append(`<option value="${t.id}">${t.name}</option>`);
                })
                $('.slTopics').selectpicker('refresh');
            }

        }
    })

    //đổ dữ liệu từ file excel lên table
    $('#excelfile').on('change', function (e) {
        var file = e.target.files[0];
        var reader = new FileReader();


        reader.onload = function (e) {
            var data = new Uint8Array(e.target.result);
            var workbook = XLSX.read(data, { type: 'array' });

            var sheetName = workbook.SheetNames[0]; // Lấy tên sheet đầu tiên
            var worksheet = workbook.Sheets[sheetName];

            var jsonData = XLSX.utils.sheet_to_json(worksheet, { header: 1 });
            questions = jsonData;

            var table = $('#exceltable tbody');
            table.empty();


            for (var i = 1; i < jsonData.length; i++) {
                let tr = `<tr>`;
                for (var j = 0; j < jsonData[i].length; j++) {
                    tr += `<td>${typeof jsonData[i][j] == 'undefined' ? '' : jsonData[i][j]}</td>`;
                }
                tr += `</tr>`;

                table.append(tr);
            }
        };

        reader.readAsArrayBuffer(file);
    });

    $(document).on('change','input[type="checkbox"]',function () {
        var isChecked = $(this).prop('checked');
        if ($(this).hasClass('check-all')) {
            $('input[type="checkbox"]').not('.check-all').prop('checked', isChecked);
        } else {
            var allChecked = $('input[type="checkbox"]').not('.check-all').length === $('input[type="checkbox"]:checked').not('.check-all').length;
            $('.check-all').prop('checked', allChecked);
        }
        

        if($('input.check-one:checked').length>0){
            $("#btnDeleteMany").removeAttr('disabled');
        }else{
            $("#btnDeleteMany").prop("disabled", true);
        }
    });

    $('#slFilterTopics').on('change',function(){
        $('#btnSearch').click();
    })
})

$('#btnDeleteMany').click(function(){
    var checkedIds = [];
    $('.check-one:checked').each(function() {
      checkedIds.push(parseInt($(this).attr('id')));
    });


    Swal.fire({
        title: `Bạn có chắc muốn xóa ${checkedIds.length>1?'những':''} câu hỏi được chọn này?`,
        showDenyButton: true,
        showCancelButton: false,
        confirmButtonText: 'Đúng! Tôi muốn xóa',
        denyButtonText: `Hủy`,
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: 'controller/question/delete-many.php',
                type: 'post',
                data: { ids:checkedIds },
                success: function (data) {
                    if (data.statusCode == 200) {
                        Swal.fire({
                            position: 'top-end',
                            icon: data.icon,
                            title: data.title,
                            showConfirmButton: false,
                            timer: 500
                        });
                        LoadQuestions();
                    } else {
                        Swal.fire(
                            data.title,
                            data.content,
                            data.icon
                        )
                    }
                }
            })
        }

    })
})

$("#txtSearch").on('keyup', function (e) {
    if (e.key === 'Enter' || e.keyCode === 13) {
        $('#btnSearch').click();
    }
});


$('#btnSubmitImport').click(function () {
    if (questions.length > 0) {
        let user = $('#userId').data('user');
        $.ajax({
            url: 'controller/question/import.php',
            type: 'post',
            data: {
                created_by: user,
                topic_id: $('div.mdlImport select.slTopics option:selected').val(),
                questions
            },
            success: function (data) {
                console.log(data);
                if (data.statusCode == 201) {
                    Swal.fire({
                        position: 'top-end',
                        icon: data.icon,
                        title: data.title,
                        showConfirmButton: false,
                        timer: 1000
                    })
                    $('#modalImport').modal('hide');
                    $('#exceltable tbody').empty();
                    $('#excelfile').val('');
                    LoadQuestions();
                } else {
                    Swal.fire(
                        data.title,
                        data.content,
                        data.icon
                    )
                }
            }
        })
    }
})

$('#btnPrint').click(async function () {

    var promises = [];
    let questions = [];
    $('#tblQuestions  > tr').each(async function (index, tr) {
        var request = $.ajax({
            url: 'controller/question/detail.php',
            type: 'get',
            async: true,
            data: { id: $(tr).attr('id') },
            success: function (question) {
                questions.push(question);
            }
        })
        promises.push(request);
    })

    $.when.apply(null, promises).done(function () {
        let index = 1;
        win = window.open('Danh sách câu hỏi', 'Print', 'width=calc(100vw - 60px),height=calc(100vh - 60px)');
        let content = `<h1 style="margin: 0 auto;">Danh sách câu hỏi</h1>`;
        content += `<div style="width:100%;border-collapse: collapse;margin-top:20px;">`;
        content += `<section>`;
        questions.forEach(q => {
            let options = JSON.parse(q.options);
            content += `<div>`;
            content += `<h4 style="font-weight:bold; padding-top: 10px;  word-wrap: break-word;">`;
            content += `<span style="margin-right:5px;">${index++}.</span>`;
            content += `${q.title}</h4>`;

            options.forEach(opt => {
                content += `<p style="padding-top:3px;margin-left:15px">`;
                content += opt.correct == 1 ? `<span style="margin-right:5px;">&#x26AB;</span>` : `<span style="margin-right:5px;">&#9898;</span>`
                content += `${opt.content}</p>`;
            })
            content += `</div>`;
        })
        content += `</section>`;
        content += `</div>`;
        win.document.write(content);
        win.document.close();
        win.print();
        return false;
    })


})

$('#btnSearch').click(function () {
    search = $('#txtSearch').val();
    page = 1;
    index = 0;
    LoadQuestions();
})

$('#btnImportExcel').click(function () {
    $('#modalImport').modal();
})
var onFileSelected = function (e) {
    let file = $(this)[0].files[0];
};

$('#btnAddNew').click(function () {
    $('#modalTitle').text('Thêm mới câu hỏi');
    $('#modalQuestion').modal();
    $('#options').empty();
    AddOption();
    SetComponents(false);
})


function LoadQuestions() {
    $.ajax({
        url: 'controller/question/list.php',
        type: 'get',
        data: { page, search, pageSize,topic:$('#slFilterTopics option:selected').val() },
        success: function (data) {
            console.log(data);
            $('#tblQuestions').empty();
            if (data.statusCode == 200) {
                questions = data.content;
                index = pageSize == 'All' ? 0 : ((page - 1) * pageSize);

                questions.forEach(q => {
                    let tr = `<tr id = "${q.id}">`;
                    tr += `<td class="text-center" style="width: 2%;"> 
                                    ${++index} <input class="form-check-input check-one" id="${q.id}" type="checkbox">
                            </td>`;
                    tr += `<td style="width:10%; font-weight: bold;">${q.topic}</td>`;
                    tr += `<td style="width: 50%; font-weight:bold; color: #3393FF"> ${q.title} </td>`;
                    tr += `<td style="width: 8%" class="text-center">`
                    if (q.applied == 1) {
                        tr += `<i class="fa fa-check-square-o text-info" aria-hidden="true"></i>`;
                    } else {
                        tr += `<i class="fa fa-square-o" aria-hidden="true"></i>`
                    }
                    tr += `</td>`;
                    tr += `<td style="width: 12%;" > ${q.created_at} </td>`
                    tr += `<td style="width: 10%;" class="text-center"> ${q.created_by} </td>`;
                    tr += `<td class="text-center" style="white-space:nowrap; width: 10%;">`;
                    tr += ` <button name="btnDetail"><i class="fa fa-info-circle" aria-hidden="true" style="color: green;"></i></button> `;
                    tr += ` <button name="btnEdit"><i class="fa fa-pencil-square-o" style="color: blue;"></i></button> `;
                    tr += ` <button name = "btnDelete"><i class="fa fa-trash-o" style="color: red;"></i></button> `;
                    tr += `</td>`;
                    tr += `</tr>`;
                    $('#tblQuestions').append(tr);
                })

                $('#pagination').empty();
                if (data.pages > 1) {
                    for (i = 1; i <= data.pages; i++) {
                        $('#pagination').append(`<li class="${page == i ? 'active' : ''}"><a href="#">${i}</a></li>`);
                    }
                }
            } else {
                console.log(data)
                Swal.fire(
                    data.title,
                    data.content,
                    data.icon
                )
            }
        }
    })
}

function GetQuestion(id, readonly = false) {
    $.ajax({
        url: 'controller/question/detail.php',
        type: 'get',
        data: { id },
        success: function (data) {

            if (data.statusCode == 200) {
                let question = data.content;
                $('#title').val(question.title);
                $('#slTopics').val(question.topic_id);
                $('div.mdlAddOrUpdate select.slTopics').val(question.topic_id);
                $('div.mdlAddOrUpdate select.slTopics').selectpicker('refresh');


                $.ajax({
                    url: 'controller/option/list-by-question.php',
                    type: 'get',
                    data: { question_id: id },
                    success: function (data) {
                        if (data.statusCode == 200) {
                            let options = data.content;
                            options.forEach(opt => {
                                AddOption(opt.id, true, !$('#ckbUseCKEditor').is(':checked'), opt.id, opt.content, opt.correct == 1, readonly);
                            })
                        }

                    },
                    error: function (jqXHR, exception) {
                        console.log(jqXHR);
                    }
                })
            } else {
                Swal.fire(
                    msg.title,
                    msg.content,
                    msg.icon
                )
            }
        },
        error: function (jqXHR, exception) {
            console.log(jqXHR);
        }
    })
}
$(document).on('click', "button[name='btnDetail']", function () {
    var trid = $(this).closest('tr').attr('id'); //get question id
    $('#modalTitle').text('Nội dung câu hỏi');
    SetComponents(true);
    GetQuestion(trid, true);
    $('#modalQuestion').modal();
})
$(document).on('click', "button[name='btnEdit']", function () {
    questId = $(this).closest('tr').attr('id'); //get question id
    $('#modalTitle').text('Cập nhật câu hỏi');
    SetComponents(false);
    GetQuestion(questId, false);
    $('#modalQuestion').modal();
})
$(document).on('click', "button[name='btnDelete']", function () {
    var trid = $(this).closest('tr').attr('id'); //get question id
    Swal.fire({
        title: 'Bạn có chắc muốn xóa câu hỏi này?',
        showDenyButton: true,
        showCancelButton: false,
        confirmButtonText: 'Đúng! Tôi muốn xóa',
        denyButtonText: `Hủy`,
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: 'controller/question/delete.php',
                type: 'post',
                data: { id: trid },
                success: function (data) {
                    console.log(data);
                    if (data.statusCode == 200) {
                        Swal.fire({
                            position: 'top-end',
                            icon: data.icon,
                            title: data.title,
                            showConfirmButton: false,
                            timer: 500
                        });
                        LoadQuestions();
                    } else {
                        Swal.fire(
                            data.title,
                            data.content,
                            data.icon
                        )
                    }
                }
            })
        }

    })
})

function SetComponents(isReadOnly) {
    $('#title').prop('readonly', isReadOnly);
    if (isReadOnly) {
        $('#btnSaveChanges').hide();
        $('#btnAddOption').hide();
    } else {
        $('#btnSaveChanges').show();
        $('#btnAddOption').show();
    }
}
$("#pagination").on("click", "li a", function (event) {
    event.preventDefault();
    page = $(this).text();
    LoadQuestions();
});

$('#slPageSize').on('change', function () {
    pageSize = $('#slPageSize option:selected').text();
    page = 1;
    LoadQuestions();
})

$(document).on('click', 'span[name="btnRemoveOption"]', function () {
    let section = $(this).closest('section');
    let option_id = $(this).closest('section').attr('id');
    let deleted = true;
    if (option_id.trim().length > 0) {
        let count = $('#options').children().length;
        if (count <= 2) {
            Swal.fire(
                "Số đáp án không thể ít hơn 2",
                "Ràng buộc dữ liệu!",
                "warning"
            )
            return;
        }

        $.ajax({
            url: 'controller/question/delete-option.php',
            type: 'post',
            data: { id: option_id },
            success: function (data) {
                console.log(data)
                if (data.statusCode != 200) {
                    deleted = false;
                }
            },
            error: function (err) {
                alert(err.responseText)
            }
        })
    }
    if (deleted) {
        section.remove();
    }

});
function AddOption(id = '', exist = false, basic = true, optName = '', content = '', checked = false, readonly = false) {
    if (!exist) {
        let now = new Date();
        optName = `${now.getDay()}_${now.getHours()}_${now.getMinutes()}_${now.getSeconds()}_${now.getMilliseconds()}`;
    }
    let count = $("#options section").length;//count exist options      

    if (count >= 6) {
        $('#errNoChecked').text('Số đáp án đã đạt mức tối đa!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }

    let option = `<section class="form-group option" id="${id}" style="margin-top:5px;">`;
    option += `<div class="row">`;
    option += `<div class="col-xs-8 col-md-8 col-sm-8 col-lg-8">`;
    option += `<label>
                Câu trả lời <span class="style2">(*)</span>                
              </label>`;
    option += `</div>`;

    option += `<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 text-right">`;
    option += `<label><input type="radio" name="rbtOption" style="accent-color: #0E92B9;margin-right:5px;"`;
    option += checked ? `checked` : ``;
    option += readonly ? ` disabled>` : `>`;
    option += `Là đáp án đúng</label>`;
    option += `</div>`;
    option += `</div>`;

    option += `<div class="input-group">`;

    option += `<textarea data-option="${id}" name="${optName}" 
        class="form-control custom-control" 
        rows="2" style="resize: vertical;" ${readonly ? 'readonly' : ''}>${basic ? content : ''}</textarea>
        <span type="submit" class="input-group-addon btn btn-secondary btnRemoveOption" 
        name="btnRemoveOption" ${readonly ? 'disabled' : ''}>
        <i class="fa fa-times" aria-hidden="true"></i></span>`;

    option += `</div>`;

    option += `<span class="error"></span>`;
    option += `</section>`;


    $('#options').append(option);
    if (!basic) {
        CKEDITOR.replace(optName);
        CKEDITOR.instances[optName].setData(content);
    }

}


$('#ckbUseCKEditor').change(function () {
    options = [];
    $('#options section.option').each(function () {
        let ta = $(this).find('textarea');
        let chk = $(this).find('input[type="checkbox"]');
        if ($(this).is(':checked')) {
            let opt = {
                content: CKEDITOR.instances[option_name].getData().trim(),
                checked: $(chk).is(':checked')
            };
            options.push(opt);
        } else {
            let opt = {
                content: $(ta).val(),
                checked: $(chk).is('checked')
            }
            options.push(opt);
        }
        console.log(options)
    })

})



//phần xử lý trên modal
$('#modalQuestion').on('hidden.bs.modal', function () {
    $('#title').val('');
    $('#options').empty();
    questId = 0;
})

$('#btnAddOption').click(function () {
    AddOption();
})

$(document).on('show.bs.modal', '#modalQuestion', function () {
    $('.error').hide();
});


$('#btnSaveChanges').click(function () {
    let title = $('#title').val().trim();
    let user = $('#userId').data('user');
    let topic_id = $('div.mdlAddOrUpdate select.slTopics option:selected').val();


    if (title.length == 0) {
        $('#errNoChecked').text('Vui lòng nhập nội dung của câu hỏi!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }


    let optValidate = true;
    let checkValidate = false;
    let options = [];
    $('#options').children().each((index, element) => {
        let id = $(element).find('textarea').data('option');


        let option_name = $(element).find('textarea').attr('name');
        let option = $('#ckbUseCKEditor').is(':checked') ? CKEDITOR.instances[option_name].getData().trim() : $(`textarea[name="${option_name}"]`).val();

        if (option.length === 0) {
            optValidate = false;
        }
        let check = $(element).find('div').find('div').find('label').find('input[type="radio"]').is(':checked') ? 1 : 0;
        if (check) {
            checkValidate = true;
        }
        options.push({ id, option, check })

    });


    if (!optValidate) {
        $('#errNoChecked').text('Vui lòng nhập nội dung của đáp án!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }

    if (!checkValidate) {
        $('#errNoChecked').text('Vui lòng chọn đáp án đúng cho câu hỏi!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }
    if (options.length <= 1) {
        $('#errNoChecked').text('Vui lòng nhập ít nhất 02 đáp án!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }

    //create or update question based on question id
    if (questId == 0) {//insert a new question
        $.ajax({
            url: 'controller/question/create.php',
            type: 'post',
            data: {
                title,
                options: JSON.stringify(options),
                topic_id,
                created_by: user
            },
            success: function (data) {
                if (data.statusCode == 201) {
                    Swal.fire({
                        title: 'Bạn có muốn tiếp tục thêm câu hỏi?',
                        text: data.title,
                        icon: data.icon,
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        cancelButtonText: 'Kết thúc',
                        confirmButtonText: 'Tiếp tục'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $('#options').empty();
                            $('#title').val('');
                            AddOption();
                        } else {
                            $('#modalQuestion').modal('hide');
                        }
                    })
                } else {
                    Swal.fire(
                        data.title,
                        data.content,
                        data.icon
                    )
                }

            }
        })
    } else {//update an exist question 
        $.ajax({
            url: 'controller/question/update.php',
            type: 'post',
            data: {
                id: questId,
                title,
                options: JSON.stringify(options),
                topic_id,
                updated_by: user
            },
            success: function (data) {
                if (data.statusCode == 200) {
                    Swal.fire({
                        position: 'top-end',
                        icon: data.icon,
                        title: data.title,
                        showConfirmButton: false,
                        timer: 1000
                    })
                    $('#modalQuestion').modal('hide');
                } else {
                    Swal.fire(
                        data.title,
                        data.content,
                        data.icon
                    )
                }
            }
        })
    }
    LoadQuestions();
})  