<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include_once('m_db.php');
include_once('m_question.php');
include_once('m_option.php');
include_once('m_exam_config.php');
include_once('m_exam_result.php');
include_once('m_exam_result_detail.php');
include_once('classes/m_message.php');

function CurrentExam(){
    $sql = "SELECT id, title, thumbnail,`begin`,`end`,regulation
            FROM exams
            WHERE `begin` < CURRENT_TIMESTAMP( )
            AND   `end` > CURRENT_TIMESTAMP( )               
            ORDER BY `end`
            LIMIT 1
            ";
    $result = mysql_query($sql,dbconnect());
    $msg = new Message();

    if($result){
        if(mysql_num_rows($result)==0){
            $sql = "SELECT id, title, thumbnail,`begin`,`end`,regulation
            FROM exams
            WHERE `begin` < CURRENT_TIMESTAMP( )
            AND   `end` < CURRENT_TIMESTAMP( )               
            ORDER BY `end` DESC
            LIMIT 1
            ";
             $result = mysql_query($sql,dbconnect());
             if($result){
                $msg->statusCode = 200;
                $msg->icon = "success";
                $msg->title = "Lấy cuộc thi gần nhất đã diễn thành công!";
                $msg->content = mysql_fetch_array($result);
             }else{
                $msg->statusCode = 500;
                $msg->icon = "error";
                $msg->title = "Lấy cuộc thi gần nhất đã diễn ra thất bại!";
                $msg->content = mysql_error();
             }
        }else{
            $msg->statusCode = 200;
            $msg->icon = "success";
            $msg->title = "Lấy cuộc thi gần nhất đang diễn thành công!";
            $msg->content = mysql_fetch_array($result);
        }
    }else{
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->title = "Lấy cuộc thi gần nhất đang diễn ra thất bại!";
        $msg->content = mysql_error();
    }
    return $msg;
}

function Top10Exams()
{
    $sql = "SELECT e.id, title, thumbnail, 
            DATE_FORMAT(begin , '%d/%m/%Y' ) AS begin , 
            DATE_FORMAT(end , '%d/%m/%Y' ) AS end , 
            description,
            CASE
                WHEN `begin` < CURRENT_TIMESTAMP( )
                AND `end` < CURRENT_TIMESTAMP( )
                THEN 1
                WHEN `begin` < CURRENT_TIMESTAMP( )
                AND `end` > CURRENT_TIMESTAMP( )
                THEN 0
                ELSE -1
            END AS exam_status
            FROM exams e
            INNER JOIN exam_configs c ON c.exam_id = e.id
            GROUP BY e.id,title, thumbnail
            ORDER BY exam_status
            LIMIT 10
        ";
    $result = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($result) {
        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Lấy top 10 cuộc thi thành công!";
        $msg->statusCode = 200;
        $msg->content = $arr;
    } else {
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->title = "Lấy top 10 cuộc thi thất bại!";
        $msg->content = mysql_error();
    }
    return $msg;
}

function LoadExams($page, $pageSize)
{
    $sql = "SELECT e.id, title, thumbnail, 
        DATE_FORMAT(begin , '%d/%m/%Y %H:%i' ) AS begin , 
        DATE_FORMAT(end , '%d/%m/%Y %H:%i' ) AS end , 
        description,
        CASE
            WHEN BEGIN < CURRENT_TIMESTAMP( )
            AND END < CURRENT_TIMESTAMP( )
            THEN 1
            WHEN BEGIN < CURRENT_TIMESTAMP( )
            AND END > CURRENT_TIMESTAMP( )
            THEN 0 
            ELSE -1
        END AS exam_status
        FROM exams e
        INNER JOIN exam_configs c ON c.exam_id = e.id
        GROUP BY e.id,title, thumbnail
        ORDER BY exam_status ";

    //Tính số trang của kết quả tìm được dựa vào kích thước trang & số dòng của kết quả
    $pages = 1;
    $result = mysql_query($sql, dbconnect());
    $totalRows = mysql_num_rows($result);
    $pages = $totalRows % $pageSize == 0 ? $totalRows / $pageSize : floor($totalRows / $pageSize) + 1;
   //-- kết thúc tính số trang


    $sql .= " LIMIT " . ($page - 1) * $pageSize . "," . $pageSize;

    $result = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($result) {
        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Lấy danh sách cuộc thi thành công!";
        $msg->statusCode = 200;
        $msg->content = $arr;
        $msg->pages = $pages;
    } else {
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->title = "Lấy danh sách cuộc thi thất bại!";
        $msg->content = mysql_error();
    }
    return $msg;
}


