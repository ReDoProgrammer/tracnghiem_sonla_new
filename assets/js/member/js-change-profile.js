var province_code = '';
var district_code = '';
var ward_code = '';

$(async function () {
    await $.ajax({
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



    LoadJobs();
    LoadWorkPlaces();
    LoadPositions();
    LoadMemberDetail();

    $(document).on('change', '.slProvinces', function () {
        LoadDistricts($('#slProvinces option:selected').val());
    })

    $(document).on('change', '.slDistricts', function () {
        LoadWards($('#slDistricts option:selected').val());
    })

  
})

$('#btnSaveChanges').click(function () {
    let user_id = $('#pf_username').data('userid');
    let fullname = $('#pf_fullname').val();
    let birthdate = $('#txtBirthdate').val();
    let gender = $('#rbtM').is(':checked') ? 1 : $('#rbtF').is(':checked') ? 0 : -1;
    let phone = $('#pf_phone').val();
    let email = $('#pf_email').val();
    let province_code = $('#slProvinces option:selected').val();
    let district_code = $('#slDistricts option:selected').val();
    let ward_code = $('#slWards option:selected').val();
    let address = $('#txtAddress').val();
    let job_id = $('#slJobs option:selected').val();
    let workplace_id = $('#slWorkplaces option:selected').val();
    let position_id = $('#slPositions option:selected').val();
    let working_unit = $('#txtWorkingUnit').val();
    console.log({ user_id, fullname, birthdate, gender, phone, email, province_code, district_code, ward_code, address, job_id, workplace_id, position_id, working_unit });
    return;

    if (fullname.trim().length == 0) {
        $.toast({
            heading: "Ràng buộc dữ liệu!!",
            text: "Họ tên không được để trống!!",
            showHideTransition: 'fade',
            icon: data.icon
        })
        return;
    }


    $.ajax({
        url: 'controller/member/update-profile.php',
        type: 'post',
        data: {
            user_id, fullname, birthdate, gender, phone, email, province_code, district_code, ward_code, address,
            job_id, workplace_id, position_id, working_unit
        },
        success: function (data) {
            console.log(data);
            if (data.statusCode == 200) {
                Swal.fire({
                    position: 'top-end',
                    icon: data.icon,
                    title: data.content,
                    showConfirmButton: false,
                    timer: 1500
                })
                window.location.href = "index.php?module=home&act=index";
            } else {
                $.toast({
                    heading: data.title,
                    text: data.content,
                    showHideTransition: 'fade',
                    icon: data.icon
                })
            }
        }
    })
})


function LoadMemberDetail() {
    $.ajax({
        url: 'controller/member/detail.php',
        type: 'get',
        success: async function (data) {
            if (data.statusCode == 200) {
                let p = data.content;
                $('#pf_username').val(p.username);
                $('#pf_username').attr('data-userid', p.id);
                $('#pf_fullname').val(p.fullname);

                if (p.get_birthdate == 1) {
                    $('#txtBirthdate').val(p.mBirthdate);
                }
                if (p.get_gender == 1) {
                    if (p.gender == 1) {
                        $('#rbtM').prop('checked', true);
                    } else if (p.gender == 0) {
                        $('#rbtF').prop('checked', true);
                    } else {
                        $('#rbtN').prop('checked', true);
                    }
                }

                $('#pf_phone').val(p.phone);
                $('#pf_email').val(p.email);

                if (p.get_address == 1) {
                    await $('#slProvinces').val(p.province_code);
                    province_code = p.province_code;
                    district_code = p.district_code;
                    ward_code = p.ward_code;
                    $('#slProvinces').trigger('change');



                }






                $('#slJobs').val(p.job_id);
                $('#slWorkplaces').val(p.workplace_id);
                $('#slPositions').val(p.position_id);
                $('#txtWorkingUnit').val(p.working_unit);
            }
        }
    })
}


function LoadWorkPlaces() {
    $.ajax({
        url: 'controller/workplace/list.php',
        type: 'get',
        success: function (data) {
            if (data.statusCode == 200) {
                data.content.forEach(w => {
                    $('#slWorkplaces').append(`<option value="${w.id}">${w.name}</option>`);
                })
            }
        }
    })
}
function LoadPositions() {
    $.ajax({
        url: 'controller/position/list.php',
        type: 'get',
        success: function (data) {
            if (data.statusCode == 200) {
                data.content.forEach(p => {
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

function LoadWards(district_code) {
    if (typeof district_code != 'undefined') {
        $.ajax({
            url: 'controller/location/wards.php',
            type: 'get',
            data: { district_code },
            success: async function (data) {
                $('.slWards').empty();
                if (data.statusCode == 200) {
                    await data.content.forEach(w => {
                        $('.slWards').append(`<option value="${w.code}">${w.full_name}</option>`)
                    })
                   
                    if ($('#slDistricts option:selected').val() == district_code) {
                        $('.slWards').val(ward_code);
                    }

                }
            }
        })
    }

}

function LoadDistricts(province_code) {
    console.log(district_code)
    if (typeof province_code != 'undefined') {
        $.ajax({
            url: 'controller/location/districts.php',
            type: 'get',
            data: { province_code },
            success:async function (data) {
                $('#slDistricts').empty();
                if (data.statusCode == 200) {
                    await data.content.forEach(d => {
                        $('#slDistricts').append(`<option value="${d.code}">${d.full_name}</option>`);
                    })
                    
                    if ($('#slProvinces option:selected').val() == province_code) {
                        $('#slDistricts').val(district_code);
                    }
                    $('#slDistricts').trigger('change');
                }
            }
        })
    }
}