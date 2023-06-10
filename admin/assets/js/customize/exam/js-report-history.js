var page = 1,
    pageSize = 10;
$(function () {
    $('#btnSearch').click();
    $(document).on('click', 'a.btnDelete', function (e) {
        e.preventDefault();
        let result_id = $(this).closest('tr').attr('id');
        Swal.fire({
            title: 'Bạn có chắc muốn xóa kết quả bài thi này?',
            showDenyButton: true,
            showCancelButton: false,
            confirmButtonText: 'Xác nhận xóa',
            denyButtonText: `Để tôi suy nghĩ lại!`,
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: 'controller/exam/delete-result.php',
                    type: 'post',
                    data: { result_id },
                    success: function (data) {
                        console.log(data);
                        if (data.statusCode == 200) {
                            Swal.fire({
                                position: 'top-end',
                                icon: data.icon,
                                title: data.title,
                                text: data.content,
                                showConfirmButton: false,
                                timer: 300
                            })
                            console.log(data)
                            LoadHistory();
                        }
                    }
                })
            }
        })
    })
})

$('#btnSearch').click(function () {
    page = 1;
    LoadHistory();
})

function LoadHistory() {
    $.ajax({
        url: 'controller/exam/report-history.php',
        type: 'get',
        data: {
            page,
            pageSize: $('#slPageSize option:selected').text(),
            search: $('#txtSearch').val(),
            exams: $('#slExams').selectpicker('val'),
            workplaces: $('#slUnits').selectpicker('val')
        },
        success: function (data) {
            $('#tblData').empty();
            if (data.statusCode == 200) {
                let idx = pageSize != 'All' ? (page - 1) * pageSize : 0;
                data.content.forEach(t => {
                    let tr = `<tr id = "${t.result_id}">
                                <td>${++idx}</td>
                                <td class="text-nowrap fw-bold text-primary">${t.username}</td>
                                <td class="text-nowrap">${t.fullname}</td>
                                <td class="text-nowrap">${t.gender}</td>
                                <td class="text-nowrap">${t.get_birthdate == 1 ? t.birthdate : ''}</td>
                                <td class="text-nowrap">${t.phone}</td>
                                <td class="text-nowrap">${t.email}</td>
                                <td class="text-nowrap">${t.get_job == 1 ? t.job : ''}</td>
                                <td class="text-nowrap">${t.get_workplace == 1 ? t.workplace : ''}</td>
                                <td class="text-nowrap">${t.get_position == 1 ? t.position : ''}</td>
                                <td class="text-nowrap text-warning fw-bold">${t.exam}</td>
                                <td class="text-center fw-bold text-info">${t.times}</td>
                                <td class="text-center fw-bold text-info">${t.mark}/${t.total_marks}</td>
                                <td class="text-nowrap">${t.exam_date}</td>
                                <td class="text-center fw-bold text-info">${formatDuration(t.spent_duration)}</td>
                                <td class="text-nowrap">
                                    <a href="index.php?module=exam&act=history-detail&id=${t.result_id}&candidate=${t.candidate}"><i class="fa fa-eye text-info"></i></a>
                                    <a href="#" class="btnDelete"><i class="fa fa-trash-o text-danger ml-2"></i></a>
                                </td>
                    </tr>`;
                    $('#tblData').append(tr);
                })
            }
        }
    })
}

function formatDuration(duration) {
    let minutes = Math.floor(duration / 60);
    let seconds = duration % 60;
    return `${minutes<10?'0'+minutes:minutes}:${seconds<10?'0'+seconds:seconds}`;
}

$('#slPageSize').on('change', function () {
    pageSize = $('#slPageSize option:selected').text();
    $('#btnSearch').click();
})