function Top10Candidates()
{
    $sql = "SELECT m.fullname,
                DATE_FORMAT(er.started_at,'%d/%m/%Y %T') AS exam_date,
                er.spent_duration,
                (COUNT(CASE WHEN erd.option_id =erd.question_answer THEN 1 END)*e.mark_per_question) AS mark ,
                COUNT(erd.question_id)*e.mark_per_question AS total_marks,
                (COUNT(CASE WHEN erd.option_id =erd.question_answer THEN 1 END)*e.mark_per_question)/(COUNT(erd.question_id)*e.mark_per_question) AS mark_ratio
            FROM members m
            JOIN exam_results er ON er.member_id = m.id
            JOIN exam_result_details erd ON erd.exam_result_id = er.id
            JOIN exams e ON er.exam_id = e.id
            WHERE e.is_stat = 1
            GROUP BY m.id,e.id,er.id
            ORDER BY mark_ratio DESC,spent_duration 
            LIMIT 10
            ";
    $result = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($result) {
        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Lấy top 10 điểm cao nhất thành công!";
        $msg->statusCode = 200;
        $msg->content = $arr;
    } else {
        $msg->icon = "error";
        $msg->statusCode = 500;
        $msg->title = "Lấy top 10 điểm cao nhất thất bại!";
        $msg->content = mysql_error();
    }
    return $msg;
}

function Top10Units()
{
    $sql = "SELECT
                wp.name AS workplace,
                COUNT(DISTINCT er.member_id) AS candidates,
                COUNT(DISTINCT m.id) AS total_members,
                COUNT(DISTINCT er.id) AS exam_times
            FROM workplaces wp
            LEFT JOIN members m ON m.workplace_id = wp.id
            LEFT JOIN exam_results er ON er.member_id = m.id
            LEFT JOIN exams e ON er.exam_id = e.id
            WHERE e.is_stat = 1
            GROUP BY wp.id
            HAVING candidates > 0
            ORDER BY candidates DESC, exam_times DESC
            LIMIT 10";
    $result = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($result) {
        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Lấy top 10 đơn vị tham gia thi nhiều nhất thành công!";
        $msg->statusCode = 200;
        $msg->content = $arr;
    } else {
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->title = "Lấy top 10 đơn vị tham gia nhiều nhất thất bại!";
        $msg->content = mysql_error();
    }
    return $msg;
}
function exResultPagination($id)
{
    $sql = "SELECT q.id,q.title,erd.question_answer,erd.option_id
            FROM exam_result_details erd   
            INNER JOIN questions q ON erd.question_id = q.id         
            WHERE exam_result_id = '" . $id . "'    
    ";
    $result = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($result && mysql_num_rows($result)) {

        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }
        $msg->icon = "success";
        $msg->statusCode = 200;
        $msg->title = "Lấy thông tin phân trang thành công!";
        $msg->content = $arr;
    } else {
        $msg->icon = "error";
        $msg->statusCode = 500;
        $msg->title = "Lấy thông tin phân trang thất bại!";
        $msg->content = "Lỗi: " . mysql_error();
    }
    return $msg;
}


