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
                    <?php
                        session_start();
                        // session_destroy();
                        if(!isset($_SESSION["profile"])){                            
                            header("Location: index.php?module=home&act=index");die();
                        }else{
                            include('components/single.tpl');
                        }
                    ?>      
                </div>
            </section>
        </div>

        <?php include('view/default/common/footer.tpl')?>
