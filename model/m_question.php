<?php
include_once('classes/m_message.php');
include_once('m_exam_config.php');
function GetQuestionsByTopic($topic_id, $limit, $random_questions = false,$random_options = false)
{
    $sql = "SELECT q.id,q.title,
    t.name AS topic
    FROM questions q 
    JOIN topics t ON q.topic_id = t.id
    WHERE q.topic_id = '".$topic_id."'
    AND q.applied = 1
    GROUP BY q.id";
   if($random_questions){
        $sql .= " ORDER BY RAND()";
   } 
   $sql .= " LIMIT ".$limit;

    $questions = mysql_query($sql, dbconnect());
    $msg=new Message();
    if($questions){
        $result = array();
        while ($local = mysql_fetch_array($questions)) {
            $result[] = $local;
        }
        $msg->statusCode = 200;
        $msg->icon = 'success';
        $msg->title = "Lấy danh sách id câu hỏi theo chủ đề thành công!";
        $msg->content = $result;
    }else{
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->title ="Lấy danh sách id câu hỏi theo chủ đề thất bại";
        $msg->content = "Lỗi: ".mysql_error();
    }
    return $msg;
    
}


function qDetail($id){
    $msg = new Message();

    $result = mysql_query("SELECT 
                q.id,q.title,
                t.name AS topic           
            FROM questions q
            JOIN topics t ON q.topic_id = t.id            
            WHERE id = '" . $id . "'", dbconnect());


    if ($result && mysql_num_rows($result)>0) {
        $exam = mysql_fetch_array($result);
        $msg->statusCode = 200;
        $msg->title = "Load chi tiết câu hỏi!";
        $msg->icon = "success";
        $msg->content = $exam;
    } else {
        $msg->statusCode = 500;
        $msg->title = "Load chi tiết câu hỏi thất bại!";
        $msg->icon = "error";
        $msg->content = mysql_error();
    }
    return $msg;
}