//hàm lấy thông tin tổng quan của 1 bài thi cụ thể
function exResultSummary($result_id)
{
    session_start();
    $p = (array)$_SESSION['profile'];
    $sql = "SELECT 
            er.id, e.exam_code, e.title, e.duration,e.mark_per_question,
            COUNT(CASE WHEN erd.question_answer = erd.option_id THEN 1 END) AS correct,
            COUNT(CASE WHEN erd.question_answer != erd.option_id AND erd.option_id !=0 THEN 1 END) AS wrong,
            COUNT(CASE WHEN erd.option_id = 0 THEN 1 END) AS unchoosed,
            COUNT(CASE WHEN erd.option_id !=0 THEN 1 END) AS choosed,
            COUNT( erd.exam_result_id ) AS total_questions,
            e.forecast_candidates as hasForeCast,
            er.spent_duration,
            er.forecast_candidates,
            DATE_FORMAT(er.created_at, '%d/%m/%Y %H:%i') AS exam_date
            FROM exams e
            INNER JOIN exam_results er ON er.exam_id = e.id
            INNER JOIN exam_result_details erd ON erd.exam_result_id = er.id
            WHERE er.member_id = '" . $p['id'] . "'
            AND er.id = '" . $result_id . "'
            GROUP BY er.id, e.exam_code, e.title";
    $result = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($result && mysql_num_rows($result) > 0) {
        $msg->statusCode = 200;
        $msg->title = "Lấy thông tin tổng quan kết quả thi thành công!";
        $msg->icon = "success";
        $msg->content = mysql_fetch_array($result);
    } else {
        $msg->statusCode = 500;
        $msg->title = "Lấy lịch sử thi thất bại!";
        $msg->icon = "error";
        $msg->content = "Lỗi: " . mysql_error();
    }
    return $msg;
}
function exHistory($page, $pageSize, $search)
{
    session_start();
    $p = (array)$_SESSION['profile'];
    $sql = "SELECT 
            er.id, e.exam_code, e.title, er.times,
            COUNT(CASE WHEN erd.question_answer = erd.option_id THEN 1 END) AS correct,
            COUNT( erd.exam_result_id ) AS total,
            DATE_FORMAT(er.created_at, '%d/%m/%Y %H:%i') AS exam_date
            FROM exams e
            INNER JOIN exam_results er ON er.exam_id = e.id
            INNER JOIN exam_result_details erd ON erd.exam_result_id = er.id
            WHERE er.member_id = '" . $p['id'] . "'
            GROUP BY er.id, e.exam_code, e.title";
    $result = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($result) {
        $count = mysql_num_rows($result);
        if ($count > 0) {
            $arr = array();
            while ($local = mysql_fetch_array($result)) {
                $arr[] = $local;
            }
            $msg->statusCode = 200;
            $msg->title = "Lấy lịch sử thi thành công!";
            $msg->icon = "success";
            $msg->content = $arr;
        } else {
            $msg->statusCode = 404;
            $msg->title = "Bạn chưa tham gia cuộc thi nào";
            $msg->icon = "warning";
            $msg->content = $p['id'];
        }
    } else {
        $msg->statusCode = 500;
        $msg->title = "Lấy lịch sử thi thất bại!";
        $msg->icon = "error";
        $msg->content = "Lỗi: " . mysql_error();
    }
    return $msg;
}


function save($exam_id,$result,$times,$spent_duration,$exam_date,$forecast_candidates)
{
    $msg = new Message();
    session_start();
    $p = (array)$_SESSION['profile'];
    $er = erSave($exam_id, $p['id'], $times, $spent_duration, $exam_date,$forecast_candidates);
    if ($er->statusCode != 201) {
        return $er;
    }
    foreach ($result as $r) {
        $option = getCorrectOption($r['id']);
        if ($option->statusCode != 200) {
            return $option;
        }

        $is = erdSave($er->content, $r['id'], $option->content['id'], $r['checked'], $p['id']);
        if ($is->statusCode != 201) {
            return $is;
        }
    }

    $msg = new Message();
    $msg->icon = "success";
    $msg->statusCode = 201;
    $msg->title = "Lưu kết quả bài thi thành công!";
    $msg->content = $er->content;
    return $msg;
}


