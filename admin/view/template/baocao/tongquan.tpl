<?php include('view/template/common/header.tpl'); ?>
<?php include('view/template/common/left.tpl'); ?>
 <div class="content-wrapper" style="clear: both; min-height: 864px;" id="content">
            <section class="content-header">
                
    <h1 style="font-size: 20px; font-family: Roboto Condensed">
        Báo Cáo Thống Kê
    </h1>
    <ol class="breadcrumb">
        <li><a href="index.php?module=cts&act=list">Thông Tin</a></li>
        <li class="active"> 
	
	
	</li>
    </ol>

            </section>
						
			
			<section class="content">
<div class="box box-primary">
<div class="box-header with-border">
<h3 class="box-title">THÔNG TIN THỐNG KÊ</h3>
</div>
<div class="row">
<div class="col-xs-12">

 <form action="" method="post" enctype="multipart/form-data" id="form">
<div class="box-header">
<div class="row">
<div class="col-md-3">
<label>Tổ Chức - Cá Nhân: </label>
<div class="input-group" style="width:100%">
                                        <select name="tochuc_canhan_id" class="form-control">
										
						<option value=""><?php echo "Lựa chọn"; ?></option>
						
						      <?php if($_SESSION['canhantochuc']=='1'){ ?>
          <option value="1" selected="selected"><?php echo "Cá Nhân"; ?></option>
          <?php } else { ?>
          <option value="1"><?php echo "Cá Nhân"; ?></option>
          <?php } ?>
          <?php if($_SESSION['canhantochuc']=='2'){ ?>
          <option value="2" selected="selected"><?php echo "Tổ Chức"; ?></option>
          <?php } else { ?>
          <option value="2"><?php echo "Tổ Chức"; ?></option>
          <?php } ?> 
							
										</select>
				 				
                                        
                                    </div>

</div>
<div class="col-md-2">
<label>Tạo từ ngày: </label>
<input id="datepicker" class="form-control date ng-pristine ng-untouched ng-valid ng-not-empty" type ="text" name ="startday" value="<?php echo  $_SESSION['startday'];?>"/>

</div>
<div class="col-md-2">
<label>Tạo đến ngày: </label>
<input id="datepicker1" class="form-control date ng-pristine ng-untouched ng-valid ng-not-empty" type="text" name="endday" value="<?php echo  $_SESSION['endday'];?>"/>


</div>



<div class="col-md-4" style="padding-top: 7px;">
<br>
<button class="btn btn-sm btn-primary btn-flat" type="submit" name="tim_kiem">
<i class="fa fa-bar-chart"></i>
 Thống kê
</button>

 <a onclick="location = '<?php echo $link_export_w;?>'" class="btn btn-sm btn-primary btn-flat">
<i class="fa fa-file-word-o"></i>&nbsp;&nbsp;Xuất word</a>


<button class="btn btn-sm btn-primary btn-flat" onclick="javascript:window.print();" value="In">
<i class="fa fa-print"></i>
 In
</button>
</div>
</div>
<div class="example-modal">
<div id="popUpWait" class="modal"> </div>
</div>
</div>
 </form>


<div id="noidungin" class="box-body table-responsive no-padding">
<h3 style="text-align:center;">BÁO CÁO TÌNH HÌNH XỬ LÝ CHỨNG THƯ SỐ</h3>
<h5 class="ng-binding" style="text-align:center; font-weight:normal;margin-top: -10px;">
Thời điểm xuất báo cáo 

<?php echo $today = date("d-m-Y H:i:s");  ?>
<br>
(Từ ngày <?php echo  $_SESSION['startday'];?> đến ngày <?php echo  $_SESSION['endday'];?>)
</h5>
<table id="bc_vbnb" cellpadding="10" border="1" style="border: 1px solid black;border-collapse: collapse !important;">
<tbody>
<tr style="border-top-width: 0px;border-left-width: 0px; padding: 10px !important;">
<th style="width:5%; text-align:center; padding: 10px !important;">STT</th>
<th style="width:15%; text-align:center;">Địa Chỉ Email</th>
<th style="width:15%; text-align:center;">Họ Và Tên</th>
<th style="width:10%; text-align:center;">Ngày Sinh</th>
<th style="width:10%; text-align:center;">Chứng minh thư</th>
<th style="width:15%; text-align:center;">Cơ quan / Đơn vị</th>
<th style="width:10%; text-align:center;">Tình trạng</th>
<th style="width:10%; text-align:center;">Đối tượng</th>
<th style="width:10%; text-align:center;">Thời gian</th>
<th style="width:10%; text-align:center;">Thao tác</th>

</tr>

