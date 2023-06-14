var page = 1;
var search = "";
var index = 0;
var topicId = 0;
var pageSize = 10;// giá trị mặc định của kích thước trang
$(function () {
    LoadData();   
})
$('#slPageSize').change(function(){
    pageSize = $(this).text();
})
$(document).on('click','#pagination li a',function(e){
    e.preventDefault();
    page = $(this).text();
    LoadData();
})



$('#btnSearch').click(function () {
    page = 1;
    LoadData();
})



$('#btnAddNew').click(function () {
    $('#modalTitle').text('Thêm mới chủ đề');
    $('#modalTopic').modal();
})



function LoadData() {
    $.ajax({
        url: 'controller/topic/list.php',
        type: 'get',
        data: { 
            page, 
            search: $('#txtSearch').val(), 
            pageSize },
        success: function (data) {
            $('#tblData').empty();
            index = pageSize == 'All' ? 1 : (page - 1) * pageSize;
            if(data.statusCode == 200){
                topics = data.content;
                topics.forEach(t => {
                    let tr = `<tr id = "${t.id}">`;
                    tr += `<td class="text-center" style="width: 2%;"> ${++index} </td>`;
                    tr += `<td style="width: 60%; font-weight:bold; color: #3393FF"> ${t.name} </td>`;
                    tr += `<td style="width: 10%;" > ${t.created_at} </td>`
                    tr += `<td style="width: 10%;" class="text-center"> ${t.created_by} </td>`;
                    tr += `<td class="text-center" style="white-space:nowrap; width: 10%;">`;
                    tr += ` <button name="btnEdit"><i class="fa fa-pencil-square-o" style="color: blue;"></i></button> `;
                    tr += ` <button name = "btnDelete"><i class="fa fa-trash-o" style="color: red;"></i></button> `;
                    tr += `</td>`;
                    tr += `</tr>`;
                    $('#tblData').append(tr);
                })
                $('#pagination').empty();
                if(data.pages > 1){
                    for(i=1; i<=data.pages; i++){
                        $('#pagination').append(`<li class="${i==page?'active':''}"><a href="#">${i}</a></li>`);
                    }
                }
            }
           
        }
    })
}

function GetDetail(id) {
    $.ajax({
        url: 'controller/topic/detail.php',
        type: 'get',
        data: { id },
        success: function (topic) {
            $('#txtName').val(topic.name);
        }
    })
}

$(document).on('click', "button[name='btnEdit']", function () {
    topicId = $(this).closest('tr').attr('id'); //get question id
    $('#modalTitle').text('Cập nhật chủ đề');
    GetDetail(topicId);
    $('#modalTopic').modal();
})
$(document).on('click', "button[name='btnDelete']", function () {
    var trid = $(this).closest('tr').attr('id'); //get question id
    Swal.fire({
        title: 'Bạn có chắc muốn xóa chủ đề này?',
        showDenyButton: true,
        showCancelButton: false,
        confirmButtonText: 'Đúng! Tôi muốn xóa',
        denyButtonText: `Để tôi suy nghĩ lại`,
    }).then((result) => {
        if (result) {
            $.ajax({
                url: 'controller/topic/delete.php',
                type: 'post',
                data: { id: trid },
                success: function (msg) {
                    if (msg.statusCode == 200) {
                        Swal.fire({
                            position: 'top-end',
                            icon: msg.icon,
                            title: msg.title,
                            showConfirmButton: false,
                            timer: 500
                        });
                    } else {
                        Swal.fire(
                            msg.title,
                            msg.content,
                            msg.icon
                        )
                    }

                    LoadData();
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



$('#modalTopic').on('hidden.bs.modal', function () {
    $('#txtName').val('');
    topicId = 0;
})

$(document).on('show.bs.modal', '#modalTopic', function () {
    $('.error').hide();
});


$('#btnSaveChanges').click(function () {
    let name = $('#txtName').val().trim();
    let user = $('#userId').data('user');


    if (name.length == 0) {
        $('#errNoChecked').text('Vui lòng nhập tên của chủ đề!');
        $('#errNoChecked').show().fadeOut(5000);
        return;
    }


    //create or update question based on question id
    if (topicId == 0) {//insert a new question
        $.ajax({
            url: 'controller/topic/create.php',
            type: 'post',
            data: {
                name,
                created_by: user
            },
            success: function (data) {
                if (data.statusCode == 201) {
                    Swal.fire({
                        title: 'Bạn có muốn tiếp tục thêm chủ đề khác?',
                        text: data.title,
                        icon: data.icon,
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        cancelButtonText: 'Kết thúc',
                        confirmButtonText: 'Tiếp tục'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $('#txtName').val('');
                        } else {
                            $('#modalTopic').modal('hide');
                        }
                    })
                } else {
                    Swal.fire(
                        msg.title,
                        msg.content,
                        msg.icon
                    )
                }

            }
        })
    } else {//update an exist question
        $.ajax({
            url: 'controller/topic/update.php',
            type: 'post',
            data: {
                id: topicId,
                name,
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
                if (data.statusCode == 200) {
                    $('#modalTopic').modal('hide');
                }

            }
        })
    }
    LoadData();
})  
