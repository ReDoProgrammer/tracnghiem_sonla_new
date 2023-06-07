<!-- start content--->
<div class="center_panel">
    <!--HOI DAP-->


<div class="news_box_skhvdt">

<div class="news_box_title">
<span class="right_title"></span>
<a href="hoat-dong-cua-so.htm">HỎI ĐÁP</a>
<span class="left_title"></span>
</div>
<div class="cont_skhvdt">

  
<div class="content_hoidap">
<h1 class="question">
<a href="#"><b>Câu Hỏi: </b><?php echo $hoidap['title'];?>.</a>
</h1>
<div class="content_question" style="text-align: justify;"> <?php echo $hoidap['noi_dung'];?>
</div>
<div class="meta_question">
<span class="auth" style="font-weight: bold;">Người hỏi: <?php echo $hoidap['author'];?></span>
<span class="date">(<?php echo $hoidap['time'];?>)</span>

</div>
</div>

<div class="clear"></div>
<!-- tra loi -->
<div id="view_answer" class="content_answer">
<h4 class="h1_traloi">Câu trả lời</h4>
<div class="list_answer list_answer_last">
<div class="style_tree_view">
<div class="content_hoidap anser_style">
<div class="meta_question">
<span class="auth" style="font-weight: bold;">Người trả lời: Quản Trị</span>
<span class="answers">Ngày trả lời: <?php echo $hoidap['edit_time'];?></span>
</div>
<div class="content_question" style="text-align: justify;">
<?php echo $hoidap['tra_loi'];?>
</div>
</div>
</div>
</div>
</div>
<!-- end tra loi -->

</div>









</div>






<!-- END HOI DAP -->
</div>

