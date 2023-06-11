var page = 1,
    pageSize = 10;
$(function () {   
    LoadExams();
    $("#pagination").on("click", "li a", function (event) {
        event.preventDefault();
        page = $(this).text();
        LoadExams();
    });
})

function LoadExams() {
    $.ajax({
        url: 'controller/exam/load-exams.php',
        type: 'get',
        data: { page, pageSize },
        success: function (data) {
            $('#exams_list').empty();
            if (data.statusCode == 200) {
                console.log(data.pages)
                let exams = data.content;

                $('#pagination').empty();
                if (data.pages > 1) {
                    for (i = 1; i <= data.pages; i++) {
                        $('#pagination').append(`<li class="${page == i ? 'active' : ''}"><a href="#">${i}</a></li>`);
                    }
                }

                for (i = 0; i < exams.length; i += 4) {

                    let exam = `<div class="row">`;
                    exam += `<div class="col-xs-24 col-sm-12 col-md-6 col-lg-6">
                                <div class="panel panel-primary exam_item">
                                    <div class="panel-heading text-overflow text-white fw-bold">${exams[i].title}</div>
                                    <div class="panel-body">
                                        <img src="${exams[i].thumbnail}" class="img-thumbnail img-responsive" style="width:100%; height:100px;"/>
                                        <hr />
                                        <div class="row mt-5">
                                            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">Từ ngày:</div>
                                            <div class="col-xs-12 col-sm-12 col-md-15 col-lg-15 fw-bold text-info">${exams[i].begin}</div>
                                        </div>
                                        <div class="row mt-5">
                                            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">Tới ngày:</div>
                                            <div class="col-xs-12 col-sm-12 col-md-15 col-lg-15 fw-bold text-info">${exams[i].end}</div>
                                        </div>
                                    </div>
                                    <div class="panel-footer text-center">
                                        <a href="index.php?module=examination&act=do-exam&id=${exams[i].id}" 
                                            class="btn btn-sm ${exams[i].exam_status == 0?'btn-info':'btn-danger disabled'}">
                                            ${exams[i].exam_status == 1? 'Đã kết thúc':exams[i].exam_status == 0?'Đang diễn ra':'Chưa diễn ra'}
                                        </a>
                                    </div>
                                </div>
                            </div>`;
                        
                    if(i+1<exams.length){
                        exam += `<div class="col-xs-24 col-sm-12 col-md-6 col-lg-6">
                                    <div class="panel panel-primary exam_item">
                                        <div class="panel-heading text-overflow text-white fw-bold">${exams[i+1].title}</div>
                                        <div class="panel-body">
                                            <img src="${exams[i+1].thumbnail}" class="img-thumbnail img-responsive" style="width:100%; height:100px;"/>
                                            <hr />
                                            <div class="row mt-5">
                                                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">Từ ngày:</div>
                                                <div class="col-xs-12 col-sm-12 col-md-15 col-lg-15 fw-bold text-info">${exams[i+1].begin}</div>
                                            </div>
                                            <div class="row mt-5">
                                                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">Tới ngày:</div>
                                                <div class="col-xs-12 col-sm-12 col-md-15 col-lg-15 fw-bold text-info">${exams[i+1].end}</div>
                                            </div>
                                        </div>
                                        <div class="panel-footer text-center">
                                            <a href="index.php?module=examination&act=do-exam&id=${exams[i+1].id}" 
                                                class="btn btn-sm ${exams[i+1].exam_status == 0?'btn-info':'btn-danger disabled'}">
                                                ${exams[i+1].exam_status == 1? 'Đã kết thúc':exams[i+1].exam_status == 0?'Đang diễn ra':'Chưa diễn ra'}
                                            </a>
                                        </div>
                                    </div>
                                </div>`;
                           
                    }

                    if(i+2<exams.length){
                        exam += `<div class="col-xs-24 col-sm-12 col-md-6 col-lg-6">
                                    <div class="panel panel-primary exam_item">
                                        <div class="panel-heading text-overflow text-white fw-bold">${exams[i+2].title}</div>
                                        <div class="panel-body">
                                            <img src="${exams[i+2].thumbnail}" class="img-thumbnail img-responsive" style="width:100%; height:100px;"/>
                                            <hr />
                                            <div class="row mt-5">
                                                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">Từ ngày:</div>
                                                <div class="col-xs-12 col-sm-12 col-md-15 col-lg-15 fw-bold text-info">${exams[i+2].begin}</div>
                                            </div>
                                            <div class="row mt-5">
                                                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">Tới ngày:</div>
                                                <div class="col-xs-12 col-sm-12 col-md-15 col-lg-15 fw-bold text-info">${exams[i+2].end}</div>
                                            </div>
                                        </div>
                                        <div class="panel-footer text-center">
                                            <a href="index.php?module=examination&act=do-exam&id=${exams[i+2].id}" 
                                                class="btn btn-sm ${exams[i+2].exam_status == 0?'btn-info':'btn-danger disabled'}">
                                                ${exams[i+2].exam_status == 1? 'Đã kết thúc':exams[i+2].exam_status == 0?'Đang diễn ra':'Chưa diễn ra'}
                                            </a>
                                        </div>
                                    </div>
                                </div>`;
                           
                    }

                    if(i+3<exams.length){
                        exam += `<div class="col-xs-24 col-sm-12 col-md-6 col-lg-6">
                                    <div class="panel panel-primary exam_item">
                                        <div class="panel-heading text-overflow text-white fw-bold">${exams[i+3].title}</div>
                                        <div class="panel-body">
                                            <img src="${exams[i+3].thumbnail}" class="img-thumbnail img-responsive" style="width:100%; height:100px;"/>
                                            <hr />
                                            <div class="row mt-5">
                                                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">Từ ngày:</div>
                                                <div class="col-xs-12 col-sm-12 col-md-15 col-lg-15 fw-bold text-info">${exams[i+3].begin}</div>
                                            </div>
                                            <div class="row mt-5">
                                                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">Tới ngày:</div>
                                                <div class="col-xs-12 col-sm-12 col-md-15 col-lg-15 fw-bold text-info">${exams[i+3].end}</div>
                                            </div>
                                        </div>
                                        <div class="panel-footer text-center">
                                            <a href="index.php?module=examination&act=do-exam&id=${exams[i+3].id}" 
                                                class="btn btn-sm ${exams[i+3].exam_status == 0?'btn-info':'btn-danger disabled'}">
                                                ${exams[i+3].exam_status == 1? 'Đã kết thúc':exams[i+3].exam_status == 0?'Đang diễn ra':'Chưa diễn ra'}
                                            </a>
                                        </div>
                                    </div>
                                </div>`;
                           
                    }

                    exam+=    `</div>`;

                    $('#exams_list').append(exam);
                }
            }
        }
    })
}

$('#slPageSize').on('change', function () {
    pageSize = $('#slPageSize option:selected').text();
    LoadExams();
})


