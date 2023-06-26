var set_province_code = '';
var set_district_code = '';
var set_ward_code = '';
var avatar = null;


$(async function () {
    await $.ajax({
        url: 'controller/location/provinces.php',
        type: 'get',
        success: function (data) {
            if (data.statusCode == 200) {
                data.content.forEach(p => {
                    $('.slProvinces').append(`<option value="${p.code}">${p.full_name}</option>`);
                })
                $('.slProvinces').trigger('change');
            }
        }
    })



    LoadJobs();
    LoadWorkPlaces();
    LoadPositions();
    LoadMemberDetail();

    $(document).on('change', '#slProvinces', function () {
        LoadDistricts($('#slProvinces option:selected').val());
    })

    $(document).on('change', '.slDistricts', function () {
        LoadWards($('#slDistricts option:selected').val());
    })


})

$('#btnSaveChanges').click(function () {
    let user_id = $('#pf_username').data('userid');
    let fullname = $('#pf_fullname').val();
    let birthdate = $('#txtBirthdate').val();
    let gender = $('#rbtM').is(':checked') ? 1 : $('#rbtF').is(':checked') ? 0 : -1;
    let phone = $('#pf_phone').val();
    let email = $('#pf_email').val();
    let new_password = $('#txtNewPassword').val();
    let confirm_new_password = $('#txtConfirmNewPassword').val();
    let province_code = $('#slProvinces option:selected').val();
    let district_code = $('#slDistricts option:selected').val();
    let ward_code = $('#slWards option:selected').val();
    let address = $('#txtAddress').val();
    let job_id = $('#slJobs option:selected').val();
    let workplace_id = $('#slWorkplaces option:selected').val();
    let position_id = $('#slPositions option:selected').val();
    let working_unit = $('#txtWorkingUnit').val();
    
    if (fullname.trim().length == 0) {
        $('#msgFullname').text('Họ tên không được để trống!');
        $('#pf_fullname').select();
        return;
    }
    $('#msgFullname').text('');
    $('#msgNewPassword').text('');
    $('#msgConfirmNewPassword').text('');
    $('#msgPhone').text('');
    $('#msgEmail').text('');
    if (validateEmail(email)) {
        $.ajax({
            url: 'controller/member/check-duplicate-email.php',
            type: 'get',
            data: { user_id, email },
            success: function (data) {
                if (data.statusCode == 200) {
                    if (parseInt(data.content) > 0) {
                        $('#msgEmail').text('Email này đã được thành viên khác sử dụng trên hệ thống!');
                        $('#pf_email').select();
                        return;
                    }
                } else {
                    $.toast({
                        heading: data.title,
                        text: data.content,
                        showHideTransition: 'fade',
                        icon: data.icon
                    })
                }
            }
        })
    } else {
        if (email.length == 0) {
            $('#msgEmail').text("Vui lòng cung cấp email của bạn!!");
            $('#pf_email').select();
            return;
        } else {
            $('#msgEmail').text("Định dạng email không hợp lệ. Email là chữ không dấu, không chứa khoảng trắng và phải có địa chỉ máy chủ cụ thể, ví dụ: @gmail.com hoặc @yahoo.com!!");
            $('#pf_email').select();
            return;
        }
    }

    if (validatePhoneNumber(phone)) {
        $.ajax({
            url: 'controller/member/check-duplicate-phone.php',
            type: 'get',
            data: { user_id, phone },
            success: function (data) {
                if (data.statusCode == 200) {
                    if (parseInt(data.content) > 0) {
                        $('#msgPhone').text('Số điện thoại này đã được thành viên khác sử dụng trên hệ thống!');
                        $('#pf_phone').select();
                        return;
                    }
                } else {
                    $.toast({
                        heading: data.title,
                        text: data.content,
                        showHideTransition: 'fade',
                        icon: data.icon
                    })
                }
            }
        })
    } else {
        if (phone.length == 0) {
            $('#msgPhone').text('Vui lòng cung cấp số điện thoại của bạn!');
            $('#pf_phone').select();
            return;
        } else {
            $('#msgPhone').text('Số điện thoại không hợp lệ. Số điện thoại gồm 10 chữ số, bắt đầu bằng số 0, không được chứa khoảng trắng!');
            $('#pf_phone').select();
            return;
        }
    }
    if (validatePassword(new_password).length > 0) {
        $('#msgNewPassword').text(validatePassword(new_password));
        $('#txtNewPassword').select();
        return;
    }

    if (validatePassword(confirm_new_password).length > 0) {
        $('#msgConfirmNewPassword').text(validatePassword(confirm_new_password));
        $('#txtConfirmNewPassword').select();
        return;
    }

    if (new_password != confirm_new_password) {
        $('#msgConfirmNewPassword').text('Mật khẩu ở 2 lần nhập không giống nhau!');
        $('#txtConfirmNewPassword').select();
        return;
    }

    let formData = new FormData();

    formData.append("fullname", fullname);
    formData.append("avatar", avatar == null ? '' : avatar);
    formData.append("gender", gender);
    formData.append("birthdate", formatDate(birthdate));
    formData.append("phone", phone);
    formData.append("email", email);
    formData.append("password", new_password);
    formData.append("province_code", province_code);
    formData.append("district_code", district_code);
    formData.append("ward_code", ward_code);
    formData.append("address", address);
    formData.append("job_id", job_id);
    formData.append("workplace_id", workplace_id);
    formData.append("position_id", position_id);
    formData.append("working_unit", working_unit);

    console.log(1,formData);
    return;

    $.ajax({
        url: 'controller/member/update-profile.php',
        type: 'post',
        data: {
            user_id, fullname, birthdate, gender, phone, email, province_code, district_code, ward_code, address,
            job_id, workplace_id, position_id, working_unit
        },
        success: function (data) {
            console.log(data);
            if (data.statusCode == 200) {
                Swal.fire({
                    position: 'top-end',
                    icon: data.icon,
                    title: data.content,
                    showConfirmButton: false,
                    timer: 1500
                })
                window.location.href = "index.php?module=home&act=index";
            } else {
                $.toast({
                    heading: data.title,
                    text: data.content,
                    showHideTransition: 'fade',
                    icon: data.icon
                })
            }
        }
    })
})


