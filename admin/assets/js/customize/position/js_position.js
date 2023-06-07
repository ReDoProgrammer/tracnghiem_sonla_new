var search = '';
var posId = -1;
$(document).ready(function () {
    ReadData();
})
$('#btnAddNew').click(function () {
    posId = -1;
    $('#txtPositionName').val('');
    $('#modalTitle').text('Thêm mới chức vụ')
    $('#modalPosition').modal();
})

$('#btnSearch').click(function () {
    ReadData();
})

function Edit(id) {
    posId = id;

    $.ajax({
        url: 'controller/position/detail.php',
        type: 'get',
        data: { id },
        success: function (data) {

            if (data.statusCode == 200) {
                $('#txtPositionName').val(data.content.name);
                $('#modalTitle').text('Cập nhật chức vụ')
                $('#modalPosition').modal();
            } else {
                Swal.fire(
                    data.title,
                    data.content,
                    data.icon
                )
            }
        },
        error: function (jqXHR, exception) {
            console.log(jqXHR)
        }
    })
}

function Delete(id) {
    
    Swal.fire({
        title: 'Bạn có chắc muốn xóa chức vụ này?',
        showDenyButton: true,
        showCancelButton: false,
        confirmButtonText: 'Đúng! Tôi muốn xóa',
        denyButtonText: `Hủy`,
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url:'controller/position/delete.php',
                type:'post',
                data:{id},
                success:function(data){
                    if(data.statusCode == 200){
                        Swal.fire({
                            position: 'top-end',
                            icon: data.icon,
                            title: data.title,
                            showConfirmButton: false,
                            timer: 1000
                        })
                        $('#modalPosition').modal('hide');
                        ReadData();
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

}

function ReadData() {
    $.ajax({
        url: 'controller/position/read.php',
        type: 'get',
        data: { search: $('#txtSearch').val() },
        success: function (data) {
            $('#tblData').empty();
            if (data.statusCode == 200) {
                let positions = data.content;
                let idx = 1;
                positions.forEach(p => {
                    let tr = `<tr>`;
                    tr += `<td>${idx++}</td>`;
                    tr += `<td class="text-info fw-bold">${p.name}</td>`;
                    tr += `<td>${p.created_at}</td>`;
                    tr += `<td style="width: 10%;" class="text-center"> ${p.created_by} </td>`;
                    tr += `<td class="text-center" style="white-space:nowrap; width: 10%;">`;
                    tr += ` <button name="btnEdit" onClick="Edit(${p.id})"><i class="fa fa-pencil-square-o" style="color: blue;"></i></button> `;
                    tr += ` <button name = "btnDelete" onClick="Delete(${p.id})"><i class="fa fa-trash-o" style="color: red;"></i></button> `;
                    tr += `</td>`;
                    tr += `</tr>`;
                    $('#tblData').append(tr);
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
}

$('#btnSubmit').click(function () {
    let name = $('#txtPositionName').val().trim();
    if (name.length == 0) {
        $('#errMsg').text('Vui lòng nhập tên chức vụ!');
        $('#errMsg').delay(2000).fadeOut();
        return;
    }
    let user = $('#userId').data('user');

    if (posId > 0) {
        $.ajax({
            url: 'controller/position/update.php',
            type: 'post',
            data: {
                id: posId,
                name,
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
                    $('#modalPosition').modal('hide');
                    ReadData();
                } else {
                    Swal.fire(
                        data.title,
                        data.content,
                        data.icon
                    )
                }
            }
        })
    } else {
        $.ajax({
            url: 'controller/position/create.php',
            type: 'post',
            data: {
                name,
                created_by: user
            },
            success: function (data) {
                if (data.statusCode == 201) {
                    ReadData();
                    Swal.fire({
                        title: 'Bạn có muốn tiếp tục thêm chức vụ khác?',
                        text: data.title,
                        icon: data.icon,
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        cancelButtonText: 'Kết thúc',
                        confirmButtonText: 'Tiếp tục'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $('#txtPositionName').val('');
                        } else {
                            $('#modalPosition').modal('hide');
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
    }


})