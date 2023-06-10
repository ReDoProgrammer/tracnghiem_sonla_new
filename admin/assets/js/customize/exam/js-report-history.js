var page = 1,
    pageSize = 10;
$(function () {
    $('#btnSearch').click();
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
            exams:$('#slExams').selectpicker('val'),
            workplaces:$('#slUnits').selectpicker('val')
        },
        success: function (data) {
            $('#tblData').empty();
            if(data.statusCode == 200){
                let idx = (page-1)*pageSize;
                data.content.forEach(t=>{
                    let tr = `<tr id = "${t.result_id}">
                                <td>${++idx}</td>
                                <td class="text-nowrap fw-bold text-primary">${t.username}</td>
                                <td class="text-nowrap">${t.fullname}</td>
                                <td class="text-nowrap">${t.gender}</td>
                                <td class="text-nowrap">${t.get_birthdate == 1?t.birthdate:''}</td>
                                <td class="text-nowrap">${t.phone}</td>
                                <td class="text-nowrap">${t.email}</td>
                                <td class="text-nowrap">${t.get_job==1?t.job:''}</td>
                                <td class="text-nowrap">${t.get_workplace==1?t.workplace:''}</td>
                                <td class="text-nowrap">${t.get_position==1?t.position:''}</td>
                                <td class="text-nowrap text-warning fw-bold">${t.exam}</td>
                                <td class="text-center fw-bold text-info">${t.times}</td>
                                <td class="text-center fw-bold text-info">${t.mark}/${t.total_marks}</td>
                                <td class="text-nowrap">${t.exam_date}</td>
                                <td class="text-center fw-bold text-info">${formatDuration(t.spent_duration)}</td>
                                <td class="text-nowrap">
                                    <a href="index.php?module=exam&act=history-detail&id=${t.result_id}&candidate=${t.candidate}"><i class="fa fa-eye text-info"></i></a>
                                    <a href="#"><i class="fa fa-trash-o text-danger ml-2"></i></a>
                                </td>
                    </tr>`;
                    $('#tblData').append(tr);
                })
            }
        }
    })
}

function formatDuration(duration){
    return `${Math.floor(duration / 60)}:${duration % 60}`;
}