$(function () {
    LoadSiteConfigs();
})

$('#btnUpdateSiteConfigs').click(function () {
    let inputs = $('#site_configs div input').map(function () {
        return {
            id: $(this).data('id'),
            cf_key: $(this).attr('id'),
            cf_value: $(this).val()
        };
    }).get();
    let areas = $('#site_configs div textarea').map(function () {
        return {
            id: $(this).data('id'),
            cf_key: $(this).attr('id'),
            cf_value: $(this).val()
        };
    }).get();
    let configs = $.merge(inputs, areas);
    $.ajax({
        url: 'controller/config/update-array.php',
        type: 'post',
        data: { configs: JSON.stringify(configs) },
        success: function (data) {
            console.log(data)
            Swal.fire({
                position: 'top-end',
                icon: data.icon,
                title: data.title,
                showConfirmButton: false,
                timer: 300
            })
            LoadSiteConfigs();
        },
        error: function (xhr, status, error) {
            console.log('Lỗi cập nhật cấu hình site: ' + error);
        }
    })
})

function LoadSiteConfigs() {
    $.ajax({
        url: 'controller/config/list.php',
        type: 'get',
        data: { mod: 'GLOBAL', fnc: 'BASIC' },
        success: function (data) {
            if (data.statusCode == 200) {
                $('#tblData').empty();
                data.content.forEach(c => {
                    $(`#${c.cf_key.toLowerCase()}`).val(c.cf_value)
                    $(`#${c.cf_key.toLowerCase()}`).attr('data-id', c.id);
                })
            }
        }
    })
}
