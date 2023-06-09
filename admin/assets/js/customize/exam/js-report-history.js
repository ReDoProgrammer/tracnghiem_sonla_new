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
    let arr = ($('#slExams').selectpicker('val')).map(x=>parseInt(x));
    console.log(arr);
    return;
    $.ajax({
        url: 'controller/exam/report-history.php',
        type: 'get',
        data: {
            page,
            pageSize: $('#slPageSize option:selected').text(),
            search: $('#txtSearch').val(),
            // exams:JSON.stringify($('#slExams').selectpicker('val')),
            // workplaces:JSON.stringify($('#slUnits').selectpicker('val'))
            exams:$('#slExams').selectpicker('val'),
            workplaces:$('#slUnits').selectpicker('val')
        },
        success: function (data) {
            console.log(data);
        }
    })
}