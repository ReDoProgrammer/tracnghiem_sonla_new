<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include_once('classes/m_message.php');
include_once('m_db.php');

function ExamConfigs($exam_id = 0)
{
    $sql = "SELECT topics.id, topics.name, 
            COALESCE(exam_configs.percent, 0) AS percent
            FROM topics
            LEFT JOIN exam_configs ON topics.id = exam_configs.topic_id 
            AND exam_configs.exam_id = '".$exam_id."'
            ";
    $result = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($result) {
        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }
        $msg->statusCode = 200;
        $msg->icon = "success";
        $msg->title = "Load config của bài thi thành công!";
        $msg->content = $arr;
    } else {
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->title = "Load configs của đề thi thất bại!";
        $msg->content = mysql_error();
    }
    return $msg;
}


function tGet($page, $search, $pageSize)
{
    $sql = "SELECT t.id,t.name,t.created_at,m.fullname AS created_by
    FROM topics t   
    INNER JOIN members m ON t.created_by = m.id
    WHERE t.name LIKE '%" . $search . "%'       
    ORDER BY t.name ";

    //Tính số trang của kết quả tìm được dựa vào kích thước trang & số dòng của kết quả
    $pages = 1;
    if (strcmp($pageSize, "All") != 0) {
        $result = mysql_query($sql, dbconnect());

        $totalRows = mysql_num_rows($result);
        $pages = $totalRows % $pageSize == 0 ? $totalRows / $pageSize : floor($totalRows / $pageSize) + 1;
        $sql .= " LIMIT " . ($page - 1) * $pageSize . "," . $pageSize . "";
    }


    $msg = new Message();
    $local_list = mysql_query($sql, dbconnect());
    if ($local_list) {
        $result = array();
        while ($local = mysql_fetch_array($local_list)) {
            $result[] = $local;
        }
        $msg->icon = 'success';
        $msg->title = "Load danh sách chủ đề thành công!";
        $msg->content = $result;
        $msg->statusCode = 200;
        $msg->pages = $pages;
    } else {
        $msg->icon = "error";
        $msg->statusCode = 500;
        $msg->title = "Load danh sách chủ đề thất bại!";
        $msg->content = "Lỗi: " . mysql_error();
    }
    return $msg;
}

function all()
{
    $sql = "SELECT topics.id, topics.name, COUNT(questions.id) AS questions_count
            FROM topics
            INNER JOIN questions ON topics.id = questions.topic_id
            GROUP BY topics.id, topics.name;";
    $local_list = mysql_query($sql, dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)) {
        $result[] = $local;
    }
    return $result;
}

function detail($id)
{
    $topic = mysql_query("select t.name
    FROM topics t WHERE id = " . $id, dbconnect());
    return mysql_fetch_array($topic);
}

function create($name, $created_by)
{
    $msg = new Message();
    $result = mysql_query("INSERT INTO topics(name,created_by) VALUES('" . $name . "','" . $created_by . "')", dbconnect());
    if ($result) {
        $affectedRows = mysql_affected_rows();
        if ($affectedRows > 0) {
            $msg->icon = "success";
            $msg->title = "Thêm mới chủ đề thành công!";
            $msg->statusCode = 201;

        } else {
            $msg->icon = "error";
            $msg->title = "Thêm mới chủ đề thất bại!";
            $msg->statusCode = 404;
        }
    } else {
        $msg->icon = "error";
        $msg->title = "Thêm mới chủ đề thất bại!";
        $msg->statusCode = 404;
        $msg->content = "Lỗi: " . mysql_error();
    }
    return $msg;
}

function update($id, $name, $updated_by)
{
    $result = mysql_query("UPDATE topics 
    SET name='" . $name . "',       
        updated_by=" . $updated_by . ",
        updated_at=CURRENT_TIMESTAMP()
    WHERE id =" . $id, dbconnect());

    $msg = new Message();
    if ($result) {
        $affectedRows = mysql_affected_rows();
        if ($affectedRows > 0) {
            $msg->icon = 'success';
            $msg->title = 'Cập nhật chủ đề thành công!';
            $msg->content = $affectedRows;
            $msg->statusCode = 200;
        } else {
            $msg->icon = 'error';
            $msg->title = 'Cập nhật chủ đề thất bại!';
            $msg->content = $affectedRows;
            $msg->statusCode = 404;
        }
    } else {
        $msg->icon = 'error';
        $msg->title = 'Cập nhật chủ đề thất bại! Lỗi: ';
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}
function delete($id)
{
    $msg = new Message();

    $result = mysql_query("select id FROM questions where topic_id= " . $id, dbconnect());
    $count = mysql_num_rows($result);

    if ($count > 0) {
        $msg->icon = 'error';
        $msg->title = 'Ràng buộc dữ liệu';
        $msg->content = "Không thể xóa chủ đề này khi có " . $count . " câu hỏi tham chiếu tới nó";
        $msg->statusCode = 403;
        return $msg;
    }

    $result = mysql_query("delete from topics where id= " . $id, dbconnect());

    if ($result) {
        $affectedRows = mysql_affected_rows();
        if ($affectedRows > 0) {
            $msg->icon = 'success';
            $msg->title = 'Xóa chủ đề thành công!';
            $msg->content = $affectedRows;
            $msg->statusCode = 200;
        } else {
            $msg->icon = 'error';
            $msg->title = 'Xóa chủ đề thất bại!';
            $msg->content = "Không tìm thấy chủ đề cần xóa";
            $msg->statusCode = 404;
        }
    } else {
        $msg->icon = 'error';
        $msg->title = 'Xóa chủ đề thất bại! Lỗi: ';
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}