<br>
    
       <?php if ($list_baocao) { ?>
          <?php foreach ($list_baocao as $cts) { ?>  

		  
		  <tr class="ng-scope">
<td class="ng-binding" style="text-align:center;padding: 10px !important;"> <?php $i = $i+1; ?>
							<span> <?php echo $i;?>  </span>
					<?php  ?></td>
<td class="ng-binding" style="text-align:center;"> <?php echo $cts['email'];?> </td>
<td class="ng-binding" style="text-align:center;">
<?php echo $cts['ho_ten'];?>
<span class="ng-binding ng-scope" ng-if="item.di_dong_nguoi_nhan != null">
<br>
<?php echo $cts['dien_thoai'];?>
</span>
</td>
<td class="ng-binding" style="text-align:center;"> <?php echo $cts['ngay_sinh'];?> </td>
<td class="ng-binding" style="text-align:center;">
<?php echo $cts['so_cmt'];?>
<span class="ng-binding ng-scope" ng-if="item.di_dong_nguoi_nhan != null">
<br>
<?php echo $cts['ngay_cap'];?>
</span>
</td>
	<td class="text-center">
				 <?php echo $cts['ten_co_quan']; ?>
				
</td>
	<td class="text-center">
				 <?php if($cts['view']=='0') { ?>
<span class="badge bg-red ng-scope">Chưa xem</span>

		 <?php } else 
			   if($cts['view']=='1') { ?>
				<span class="badge bg-green ng-scope">Đã Xem</span>
		   <?php } ?>				
</td>

 <td class="text-center" style="color: red;">
                  <?php if($cts['tochuc_canhan_id']=='1') {echo "Cá Nhân" ;}
            else if($cts['tochuc_canhan_id']=='2'){echo "Tổ Chức" ;}
			?>
                </td>
				 <td class="text-center" style="color: red;">
               <?php echo time_stamp_to_date($cts['publish_date']); ?>
                </td>
				
				 <td class="text-center" style="white-space:nowrap">
                       
						 [	<a href="index.php?module=cts&act=view&cm=<?php echo $cts['tochuc_canhan_id'] ?>&id=<?php echo $cts['id_cts']; ?>" title="Xem"><i class="fa fa-file" aria-hidden="true"></i> </a> ]
                </td>
				
				  
		
       
 
    
           <?php } ?>
  <?php } else { ?> 

<tr class="ng-scope">
<td style="color:#848484; text-align:center;" colspan="10">
<br>
Không có dữ liệu
<br>
<br>
</td>
</tr>
</tr>
		  
		  
		
        
  
		  
	  <?php } ?>	
		
		
<br>
<br>

</tbody>
</table>
</div>
</div>
</div>
</div>
</section>
          
		
		  
		  

		
		   <!-- Main content -->
    <section class="content">	
<!--	
	<?php if($_SESSION['success']) {?>
			<div class="success">Đã gửi thư thành công!</div>		
			<?php } ?>		<?php if($_SESSION['warning']) {?>			
			<div class="warning">Lỗi gửi thư, nhập đủ thông tin!</div>		 
			<?php } ?>-->
      <div class="row">
       
        <!-- /.col -->
        <div class="col-md-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab">Biểu Đồ Hình Tròn</a></li>
              <li><a href="#timeline" data-toggle="tab">Biểu Đồ Dạng Cột</a></li>
              <li><a href="#settings" data-toggle="tab">Thông Tin Phản Hồi</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="activity">
                <!-- Post -->
                
				   <div class="box-body" style="text-align: center;"> 
                 
							
<!-- Styles -->
<style>
#chartdiv {
  width: 100%;
  height: 500px;
}

</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/material.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_material);
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("chartdiv", am4charts.PieChart);

// Add and configure Series
var pieSeries = chart.series.push(new am4charts.PieSeries());
pieSeries.dataFields.value = "litres";
pieSeries.dataFields.category = "country";

// Let's cut a hole in our Pie chart the size of 30% the radius
chart.innerRadius = am4core.percent(30);

// Put a thick white border around each Slice
pieSeries.slices.template.stroke = am4core.color("#fff");
pieSeries.slices.template.strokeWidth = 2;
pieSeries.slices.template.strokeOpacity = 1;
pieSeries.slices.template
  // change the cursor on hover to make it apparent the object can be interacted with
  .cursorOverStyle = [
    {
      "property": "cursor",
      "value": "pointer"
    }
  ];

pieSeries.alignLabels = false;
pieSeries.labels.template.bent = true;
pieSeries.labels.template.radius = 3;
pieSeries.labels.template.padding(0,0,0,0);

pieSeries.ticks.template.disabled = true;

// Create a base filter effect (as if it's not there) for the hover to return to
var shadow = pieSeries.slices.template.filters.push(new am4core.DropShadowFilter);
shadow.opacity = 0;

// Create hover state
var hoverState = pieSeries.slices.template.states.getKey("hover"); // normally we have to create the hover state, in this case it already exists

// Slightly shift the shadow and make it more prominent on hover
var hoverShadow = hoverState.filters.push(new am4core.DropShadowFilter);
hoverShadow.opacity = 0.7;
hoverShadow.blur = 5;

