//load dữ liệu bên ngoài trang chủ
$(document).ready(function () {   
    LoadTop10Exams();
})

function LoadTop10Exams() {
    $.ajax({
        url: 'controller/exam/top10-exams.php',
        type: 'get',
        success: function (exams) {
            exams.forEach(exam => {
                let li = `<li>`
                li += `<div class="timeline-content ${exam.status == -1?'exam-yet':exam.status==0?'examing':'exam-done'}">`
                li += `<div class="timeline-name" title="Xem kết quả"`
                li += `style="white-space: initial; min-height: 100px;">`
                li += exam.title
                li += `</div>`
                li += `<div>`;
                if (exam.thumbnail.trim().length > 0) {
                    li += `<img src="${exam.thumbnail}" class="img-thumbnail" alt="${exam.title}" style="height: 120px; ;width: 100%;">`
                } else {
                    li += `<img src="assets/images/no-thumbnail.jpg" class="img-thumbnail" alt="${exam.title}" style="height: 120px; ;width: 100%;">`
                }
                li += `</div>`;
                li += `<div class="timeline-desc">`
                li += `<p class="time">`
                li += `${exam.begin} - ${exam.end}`
                li += `</p>`

                li += `<p class="status">${exam.status == -1 ? 'Sắp diễn ra' : exam.status == 0 ? 'Đang diễn ra' : 'Đã kết thúc'}</p>`
                li += `</div>`
                li += `</div>`
                li += `</li>`;
                $('#top10-exams').append(li);
            })
        }
    })
}

function ShowBasedOnHotExam(){
    $.ajax({
        url:'controller/exam/show-based-on-hot-exam.php',
        type:'get',
        success:function(data){
            if(data.statusCode == 200){
                $('#hot_exam').show();
                $('#default_exam').hide();

                let exam = data.content;

                $('#hot_exam_banner').attr('src',exam.thumbnail);
                $('#hot_exam_banner').attr('alt',exam.title);
                $('#hot_exam_title').text(exam.title);

                let begin = new Date(exam.begin);
                $('#hot_exam_begin p.time').text(`${begin.getHours()<10?'0'+begin.getHours():begin.getHours()}H${begin.getMinutes()<10?'0'+begin.getMinutes():begin.getMinutes()}`);
                $('#hot_exam_begin p.date').text(`${begin.getDate()<10?'0'+begin.getDate():begin.getDate()}/${begin.getMonth()+1<10?'0'+(begin.getMonth()+1):begin.getMonth()+1}/${begin.getFullYear()}`)
                

                let end = new Date(exam.end);
                $('#hot_exam_end p.time').text(`${end.getHours()<10?'0'+end.getHours():end.getHours()}H${end.getMinutes()<10?'0'+end.getMinutes():end.getMinutes()}`);
                $('#hot_exam_end p.date').text(`${end.getDate()<10?'0'+end.getDate():end.getDate()}/${end.getMonth()+1<10?'0'+(end.getMonth()+1):end.getMonth()+1}/${end.getFullYear()}`)

                $('#do_hot_exam').attr('href',`index.php?module=examination&act=index&id=${exam.id}`)

            }else{
               
                $('#hot_exam').hide();
                $('#default_exam').show();
            }
        }
    })
}