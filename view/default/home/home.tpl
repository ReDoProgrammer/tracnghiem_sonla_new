<!DOCTYPE html>
<html lang="vi" xmlns="http://www.w3.org/1999/xhtml" prefix="og: http://ogp.me/ns#">
<?php include('view/default/common/header.tpl')?>
<div class="hidden-md hidden-lg opacity_menu"></div>
<body>
    <div class="body-bg">
        <?php include('view/default/common/navbar.tpl')?>
        
        <div class="wraper">
            <section>
                <div class="container" id="body">
                   <div class="row" id="default_exam">
                        <?php include('components/slider.tpl')?>
                        <?php include('components/countdown.tpl')?>                       
                    </div>
                    <?php include('components/hot-exam.tpl'); ?>                                     
                    <?php include('components/examings.tpl')?>
                 
                    <div class="row">
                        <?php include('components/notifications.tpl')?>
                        <?php include('components/top.tpl')?>
                        <?php include('components/top10.tpl')?>                        
                    </div>
                    
                </div>
            </section>
        </div>

<?php include('view/default/common/footer.tpl')?>        