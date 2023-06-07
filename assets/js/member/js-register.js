var BIRTHDATE = true,
    GENDER = true,
    ADDRESS = true,
    JOB = true,
    POSITION = true,
    WORKPLACE = true;

$(function () {
    ConfigInputs();
    LoadProvinces();
    if (ADDRESS) {
        $('.slProvinces').on('change', function () {
            LoadDistrictsByPro($(this).val());
            LoadWorkPlaces($(this).val());
        })

        $('.slDistricts').on('change', function () {
            LoadWardsByDist($(this).val())
        })
    }
    if (JOB) {
        LoadJobs();
    }
    if (POSITION) {
        LoadPositions();
    }
    if (WORKPLACE) {
        LoadWorkPlaces($('.slProvinces option:selected').val());
    }



    $('.btnSubmitRegister').prop('disabled', true);
    $('.divWarningMsg').hide();

    //kiểm tra username đã tồn tại trong hệ thống hay chưa
    $('.txtUsername').focusout(function () {
        if ($(this).val().trim().length > 0) {
            $.ajax({
                url: 'controller/member/check-username-exists.php',
                type: 'get',
                data: { username: $(this).val() },
                success: function (count) {
                    isPassport = count == 0;
                    if (count > 0) {
                        $('.divWarningMsg').slideDown(200);
                        $('.divWarningMsg span').text('Tài khoản này đã tồn tại trên hệ thống!');
                    } else {
                        $('.divWarningMsg').slideUp(200);
                    }
                }
            })
        }
    })


    //kiểm tra email đã tồn tại trên hệ thống hay chưa
    $('.txtEmail').focusout(function () {
        if ($(this).val().trim().length > 0) {
            if (validateEmail($(this).val())) {
                $.ajax({
                    url: 'controller/member/check-email-exists.php',
                    type: 'get',
                    data: { email: $(this).val() },
                    success: function (count) {
                        isPassport = count == 0;
                        if (count > 0) {
                            $('.divWarningMsg').slideDown(200);
                            $('.divWarningMsg span').text('Email này đã tồn tại trên hệ thống');
                        } else {
                            $('.divWarningMsg').slideUp(200);
                        }
                    }
                })
            } else {
                $('.divWarningMsg').slideDown(200);
                $('.divWarningMsg span').text('Email không hợp lệ');
                isPassport = false;
            }

        }
    })

    //kiểm tra xem sdt đã tồn tại trên hệ thống hay chưa
    $('.txtPhone').focusout(function () {
        if ($(this).val().trim().length > 0) {
            if (validatePhoneNumber($(this).val())) {
                $.ajax({
                    url: 'controller/member/check-phone-exists.php',
                    type: 'get',
                    data: { phone: $(this).val() },
                    success: function (count) {
                        isPassport = count == 0;
                        if (count > 0) {
                            $('.divWarningMsg').slideDown(200);
                            $('.divWarningMsg span').text('Số điện thoại này đã tồn tại trên hệ thống');
                        } else {
                            $('.divWarningMsg').slideUp(200);
                        }
                    }
                })
            } else {
                $('.divWarningMsg').slideDown(200);
                $('.divWarningMsg span').text('Số điện thoại không hợp lệ');
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
    console.log({fullname,username,password,confirm_password,email,phone});
    return;

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
        $('.divWarningMsg span').text('Vui lòng cung cấp họ tên của bạn');
        $('.divWarningMsg').delay(3000).slideUp(2000);
        return;
    }

    if (username.length == 0) {
        $('.divWarningMsg').slideDown(200);
        $('.divWarningMsg span').text('Vui lòng nhập tài khoản bạn muốn đăng ký với hệ thống');
        $('.divWarningMsg').delay(3000).slideUp(2000);
        return;
    }

    if (password.length == 0 || confirm_password.length == 0) {
        $('.divWarningMsg').slideDown(200);
        $('.divWarningMsg span').text('Vui lòng nhập đầy đủ 2 lần mật khẩu');
        $('.divWarningMsg').delay(3000).slideUp(2000);
        return;
    }

    if (password !== confirm_password) {
        $('.divWarningMsg').slideDown(200);
        $('.divWarningMsg span').text('Mật khẩu 2 lần nhập không trùng khớp');
        $('.divWarningMsg').delay(3000).slideUp(2000);
        return;
    }

    if (JOB && job_id == null) {
        $('.divWarningMsg').slideDown(200);
        $('.divWarningMsg span').text('Vui lòng chọn nghề nghiệp!');
        $('.divWarningMsg').delay(3000).slideUp(2000);
        return;
    }


    if (POSITION && position_id == null) {
        $('.divWarningMsg').slideDown(200);
        $('.divWarningMsg span').text('Vui lòng chọn chức vụ!');
        $('.divWarningMsg').delay(3000).slideUp(2000);
        return;
    }

    if (WORKPLACE && workplace_id == null) {
        $('.divWarningMsg').slideDown(200);
        $('.divWarningMsg span').text('Vui lòng chọn đơn vị công tác!');
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
        success: function (msg) {
        
            Swal.fire({
                icon:msg.icon,
                title: msg.title,
                showDenyButton: false,
                showCancelButton: false,
                confirmButtonText: 'OK!'
                
            }).then(async (result) => {
                let ip_address = '';
                await $.getJSON('https://api.ipify.org?format=json', function (data) {
                    ip_address = data.ip;
                });

                $.ajax({
                    url: 'controller/member/login.php',
                    type: 'post',
                    data: { 
                        username_or_email:username, 
                        login_password:password,
                        ip_address },
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
                let cfigs = data.content;
                BIRTHDATE = cfigs.filter(x => x.cf_key == 'GET_BIRTHDATE')[0].cf_value == 1;
                GENDER = cfigs.filter(x => x.cf_key == 'GET_GENDER')[0].cf_value == 1;
                ADDRESS = cfigs.filter(x => x.cf_key == 'GET_ADDRESS')[0].cf_value == 1;
                JOB = cfigs.filter(x => x.cf_key == 'GET_JOB')[0].cf_value == 1;
                POSITION = cfigs.filter(x => x.cf_key == 'GET_POSITION')[0].cf_value == 1;
                WORKPLACE = cfigs.filter(x => x.cf_key == 'GET_WORKPLACE')[0].cf_value == 1;
                let arr = ['BIRTHDATE', 'GENDER', 'ADDRESS', 'JOB', 'POSITION', 'WORKPLACE'];
                SetVisible(cfigs, arr);
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

function LoadProvinces() {
    $.ajax({
        url: 'controller/location/provinces.php',
        type: 'get',
        success: function (provinces) {
            let default_pro = -1;
            provinces.forEach(p => {
                if (p.default_pro == 1) {
                    default_pro = p.code;
                }
                $('.slProvinces').append(`<option value="${p.code}">${p.full_name}</option>`);
            })
            $(`.slProvinces option[value=${default_pro}]`).attr('selected', 'selected');
            if (ADDRESS) {
                $(`.slProvinces`).trigger('change');
            }

        }
    })
}

function LoadDistrictsByPro(province_code) {
    $.ajax({
        url: 'controller/location/districts.php',
        type: 'get',
        data: { province_code },
        success: function (districts) {
            $('.slDistricts').empty();
            districts.forEach(d => {
                $('.slDistricts').append(`<option value="${d.code}">${d.full_name}</option>`);
            })
            $(`.slDistricts`).selectpicker('refresh');
            $(`.slDistricts`).trigger('change');
        }
    })
}

function LoadWardsByDist(district_code) {
    $.ajax({
        url: 'controller/location/wards.php',
        type: 'get',
        data: { district_code },
        success: function (wards) {
            $('.slWards').empty();
            wards.forEach(w => {
                $('.slWards').append(`<option value="${w.code}">${w.full_name}</option>`);
            })
            $(`.slWards`).selectpicker('refresh');
            $(`.slWards`).trigger('change');
        }
    })
}

function LoadWorkPlaces(province_code) {
    $.ajax({
        url: 'controller/workplace/list.php',
        type: 'get',
        data: { province_code },
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

function SetVisible(cfs, arr) {
    arr.forEach(el => {
        let cf = cfs.filter(x => x.cf_key == `GET_${el.toUpperCase()}`);
        if (cf.length > 0) {
            if (cf[0].cf_value == 0) {
                $(`div.${el}`).hide();
            }
        }
    })
}