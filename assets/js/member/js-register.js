var BIRTHDATE = true,
    GENDER = true,
    ADDRESS = true,
    JOB = true,
    POSITION = true,
    WORKPLACE = true;

$(function () {
    ConfigInputs();
    if (JOB) {
        LoadJobs();
    }
    if (POSITION) {
        LoadPositions();
    }
    if (WORKPLACE) {
        LoadWorkPlaces();
    }



    $('.btnSubmitRegister').prop('disabled', true);

    $('input').focusout(function () {
        let phone = $('.txtPhone').val().trim();
        let username = $('.txtUsername').val().trim();
        let email = $('.txtEmail').val().trim();
        $('.divWarningMsg').empty();

        if (username.length > 0) {
            $.ajax({
                url: 'controller/member/check-username-exists.php',
                type: 'get',
                data: { username },
                success: function (count) {
                    isPassport = count == 0;
                    if (count > 0) {
                        $('.divWarningMsg').append('- Tài khoản này đã tồn tại trên hệ thống!<br/>');
                    }
                }
            })
        }
        if(email.length > 0){
            if (validateEmail(email)) {
                $.ajax({
                    url: 'controller/member/check-email-exists.php',
                    type: 'get',
                    data: { email },
                    success: function (count) {
                        isPassport = count == 0;
                        if (count > 0) {
                            $('.divWarningMsg').append('- Email này đã tồn tại trên hệ thống <br/>');
                        }
                    }
                })
            } else {
                $('.divWarningMsg').append('- Email không hợp lệ<br/>');
                isPassport = false;
            }
        }
        if(phone.length>0){
            if (validatePhoneNumber(phone)) {
                $.ajax({
                    url: 'controller/member/check-phone-exists.php',
                    type: 'get',
                    data: { phone },
                    success: function (count) {
                        isPassport = count == 0;
                        if (count > 0) {
                            $('.divWarningMsg').append('- Số điện thoại này đã tồn tại trên hệ thống <br/>');
                        } 
                    }
                })
            } else {
                $('.divWarningMsg').append('- Số điện thoại không hợp lệ <br/>');
                isPassport = false;
            }
        }
    })

})