function LoadMemberDetail() {
    $.ajax({
        url: 'controller/member/detail.php',
        type: 'get',
        success: async function (data) {
            if (data.statusCode == 200) {
                let p = data.content;
                $('#pf_username').val(p.username);
                $('#pf_username').attr('data-userid', p.id);
                $('#pf_fullname').val(p.fullname);

                if (p.get_birthdate == 1) {
                    $('#txtBirthdate').val(p.mBirthdate);
                }
                if (p.get_gender == 1) {
                    if (p.gender == 1) {
                        $('#rbtM').prop('checked', true);
                    } else if (p.gender == 0) {
                        $('#rbtF').prop('checked', true);
                    } else {
                        $('#rbtN').prop('checked', true);
                    }
                }

                $('#pf_phone').val(p.phone);
                $('#pf_email').val(p.email);

                if (p.get_address == 1) {
                    await $('#slProvinces').val(p.province_code);
                    set_province_code = p.province_code;
                    set_district_code = p.district_code;
                    set_ward_code = p.ward_code;  
                    $('#txtAddress').val(p.address);
                }
                $('#slProvinces').trigger('change');


                $('#slJobs').val(p.job_id);
                $('#slWorkplaces').val(p.workplace_id);
                $('#slPositions').val(p.position_id);
                $('#txtWorkingUnit').val(p.working_unit);
            }
        }
    })
}


function LoadWorkPlaces() {
    $.ajax({
        url: 'controller/workplace/list.php',
        type: 'get',
        success: function (data) {
            if (data.statusCode == 200) {
                data.content.forEach(w => {
                    $('#slWorkplaces').append(`<option value="${w.id}">${w.name}</option>`);
                })
            }
        }
    })
}
function LoadPositions() {
    $.ajax({
        url: 'controller/position/list.php',
        type: 'get',
        success: function (data) {
            if (data.statusCode == 200) {
                data.content.forEach(p => {
                    $('#slPositions').append(`<option value="${p.id}">${p.name}</option>`);
                })
            }
        }
    })
}

function LoadJobs() {
    $.ajax({
        url: 'controller/job/list.php',
        type: 'get',
        success: function (data) {
            data.forEach(j => {
                $('#slJobs').append(`<option value="${j.id}">${j.name}</option>`)
            })
        }
    })
}

function LoadWards(district_code) {
    if (typeof district_code != 'undefined') {
        $.ajax({
            url: 'controller/location/wards.php',
            type: 'get',
            data: { district_code },
            success: async function (data) {
                $('#slWards').empty();
                if (data.statusCode == 200) {
                    await data.content.forEach(w => {
                        $('#slWards').append(`<option value="${w.code}">${w.full_name}</option>`)
                    })

                    if (set_ward_code.trim().length > 0 && district_code.trim() == set_district_code.trim()) {
                        $('#slWards').val(set_ward_code);
                    }
                }
            }
        })
    }
}

function LoadDistricts(province_code) {
    if (typeof province_code != 'undefined') {
        $.ajax({
            url: 'controller/location/districts.php',
            type: 'get',
            data: { province_code },
            success: async function (data) {
                $('#slDistricts').empty();
                if (data.statusCode == 200) {
                    await data.content.forEach(d => {
                        $('#slDistricts').append(`<option value="${d.code}">${d.full_name}</option>`);
                    })

                    if (province_code == set_province_code) {
                        $('#slDistricts').val(set_district_code);
                    }
                    $('#slDistricts').trigger('change');
                }
            }
        })
    }
}

$(".btnImportAvatar").on("click", function (e) {
    var fileDialog = $('<input style="z-index:9999;" type="file"  accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">');
    fileDialog.click();
    fileDialog.on("change", onFileSelected);
    return false;
});

var onFileSelected = function (e) {
    if ($(this)[0].files && $(this)[0].files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('.avatar .content img').attr('src', e.target.result);
        }
        avatar = $(this)[0].files[0];
        reader.readAsDataURL($(this)[0].files[0]);
    }
};

function validatePassword(pwd) {
    // Kiểm tra các ràng buộc
    var hasWhitespace = /\s/.test(pwd);
    var hasEnoughLength = pwd.length >= 6;
    var hasEnoughCharacterTypes = /[a-zA-Z]/.test(pwd) && /\d/.test(pwd);
    if (hasWhitespace) {
        return 'Mật khẩu không được chứa khoảng trắng.';
    } else if (!hasEnoughLength) {
        return 'Mật khẩu phải có ít nhất 6 kí tự.';
    } else if (!hasEnoughCharacterTypes) {
        return 'Mật khẩu phải chứa ít nhất 1 kí tự chữ cái và 1 kí tự số.';
    }
    return '';
}

function validateEmail(email) {
    var pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return pattern.test(email);
}
function validatePhoneNumber(phoneNumber) {
    let regex = /^0\d{9}$/;
    return regex.test(phoneNumber);
}

function formatDate(date) {
    let d = date.split('/');
    return `${d[2]}-${d[1]}-${d[0]}`;
}