function HasHot()
{
    $result = mysql_query("SELECT * FROM exams WHERE is_hot = 1", dbconnect());
    $msg = new Message();
    if ($result) {

        $count = mysql_num_rows($result);
        if ($count > 0) {
            $msg->icon = "success";
            $msg->statusCode = 200;
            $msg->title = "Có bài thi tiêu điểm!";
        } else {
            $msg->icon = "error";
            $msg->statusCode = 404;
            $msg->title = "Không có bài thi tiêu điểm!";
        }
    } else {
        $msg->icon = "error";
        $msg->statusCode = 500;
        $msg->title = "Kiểm tra tồn tại bài thi tiêu điểm thất bại!";
        $msg->content = "Lỗi: " . mysql_error();
    }
    return $msg;
}
function GetHotExam()
{
    $result = mysql_query("SELECT *
    FROM exams 
    WHERE is_hot = 1
    -- AND end >= CURRENT_TIMESTAMP()
    ", dbconnect());
    $msg = new Message();
    if ($result) {
        $count = mysql_num_rows($result);
        if ($count > 0) {
            $msg->statusCode = 200;
            $msg->title = "Có cuộc thi tiêu điểm";
            $msg->icon = "success";
            $msg->content = mysql_fetch_array($result);
        } else {
            $msg->statusCode = 404;
            $msg->title = "Hiện tại không có cuộc thi tiêu điểm nào";
            $msg->icon = "warning";
            $msg->content = "NOT FOUND";
        }
    } else {
        $msg->statusCode = 500;
        $msg->title = "Kiểm tra hot exam thất bại!";
        $msg->icon = "error";
        $msg->content = "Lỗi: " . mysql_error();
    }
    return $msg;
}
function GetQuestions($exam_id)
{
    $msg = new Message();

    /*
        Lấy thông tin bài thi 
        và các cấu hình liên quan
        -- đảo câu hỏi
        -- đảo đáp án
        -- số câu hỏi
    */
    $sql = "SELECT  e.id,e.title,
                    e.random_questions,e.random_options,
                    e.number_of_questions,
                    ef.topic_id,ef.percent 
            FROM exams e
            INNER JOIN exam_configs ef ON ef.exam_id = e.id
            WHERE e.id = '".$exam_id."' AND ef.percent>0";
    $result = mysql_query($sql,dbconnect());
    if($result && mysql_num_rows($result) > 0){
        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }
        $number_of_questions =intval($arr[0]['number_of_questions']);
        $random_questions = intval($arr[0]['random_questions']);
       
        
        $sql = "SELECT * FROM( ";
                foreach($arr as $i=>$t){
                    $limit = round((intval($t['percent']) / 100) * $number_of_questions);
                    $sql .= "SELECT q".$i.".id, q".$i.".title, q".$i.".topic
                    FROM (
                        SELECT q.id, q.title, q.topic_id,t.name AS topic
                        FROM questions q
                        INNER JOIN topics t ON q.topic_id = t.id
                        WHERE q.topic_id = ".$t['topic_id']."";
                        $sql.= $random_questions==1?" ORDER BY RAND()":" ORDER BY q.id";
                        $sql.= " LIMIT ".$limit."
                    ) AS q".$i;
                    $sql .= $t == end($arr)?"":" UNION ";
                }
                $sql .=")  AS subquery";
                $sql.=$random_questions==1?" ORDER BY RAND();":"";
            $result = mysql_query($sql,dbconnect());
            if($result && mysql_num_rows($result)>0){
                $arr = array();
                while ($local = mysql_fetch_array($result)) {
                    $arr[] = $local;
                }
                $msg->title = "Lấy đề thi thành công!";
                $msg->icon = "success";
                $msg->statusCode = 200;
                $msg->content = $arr; 
            }else{
                $msg->icon = "error";
                $msg->title = "Lấy đề thi thất bại!";
                $msg->statusCode = 500;
                $msg->content = mysql_error();
            } 

    }else{
        $msg->title = "Lấy thông tin chi tiết bài thi thất bại!";
        $msg->icon = "error";
        $msg->statusCode = 500;
        $msg->content = mysql_error();
    }
    return $msg;
}


function ExDetail($id)
{
    $msg = new Message();

    $result = mysql_query("SELECT 
                e.id,e.title,e.thumbnail,e.duration,
                e.number_of_questions,
                e.mark_per_question,
                e.times,
                DATE_FORMAT(e.begin, '%d/%m/%Y %H:%i') AS begin,
                DATE_FORMAT(e.end, '%d/%m/%Y %H:%i') AS end,       
                e.random_questions,
                e.random_options,
                forecast_candidates,
                CASE
                    WHEN `begin` < CURRENT_TIMESTAMP( )
                    AND `end` < CURRENT_TIMESTAMP( )
                    THEN 1
                    WHEN `begin` < CURRENT_TIMESTAMP( )
                    AND `end` > CURRENT_TIMESTAMP( )
                    THEN 0
                    ELSE -1
                END AS exam_status
            FROM exams e
            JOIN exam_configs ef ON ef.exam_id = e.id
            WHERE e.id = '" . $id . "' 
            GROUP BY e.id,e.title,e.thumbnail,e.duration,e.number_of_questions,e.mark_per_question,e.times,e.begin,e.end,e.random_questions,e.random_options
            ", dbconnect());


    if ($result) {
        $exam = mysql_fetch_array($result);
        $msg->statusCode = 200;
        $msg->title = "Load chi tiết bài thi thành công!";
        $msg->icon = "success";
        $msg->content = $exam;
    } else {
        $msg->statusCode = 500;
        $msg->title = "Load chi tiết bài thi thất bại!";
        $msg->icon = "error";
        $msg->content = mysql_error();
    }
    return $msg;
}



function EarliestExam()
{
    $exam = mysql_query("SELECT * 
                FROM exams 
                WHERE begin > CURRENT_TIMESTAMP()
                ORDER BY begin
                LIMIT 1
                ", dbconnect());
    return mysql_fetch_array($exam);
}

    