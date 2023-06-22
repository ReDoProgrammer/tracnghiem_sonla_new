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

$(document).on('click', "a[name='member-detail']", function (e) {
    e.preventDefault();
    let id = $(this).closest('tr').attr('id');
    $.ajax({
        url:'controller/member/detail.php',
        type:'get',
        data:{id},
        success:function(data){
            if(data.statusCode == 200){
                $('#modalMemberDetail').modal();
                let m = data.content;
                if(m.avatar.length > 0){
                    $('#mbAvatar').attr('src',m.avatar);
                }
                $('#mbUsername').text(m.username);
                $('#mbFullname').text(m.fullname);
                $('#mbEmail').text(m.email);
                $('#mbPhone').text(m.phone);
                $('#mbBirthdate').html(m.get_birthdate==1?m.birthdate:`<i class="fa fa-square-o" aria-hidden="true"></i> Không hiển thị`);
                $('#mbGender').html(m.get_gender==1?m.gender:`<i class="fa fa-square-o" aria-hidden="true"></i> Không hiển thị`);
                $('#mbAddress').html(m.get_address==1?m.address:`<i class="fa fa-square-o" aria-hidden="true"></i> Không hiển thị`);
                $('#mbWorkplace').html(m.get_workplace==1?m.workplace:`<i class="fa fa-square-o" aria-hidden="true"></i> Không hiển thị`);
                $('#mbJob').html(m.get_job==1?m.job:`<i class="fa fa-square-o" aria-hidden="true"></i> Không hiển thị`);
                $('#mbPosition').html(m.get_position==1?m.position:`<i class="fa fa-square-o" aria-hidden="true"></i> Không hiển thị`);
                $('#mbAppliedDate').text(m.applied_date);
                $('#mbLasttimeLogin').text(m.lasttime_login);
            }else{
                Swal.fire({
                    icon: data.icon,
                    title: data.title,
                    text: data.content
                })
            }
        }
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
        url: 'controller/member/list.php',
        type: 'get',
        data: {
            search: $('#txtSearch').val(),
            page, pageSize,
            wp:$('#slProvincesWorkplaces option:selected').val()
        },
        success: function (data) {
            console.log(data)
            if (data.statusCode == 200) {
                $('#tblData').empty();
                let idx = (page - 1) * pageSize;
                data.content.forEach(m => {
                    let tr = `<tr id = "${m.id}">
                        <td class="text-center">${++idx}</td>
                        <td class="fw-bold text-primary">
                            <a href="#" name="member-detail">${m.username}</a>
                        </td>
                        <td class="text-nowrap fw-bold">${m.fullname}</td>
                        <td>${m.gender}</td>
                        <td class="text-nowrap">${m.birthdate}</td>
                        <td class="text-nowrap">${m.phone}</td>
                        <td class="text-nowrap">${m.email}</td>
                        <td class="text-nowrap">${m.address}</td>
                        <td class="text-nowrap">${m.workplace}</td>
                        <td class="text-nowrap">${m.working_unit}</td>
                        <td class="text-nowrap">${m.job}</td>
                        <td class="text-nowrap">${m.position}</td>
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

