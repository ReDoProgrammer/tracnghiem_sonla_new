<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_position.php');


$ps = retrieve();
header("Content-Type: application/json");
echo json_encode($ps);