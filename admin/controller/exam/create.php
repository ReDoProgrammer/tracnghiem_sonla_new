<?php
include('../../model/m_exam.php');

//get form input
$title = $_POST['title'];
$thumbnail = $_POST['thumbnail'];
$description = $_POST['description'];
$duration = $_POST['duration'];
$number_of_questions = $_POST['number_of_questions'];
$mark_per_question = $_POST['mark_per_question'];
$times = $_POST['times'];
$begin = $_POST['begin'];
$end = $_POST['end'];
$is_hot = $_POST['is_hot'];
$random_questions = $_POST['random_questions'];
$random_options = $_POST['random_options'];
$regulation = $_POST['regulation'];
$created_by = $_POST['created_by'];

$result = create($title,$thumbnail,$description,$duration,$number_of_questions,
$mark_per_question,$times,$begin,$end,$is_hot,$random_questions,$random_options,$regulation,$created_by);
header("Content-Type: application/json");
echo json_encode($result);
?>