<!--profile and examinations-->
<div class="row">
    <?php
        session_start();
        if(isset($_SESSION['profile'])){ ?>
            <div class="col-xs-24 col-sm-24 col-md-8 col-lg-8">
                <?php include('view/common/children/profile.tpl'); ?>
            </div>
       <?php }else{ ?>
            <div class="col-xs-24 col-sm-24 col-md-8 col-lg-8">
                <?php  include('view/common/children/login.tpl'); ?>
            </div>
       <?php } 
        include('children/examinations.tpl');
    ?>

    
</div>
<!--/end profile and examinations-->