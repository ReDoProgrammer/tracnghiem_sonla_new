$(document).on('show.bs.modal', '#modalImport', function () {
    $('.error').hide();
    $.ajax({
        url: 'controller/topic/list.php',
        type: 'get',
        data: {
            page: 1,
            pageSize: 'All',
            search: ''
        },
        success: function (data) {
            if (data.statusCode == 200) {
                let topics = data.content;
                $('#slTopicsInImporting').empty();
                topics.forEach(t => {
                    $('#slTopicsInImporting').append(`<option value="${t.id}">${t.name}</option>`);
                })
                $('#slTopicsInImporting').selectpicker('refresh');
            }

        }
    })
});
$('#btnSubmitImport').click(function () {
    let user = $('#userId').data('user');
    let topic_id = $('#slTopicsInImporting option:selected').val();

    $('#exceltable > tbody  > tr').slice(1)// bỏ hàng đầu tiên là hàng tiêu đề
        .each(function (index, tr) {
            if ($(tr).find("input")[0] && $(tr).find('td').length > 2) {// chỉ lấy các dòng câu hỏi đc check và có đáp án
                let count = $(tr).find('td').length;//lấy chiều dài của row (số cột)
                let answer = $(tr).find(`td:eq(${count - 2})`).text();//lấy đáp án đúng của câu hỏi
                let answerIndex = answer == 'A' ? 2 : answer == 'B' ? 3 : answer == 'C' ? 4 : answer == 'D' ? 5 : answer == 'E' ? 6 : 7;

                //lấy nội dung của câu hỏi
                let title = $(tr).find(`td:eq(1)`).text();// bỏ qua chỉ số 0 vì đây là cột stt

                // Lấy các đáp án khả dụng
                let options = [];
                for (i = 2; i < $(tr).find('td').length - 2; i++) {
                    if ($(tr).find(`td:eq(${i})`).text().trim().length > 0) {
                        let option = $(tr).find(`td:eq(${i})`).text();
                        let check = $(tr).find(`td:eq(${i})`).index() == answerIndex ? 1 : 0;
                        options.push({ option, check })
                    }
                }
                $.ajax({
                    url: 'controller/question/create.php',
                    type: 'post',
                    data: {
                        title,
                        options: JSON.stringify(options),
                        topic_id,
                        created_by: user
                    }

                })
            }
        });
    Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: `Import danh sách câu hỏi thành công!`,
        showConfirmButton: false,
        timer: 1000
    })
    $('#modalImport').modal('hide');
    LoadQuestions();
})


$('#excelfile').on("change", function () { ExportToTable(); });

function ExportToTable() {
    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.xlsx|.xls)$/;
    /*Checks whether the file is a valid excel file*/
    if (regex.test($("#excelfile").val().toLowerCase())) {
        var xlsxflag = false; /*Flag for checking whether excel is .xls format or .xlsx format*/
        if ($("#excelfile").val().toLowerCase().indexOf(".xlsx") > 0) {
            xlsxflag = true;
        }
        /*Checks whether the browser supports HTML5*/
        if (typeof (FileReader) != "undefined") {
            var reader = new FileReader();
            reader.onload = function (e) {
                var data = e.target.result;
                /*Converts the excel data in to object*/
                if (xlsxflag) {
                    var workbook = XLSX.read(data, { type: 'binary' });
                }
                else {
                    var workbook = XLS.read(data, { type: 'binary' });
                }
                /*Gets all the sheetnames of excel in to a variable*/
                var sheet_name_list = workbook.SheetNames;

                var cnt = 0; /*This is used for restricting the script to consider only first sheet of excel*/
                sheet_name_list.forEach(function (y) { /*Iterate through all sheets*/
                    /*Convert the cell value to Json*/
                    if (xlsxflag) {
                        var exceljson = XLSX.utils.sheet_to_json(workbook.Sheets[y]);
                    }
                    else {
                        var exceljson = XLS.utils.sheet_to_row_object_array(workbook.Sheets[y]);
                    }
                    if (exceljson.length > 0 && cnt == 0) {
                        BindTable(exceljson, '#exceltable');
                        cnt++;
                    }
                });
                $('#exceltable').show();
            }
            if (xlsxflag) {/*If excel file is .xlsx extension than creates a Array Buffer from excel*/
                reader.readAsArrayBuffer($("#excelfile")[0].files[0]);
            }
            else {
                reader.readAsBinaryString($("#excelfile")[0].files[0]);
            }
        }
        else {
            alert("Sorry! Your browser does not support HTML5!");
        }
    }
    else {
        alert("Please upload a valid Excel file!");
    }
}
function BindTable(jsondata, tableid) {/*Function used to convert the JSON array to Html Table*/
    var columns = BindTableHeader(jsondata, tableid); /*Gets all the column headings of Excel*/
    for (var i = 0; i < jsondata.length; i++) {
        var row$ = $('<tr/>');
        for (var colIndex = 0; colIndex < columns.length; colIndex++) {
            var cellValue = jsondata[i][columns[colIndex]];
            if (cellValue == null)
                cellValue = "";
            row$.append($('<td/>').html(cellValue));
        }
        row$.append($('<td/>').html('<input type="checkbox" checked class="applied"/>'));
        $(tableid).append(row$);
    }
}
function BindTableHeader(jsondata, tableid) {/*Function used to get all column names from JSON and bind the html table header*/
    var columnSet = [];
    var headerTr = $('<tr/>');
    for (var i = 0; i < jsondata.length; i++) {
        var rowHash = jsondata[i];
        for (var key in rowHash) {
            if (rowHash.hasOwnProperty(key)) {
                if ($.inArray(key, columnSet) == -1) {/*Adding each unique column names to a variable array*/
                    columnSet.push(key);
                    headerTr.append($('<th/>').html(key));
                }
            }
        }
    }
    $(tableid).append(headerTr);
    return columnSet;
}