$(function () {
    $.ajax({
        url: 'controller/location/provinces.php',
        type: 'get',
        success: function (data) {
            if (data.statusCode == 200) {
                let defPro = '';
                data.content.forEach(p => {
                    if (p.default_pro == 1) {
                        defPro = p.code;
                    }
                    $('#slProvinces').append(`<option value="${p.code}">${p.full_name}</option>`);
                })
                $('#slProvinces').val(defPro);
            }
        }
    })
})
var arrDistricts = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6'];
var arrCandidates = [1130, 811, 1112, 1235, 3151, 191];
var arrArerage = [1000, 1500, 1200, 1800, 2000, 1600];
$(document).ready(function () {
    // Tạo dữ liệu mẫu cho biểu đồ
    var data = {
        labels: arrDistricts,
        datasets: [
            {
                type: 'line',
                label: 'Điểm trung bình',
                data: arrArerage,
                fill: false,
                borderColor: 'rgba(75, 192, 192, 1)',
                tension: 0.4
            },
            {
                type: 'bar',
                label: 'Số người tham gia',
                data: arrCandidates,
                backgroundColor: 'rgb(255, 99, 71)'
            }
        ]
    };

    // Thiết lập các tùy chọn cho biểu đồ
    var options = {
        responsive: true,
        plugins: {
            legend: {
                display: false // Ẩn cả hai label "Doanh thu" và "Sản phẩm" trên cùng
            },
            datalabels: {
                display: false // Ẩn giá trị trên các bar
            }
        }
    };

    // Vẽ biểu đồ
    var ctx = document.getElementById('combinedChart').getContext('2d');
    var combinedChart = new Chart(ctx, {
        type: 'bar',
        data: data,
        options: options
    });
});

