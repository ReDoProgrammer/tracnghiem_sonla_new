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
                LoadChart();
            }
        }
    })

   
    $('#slProvinces').change(function () {
        LoadChart();
    })
})




var arrDistricts = [];
var arrCandidates = [];
var arrArerage = [];

function LoadChart() {
    $.ajax({
        url: 'controller/statistic/statistic-via-province.php',
        type: 'get',
        data: { province_code: $('#slProvinces option:selected').val() },
        success: function (data) {
            if (data.statusCode == 200) {
                if(data.content.length>0){
                    $('#e_title').text(data.content[0].title);
                    arrDistricts = data.content.map(x => x.district);
                    arrCandidates = data.content.map(x=>x.candidates);
                    arrArerage = data.content.map(x=>x.average_mark);
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
                    var chart = Chart.getChart("combinedChart"); // Lấy biểu đồ hiện tại trên canvas
                    if (chart) {
                        chart.destroy(); // Xóa biểu đồ
                    }
    
                    // Tiếp tục tạo biểu đồ mới trên cùng một canvas
                    var ctx = document.getElementById("combinedChart").getContext("2d");
                    var combinedChart = new Chart(ctx, {
                        type: 'bar',
                        data: data,
                        options: options
                    });
                    $('#h2Notice').hide();
                }else{
                    $('#h2Notice').show();
                }
                
            }
        }
    })

}


