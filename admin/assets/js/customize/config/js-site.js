$(function () {
    LoadSiteConfigs();
})

function LoadSiteConfigs() {
    $.ajax({
        url: 'controller/config/list.php',
        type: 'get',
        data: { mod: 'GLOBAL', fnc: 'BASIC' },
        success: function (data) {
            console.log(data)
            if (data.statusCode == 200) {
                $('#tblData').empty();
                data.content.forEach(c => {
                   $(`#${c.cf_key.toLowerCase()}`).val(c.cf_value)
                })
            }
        }
    })
}
