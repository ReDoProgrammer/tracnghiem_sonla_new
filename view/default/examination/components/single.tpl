<div class="row">
    <div class="col-sm-18 col-md-17 col-sm-push-6 col-md-push-7">
        <div id="OnlineTestDoTest" class="OnlineTestDoTest">
            <div class="OnlineTestDoTestbox">
                <div class="row summury-info">
                     <div class="col-xs-20 col-sm-20 col-md-20 col-lg-20" id="exam_name">
                    </div>
                     <div class="TriSea-technologies-Switch pull-right col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <input id="switchMode" name="switchMode" type="checkbox" checked/>
                        <label for="switchMode" class="label-warning"></label>
                        <span style="font-size: 14px; margin-left:5px;" id="modeName">Single</span>
                    </div>
                </div>
               
               <div id="QuestionsContent">
                 <?php include('single/show-question.tpl'); ?>
               </div>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-7 col-sm-pull-18 col-md-pull-17">
        <div class="content signed clearfix" style="border: 1px solid #ccc;">
            <?php include('view/default/common/panel_profile.tpl'); ?>
        </div>
        <?php include('single/pagination.tpl'); ?>
        <div class="clearfix"> </div>
    </div>
</div>

<link rel="stylesheet" href="assets/css/single-examination.css">
<link rel="stylesheet" href="assets/css/pretty-switch.css">
<script src="assets/js/examination/js-examination.js"></script>
<script src="assets/js/onlinetest.js"></script>