$('.btnSubmitRegister').click(function () {
    let fullname = $('input[name=txtFullname1]').val().trim();
    let username = $('input[name=txtUsername]').val().trim();
    let password = $('.txtPassword').val().trim();
    let confirm_password = $('.txtConfirmPassword').val().trim();
    let email = $('.txtEmail').val().trim();
    let phone = $('.txtPhone').val().trim();
    console.log({ fullname, username, password, confirm_password, email, phone });


    let gender = GENDER ? $('.rbtN').is(':checked') ? -1 : $('.rbtM').is(':checked') ? 1 : 0 : -1;
    let birthdate = BIRTHDATE ? $('.txtBirthdate').val() : '';
    let province_code = ADDRESS ? $('.slProvinces option:selected').val() : '';
    let district_code = ADDRESS ? $('.slDistricts option:selected').val() : '';
    let ward_code = ADDRESS ? $('.slWards option:selected').val() : '';
    let address = ADDRESS ? $('.txtAddress').val().trim() : '';
    let job_id = JOB ? $('.slJobs option:selected').val() : '';
    let position_id = POSITION ? $('.slPositions option:selected').val() : '';
    let workplace_id = WORKPLACE ? $('.slWorkPlaces option:selected').val() : '';



    if (fullname.length == 0) {
        $('.divWarningMsg').slideDown(200);
        $('.divWarningMsg').text('Vui lòng cung cấp họ tên của bạn');
        $('.divWarningMsg').delay(3000).slideUp(2000);
        return;
    }

    if (username.length == 0) {
        $('.divWarningMsg').slideDown(200);
        $('.divWarningMsg').text('Vui lòng nhập tài khoản bạn muốn đăng ký với hệ thống');
        $('.divWarningMsg').delay(3000).slideUp(2000);
        return;
    }

    if (password.length == 0 || confirm_password.length == 0) {
        $('.divWarningMsg').slideDown(200);
        $('.divWarningMsg').text('Vui lòng nhập đầy đủ 2 lần mật khẩu');
        $('.divWarningMsg').delay(3000).slideUp(2000);
        return;
    }

    if (password !== confirm_password) {
        $('.divWarningMsg').slideDown(200);
        $('.divWarningMsg').text('Mật khẩu 2 lần nhập không trùng khớp');
        $('.divWarningMsg').delay(3000).slideUp(2000);
        return;
    }

    if (JOB && job_id == null) {
        $('.divWarningMsg').slideDown(200);
        $('.divWarningMsg').text('Vui lòng chọn nghề nghiệp!');
        $('.divWarningMsg').delay(3000).slideUp(2000);
        return;
    }


    if (POSITION && position_id == null) {
        $('.divWarningMsg').slideDown(200);
        $('.divWarningMsg').text('Vui lòng chọn chức vụ!');
        $('.divWarningMsg').delay(3000).slideUp(2000);
        return;
    }

    if (WORKPLACE && workplace_id == null) {
        $('.divWarningMsg').slideDown(200);
        $('.divWarningMsg').text('Vui lòng chọn đơn vị công tác!');
        $('.divWarningMsg').delay(3000).slideUp(2000);
        return;
    }

    if (!isPassport) { return; }



    //dữ liệu nhập là hợp lệ => tiến hành post dữ liệu để lưu vào csdl
    let formData = new FormData();

    formData.append("fullname", fullname);
    formData.append("username", username);
    formData.append("password", password);
    formData.append("avatar", avatar == null ? '' : avatar);
    formData.append("email", email);
    formData.append("phone", phone);
    formData.append("gender", gender);
    formData.append("birthdate", formatDate(birthdate));
    formData.append("province_code", province_code);
    formData.append("district_code", district_code);
    formData.append("ward_code", ward_code);
    formData.append("address", address);
    formData.append("job_id", job_id);
    formData.append("position_id", position_id);
    formData.append("workplace_id", workplace_id);


    formData.append("cfGender", GENDER ? 1 : 0);
    formData.append("cfBirthdate", BIRTHDATE ? 1 : 0);
    formData.append("cfAddress", ADDRESS ? 1 : 0);
    formData.append("cfJob", JOB ? 1 : 0);
    formData.append("cfPosition", POSITION ? 1 : 0);
    formData.append("cfWorkPlace", WORKPLACE ? 1 : 0);


    $.ajax({
        url: 'controller/member/register.php',
        type: 'post',
        data: formData,
        processData: false,
        contentType: false,
        success: function (data) {
            if (data.statusCode == 201) {
                Swal.fire({
                    icon: data.icon,
                    title: data.title,
                    showDenyButton: false,
                    showCancelButton: false,
                    confirmButtonText: 'OK!'
                }).then(_ => {
                    let ip_address = '127.0.0.1';
                    // await $.getJSON('https://api.ipify.org?format=json', function (data) {
                    //     ip_address = data.ip;
                    // });

                    $.ajax({
                        url: 'controller/member/login.php',
                        type: 'post',
                        data: {
                            username_or_email: username,
                            login_password: password,
                            ip_address
                        },
                        success: function (data) {
                            console.log(data)
                            if (data.statusCode == 200) {
                                window.location.href = "index.php?module=home&act=index";
                            }
                        },
                        error: function (jqXHR, exception) {
                            console.log(jqXHR)
                        }
                    })

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


})

function ShowRegisterRules() {
    $.ajax({
        url: 'controller/config/register-rule.php',
        type: 'get',
        data: {
            key: 'RULES',
            mod: 'MEMBER',
            fnc: 'REGISTER'
        },
        success: function (data) {
            if (data.statusCode == 200) {

                Swal.fire({
                    title: data.title,
                    icon: data.icon,
                    html: data.content.cf_value,
                    customClass: 'swal-wide',
                    showCloseButton: false,
                    showCancelButton: false,
                    focusConfirm: false,
                    confirmButtonText: 'Tôi đã hiểu!'
                })
            }
        },
        error: function (jqXHR, exception) {
            console.log(jqXHR);
        }
    })
}

function ConfigInputs() {
    $.ajax({
        url: 'controller/config/register.php',
        type: 'get',
        data: { mod: 'MEMBER', fnc: 'REGISTER' },
        success: function (data) {
            if (data.statusCode == 200) {
                data.content.forEach(el => {
                    el.cf_value == 1 ? $(`.${el.cf_key.toLowerCase()}`).show() : $(`.${el.cf_key.toLowerCase()}`).hide();

                })
                BIRTHDATE = data.content.filter(x => x.cf_key == 'GET_BIRTHDATE')[0].cf_value == 1;
                GENDER = data.content.filter(x => x.cf_key == 'GET_GENDER')[0].cf_value == 1;
                ADDRESS = data.content.filter(x => x.cf_key == 'GET_ADDRESS')[0].cf_value == 1;
                WORKPLACE = data.content.filter(x => x.cf_key == 'GET_WORKPLACE')[0].cf_value == 1;
                JOB = data.content.filter(x => x.cf_key == 'GET_JOB')[0].cf_value == 1;
                POSITION = data.content.filter(x => x.cf_key == 'GET_POSITION')[0].cf_value == 1;
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
                let positions = data.content;
                positions.forEach(p => {
                    $('.slPositions').append(`<option value="${p.id}">${p.name}</option>`);
                })
                $('.slPositions').selectpicker('refresh');
            }
        }
    })
}



var isPassport = true;
var avatar = null;


$(".ckbAgreement").change(function () {
    $('.btnSubmitRegister').prop('disabled', !this.checked);
});

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


function LoadJobs() {
    $.ajax({
        url: 'controller/job/list.php',
        type: 'get',
        success: function (jobs) {
            jobs.forEach(j => {
                $('.slJobs').append(`<option value="${j.id}">${j.name}</option>`)
            })
            $('.slJobs').selectpicker('refresh');
        }
    })
}


function LoadWorkPlaces() {
    $.ajax({
        url: 'controller/workplace/list.php',
        type: 'get',
        success: function (data) {
            $('.slWorkPlaces').empty();
            if (data.statusCode == 200) {
                let wps = data.content;
                wps.forEach(w => {
                    $('.slWorkPlaces').append(`<option value="${w.id}">${w.name}</option>`);
                })
                $('.slWorkPlaces').selectpicker('refresh');
            } else {

            }
        }
    })
}

function validateEmail(email) {
    var pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return pattern.test(email);
}
function validatePhoneNumber(phoneNumber) {
    var pattern = /^0\d{9}$/;
    return pattern.test(phoneNumber);
}

function formatDate(date) {
    let d = date.split('/');
    return `${d[2]}-${d[1]}-${d[0]}`;
}

