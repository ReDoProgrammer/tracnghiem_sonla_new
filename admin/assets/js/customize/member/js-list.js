var search = '';
var page = 1,
    pageSize = 30;

$(function () {
    LoadProvincesWithWorkplaces();
    $('#btnSearch').click();

    $('#slProvincesWorkplaces').change(function(){
        $('#btnSearch').click();
    })
})



$(document).on('click', "a[name='reset-password']", function (e) {
    e.preventDefault();
    let id = $(this).closest('tr').attr('id');
    $.ajax({
        url: 'controller/config/default-password.php',
        type: 'get',
        data: {
            key: 'DEFAULT_PASSWORD',
            mod: 'MEMBER',
            fnc: 'PROFILE'
        },
        success: function (data) {
            if (data.statusCode == 200) {
                Swal.fire({
                    title: 'Reset về mật khẩu mặc định?',
                    html: `Mật khẩu mặc định là: <span class="fw-bold text-danger">${data.content.cf_value}</span>`,
                    showDenyButton: true,
                    showCancelButton: false,
                    confirmButtonText: 'Khôi phục mật khẩu mặc định',
                    denyButtonText: `Hủy`,
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: 'controller/member/reset-password.php',
                            type: 'post',
                            data: {
                                id,
                                default_password: data.content.cf_value
                            },
                            success: function (data) {
                                if (data.statusCode == 200) {
                                    Swal.fire({
                                        icon: data.icon,
                                        title: data.title
                                    })
                                } else {
                                    Swal.fire({
                                        icon: data.icon,
                                        title: data.title,
                                        text: data.content
                                    })
                                }
                            }
                        })
                    }
                })
            }
        }
    })
})

$('#btnSearch').click(function () {
    LoadMembers();
})
$('#txtSearch').keypress(function (e) {
    if (e.which == 13) {
        LoadMembers();
    }
});


function LoadProvincesWithWorkplaces() {
    $.ajax({
        url: 'controller/location/provinces-workplaces.php',
        type: 'get',
        data: { search },
        success: function (data) {
            // console.log(data);
            if (data.statusCode == 200) {
                $('#slProvincesWorkplaces').empty();
                data.content.forEach(p => {
                    let opt = `<optgroup label="${p.province}" style="color:red !important;">`;
                    JSON.parse(p.workplaces).forEach(el => {
                        opt += `<option value="${el.id}">${el.name}</option>`;
                    })
                    opt += `</optgroup>  `
                    $('#slProvincesWorkplaces').append(opt);
                })
                $('#slProvincesWorkplaces').selectpicker('refresh');
            }
        }
    })
}

function LoadMembers() {
    $.ajax({
        url: 'controller/member/members-list.php',
        type: 'get',
        data: {
            search: $('#txtSearch').val(),
            page, pageSize,
            wp:$('#slProvincesWorkplaces option:selected').val()
        },
        success: function (data) {
            if (data.statusCode == 200) {
                $('#tblData').empty();
                let idx = (page - 1) * pageSize;
                data.content.forEach(m => {
                    let tr = `<tr id = "${m.id}">
                        <td class="text-center">${++idx}</td>
                        <td class="fw-bold text-primary">
                            <a href="#" onclick="GetMember(event)">${m.username}</a>
                        </td>
                        <td>${m.fullname}</td>
                        <td>${m.phone}</td>
                        <td>${m.email}</td>
                        <td>${m.applied_date}</td>
                        <td>${m.lasttime_login}</td>
                        <td class="text-center">
                            <a href=""  name="reset-password">
                                <i class="fa fa-refresh" aria-hidden="true"></i>
                                Reset password
                            </a>
                        </td>
                    </tr>`;
                    $('#tblData').append(tr);
                })
            }
        },
        error: function (jqXHR, exception) {
            console.log(jqXHR)
        }
    })
}

