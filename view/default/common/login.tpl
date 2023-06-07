<?php
    session_start();
    if (isset($_SESSION["profile"])) { 
            // session_destroy();
            include('panel_profile.tpl'); 
        ?>
        </div>
<?php }else { include('panelLogin.tpl');} ?>



 

