var page = 1,
    pageSize = 10;

$(function () {
    let dBegin = new Date();
    dBegin.addDays(-10);
    $('#dtpBegin').datetimepicker({
        defaultDate: dBegin,
        format: 'DD/MM/YYYY HH:mm',
    });
    $('#dtpEnd').datetimepicker({
        defaultDate: dBegin,
        format: 'DD/MM/YYYY HH:mm'
    });
    $('#btnSearch').click();
    $("#pagination").on("click", "li a", function (event) {
        event.preventDefault();
        page = $(this).text();
        LoadData();
    });

    $("#ckbMax").change(function () {
        $('#btnSearch').click();
    });
    
})

$('#btnSearch').click(function () {
    page = 1;
    LoadData();
})

$('#btnExportExcel').click(function () {
    $("#tableData").table2excel({
        name: "Sheet1",
        filename: "data",
        fileext: ".xlsx",
        exclude_rows: false,
        exclude_cols: false,
        preserveColors: false
      });
})

function LoadData() {
    let exams = $('#slExams').selectpicker('val');
    let workplaces = $('#slUnits').selectpicker('val');
    let begin = $('#dtpBegin').val();
    let end = $('#dtpEnd').val();
    $.ajax({
        url: 'controller/exam/report-by-exams-and-workplaces.php',
        type: 'get',
        data: {
            exams,
            workplaces,
            page, pageSize,
            max: $('#ckbMax').is(':checked') ? 1 : 0,
            begin: Date2TimeStamp(begin),
            end: Date2TimeStamp(end)
        },
        success: function (data) {
            console.log(data)
            if (data.statusCode == 200) {
                let idx = pageSize != 'All' ? (page - 1) * pageSize : 0;
                $('#tblData').empty();
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
                                <td class="text-nowrap">${t.working_unit}</td>
                                <td class="text-nowrap">${t.get_position == 1 ? t.position : ''}</td>
                                <td class="text-nowrap text-warning fw-bold">${t.exam}</td>
                                <td class="text-center fw-bold text-info">${t.times}</td>
                                <td class="text-center fw-bold text-info">${t.mark}/${t.total_marks}</td>
                                <td class="text-nowrap">${t.exam_date}</td>
                                <td class="text-center fw-bold text-info">${formatDuration(t.spent_duration)}</td>
                               
                    </tr>`;
                    $('#tblData').append(tr);
                })
                $('#pagination').empty();
                if (data.pages > 1) {
                    for (i = 1; i <= data.pages; i++) {
                        $('#pagination').append(`<li class="${page == i ? 'active' : ''}"><a href="#">${i}</a></li>`);
                    }
                }
            }
        }
    })
}
function formatDuration(duration) {
    let minutes = Math.floor(duration / 60);
    let seconds = duration % 60;
    return `${minutes < 10 ? '0' + minutes : minutes}:${seconds < 10 ? '0' + seconds : seconds}`;
}

$('#slPageSize').on('change', function () {
    pageSize = $('#slPageSize option:selected').text();
    $('#btnSearch').click();
})

Date.prototype.addDays = function(days) {
    var date = new Date(this.valueOf());
    date.setDate(date.getDate() + days);
    return date;
}

function Date2TimeStamp(datetime) {
    let arr = datetime.split(' ');
    let part1 = arr[0].split('/');
    let year = part1[2];
    let month = part1[1];
    let day = part1[0];

    let part2 = arr[1].split(':');
    let hour = part2[0];
    let minute = part2[1];

    return `${year}-${month}-${day} ${hour}:${minute}:00`;
}