<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('../../model/m_db.php');
include('../../model/m_job.php');
$jobs = AllJobs();
header("Content-Type: application/json");
echo json_encode($jobs);
