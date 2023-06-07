<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_position.php');


$count = retrieve();
header("Content-Type: application/json");
echo json_encode($count);