$('#btnSearch').click(function () {
    LoadData();
})

function LoadData() {
    let exams = $('#slExams').selectpicker('val');
    let workplaces = $('#slUnits').selectpicker('val');
    $.ajax({
        url:'controller/exam/load-result-by-exams-and-workplaces.php',
        type:'get',
        data:{
            exams,
            workplaces
        },
        success:function(data){
            console.log(data);
        }
    })
}