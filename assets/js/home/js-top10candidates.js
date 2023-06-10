
$(function () {
    $.ajax({
        url: 'controller/exam/top10candidates.php',
        type: 'get',
        success: function (data) {
            if (data.statusCode == 200) {
                data.content.forEach(m => {
                    let tr = `<div class="list-item">
                        <p class="date">
                            ${m.exam_date}
                        </p>
                        <p class="title">
                            <a href="javascript:void(0);">
                                ${m.fullname} - <span class="red">${m.mark}/${m.total_marks} (${formatDuration(m.spent_duration)})</span>
                            </a>
                        </p>
                    </div>`;
                    $('.top10candidates').append(tr);
                })
            }
        }
    })
})

function formatDuration(duration) {
    let minutes = Math.floor(duration / 60);
    let seconds = duration % 60;
    return `${minutes < 10 ? '0' + minutes : minutes}:${seconds < 10 ? '0' + seconds : seconds}`;
}