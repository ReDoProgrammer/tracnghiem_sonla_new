<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('m_db.php');
include('classes/m_message.php');

function read($search)
{
    $sql = "SELECT 
        p.id,
        p.name,
        p.created_at,
        m.fullname AS created_by
    FROM positions p
    INNER JOIN members m ON p.created_by = m.id
    WHERE name like '%" . $search . "%'";
    $local_list = mysql_query($sql, dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)) {
        $result[] = $local;
    }
    $msg = new Message();
    $msg->icon = 'success';
    $msg->title = "Load danh sách chức vụ thành công!";
    $msg->content = $result;
    $msg->statusCode = 200;
    return $msg;
}




function detail($id)
{
    $position = mysql_query("SELECT * FROM positions WHERE id = " . $id, dbconnect());
    $msg = new Message();
    $msg->icon = 'success';
    $msg->title = 'Lấy thông tin chức vụ thành công!';
    $msg->content = mysql_fetch_array($position);
    $msg->statusCode = 200;
    return $msg;
}



function create($name, $created_by)
{
    $msg = new Message();
    $result = mysql_query("INSERT INTO positions(name,created_by) VALUES('" . $name . "','" . $created_by . "')", dbconnect());
    if ($result && mysql_affected_rows() > 0) {
        $msg->icon = "success";
        $msg->title = "Thêm mới chức vụ thành công!";
        $msg->statusCode = 201;
    } else {
        $msg->icon = "error";
        $msg->title = "Thêm mới chức vụ thất bại!";
        $msg->statusCode = 404;
        $msg->content = "Lỗi: " . mysql_error();
    }
    return $msg;
}

function update($id, $name, $updated_by)
{
    $result = mysql_query("UPDATE positions 
    SET name='" . $name . "',       
        updated_by=" . $updated_by . ",
        updated_at=CURRENT_TIMESTAMP()
    WHERE id =" . $id, dbconnect());

    $msg = new Message();
    if ($result && mysql_affected_rows()) {

        $msg->icon = 'success';
        $msg->title = 'Cập nhật chức vụ thành công!';
        $msg->statusCode = 200;
    } else {
        $msg->icon = 'error';
        $msg->title = 'Cập nhật chức vụ thất bại!';
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}
function delpos($id)
{
    $msg = new Message();

    $result = mysql_query("SELECT id FROM members WHERE position_id= " . $id, dbconnect());
    $count = mysql_num_rows($result);

    if ($count > 0) {
        $msg->icon = 'error';
        $msg->title = 'Ràng buộc dữ liệu';
        $msg->content = "Không thể xóa chức vụ này khi có " . $count . " người dùng tham chiếu tới nó";
        $msg->statusCode = 403;
        return $msg;
    }

    $result = mysql_query("DELETE FROM positions WHERE id= " . $id, dbconnect());

    if ($result && mysql_affected_rows()) {
        $msg->icon = 'success';
        $msg->title = 'Xóa chức vụ thành công!';
        $msg->statusCode = 200;
    } else {
        $msg->icon = 'error';
        $msg->title = 'Xóa chức vụ thất bại! Lỗi: ';
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}
