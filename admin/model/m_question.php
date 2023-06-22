<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include_once('m_option.php');
include_once('classes/m_message.php');
include_once('classes/m_option.php');

function qDeleteMany($ids){
    $sql = "DELETE FROM questions WHERE id IN(";
    
    foreach($ids as $id){
        $sql.=$id.($id==end($ids)?')':',');
    }

    $msg = new Message();
    $result = mysql_query($sql,dbconnect());
    if($result){
        $msg->icon = "success";
        $msg->title = "Xóa câu hỏi thành công!";
        $msg->statusCode = 200;
    }else{
        $msg->icon = "error";
        $msg->title = "Xóa câu hỏi thất bại!";
        $msg->statusCode = 500;
        $msg->content = mysql_error();
    }
    return $msg;
}
function qGet($topic,$page, $search, $pageSize)
{
    $sql = "SELECT 
        t.name AS topic,
        m.fullname AS created_by,
        q.created_at,
        q.id,
        q.title,
        q.applied
       
    FROM questions q
    JOIN topics  t ON q.topic_id = t.id  
    JOIN members m ON q.created_by = m.id 
    WHERE q.title like '%" . $search . "%'";
    if($topic!="All"){
        $sql.= " AND q.topic_id = '".$topic."'";
    }
    $sql.= " GROUP BY t.name,q.id, q.title,created_by, applied
  ";


    //Tính số trang của kết quả tìm được dựa vào kích thước trang & số dòng của kết quả
    $pages = 1;
    if (strcmp($pageSize, "All") != 0) {
        $result = mysql_query($sql, dbconnect());

        $totalRows = mysql_num_rows($result);
        $pages = $totalRows % $pageSize == 0 ? $totalRows / $pageSize : floor($totalRows / $pageSize) + 1;
        $sql .= " LIMIT " . ($page - 1) * $pageSize . "," . $pageSize . "";
    }

    $local_list = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($local_list) {
        $result = array();
        while ($local = mysql_fetch_array($local_list)) {
            $result[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Load danh sách câu hỏi thành công!";
        $msg->content = $result;
        $msg->pages = $pages;
        $msg->statusCode = 200;
    } else {
        $msg->icon = "error";
        $msg->title = "Load danh sách câu hỏi thất bại!";
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}

function getQuestion($id)
{
    $q = mysql_query("SELECT 
        t.name AS topic,
        t.id AS topic_id,
        m.fullname AS created_by,
        q.created_at,
        q.id,
        q.title,
        q.applied, 
        CONCAT('[', GROUP_CONCAT(CONCAT('{\"id\":', o.id, ',\"content\":\"', o.content, '\",\"correct\":', o.correct, '}')) ,']') AS options
    FROM questions q
    JOIN options o ON q.id = o.question_id   
    JOIN topics t ON q.topic_id = t.id  
    JOIN members m ON q.created_by = m.id 
    WHERE q.id = '" . $id . "'  
    GROUP BY t.name,q.id, q.title,created_by, q.applied", dbconnect());

    $msg = new Message();
    if ($q) {
        $msg->icon = 'success';
        $msg->title = "Lấy thông tin chi tiết câu hỏi thành công!";
        $msg->content = mysql_fetch_array($q);
        $msg->statusCode = 200;
    } else {
        $msg->icon = 'error';
        $msg->title = "Lấy thông tin chi tiết câu hỏi thất bại!";
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}


function getRandomQuestionsLimited($topic_id, $limit)
{
    $sql = "SELECT 
        t.name AS topic,
        m.fullname AS created_by,
        q.created_at,
        q.id,
        q.title,
        q.applied, 
        CONCAT('[', GROUP_CONCAT(CONCAT('{\"id\":', o.id, ',\"content\":\"', o.content, '\",\"correct\":', o.correct, '}')) ,']') AS options
    FROM questions q
    JOIN options o ON q.id = o.question_id   
    JOIN topics t ON q.topic_id = t.id  
    JOIN members m ON q.created_by = m.id 
    WHERE q.topic_id = '" . $topic_id . "'
    GROUP BY t.name,q.id, q.title,created_by, applied
    ORDER BY RAND()
    LIMIT " . $limit;

    $msg = new Message();

    $local_list = mysql_query($sql, dbconnect());
    if ($local_list) {
        $result = array();
        while ($local = mysql_fetch_array($local_list)) {
            $result[] = $local;
        }
        $msg->statusCode = 200;
        $msg->title = "Lấy câu hỏi random thành công!";
        $msg->content = $result;
        $msg->icon = 'success';
    } else {
        $msg->statusCode = 500;
        $msg->title = "Lấy câu hỏi random thành công!";
        $msg->content = "Lỗi: " . mysql_error();
        $msg->icon = 'error';
    }
    return $msg;
}


function getQuestionsByTopic($topic_id)
{
    $sql = "SELECT q.id,
        q.title,       
        CONCAT('[', GROUP_CONCAT(CONCAT('{\"id\":', o.id, ',\"content\":\"', o.content, '\",\"correct\":', o.correct, '}')) ,']') AS options
        FROM questions q
        JOIN options o ON q.id = o.question_id  
        WHERE q.topic_id = '" . $topic_id . "'
        AND applied = 1  
        GROUP BY q.id, q.title";
    $local_list = mysql_query($sql, dbconnect());

    $msg = new Message();
    if ($local_list) {
        $result = array();
        while ($local = mysql_fetch_array($local_list)) {
            $result[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Lấy câu hỏi theo đề tài thành công!";
        $msg->statusCode = 200;
        $msg->content = $result;
    } else {
        $msg->icon = "error";
        $msg->title = "Lấy câu hỏi theo đề tài thất bại!";
        $msg->statusCode = 500;
        $msg->content = "Lỗi: " . mysql_error();
    }
}


function qImport($topic_id, $questions, $created_by)
{
    $msg = new Message();
    for ($i = 1; $i < count($questions); $i++) {
        /*
            - hàng đầu tiên (chỉ số 0) là tiêu đề
            - chỉ lấy các option khác rỗng
            - bỏ 2 cột đầu tiên là cột stt và tiêu đề câu hỏi
        */
        $title = $questions[$i][1];

        $filteredArray = array_filter($questions[$i], 'filterNonEmptyStrings');

        array_shift($filteredArray);
        array_shift($filteredArray);

        $answer = end($filteredArray); 
        $options = array();
        for($j=0; $j< count($filteredArray)-1; $j++){
            $options[]=converToObject($j,$filteredArray[$j],convertAnswerToNumber($answer));
        }
       

        $sql = "INSERT INTO questions(topic_id,title,created_by) 
                VALUES('".$topic_id."','".$title."','".$created_by."')";
        $result = mysql_query($sql,dbconnect());
        if($result && mysql_affected_rows()>0){
            $question_id = mysql_insert_id();
            $result = oInsertMany($question_id,$options,$created_by);
            if($result->statusCode !=201){
                return $result;
            }
        }else{
            $msg->icon = "error";
            $msg->title = "Insert câu hỏi: ".$title." thất bại!";
            $msg->content = mysql_error();
            $msg->statusCode = 500;
            return $msg;
        }        
    }
    $msg = new Message();
    $msg->statusCode = 201;
    $msg->title = "Import danh sách câu hỏi thành công!";
    $msg->icon = "success";
    return $msg;
}

function create($title, $options, $topic_id, $created_by)
{
    $result = mysql_query("INSERT INTO questions(title,topic_id,created_by) VALUES('" . $title . "'," . $topic_id . ",'" . $created_by . "')", dbconnect());
    $msg = new Message();

    if ($result) {
        $insertedRows = mysql_affected_rows();
        if ($insertedRows > 0) {
            $question_id = mysql_insert_id();

            $array = json_decode(stripslashes($options), true);

            foreach ($array as $opt) {
                $option = $opt['option'];
                $check = $opt['check'];
                $result = oCreate($question_id, $option, $check, $created_by);

                if ($result != true) {
                    $msg->icon = 'error';
                    $msg->title = "Thêm mới đáp án [" . $option . "] thất bại!";
                    $msg->content = $result;
                    $msg->statusCode = 500;
                    return $msg;
                }
            }


            $msg->icon = 'success';
            $msg->title = "Thêm mới câu hỏi thành công!";
            $msg->statusCode = 201;
        } else {
            $msg->icon = 'error';
            $msg->title = "Thêm mới câu hỏi thất bại!";
            $msg->content = "Lỗi không xác định";
            $msg->statusCode = 400;
        }
    } else {
        $msg->icon = 'error';
        $msg->title = "Thêm mới câu hỏi thất bại!";
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}

function update($id, $title, $options, $topic_id, $updated_by)
{
    $result = mysql_query("UPDATE questions 
    SET title='" . $title . "',       
        topic_id=" . $topic_id . ",
        updated_by=" . $updated_by . ",
        updated_at=CURRENT_TIMESTAMP()
    WHERE id =" . $id, dbconnect());

    $msg = new Message();
    if ($result && mysql_affected_rows() > 0) {        
        $array = json_decode(stripslashes($options), true);
        $update = oUpdateMany($id,$array,$updated_by);
        if($update->statusCode !=201){
            return $update;
        }

        $msg->icon = 'success';
        $msg->title = "Cập nhật câu hỏi thành công!";
        $msg->statusCode = 200;
    } else {
        $msg->icon = 'error';
        $msg->title = "Cập nhật câu hỏi thất bại! Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}
function delete($id)
{
    $sql = "DELETE questions, options
    FROM questions
    INNER JOIN options ON questions.id = options.question_id
    WHERE questions.id = '".$id."'";
    $result = mysql_query($sql,dbconnect());
    $msg = new Message();
    if($result && mysql_affected_rows()>0){
        $msg->title = "Xóa câu hỏi thành công!";
        $msg->icon = "success";
        $msg->statusCode = 200;        
    }else{
        $msg->title = "Xóa câu hỏi thất bại!";
        $msg->icon = "error";
        $msg->statusCode = 500;
        $msg->content = mysql_error();
    }
    return $msg;
}

function filterNonEmptyStrings($element)
{
    $trimmed = trim($element);
    return !empty($trimmed);
}

function convertAnswerToNumber($answer) {
    $answer = strtoupper($answer); // Chuyển đổi "answer" thành chữ hoa
    $number = ord($answer) - ord('A');
    return $number;
}

function converToObject($index,$content,$answer_index){
    $opt = new Option();
    $opt->content = $content;
    $opt->check = $index == $answer_index?1:0;
    return $opt;
}
