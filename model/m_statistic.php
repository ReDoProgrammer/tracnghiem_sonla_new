<?php
include_once('m_db.php');
include_once('classes/m_message.php');

function statDistrict($code){
    $sql = "SELECT 
        d.full_name AS district,
        w.full_name AS ward,
        m.working_unit,
        wp.name AS workplace,
        COUNT(DISTINCT er.member_id) AS candidates,
        COUNT(DISTINCT  er.id) AS total_times,
        COUNT(erd.question_id) AS total_questions,
        COUNT(CASE WHEN erd.question_answer = erd.option_id THEN 1 END) * e.mark_per_question AS total_marks,
        ROUND((COUNT(CASE WHEN erd.question_answer = erd.option_id THEN 1 END)* e.mark_per_question)/ COUNT(erd.question_id),2) AS average_mark
    FROM wards w
    INNER JOIN districts d ON w.district_code = d.code
    INNER JOIN members m ON m.ward_code = w.code
    LEFT JOIN workplaces wp ON m.workplace_id = wp.id
    INNER JOIN exam_results er ON er.member_id = m.id
    INNER JOIN exam_result_details erd ON erd.exam_result_id = er.id
    INNER JOIN exams e ON er.exam_id = e.id
    WHERE w.district_code = '".$code."'
    GROUP BY w.code";
    $result = mysql_query($sql,dbconnect());
    $msg = new Message();
    if($result){
        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Thống kê dữ liệu cuộc thi theo quận, huyện thành công!";
        $msg->statusCode = 200;
        $msg->content = $arr;
    }else{
        $msg->title = "Thống kê dữ liệu thi theo quận huyện thất bại!";
        $msg->icon = "error";
        $msg->statusCode = 500;
        $msg->content = mysql_error();
    }
    return $msg;
}
function statProvince($province_code)
{
    $sql = "SELECT
                e.title,
                d.code,
                d.full_name AS district, 
                COUNT(DISTINCT er.member_id) AS candidates,
                COUNT(DISTINCT  er.id) AS total_times,
                COUNT(erd.question_id) AS total_questions,
                COUNT(CASE WHEN erd.question_answer = erd.option_id THEN 1 END) * e.mark_per_question AS total_marks,
                (COUNT(CASE WHEN erd.question_answer = erd.option_id THEN 1 END)* e.mark_per_question)/ COUNT(erd.question_id) AS average_mark
            FROM exam_result_details erd
            INNER JOIN exam_results er ON erd.exam_result_id = er.id
            INNER JOIN exams e ON er.exam_id = e.id
            INNER JOIN members m ON er.member_id = m.id
            INNER JOIN provinces p ON m.province_code = p.code
            LEFT JOIN districts d ON d.province_code = p.code AND m.district_code = d.code
            WHERE p.code = '" . $province_code . "'
            AND e.is_stat = 1
            GROUP BY d.code";
    $result = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($result) {
        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Thống kê theo cuộc thi và tỉnh thành công!";
        $msg->statusCode = 200;
        $msg->content = $arr;

    } else {
        $msg->statusCode = 500;
        $msg->title = "Thống kê cuộc thi theo tỉnh thành thất bại!";
        $msg->icon = "error";
        $msg->content = mysql_error();
    }
    return $msg;
}