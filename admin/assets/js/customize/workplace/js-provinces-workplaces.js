$(function () {
    $.ajax({
        url: 'controller/workplace/provinces-workplaces.php',
        type: 'get',
        data: { search: '' },
        success: function (data) {
            if (data.statusCode == 200) {
                $('#slUnits').empty();
                data.content.forEach(item => {
                    let opt = `<optgroup label="${item.province}">`;
                    let workplaces = JSON.parse(item.workplaces);
                    workplaces.forEach(w => {
                        opt += `<option value="${w.id}">${w.name}</option>`;
                    })
                    opt += `</optgroup>`;
                    $('#slUnits').append(opt);
                })
                $('#slUnits').selectpicker('refresh');
            }
        }
    })
})