<?php include('view/template/common/header.tpl'); ?>

<?php include('view/template/common/left.tpl'); ?>

        <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Trang chủ
            <small>Bảng điều khiển</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Trang Chủ</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
        <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-newspaper-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Tổng số tin bài</span>
              <span class="info-box-number"><?php echo $tinbai;?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
        <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-book"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Tổng số văn bản</span>
              <span class="info-box-number"><?php echo $vanban1;?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
        <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-file-video-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Tổng số Video - Clip</span>
              <span class="info-box-number"><?php echo $quayphim1;?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
         <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-file-photo-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Tổng số Album ảnh</span>
              <span class="info-box-number"><?php echo $album1;?></span>
            </div>
            <!-- /.info-box-content -->
          </div>
        </div>
        <!-- ./col -->
		
      </div>
      <!-- /.row -->
	  <script>
	  $(function () {

  'use strict';

  /* ChartJS
   * -------
   * Here we will create a few charts using ChartJS
   */

  //-----------------------
  //- MONTHLY SALES CHART -
  //-----------------------

  // Get context with jQuery - using jQuery's .get() method.
  var salesChartCanvas = $("#salesChart").get(0).getContext("2d");
  // This will get the first returned node in the jQuery collection.
  var salesChart = new Chart(salesChartCanvas);

  var salesChartData = {
    labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "TTháng 10", "Tháng 11", "Tháng 12" ],
    datasets: [
     
      {
        label: "Digital Goods",
        fillColor: "rgba(60,141,188,0.9)",
        strokeColor: "rgba(60,141,188,0.8)",
        pointColor: "#3b8bba",
        pointStrokeColor: "rgba(60,141,188,1)",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(60,141,188,1)",
        data: [<?php echo $phuyen ;?>, <?php echo $bacyen ;?>, <?php echo $maison ;?>, <?php echo $yenchau ;?>, <?php echo $mocchau ;?>, <?php echo $vanho1 ;?>, <?php echo $sopcop ;?>, <?php echo $songma ;?>, <?php echo $muongla ;?>, <?php echo $thuanchau ;?>, <?php echo $quynhnhai ;?>, 30, ]
      }
    ]
  };

  var salesChartOptions = {
    //Boolean - If we should show the scale at all
    showScale: true,
    //Boolean - Whether grid lines are shown across the chart
    scaleShowGridLines: false,
    //String - Colour of the grid lines
    scaleGridLineColor: "rgba(0,0,0,.05)",
    //Number - Width of the grid lines
    scaleGridLineWidth: 1,
    //Boolean - Whether to show horizontal lines (except X axis)
    scaleShowHorizontalLines: true,
    //Boolean - Whether to show vertical lines (except Y axis)
    scaleShowVerticalLines: true,
    //Boolean - Whether the line is curved between points
    bezierCurve: true,
    //Number - Tension of the bezier curve between points
    bezierCurveTension: 0.3,
    //Boolean - Whether to show a dot for each point
    pointDot: false,
    //Number - Radius of each point dot in pixels
    pointDotRadius: 4,
    //Number - Pixel width of point dot stroke
    pointDotStrokeWidth: 1,
    //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
    pointHitDetectionRadius: 20,
    //Boolean - Whether to show a stroke for datasets
    datasetStroke: true,
    //Number - Pixel width of dataset stroke
    datasetStrokeWidth: 2,
    //Boolean - Whether to fill the dataset with a color
    datasetFill: true,
    //String - A legend template
    legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].lineColor%>\"></span><%=datasets[i].label%></li><%}%></ul>",
    //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
    maintainAspectRatio: true,
    //Boolean - whether to make the chart responsive to window resizing
    responsive: true
  };

  //Create the line chart
  salesChart.Line(salesChartData, salesChartOptions);

  //---------------------------
  //- END MONTHLY SALES CHART -
  //---------------------------

  //-------------
  //- PIE CHART -
  //-------------
  // Get context with jQuery - using jQuery's .get() method.
  var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
  var pieChart = new Chart(pieChartCanvas);
  var PieData = [
    {
	 label: "Số câu hỏi",
      value: 4,
      color: "#f56954",
      highlight: "#f56954"
      
    },
    {
      value: <?php echo $traloi2 ;?>,
      color: "#f39c12",
      highlight: "#f39c12",
      label: "Câu trả lời"
    }

  ];
  var pieOptions = {
    //Boolean - Whether we should show a stroke on each segment
    segmentShowStroke: true,
    //String - The colour of each segment stroke
    segmentStrokeColor: "#fff",
    //Number - The width of each segment stroke
    segmentStrokeWidth: 1,
    //Number - The percentage of the chart that we cut out of the middle
    percentageInnerCutout: 50, // This is 0 for Pie charts
    //Number - Amount of animation steps
    animationSteps: 100,
    //String - Animation easing effect
    animationEasing: "easeOutBounce",
    //Boolean - Whether we animate the rotation of the Doughnut
    animateRotate: true,
    //Boolean - Whether we animate scaling the Doughnut from the centre
    animateScale: false,
    //Boolean - whether to make the chart responsive to window resizing
    responsive: true,
    // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
    maintainAspectRatio: false,
    //String - A legend template
    legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>",
    //String - A tooltip template
    tooltipTemplate: "<%=label%> <%=value %> Người"
  };
  //Create pie or douhnut chart
  // You can switch between pie and douhnut using the method below.
  pieChart.Doughnut(PieData, pieOptions);
  //-----------------
  //- END PIE CHART -
  //-----------------
  
  

  /* jVector Maps
   * ------------
   * Create a world map with markers
   */

  /* jVector Maps
   * ------------
   * Create a world map with markers
   */
  $('#world-map-markers').vectorMap({
    map: 'world_mill_en',
    normalizeFunction: 'polynomial',
    hoverOpacity: 0.7,
    hoverColor: false,
    backgroundColor: 'transparent',
    regionStyle: {
      initial: {
        fill: 'rgba(210, 214, 222, 1)',
        "fill-opacity": 1,
        stroke: 'none',
        "stroke-width": 0,
        "stroke-opacity": 1
      },
      hover: {
        "fill-opacity": 0.7,
        cursor: 'pointer'
      },
      selected: {
        fill: 'yellow'
      },
      selectedHover: {}
    },
    markerStyle: {
      initial: {
        fill: '#00a65a',
        stroke: '#111'
      }
    },
    markers: [
      {latLng: [41.90, 12.45], name: 'Vatican City'},
      {latLng: [43.73, 7.41], name: 'Monaco'},
      {latLng: [-0.52, 166.93], name: 'Nauru'},
      {latLng: [-8.51, 179.21], name: 'Tuvalu'},
      {latLng: [43.93, 12.46], name: 'San Marino'},
      {latLng: [47.14, 9.52], name: 'Liechtenstein'},
      {latLng: [7.11, 171.06], name: 'Marshall Islands'},
      {latLng: [17.3, -62.73], name: 'Saint Kitts and Nevis'},
      {latLng: [3.2, 73.22], name: 'Maldives'},
      {latLng: [35.88, 14.5], name: 'Malta'},
      {latLng: [12.05, -61.75], name: 'Grenada'},
      {latLng: [13.16, -61.23], name: 'Saint Vincent and the Grenadines'},
      {latLng: [13.16, -59.55], name: 'Barbados'},
      {latLng: [17.11, -61.85], name: 'Antigua and Barbuda'},
      {latLng: [-4.61, 55.45], name: 'Seychelles'},
      {latLng: [7.35, 134.46], name: 'Palau'},
      {latLng: [42.5, 1.51], name: 'Andorra'},
      {latLng: [14.01, -60.98], name: 'Saint Lucia'},
      {latLng: [6.91, 158.18], name: 'Federated States of Micronesia'},
      {latLng: [1.3, 103.8], name: 'Singapore'},
      {latLng: [1.46, 173.03], name: 'Kiribati'},
      {latLng: [-21.13, -175.2], name: 'Tonga'},
      {latLng: [15.3, -61.38], name: 'Dominica'},
      {latLng: [-20.2, 57.5], name: 'Mauritius'},
      {latLng: [26.02, 50.55], name: 'Bahrain'},
      {latLng: [0.33, 6.73], name: 'São Tomé and Príncipe'}
    ]
  });

  /* SPARKLINE CHARTS
   * ----------------
   * Create a inline charts with spark line
   */

  //-----------------
  //- SPARKLINE BAR -
  //-----------------
  $('.sparkbar').each(function () {
    var $this = $(this);
    $this.sparkline('html', {
      type: 'bar',
      height: $this.data('height') ? $this.data('height') : '30',
      barColor: $this.data('color')
    });
  });

  //-----------------
  //- SPARKLINE PIE -
  //-----------------
  $('.sparkpie').each(function () {
    var $this = $(this);
    $this.sparkline('html', {
      type: 'pie',
      height: $this.data('height') ? $this.data('height') : '90',
      sliceColors: $this.data('color')
    });
  });

  //------------------
  //- SPARKLINE LINE -
  //------------------
  $('.sparkline').each(function () {
    var $this = $(this);
    $this.sparkline('html', {
      type: 'line',
      height: $this.data('height') ? $this.data('height') : '90',
      width: '100%',
      lineColor: $this.data('linecolor'),
      fillColor: $this.data('fillcolor'),
      spotColor: $this.data('spotcolor')
    });
  });
});
</script>

          <div class="row">
            <div class="col-md-12">
              <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">Biểu đồ thống kê</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <div class="btn-group">
                      <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                      </ul>
                    </div>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <div class="row">
                    <div class="col-md-9">
                      <p class="text-center">
                        <strong>Thống kế số tin bài theo tháng</strong>
                      </p>
                      <div class="chart">
                        <!-- Sales Chart Canvas -->
                        <canvas id="salesChart" style="height: 180px;"></canvas>
                      </div><!-- /.chart-responsive -->
                    </div><!-- /.col -->
                    <div class="col-md-3">
                     <p class="text-center">
                        <strong>Thống kê truy cập</strong>
                      </p>
                      <div class="progress-group">
                        <span class="progress-text">Tổng số bài giới thiệu</span>
                        <span class="progress-number"><b><?php echo $about2;?></b>/200</span>
                        <div class="progress sm">
                          <div class="progress-bar progress-bar-aqua" style="width: 4%"></div>
                        </div>
                      </div><!-- /.progress-group -->
                      <div class="progress-group">
                        <span class="progress-text">Tổng số thông báo</span>
                        <span class="progress-number"><b><?php echo $thongbao2;?></b>/200</span>
                        <div class="progress sm">
                          <div class="progress-bar progress-bar-red" style="width: 1%"></div>
                        </div>
                      </div><!-- /.progress-group -->
                      <div class="progress-group">
                        <span class="progress-text">Tin cộng tác viên</span>
                        <span class="progress-number"><b><?php echo $bbt2;?></b>/200</span>
                        <div class="progress sm">
                          <div class="progress-bar progress-bar-green" style="width: 3%"></div>
                        </div>
                      </div><!-- /.progress-group -->
                      <div class="progress-group">
                        <span class="progress-text">Bản tin công tác mặt trận</span>
                        <span class="progress-number"><b><?php echo $news2; ?></b></span>
                        <div class="progress sm">
                          <div class="progress-bar progress-bar-yellow" style="width: 5%"></div>
                        </div>
                      </div><!-- /.progress-group -->
                    </div><!-- /.col -->
                  </div><!-- /.row -->
                </div><!-- ./box-body -->




