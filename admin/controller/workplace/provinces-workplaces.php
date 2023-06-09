<?php
    include('../../model/m_workplace.php');

    $search = $_GET['search'];

    $result = ProvincesWorkplaces($search);
    header("Content-Type: application/json");
    echo json_encode($result);
?>