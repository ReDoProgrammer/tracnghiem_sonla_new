$('#btnLogin').click(function () {
    let username = $('#txtUsername').val().trim();
    let password = $('#txtPassword').val().trim();
    if (username.length == 0) {
        $('#msgLoginTitle').text('Chú ý!');
        $('#msgLoginContent').text('Vui lòng nhập tài khoản');
        return;
    }
    if (password.length == 0) {
        $('#msgLoginTitle').text('Chú ý!');
        $('#msgLoginContent').text('Vui lòng nhập mật khẩu');
        return;
    }

    $.ajax({
        url: 'controller/member/login.php',
        type: 'post',
        data: { username, password },
        success: function (msg) {
            if (msg.statusCode == 200) {
                $(location).prop('href', 'index.php?module=home&act=list')
            } else {
                $('#msgLoginTitle').text(msg.title);
                $('#msgLoginContent').text(msg.content);
                return;
            }

        },
        error: function (err) {
            console.log(err);
        }
    })
})

$('#txtPassword').keypress(function (e) {
    if (e.which === 13) {
        $('#btnLogin').click();
    }
})