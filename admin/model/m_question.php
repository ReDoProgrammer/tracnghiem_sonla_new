<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('m_option.php');
include('classes/m_message.php');

function countPages($search, $pageSize)
{
    $result = mysql_query("SELECT 
        t.name AS topic,
        m.fullname AS created_by,
        q.created_at,
        q.id,
        q.title,
        q.applied, 
        CONCAT('[', GROUP_CONCAT(CONCAT('{\"id\":', o.id, ',\"content\":\"', o.content, '\",\"correct\":', o.correct, '}')) ,']') AS corrects
    FROM questions q
    JOIN options o ON q.id = o.question_id   
    JOIN topics  t ON q.topic_id = t.id  
    JOIN members m ON q.created_by = m.id 
    WHERE q.title like '%" . $search . "%'
    OR o.content like '" . $search . "'   
    GROUP BY t.name,q.id, q.title,created_by, q.applied", dbconnect());

    $msg = new Message();
    if ($result) {
        $count = mysql_num_rows($result);
        $pages = $count % $pageSize == 0 ? $count / $pageSize : floor($count / $pageSize) + 1;

        $msg->icon = "success";
        $msg->statusCode = 200;
        $msg->content = $pages;
        $msg->title = "Lấy số trang thành công!";
    } else {
        $msg->icon = "success";
        $msg->statusCode = 500;
        $msg->content = "Lỗi: " . mysql_error();
        $msg->title = "Lấy số trang thất bại!";
    }
    return $msg;
}
function getQuestions($page, $search, $pageSize)
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
    JOIN topics  t ON q.topic_id = t.id  
    JOIN members m ON q.created_by = m.id 
    WHERE q.title like '%" . $search . "%'
    OR o.content like '" . $search . "'   
    GROUP BY t.name,q.id, q.title,created_by, applied
  ";



    $msg = new Message();

    // nếu kích thước trang truyền vào không phải là all (tất cả)
    if ($pageSize != "All") {
        $sql .= " LIMIT " . $pageSize . " OFFSET " . ($page - 1) * $pageSize;
    }
    $local_list = mysql_query($sql, dbconnect());
    if ($local_list) {
        $result = array();
        while ($local = mysql_fetch_array($local_list)) {
            $result[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Load danh sách câu hỏi thành công!";
        $msg->content = $result;
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

function create($title, $options, $topic_id, $created_by)
{
    $result = mysql_query("INSERT INTO questions(title,topic_id,created_by) VALUES('" . $title . "'," . $topic_id . ",'" . $created_by . "')", dbconnect());
    $msg = new Message();

    if ($result) {
        $insertedRows = mysql_affected_rows();
        if ($insertedRows > 0) {
            $question_id = mysql_insert_id();

            $array = json_decode(stripslashes($options), true);
            $obj = new Option();
            foreach ($array as $opt) {
                $option = $opt['option'];
                $check = $opt['check'];
                $result = $obj->create($question_id, $option, $check, $created_by);
                
                if($result!=true){
                    $msg->icon = 'error';
                    $msg->title = "Thêm mới đáp án [".$option."] thất bại!";
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
        $msg->content = "Lỗi: ".mysql_error();
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
    if($result && mysql_affected_rows()>0){
        $array = json_decode(stripslashes($options), true);
        $obj = new Option();
        foreach ($array as $opt) {
            $id = $opt['id'];
            $content = $opt['option'];
            $check = $opt['check'];
            $result = $obj->update($id, $content, $check, $updated_by);
            
            if($result!=true){
                $msg->icon = 'error';
                $msg->title = "Cập nhật đáp án [".$content."] thất bại!";
                $msg->content = $result;
                $msg->statusCode = 500;
                return $msg;
            }
        }


        $msg->icon = 'success';
        $msg->title = "Cập nhật câu hỏi thành công!";
        $msg->content = $array;
        $msg->statusCode = 200;
    }else{
        $msg->icon = 'error';
        $msg->title = "Cập nhật câu hỏi thất bại! Lỗi: ".mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
   
}
function delete($id)
{
    $result = mysql_query("delete from questions where id= " . $id, dbconnect());
    $msg = new Message();

    if ($result &&  mysql_affected_rows()>0) {
        $obj = new Option();       
        if($obj->deletebyQuestion($id)){
            $msg->icon='success';
            $msg->title = 'Xóa câu hỏi và đáp án thành công!';
            $msg->statusCode = 200;
        }else{
            $msg->icon='success';
            $msg->title = 'Xóa câu hỏi thành công!';
            $msg->statusCode = 200;
        }
    } else {
        $msg->icon='error';
        $msg->title = 'Xóa câu hỏi thất bại!';
        $msg->content = "Lỗi: ".mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}
