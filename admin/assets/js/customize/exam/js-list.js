$(function(){
    $.ajax({
        url:'controller/exam/all.php',
        type:'get',
        success:function(data){
            if(data.statusCode == 200){
                $('#slExams').empty();
                data.content.forEach(ex=>{
                    $('#slExams').append(`<option value="${ex.id}">${ex.title}</option>`);
                })
                $('#slExams').selectpicker('refresh');
            }
        }
    })
})