var page = 1;
var search = "";
var index = 0;
var wpId = 0;
var pageSize = 10;// giá trị mặc định của kích thước trang
$(document).ready(function () {

    LoadProvinces();
    pageSize = $('#slPageSize option:selected').text();
    $('.selectpicker').selectpicker();
    LoadData();
})

function Delete(id) {
    Swal.fire({
        title: 'Bạn có chắc muốn xóa đơn vị này?',
        showDenyButton: true,
        showCancelButton: false,
        confirmButtonText: 'Đúng! Tôi muốn xóa',
        denyButtonText: `Để tôi suy nghĩ lại`,
    }).then((result) => {
        if (result) {
            $.ajax({
                url: 'controller/workplace/delete.php',
                type: 'post',
                data: { id },
                success: function (data) {
                    index = (page - 1) * pageSize;
                    if (data.statusCode == 200) {
                        Swal.fire({
                            position: 'top-end',
                            icon: data.icon,
                            title: data.title,
                            showConfirmButton: false,
                            timer: 500
                        });
                    } else {
                        Swal.fire(
                            data.title,
                            data.content,
                            data.icon
                        )
                    }

                    LoadData();
                },
                error: function (jqXHR, exception) {
                    console.log(jqXHR)
                }
            })
        }


    })
}

function Edit(id) {
    wpId = id;
    $.ajax({
        url: 'controller/workplace/detail.php',
        type: 'get',
        data: { id },
        success: function (data) {
            if (data.statusCode == 200) {
                let wp = data.content;
                $('#txtName').val(wp.name);
                $('#txtPhone').val(wp.phone);
                $('#txtFax').val(wp.fax);
                $('#txtEmail').val(wp.email);

                $('#slProvinces').val(wp.province_code).change();
                $('#slProvinces').trigger('change');

                $('#slDistricts').val(wp.district_code).change();
                $('#slDistricts').trigger('change');

                $('#slWards').val(wp.ward_code).change();

                $('#txtAdress').val(wp.address);
                $('#modalTitle').text('Cập nhật đơn vị công tác');
                $('#modalWP').modal();
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

function LoadData() {
    search = $('#txtSearch').val().trim();
    $.ajax({
        url: 'controller/workplace/list.php',
        type: 'get',
        data: { pageSize, page, search },
        success: function (data) {
            if (data.statusCode == 200) {
                let wps = data.content;
                $('#tblData').empty();
                wps.forEach(w => {
                    let tr = `<tr>`;
                    tr += `<td style="width:5%;" class="text-center">${++index}</td>`;
                    tr += `<td class="text-info fw-bold">${w.name}</td>`;
                    tr += `<td>${w.phone}</td>`;
                    tr += `<td>${w.fax}</td>`;
                    tr += `<td>${w.email}</td>`;
                    tr += `<td>${w.address}</td>`;
                    tr += `<td class="text-center" style="white-space:nowrap; width: 10%;">`;
                    tr += ` <button name="btnEdit" onClick="Edit(${w.id})"><i class="fa fa-pencil-square-o" style="color: blue;"></i></button> `;
                    tr += ` <button name = "btnDelete" onClick="Delete(${w.id})"><i class="fa fa-trash-o" style="color: red;"></i></button> `;
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
        },
        error: function (jqXHR, exception) {
            console.log(jqXHR)
        }
    })
}


$('#btnSearch').click(function () {
    page = 1;
    index = 0;
    LoadData();
})





$('#btnSaveChanges').click(function () {
    let user = $('#userId').data('user');
    let name = $('#txtName').val().trim();
    let phone = $('#txtPhone').val().trim();
    let fax = $('#txtFax').val().trim();
    let email = $('#txtEmail').val().trim();
    let province_code = $('#slProvinces option:selected').val();
    let district_code = $('#slDistricts option:selected').val();
    let ward_code = $('#slWards option:selected').val();
    let address = $('#txtAddress').val().trim();

    //validate inputs
    if (name.length == 0) {
        $('#errMsg').text("Ràng buộc dữ liệu! Vui lòng nhập tên đơn vị");
        $('#errMsg').delay(3000).fadeOut();
        return;
    }

    //post data via ajax
    if (wpId <= 0) {
        $.ajax({
            url: 'controller/workplace/create.php',
            type: 'post',
            data: {
                name, phone, fax, email,
                province_code, district_code, ward_code,
                address, created_by: user
            },
            success: function (data) {
                if (data.statusCode == 201) {
                    Swal.fire({
                        title: 'Bạn có muốn tiếp tục thêm đơn vị khác?',
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
                            $('#txtPhone').val('');
                            $('#txtEmail').val('');
                            $('#txtFax').val('');
                            $('#txtAddress').val('');
                        } else {
                            $('#modalWP').modal('hide');
                        }
                    })
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
    } else {
        $.ajax({
            url: 'controller/workplace/update.php',
            type: 'post',
            data: {
                id: wpId, name, phone, fax, email,
                province_code, district_code, ward_code,
                address, updated_by: user
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

                    $('#modalWP').modal('hide');

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
    index = (page-1)*pageSize;
    LoadData();

})

$('#btnAddNew').click(function () {
    $('#modalTitle').text('Thêm mới đơn vị công tác');
    $('#txtName').val('');
    $('#txtPhone').val('');
    $('#txtEmail').val('');
    $('#txtFax').val('');
    $('#txtAddress').val('');
    $('#modalWP').modal();
    wpId = -1;
})

$('#slDistricts').on('change', function () {
    LoadWards($(this).val());
})

$('#slProvinces').on('change', function () {
    LoadDistricts($(this).val());
})


function LoadWards(district_code) {
    $.ajax({
        url: 'controller/location/wards.php',
        type: 'get',
        data: { district_code },
        success: function (wards) {
            $('#slWards').empty();
            wards.forEach(w => {
                $('#slWards').append(`<option value="${w.code}">${w.full_name}</option>`);
            })
            $('#slWards').selectpicker('refresh');
        }
    })
}


function LoadDistricts(province_code) {
    $.ajax({
        url: 'controller/location/districts.php',
        type: 'get',
        data: { province_code },
        success: function (districts) {
            $('#slDistricts').empty();
            districts.forEach(d => {
                $('#slDistricts').append(`<option value="${d.code}">${d.full_name}</option>`);
            })
            $('#slDistricts').selectpicker('refresh');
            $('#slDistricts').trigger('change');
        }
    })
}

function LoadProvinces() {
    $.ajax({
        url: 'controller/location/provinces.php',
        type: 'get',
        success: function (provinces) {
            let default_pro = '';
            provinces.forEach(p => {
                if (p.default_pro == 1) {
                    default_pro = p.code;
                }
                $('#slProvinces').append(`<option value="${p.code}">${p.full_name}</option>`)
            })
            $('#slProvinces').selectpicker('refresh');
            $('#slProvinces').val(default_pro).change();
            $('#slProvinces').trigger('change');
        }
    })
}

