<?php
    include('../../model/m_member.php');
    $msg = new Message();

    $id = $_GET['id'];
    $result = detail($id);
    header("Content-Type: application/json");
    echo json_encode($result);
  