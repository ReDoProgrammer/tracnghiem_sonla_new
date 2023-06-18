$(function () {
    $('#divLoginMsg').hide();
})



$('#btnLoginWithUsernameOrEmail').on('click', function () {

    let username_or_email = $('#txtUsernameOrEmail').val();
    let login_password = $('#txtLoginPassword').val();
    let ip_address = '127.0.0.1';
    // await $.getJSON('https://api.ipify.org?format=json', function (data) {
    //     ip_address = data.ip;
    // });

    if (username_or_email.trim().length == 0) {
        $('#divLoginMsg span').text(`Vui lòng nhập tài khoản hoặc email!`);
        $('#divLoginMsg').slideDown(200).delay(2000).slideUp(2000);
        return;
    }
    if (login_password.trim().length == 0) {
        $('#divLoginMsg span').text(`Mật khẩu không thể để trống!`);
        $('#divLoginMsg').slideDown(200).delay(2000).slideUp(2000);
        return;
    }
   
    $.ajax({
        url: 'controller/member/login.php',
        type: 'post',
        data: { username_or_email, login_password,ip_address },
        success: function (data) {
            console.log(data)
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
        },
        error: function (jqXHR, exception) {
            console.log(jqXHR)
        }
    })
})