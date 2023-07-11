var BIRTHDATE = true,
    GENDER = true,
    ADDRESS = true,
    JOB = true,
    POSITION = true,
    WORKPLACE = true;
    WORKINGUNIT = true;

$(function () {
    $('.msgValidation').empty();

    ConfigInputs();
    if (JOB) {
        LoadJobs();
    }

    if (WORKPLACE) {
        LoadWorkPlaces();
    }
})


$('.btnSubmitRegister').click(function () {

    $('.msgValidation').text('');
    let fullname = $('#txtFullname').val().trim();
    let username = $('#txtUsername').val().trim();
    let password = $('#txtPassword').val();
    let confirm_password = $('#txtConfirmPassword').val();
    let email = $('#txtEmail').val();
    let phone = $('#txtPhone').val();


    let gender = GENDER ? $('.rbtN').is(':checked') ? -1 : $('.rbtM').is(':checked') ? 1 : 0 : -1;
    let birthdate = BIRTHDATE ? $('.txtBirthdate').val() : '';
    let province_code = ADDRESS ? $('.slProvinces option:selected').val() : '';
    let district_code = ADDRESS ? $('.slDistricts option:selected').val() : '';
    let ward_code = ADDRESS ? $('.slWards option:selected').val() : '';
    let address = ADDRESS ? $('.txtAddress').val().trim() : '';
    let job_id = JOB ? $('.slJobs option:selected').val() : '';
    let position = POSITION ? $('#txtPosition').val() : '';
    let workplace_id = WORKPLACE ? $('.slWorkPlaces option:selected').val() : '';
    let workingunit = $('.txtWorkingUnit').val();

    
    if (fullname.length == 0) {
        $('#msgFullname').text("Vui lòng nhập họ tên. Họ tên không thể để trống!");
        $('#txtFullname').select();
        return;
    }

    if (validateUsername(username)) {
        $.ajax({
            url: 'controller/member/check-username-exists.php',
            type: 'get',
            data: { username },
            success: function (count) {
                if (count > 0) {
                    $('#msgUsername').text("- Tài khoản này đã tồn tại trên hệ thống!");
                    $('#txtUsername').select();
                    return;
                }
            }
        })
    } else {
        $('#msgUsername').text("- Tài khoản ít nhất 4 kí tự, không chứa khoảng trắng, tiếng Việt và kí tự đặc biệt!");
        $('#txtUsername').select();
        return;
    }


    if (validatePassword(password).length >0) {
        $('#msgPassword').text(validatePassword(password));
        $('#msgPassword').select();
        return;
    }

    if (validatePassword(confirm_password).length>0) {
        $('#msgConfirmPassword').text(validatePassword(confirm_password));
        $('#msgConfirmPassword').select();
        return;
    }

    if (password != confirm_password) {
        $('#msgConfirmPassword').text("Mật khẩu 2 lần nhập không giống nhau!!");
        $('#msgConfirmPassword').select();
        return;
    }



    if (validateEmail(email)) {
        $.ajax({
            url: 'controller/member/check-email-exists.php',
            type: 'get',
            data: { email },
            success: function (count) {
                if (count > 0) {
                    $('#msgEmail').text("Email này đã tồn tại trên hệ thống!");
                    $('#txtEmail').select();
                    return;
                }
            }
        })
    } else {
        if(email.length == 0){
            $('#msgEmail').text("Vui lòng cung cấp email của bạn!!");
            $('#txtEmail').select();
            return;
        }else{
            $('#msgEmail').text("Định dạng email không hợp lệ. Email là chữ không dấu, không chứa khoảng trắng và phải có địa chỉ máy chủ cụ thể, ví dụ: @gmail.com hoặc @yahoo.com!!");
            $('#txtEmail').select();
            return;
        }
       
    }

    if (validatePhoneNumber(phone)) {
        $.ajax({
            url: 'controller/member/check-phone-exists.php',
            type: 'get',
            data: { phone },
            success: function (count) {
                if (count > 0) {
                    $('#msgPhone').text('Số điện thoại này đã được dùng để đăng ký với hệ thống!');
                    $('#txtPhone').select();
                    return;
                }
            }
        })
    } else {
        if(phone.length == 0){
            $('#msgPhone').text('Vui lòng cung cấp số điện thoại của bạn!');
            $('#txtPhone').select();
            return;
        }else{
            $('#msgPhone').text('Số điện thoại không hợp lệ. Số điện thoại gồm 10 chữ số, bắt đầu bằng số 0, không được chứa khoảng trắng!');
            $('#txtPhone').select();
            return;
        }
      
    }

    if(!$('#ckbAgreement').is(':checked')){
        $('#msgAgreement').text('Vui lòng tick vào nút "Tôi đồng ý với quy định đăng ký thành viên" !!');
        return;
    }


    if (JOB && job_id == null) {
        $('.divWarningMsg').slideDown(200);
        $('.divWarningMsg').text('Vui lòng chọn nghề nghiệp!');
        $('.divWarningMsg').delay(3000).slideUp(2000);
        return;
    }


    // if (POSITION) {
    //     $('.divWarningMsg').slideDown(200);
    //     $('.divWarningMsg').text('Vui lòng chọn chức vụ!');
    //     $('.divWarningMsg').delay(3000).slideUp(2000);
    //     return;
    // }

    if (WORKPLACE && workplace_id == null) {
        $('.divWarningMsg').slideDown(200);
        $('.divWarningMsg').text('Vui lòng chọn đơn vị công tác!');
        $('.divWarningMsg').delay(3000).slideUp(2000);
        return;
    }



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
    formData.append("position", position);
    formData.append("workplace_id", workplace_id);
    formData.append("working_unit", workingunit);


    formData.append("cfGender", GENDER ? 1 : 0);
    formData.append("cfBirthdate", BIRTHDATE ? 1 : 0);
    formData.append("cfAddress", ADDRESS ? 1 : 0);
    formData.append("cfJob", JOB ? 1 : 0);
    formData.append("cfPosition", POSITION ? 1 : 0);
    formData.append("cfWorkPlace", WORKPLACE ? 1 : 0);
    formData.append("cfWorkingUnit", WORKINGUNIT ? 1 : 0);



    $.ajax({
        url: 'controller/member/register.php',
        type: 'post',
        data: formData,
        processData: false,
        contentType: false,
        success: function (data) {
            console.log(data);
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
                console.log(data);
                // Swal.fire({
                //     icon: data.icon,
                //     title: data.title,
                //     text: data.content
                // })
            }
        },
        error: function (jqXHR, exception) {
            console.log(jqXHR,exception);
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
                WORKINGUNIT = data.content.filter(x => x.cf_key == 'GET_WORKINGUNIT')[0].cf_value == 1;
                JOB = data.content.filter(x => x.cf_key == 'GET_JOB')[0].cf_value == 1;
                POSITION = data.content.filter(x => x.cf_key == 'GET_POSITION')[0].cf_value == 1;

            }
        }
    })
}






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
    let regex = /^0\d{9}$/;
    return regex.test(phoneNumber);
}

function formatDate(date) {
    let d = date.split('/');
    return `${d[2]}-${d[1]}-${d[0]}`;
}

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

function validateUsername(usr) {
    let regex = /^[^\s!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+$/;
    return regex.test(usr);
}