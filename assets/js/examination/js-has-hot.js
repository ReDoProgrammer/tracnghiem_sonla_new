$(document).ready(function () {
    $.ajax({
        url: 'controller/exam/has-hot.php',
        type: 'get',
        success: function (data) {
            if (data.statusCode == 200) {
                getFileContent('view/home/components/children/hot-exam.tpl')
                    .then(content => {
                        $('#ex_content').html(content);
                    })
            } else {
                Promise.all([
                    getFileContent('view/home/components/children/slider.tpl'),
                    getFileContent('view/home/components/children/countdown.tpl')
                ])
                    .then(content => {
                        $('#ex_content').html(content[0]);
                        $('#ex_content').append(content[1]);
                    })
            }
        }
    })
})

function getFileContent(url) {
    return new Promise(function (resolve, reject) {
        $.ajax({
            url: url,
            method: 'GET',
            dataType: 'text',
            success: function (data) {
                resolve(data);
            },
            error: function (xhr, status, error) {
                reject(error);
            }
        });
    });
}