<div class="box-footer">
              <div class="row">
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block border-right">
                    <h5 class="description-percentage text-green"><i class="fa fa-male"></i> <?php echo $day_value; ?></h5>
      
                    <span class="description-text">Thống kê hôm nay</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block border-right">
                    <h5 class="description-percentage text-yellow"><i class="fa fa-male"></i> <?php echo $yesterday_value; ?></h5>
                 
                    <span class="description-text">Truy cập hôm qua</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block border-right">
                 

<h5 class="description-percentage text-green"><i class="fa fa-male"></i> <?php echo $week_value; ?></h5>
             
                   <span class="description-text">Truy cập trong tuần</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 col-xs-6">
                  <div class="description-block">
                    <h5 class="description-percentage text-red"><i class="fa fa-male"></i> <?php echo $all_value; ?></h5>
    
                    <span class="description-text">Tổng số người truy cập</span>
                  </div>
                  <!-- /.description-block -->
                </div>
              </div>
              <!-- /.row -->
            </div>

     
	 
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->

          <!-- Main row -->
          <div class="row">
            <!-- Left col -->
            <div class="col-md-8">
              <!-- MAP & BOX PANE -->
           
            
        
                 
					 
				  <!-- Custom tabs (Charts with tabs)-->
              <div class="nav-tabs-custom">
                <!-- Tabs within a box -->
                <ul class="nav nav-tabs pull-right">
                  <li class="active"><a href="#revenue-chart" data-toggle="tab">Ban biên tập</a></li>
                  <li><a href="#sales-chart" data-toggle="tab">Hỏi đáp</a></li>
                  <li class="pull-left header"><i class="fa fa-inbox"></i> Nội dung mới cập nhật</li>
                </ul>
                <div class="tab-content no-padding">
                  <!-- Morris chart - Sales -->
                  <div class="chart tab-pane active" id="revenue-chart" style="">
			

 <table class="table table-bordered table-striped table-hover" style="margin-bottom: 0;">
    <thead>
        <tr>
		
           
			<th class="text-center" style="padding-top: 20px;padding-bottom: 20px; width:20px">
                ID
            </th>
            <th class="text-center">
                Họ Tên
            </th>
            <th class="text-center">
              Tiêu đề
            </th>
 	<th class="text-center">
              Thời gian
            </th>
