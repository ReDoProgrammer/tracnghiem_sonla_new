$(function () {
    $.ajax({
        url: 'controller/exam/top10units.php',
        type: 'get',
        success: function (data) {
            if(data.statusCode == 200){
                let index = 1;
                data.content.forEach(u=>{
                    let tr = `<tr>
                                <td class="text-center" >
                                    ${index++}
                                </td>
                                <td>
                                    ${u.workplace}
                                </td>
                                <td class="text-right" >
                                    ${u.candidates.toLocaleString()}
                                </td>
                                <td class="text-right" >
                                ${u.exam_times.toLocaleString()}
                                </td>
                            </tr>`;
                    $('.top10units').append(tr);
                })
                
            }
        }
    })
})