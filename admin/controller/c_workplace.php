<?php

/**
 * @author ReDo
 * @copyright 2023
 */
if ((!$_SESSION['admin'])) {
    header('LOCATION: index.php?module=member&act=login');
    exit();
}

require('view/template/workplace/index.tpl');