<th class="text-center">
              Thao tác
            </th>
            
        </tr>
    </thead>
    <tbody>

          <?php foreach ($list_bbt1 as $bbt) { ?>         
<tr>


                   
<td class="text-center" style="width: 5%"> <?php echo $bbt['id_bbt']; ?> </td>
<td style="width: 17%"> <?php echo $bbt['ho_ten']; ?> </td>
<td class="text-center" style="width: 45%;"> <?php echo $bbt['tieu_de']; ?> </td>
<td style="width: 20%"> <?php echo substr($bbt['time'],0,19); ?> </td>
<td class="text-center" style="width: 8%">  [	<a href="index.php?module=bbt&act=<?php echo "view";?>&id=<?php echo $bbt['id_bbt']; ?>"><i class="fa fa-file" aria-hidden="true"></i> </a> ] </td>

</tr>

   <?php } ?>
        
       

    </tbody>
</table>

			  
				  
				  </div>
                  <div class="chart tab-pane" id="sales-chart" style="position: relative;">


  <div class="table-responsive">
 <table class="table table-bordered table-striped table-hover" style="margin-bottom: 0;">
    <thead>
        <tr>
		
            <th class="text-center" style="padding-top: 20px;padding-bottom: 20px">
               ID
            </th>
            <th class="text-center">
               Họ tên
            </th>
           
            <th class="text-center">
                Nội dung
            </th>
           
         
			  <th class="text-center">
              Bởi
            </th>
			
			 <th class="text-center">
               Thao Tác
            </th>
        </tr>
    </thead>
    <tbody>

          <?php foreach ($list_thu_ly as $thuly) { ?>         
<tr>


<td class="text-center" style="width: 2%;">  
					<?php $a = $a+1; ?>
							<span> <?php echo $thuly['tin_id'];?>  </span>
					<?php  ?></td>
<td style="width: 30%">  <?php echo $thuly['ho_ten']; ?> </td>
<td style=""> <?php echo $thuly['hanh_dong']; ?> </td>
<td class="text-center" style="width: 15%;"> <?php echo $thuly['tai_khoan']; ?> </td>

 <td class="text-center" style="white-space:nowrap; width: 10%;">
                     						 [	<a href="index.php?module=thongtin&act=<?php echo "view";?>&id=<?php echo $thuly['tin_id']; ?>"><i class="fa fa-file" aria-hidden="true"></i> </a> ]
                </td>

</tr>

   <?php } ?>
        
       

    </tbody>
