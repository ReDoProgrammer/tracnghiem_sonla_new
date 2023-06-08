<?php

/**
 * @author ReDo
 * @copyright 2023
 */


 include('../../model/m_location.php');
$search = $_GET['search'];
$pws = ProvincesWorkplaces($search);
header("Content-Type: application/json");
echo json_encode($pws);
