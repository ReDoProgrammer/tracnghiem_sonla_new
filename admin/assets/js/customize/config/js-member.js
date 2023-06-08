$(function () {
    LoadRegisterConfigs();
})

function LoadRegisterConfigs() {
    $.ajax({
        url: 'controller/config/list.php',
        type: 'get',
        data: { mod: 'MEMBER', fnc: 'REGISTER' },
        success: function (data) {
            if (data.statusCode == 200) {
                $('#tblData').empty();
                data.content.forEach(c => {
                    let tr = `<tr id="${c.id}">
                                <td class="fw-bold text-warning">${c.cf_title}</td>
                                <td>
                                    <input type="checkbox" ${c.cf_value == 1 ? 'checked' : ''}> <span class="text-info">${c.cf_value == 1?'Kích hoạt':'Không kích hoạt'}</span></label>
                                </td>
                            </tr>`;
                    $('#tblData').append(tr);
                })
            }
        }
    })
}

$(document).on('change', 'tr td input[type="checkbox"]', function () {
    let id = $(this).closest('tr').attr('id');
    let state = this.checked?1:0;  

    $.ajax({
        url: 'controller/config/change-state.php',
        type: 'post',
        data: { id,state },
        success: function (data) {
            if (data.statusCode == 200) {
                Swal.fire({
                    position: 'top-end',
                    icon: data.icon,
                    title: data.title,
                    showConfirmButton: false,
                    timer: 500
                })
                LoadRegisterConfigs();
            }
        }
    })
})