</table>
</div>
</div>
				  
				
                </div>


              </div><!-- /.nav-tabs-custom -->
				 
				 
				 
				  <div class="row">
                <div class="col-md-6">
                  <!-- DIRECT CHAT -->
                  <div class="box box-warning direct-chat direct-chat-warning">
                    <div class="box-header with-border">
                      <h3 class="box-title">Thống kê website</h3>
                      <div class="box-tools pull-right">
                     
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                       
                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                      </div>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                      <!-- Conversations are loaded here -->
                      <div class="direct-chat-messages">
                        <!-- Message. Default to the left -->
                      
    <div class="col-md-7">
                      <div class="chart-responsive">
                        <canvas id="pieChart1" height="150"></canvas>
                      </div><!-- ./chart-responsive -->
                    </div><!-- /.col -->
                    <div class="col-md-5">
                      <ul class="chart-legend clearfix">
                        <li><i class="fa fa-circle-o text-aqua"></i> Tin bài</li>
                        <li><i class="fa fa-circle-o text-yellow"></i> Văn bản</li>
                        <li><i class="fa fa-circle-o text-green"></i> Hỏi đáp</li>
                        <li><i class="fa fa-circle-o text-red"></i> Thành viên</li>
						 <li><i class="fa fa-circle-o light-blue"></i> Thông báo</li>
						
						
                      </ul>
                    </div><!-- /.col -->
                    
                       <Script>
		   // Get context with jQuery - using jQuery's .get() method.
  var pieChartCanvas = $("#pieChart1").get(0).getContext("2d");
  var pieChart = new Chart(pieChartCanvas);
  var PieData = [
    {
	 label: "Tổng số tin",
      value: <?php echo $tinbai;?>,
      color: "#00c0ef",
      highlight: "#00c0ef"
      
    },
    {
      value: <?php echo $vanban1;?>,
      color: "#f39c12",
      highlight: "#f39c12",
      label: "Tổng số văn bản"
    },
    {
      value: <?php echo $hoi2;?>,
      color: "#00a65a",
      highlight: "#00a65a",
      label: "Tổng số hỏi đáp"
    },
    {
      value: <?php echo $member4;?>,
      color: "#dd4b39",
      highlight: "#dd4b39",
      label: "Tổng số thành viên"
    },
	{
      value: <?php echo $thongbao2;?>,
      color: "#000000",
      highlight: "#000000",
      label: "Thông báo"
    }
	

  ];
  var pieOptions = {
    //Boolean - Whether we should show a stroke on each segment
    segmentShowStroke: true,
    //String - The colour of each segment stroke
    segmentStrokeColor: "#fff",
    //Number - The width of each segment stroke
    segmentStrokeWidth: 1,
    //Number - The percentage of the chart that we cut out of the middle
    percentageInnerCutout: 50, // This is 0 for Pie charts
    //Number - Amount of animation steps
    animationSteps: 100,
    //String - Animation easing effect
    animationEasing: "easeOutBounce",
    //Boolean - Whether we animate the rotation of the Doughnut
    animateRotate: true,
    //Boolean - Whether we animate scaling the Doughnut from the centre
    animateScale: false,
    //Boolean - whether to make the chart responsive to window resizing
    responsive: true,
    // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
    maintainAspectRatio: false,
    //String - A legend template
    legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>",
    //String - A tooltip template
    tooltipTemplate: "<%=label%> <%=value %>"
  };
  //Create pie or douhnut chart
  // You can switch between pie and douhnut using the method below.
  pieChart.Doughnut(PieData, pieOptions);
  //-----------------
  //- END PIE CHART -
  //-----------------
		  </script>
                   

                      </div><!--/.direct-chat-messages-->

                      <div class="box-footer text-center">
                      <a href="javascript::" class="uppercase">Xem tất cả</a>
                    </div><!-- /.box-footer -->
                    </div><!-- /.box-body -->
             
                  </div><!--/.direct-chat -->
                </div><!-- /.col -->

                <div class="col-md-6">
                  <!-- USERS LIST -->
                  <div class="box box-danger">
                    <div class="box-header with-border">
                      <h3 class="box-title">Quản trị viên</h3>
                      <div class="box-tools pull-right">
                       
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                      </div>
                    </div><!-- /.box-header -->
                    <div class="box-body no-padding">
                      <ul class="users-list clearfix">
					   <?php foreach ($list_member4 as $member) { ?> 
                        <li>
                          <img src="assets/images/no-vata.png" alt="User Image">
                          <a class="users-list-name" href="#"><?php echo $member['tai_khoan'];?></a>
                          <span class="users-list-date">Today</span>
                        </li>
						<?php } ?>
                       
                      </ul><!-- /.users-list -->
                    </div><!-- /.box-body -->
                    <div class="box-footer text-center">
                      <a href="javascript::" class="uppercase">Xem tất cả</a>
                    </div><!-- /.box-footer -->
                  </div><!--/.box -->
                </div><!-- /.col -->
              </div><!-- /.row -->
              
            
            
			
			

       
            </div><!-- /.col -->
       <!-- TABLE: LATEST ORDERS -->

            <div class="col-md-4">
              <!-- Info Boxes Style 2 -->
              <div class="info-box bg-yellow">
                <span class="info-box-icon"><i class="ion ion-ios-pricetag-outline"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Tổng số thành viên quản trị</span>
                  <span class="info-box-number"><?php echo $member4 ;?></span>
                 
                 
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
              <div class="info-box bg-green">
                <span class="info-box-icon"><i class="ion ion-ios-heart-outline"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Tổng danh mục tin tức</span>
                  <span class="info-box-number"><?php echo $dmnews2 ;?></span>
                 
                 
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
              <div class="info-box bg-red">
                <span class="info-box-icon"><i class="ion ion-ios-cloud-download-outline"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Quảng cáo trên Website</span>
                  <span class="info-box-number"><?php echo $adv2 ;?></span>
                  <div class="progress">
                    <div class="progress-bar" style="width: 70%"></div>
                  </div>
				  <!--
                  <span class="progress-description">
                    70% Increase in 30 Days
                  </span>-->
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
              <div class="info-box bg-aqua">
                <span class="info-box-icon"><i class="ion-ios-chatbubble-outline"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Tổng số liên hệ</span>
                  <span class="info-box-number"><?php echo $lienhe1 ;?></span>
                  <div class="progress">
                    <div class="progress-bar" style="width: 40%"></div>
                  </div>
                 <!-- <span class="progress-description">
                    40% Increase in 30 Days
                  </span>-->
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->

              <div class="box box-default">
                <div class="box-header with-border">
                  <h3 class="box-title">Ý KIẾN NGƯỜI DÂN</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body" >
                  <div class="row">
                    <div class="col-md-8">
                      <div class="chart-responsive">
                        <canvas id="pieChart" height="150"></canvas>
                      </div><!-- ./chart-responsive -->
                    </div><!-- /.col -->
                  
                  </div><!-- /.row -->
                </div><!-- /.box-body -->
                <div class="box-footer no-padding">
                  <ul class="nav nav-pills nav-stacked">
                    <li><a href="#">Tổng số ý kiến người dân <span class="pull-right text-red"><i class="fa fad fa-users"></i> <?php echo $hoi2 ;?></span></a></li>
                    <li><a href="#">Tổng số câu trả lời <span class="pull-right text-yellow"><i class="fa fa-check-square"></i> <?php echo $traloi2 ;?></span></a></li>
                 
                  </ul>
                </div><!-- /.footer -->
              </div><!-- /.box -->
            </div><!-- /.col -->			
          </div><!-- /.row -->
		  
		
		  
		  
		  
		    <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Nhật ký hệ thống</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <div class="table-responsive">
                    <table class="table no-margin">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>ID User</th>
                          <th>Tài khoản</th>
                          <th>Hành động</th>
						   <th>Thời gian</th>
						   <th>Khu vực</th>
						    <th>Nên tảng</th>
						   <th>IP</th>
                        </tr>
                      </thead>
                      <tbody>
					  <?php foreach ($list_nkht as $nkht) { ?> 
                        <tr>
                          <td><a href=""><?php echo $nkht['id'];?></a></td>
                          <td><?php echo $nkht['user_id'];?></td>
                          <td><span class="label label-success"><?php echo $nkht['user_name'];?></span></td>
                          <td><div class="sparkbar" data-color="#00a65a" data-height="20"><?php echo $nkht['user_action'];?></div></td>
						   <td><div class="sparkbar" data-color="#00a65a" data-height="20"> <?php echo $nkht['action_time']; ?>	 </div></td>
		     <td><div class="sparkbar" data-color="#00a65a" data-height="20"><?php echo $nkht['action'];?></div></td>
			 <td><div class="sparkbar" data-color="#00a65a" data-height="20"><?php echo $nkht['agent'];?></div></td>
						    <td><div class="sparkbar" data-color="#00a65a" data-height="20"><?php echo $nkht['action_ip'];?></div></td>
                        </tr>
						<?php } ?>
                       
                      </tbody>
                    </table>
                  </div><!-- /.table-responsive -->
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
                  <a href="javascript::;" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a>
                  <a href="javascript::;" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a>
                </div><!-- /.box-footer -->
              </div><!-- /.box -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->


 


<?php include('view/template/common/footer.tpl'); ?>