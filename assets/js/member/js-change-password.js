
$('#btnSaveChanges').click(function () {
    $('#msgCurrentPassword').text('');
    $('#msgNewPassword').text('');
    $('#msgConfirmNewPassword').text('');

    let user_id = localStorage.getItem('candidate');
    let currentPassword = $('#txtCurrentPassword').val();
    let newPassword = $('#txtNewPassword').val();
    let confirmNewPassword = $('#txtConfirmNewPassword').val();
    if (validatePassword(currentPassword).length > 0) {
        $('#msgCurrentPassword').text(validatePassword(currentPassword));
        $('#txtCurrentPassword').select();
        return;
    }
    if (validatePassword(newPassword).length > 0) {
        $('#msgNewPassword').text(validatePassword(newPassword));
        $('#txtNewPassword').select();
        return;
    }

    if (validatePassword(confirmNewPassword).length > 0) {
        $('#msgConfirmNewPassword').text(validatePassword(confirmNewPassword));
        $('#txtConfirmNewPassword').select();
        return;
    }

    if (newPassword != confirmNewPassword) {
        $('#msgConfirmNewPassword').text('Mật khẩu mới ở 2 lần nhập không giống nhau!');
        $('#txtConfirmNewPassword').select();
        return;
    }

    $.ajax({
        url: 'controller/member/change-password.php',
        type: 'post',
        data: { user_id, currentPassword, newPassword },
        success: function (data) {
            console.log(data);
            if (data.statusCode == 200) {
                Swal.fire({
                    icon: data.icon,
                    title: 'Successfull!!!',
                    text: data.title,
                }).then(_ => {
                    window.location.href = "index.php?module=home&act=index";
                })
            }
            else {
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