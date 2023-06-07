<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('classes/m_message.php');

function countPages($search, $pageSize)
{
    $msg = new Message();

    $result = mysql_query("SELECT id
    FROM topics t
    WHERE t.name like '%" . $search . "%' ", dbconnect());
    if($result){
        $count = mysql_num_rows($result);
        $pages = $count % $pageSize == 0 ? $count / $pageSize : floor($count / $pageSize) + 1;
        
        $msg->title = 'Load số trang thành công!';
        $msg->statusCode = 200;
        $msg->content = $pages;

    }else{
        $msg->title = 'Load số trang thành công!';
        $msg->statusCode = 500;
        $msg->content = "Lỗi: ".mysql_error();
    }
    return $msg;
   
}
function retrieve($page, $search, $pageSize)
{
    $sql = "SELECT t.id,t.name,t.created_at,m.fullname AS created_by
    FROM topics t   
    INNER JOIN members m ON t.created_by = m.id
    WHERE t.name like '%" . $search . "%'       
    ORDER BY t.name";

    // nếu kích thước trang truyền vào không phải là all (tất cả)
    if ($pageSize != "All") {
        $sql .= " LIMIT " . $pageSize . " OFFSET " . ($page - 1) * $pageSize;
    }
    $local_list = mysql_query($sql, dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)) {
        $result[] = $local;
    }
    $msg = new Message();
    $msg->icon = 'success';
    $msg->title = "Load danh sách chủ đề thành công!";
    $msg->content = $result;
    $msg->statusCode = 200;
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
    $result= mysql_query("INSERT INTO topics(name,created_by) VALUES('" . $name . "','" . $created_by . "')", dbconnect());
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
        $msg->content = "Lỗi: ". mysql_error();
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
