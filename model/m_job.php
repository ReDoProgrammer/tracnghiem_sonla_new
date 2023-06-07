<?php

/**
 * @author ReDo
 * @copyright 2023
 */

function AllJobs()
{
    $exams_list = mysql_query("SELECT * FROM jobs", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($exams_list)) {
        $result[] = $local;
    }
    return $result;
}
?>