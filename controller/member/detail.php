<?php
    include('../../model/m_member.php');
    session_start();
    $profile = (array)$_SESSION['profile'];
    $result = mDetail($profile['id']);
    header("Content-Type: application/json");
    echo json_encode($result);