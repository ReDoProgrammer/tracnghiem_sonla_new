$(function () {
    $.ajax({
        url: 'controller/location/provinces.php',
        type: 'get',
        success: function (data) {
            if (data.statusCode == 200) {
                data.content.forEach(p => {
                    $('.slProvinces').append(`<option value="${p.code}">${p.full_name}</option>`);
                })
                $('.slProvinces').trigger('change');
            }
        }
    })

    $(document).on('change', '.slProvinces', function () {
        LoadDistricts();
    })

    $(document).on('change', '.slDistricts', function () {
        LoadWards();
    })

    LoadJobs();
    LoadWorkPlaces();
    LoadPositions();

})

function LoadWorkPlaces(){
    $.ajax({
        url:'controller/workplace/list.php',
        type:'get',
        success:function(data){
            if(data.statusCode == 200){
                data.content.forEach(w=>{
                    $('#slWorkplaces').append(`<option value="${w.id}">${w.name}</option>`);
                })
            }
        }
    })
}
function LoadPositions(){
    $.ajax({
        url:'controller/position/list.php',
        type:'get',
        success:function(data){
            if(data.statusCode == 200){
                data.content.forEach(p=>{
                    $('#slPositions').append(`<option value="${p.id}">${p.name}</option>`);
                })
            }
        }
    })
}

function LoadJobs() {
    $.ajax({
        url: 'controller/job/list.php',
        type: 'get',
        success: function (data) {
            data.forEach(j => {
                $('#slJobs').append(`<option value="${j.id}">${j.name}</option>`)
            })
        }
    })
}

function LoadWards() {
    $.ajax({
        url: 'controller/location/wards.php',
        type: 'get',
        data: { district_code: $('.slDistricts option:selected').val() },
        success: function (data) {
            $('.slWards').empty();
            if (data.statusCode == 200) {
                data.content.forEach(w => {
                    $('.slWards').append(`<option value="${w.code}">${w.full_name}</option>`)
                })
            }
        }
    })
}

function LoadDistricts() {
    $.ajax({
        url: 'controller/location/districts.php',
        type: 'get',
        data: { province_code: $('.slProvinces option:selected').val() },
        success: function (data) {
            $('.slDistricts').empty();
            if (data.statusCode == 200) {
                data.content.forEach(d => {
                    $('.slDistricts').append(`<option value="${d.code}">${d.full_name}</option>`);
                })
                $('.slDistricts').trigger('change');
            }
        }
    })
}