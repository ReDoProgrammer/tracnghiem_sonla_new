$(function () {
    $.ajax({
        url: 'controller/statistic/top10units.php',
        type: 'get',
        success: function (data) {
            if(data.statusCode == 200){
                let index = 1;
                data.content.forEach(u=>{
                    let tr = `<tr>
                                <td class="text-center" >
                                    ${index++}
                                </td>
                                <td class="fw-bold text-primary">
                                    ${u.workplace}
                                </td>
                                <td class="text-center" >
                                    ${u.candidates.toLocaleString()}
                                </td>
                                <td class="text-center" >
                                ${u.exam_times.toLocaleString()}
                                </td>
                            </tr>`;
                    $('.top10units').append(tr);
                })
                
            }
        }
    })
})