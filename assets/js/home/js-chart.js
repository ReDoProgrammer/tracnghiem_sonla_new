var arrDistricts = [];
var arrTotalTimes = [];
var arrCandidates = [];

function LoadChart() {
    $.ajax({
        url: 'controller/statistic/statistic-via-province.php',
        type: 'get',
        data: { province_code: $('#slProvinces option:selected').val() },
        success: function (data) {
            if (data.statusCode == 200) {
                if (data.content.length > 0) {
                    $('#e_title').text(data.content[0].title);
                    arrDistricts = data.content.map(x => {
                        let obj = {};
                        obj.code = x.code;
                        obj.district = x.district;
                        return obj;
                    });
                    arrTotalTimes = data.content.map(x => x.total_times);
                    arrCandidates = data.content.map(x => x.candidates);




                    // Vẽ biểu đồ kết hợp
                    var combinedChartCanvas = document.getElementById('combinedChart');
                    var chart = Chart.getChart("combinedChart"); // Lấy biểu đồ hiện tại trên canvas


                    if (chart) {
                        // Cập nhật dữ liệu và cấu hình mới cho biểu đồ
                        chart.data = {
                            labels: arrDistricts.map(function (district) {
                                return district.district;
                            }),
                            datasets: [
                                {
                                    label: 'Số thí sinh tham dự',
                                    data: arrCandidates,
                                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                    borderColor: 'rgba(75, 192, 192, 1)',
                                    borderWidth: 1,
                                    yAxisID: 'candidates-y-axis'
                                },
                                {
                                    label: 'Số lượt thi',
                                    data: arrTotalTimes,
                                    borderColor: 'rgba(255, 99, 132, 1)',
                                    borderWidth: 1,
                                    yAxisID: 'times-y-axis',
                                    type: 'line'
                                }
                            ]
                        };
                        chart.options = {
                            responsive: true,
                            maintainAspectRatio: false,
                            scales: {
                                yAxes: [
                                    {
                                        id: 'candidates-y-axis',
                                        position: 'left',
                                        ticks: {
                                            beginAtZero: true
                                        }
                                    },
                                    {
                                        id: 'times-y-axis',
                                        position: 'right',
                                        ticks: {
                                            beginAtZero: true
                                        }
                                    }
                                ]
                            }
                        };
                        chart.update(); // Cập nhật biểu đồ
                    } else {
                        var combinedChart = new Chart(combinedChartCanvas, {
                            type: 'bar',
                            data: {
                                labels: arrDistricts.map(function (district) {
                                    return district.district;
                                }),
                                datasets: [
                                    {
                                        label: 'Số thí sinh tham dự',
                                        data: arrCandidates,
                                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                        borderColor: 'rgba(75, 192, 192, 1)',
                                        borderWidth: 1,
                                        yAxisID: 'candidates-y-axis'
                                    },
                                    {
                                        label: 'Số lượt thi',
                                        data: arrTotalTimes,
                                        borderColor: 'rgba(255, 99, 132, 1)',
                                        borderWidth: 1,
                                        yAxisID: 'times-y-axis',
                                        type: 'line'
                                    }
                                ]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                scales: {
                                    yAxes: [
                                        {
                                            id: 'candidates-y-axis',
                                            position: 'left',
                                            ticks: {
                                                beginAtZero: true
                                            }
                                        },
                                        {
                                            id: 'times-y-axis',
                                            position: 'right',
                                            ticks: {
                                                beginAtZero: true
                                            }
                                        }
                                    ]
                                }
                            }
                        });
                    }

                    // Bắt sự kiện click vào biểu đồ
                    $(combinedChartCanvas).on('click', function (event) {
                        var activePoints = combinedChart.getElementsAtEventForMode(event, 'nearest', { intersect: true }, true);
                        if (activePoints.length > 0) {
                            var clickedDistrict = arrDistricts[activePoints[0].index];
                            $.ajax({
                                url: 'controller/statistic/statistic-via-district.php',
                                type: 'get',
                                data: { code: clickedDistrict.code },
                                success: function (data) {
                                    if (data.statusCode == 200) {
                                        $('.modal-title').text(`Chi tiết ${clickedDistrict.district}`);
                                        $('#modalChart').modal();
                                        $('#tblStat').empty();
                                        let idx = 1;
                                        data.content.forEach(tr => {
                                            let r = `<tr>
                                                <td>${idx++}</td>
                                                <td class="fw-bold text-primary">${tr.workplace}</td>
                                                <td class="text-right">${tr.candidates}</td>
                                                <td class="text-right">${tr.average_mark}</td>
                                            </tr>`;
                                            $('#tblStat').append(r);
                                        })
                                    }
                                }
                            })
                        }
                    });

                    $('#h2Notice').hide();
                    $('#combinedChart').show();
                } else {
                    $('#combinedChart').hide();
                    $('#h2Notice').show();
                }
            }
        }
    });


}

$(document).ready(function () {
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




});