// Add a legend
chart.legend = new am4charts.Legend();

chart.data = [{
  "country": "Tổng số CTS",
  "litres": 501.9
},{
  "country": "Cá Nhân ",
  "litres": 165.8
},{
  "country": "Tổ Chức",
  "litres": 60
}];

}); // end am4core.ready()
</script>

<!-- HTML -->
<div id="chartdiv"></div>
			
						 
							   
                        
                            </div><!-- /.box-body -->      
							
				
				
                <!-- /.post -->

             

              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="timeline">
              <div class="box box-primary">
<h3 class="box-title">Chi tiết

</h3>

</div>
			  <div class="box-body">
<div class="row">
		
<style>
#chartdiv1 {
  width: 100%;
  height: 500px;
}

</style>
<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

// Create chart instance
var chart = am4core.create("chartdiv1", am4charts.XYChart);

// Export
chart.exporting.menu = new am4core.ExportMenu();

// Data for both series
var data = [ {
  "year": "2017",
  "income": 23.5,
  "expenses": 21.1
}, {
  "year": "2018",
  "income": 26.2,
  "expenses": 30.5
}, {
  "year": "2019",
  "income": 30.1,
  "expenses": 34.9
}, {
  "year": "2020",
  "income": 29.5,
  "expenses": 31.1
}, {
  "year": "2021",
  "income": 30.6,
  "expenses": 28.2,
  "lineDash": "5,5",
}, {
  "year": "2022",
  "income": 34.1,
  "expenses": 32.9,
  "strokeWidth": 1,
  "columnDash": "5,5",
  "fillOpacity": 0.2,
  "additional": "(projection)"
} ];

/* Create axes */
var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.dataFields.category = "year";
categoryAxis.renderer.minGridDistance = 30;

/* Create value axis */
var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

/* Create series */
var columnSeries = chart.series.push(new am4charts.ColumnSeries());
columnSeries.name = "Income";
columnSeries.dataFields.valueY = "income";
columnSeries.dataFields.categoryX = "year";

columnSeries.columns.template.tooltipText = "[#fff font-size: 15px]{name} in {categoryX}:\n[/][#fff font-size: 20px]{valueY}[/] [#fff]{additional}[/]"
columnSeries.columns.template.propertyFields.fillOpacity = "fillOpacity";
columnSeries.columns.template.propertyFields.stroke = "stroke";
columnSeries.columns.template.propertyFields.strokeWidth = "strokeWidth";
columnSeries.columns.template.propertyFields.strokeDasharray = "columnDash";
columnSeries.tooltip.label.textAlign = "middle";

var lineSeries = chart.series.push(new am4charts.LineSeries());
lineSeries.name = "Expenses";
lineSeries.dataFields.valueY = "expenses";
lineSeries.dataFields.categoryX = "year";

lineSeries.stroke = am4core.color("#fdd400");
lineSeries.strokeWidth = 3;
lineSeries.propertyFields.strokeDasharray = "lineDash";
lineSeries.tooltip.label.textAlign = "middle";

var bullet = lineSeries.bullets.push(new am4charts.Bullet());
bullet.fill = am4core.color("#fdd400"); // tooltips grab fill from parent by default
bullet.tooltipText = "[#fff font-size: 15px]{name} in {categoryX}:\n[/][#fff font-size: 20px]{valueY}[/] [#fff]{additional}[/]"
var circle = bullet.createChild(am4core.Circle);
circle.radius = 4;
circle.fill = am4core.color("#fff");
circle.strokeWidth = 3;

chart.data = data;

}); // end am4core.ready()
</script>

<!-- HTML -->
<div id="chartdiv1"></div>


 
 

 
</div>			 
</div>			  
			  
			  
			  
			  
			  
			  
              </div>
              <!-- /.tab-pane -->

              <div class="tab-pane" id="settings">
                <form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" onclick="return validate(this);">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Email Người Nhận</label>

                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="inputName" placeholder="Name" value="<?php echo $cts['email']; ?>">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Tiêu Đề</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder="Name">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label">Nội Dung</label>

                    <div class="col-sm-10">
                      <textarea class="form-control" id="inputExperience" placeholder="Nội dung thư nhập tại đây"></textarea>
                    </div>
                  </div><!--
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Skills</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputSkills" placeholder="Skills">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> I agree to the <a href="#">terms and conditions</a>
                        </label>
                      </div>
                    </div>
                  </div>-->
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-danger">Gửu thông tin</button>
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
		  

		 
	
		  
		  
		  
		  
        </div>
        



<?php include('view/template/common/footer.tpl'); ?>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>

  <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
    <script>
  $( function() {
    $( "#datepicker1" ).datepicker();
  } );
  </script>
  
  <script>
      function quay_lai_trang_truoc(){
          history.back();
      }
  </script>
  