var page = 1;
var search = "";
var pageSize = 10;
$(function () {
    $.ajax({
        url: 'controller/exam/history.php',
        type: 'get',
        data: {search,page,pageSize},
        success: function (data) {
            if(data.statusCode == 200){
                let idx = (page-1)*pageSize;
                data.content.forEach(e=>{
                    console.log(e);                   
                    let tr = `<tr id="${e.id}">
                        <td class="text-center">
                            <input type="checkbox" name="selected[]" value="${e.id}">
                        </td>
                        <td class="text-center">${++idx}</td>
                        <td class="text-left fw-bold">${e.exam_code}</td>
                        <td class="text-left fw-bold text-info">${e.title}</td>
                        <td class="text-center">${e.correct}/${e.total}</td>
                        <td class="text-left">${e.exam_date}</td>
                        <td class="text-center">${e.times}</td>                       
                        <td class="text-center">
                            <a href="index.php?module=examination&act=history-detail&id=${e.id}"
                                data-toggle="tooltip" 
                                class="btn btn-primary btn-xs"
                                title="" data-original-title="Xem">
                                <i class="fa fa-eye"></i></a>
                            
                        </td>
                    </tr> `;
                    $('#tblExamHistory').append(tr);

                })
            }
            
        }
    })
})