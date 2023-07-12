$(function () {
    LoadProvinces();
    $('.slProvinces').on('change', function () {
        LoadDistrictsByPro($(this).val());
    })
    $('.slDistricts').on('change', function () {
        LoadWardsByDist($(this).val())
    })
})


function LoadProvinces() {
    $.ajax({
        url: 'controller/location/provinces.php',
        type: 'get',
        success: function (data) {
            if (data.statusCode == 200) {
                let default_pro = -1;
                data.content.forEach(p => {
                    if (p.default_pro == 1) {
                        default_pro = p.code;
                    }
                    $('.slProvinces').append(`<option value="${p.code}">${p.full_name}</option>`);
                })
                $(`.slProvinces option[value=${default_pro}]`).attr('selected', 'selected');

                if (ADDRESS) {
                    $(`.slProvinces`).trigger('change');
                }
            }


        }
    })
}

function LoadDistrictsByPro(province_code) {
    $.ajax({
        url: 'controller/location/districts.php',
        type: 'get',
        data: { province_code },
        success: function (data) {
            if (data.statusCode == 200) {
                $('.slDistricts').empty();
                data.content.forEach(d => {
                    $('.slDistricts').append(`<option value="${d.code}">${d.full_name}</option>`);
                })
                $(`.slDistricts`).trigger('change');
            }

        }
    })
}

function LoadWardsByDist(district_code) {
    $.ajax({
        url: 'controller/location/wards.php',
        type: 'get',
        data: { district_code },
        success: function (data) {
            if (data.statusCode == 200) {
                $('.slWards').empty();
                data.content.forEach(w => {
                    $('.slWards').append(`<option value="${w.code}">${w.full_name}</option>`);
                })
              
            }

        }
    })
}