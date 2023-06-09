<?php
    include('../../model/m_exam.php');   
    $result = all();
    header("Content-Type: application/json");
    echo json_encode($result);
?>