<?php

/**
 * @author ReDo
 * @copyright 2023
 */


include_once('m_db.php');
include('classes/m_message.php');

//hàm thay đổi thuộc tính đảo đáp án của cuộc thi
function change_random_options($id, $random_options)
{
    //Cập nhật tất cả các bài thi khác thành không tiêu điểm
    $msg = new Message();

    $checked = $random_options ==1?0:1;

    $result = mysql_query("UPDATE exams SET random_options = '" . $checked . "' WHERE id= " . $id, dbconnect());

    if ($result && mysql_affected_rows()>0) {
        $msg->statusCode = 200;
        $msg->icon = "success";
        $msg->title = "Cập nhật trạng thái đảo đáp án của bài thi thành công!";
    } else {
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->title = "Cập nhật trạng thái đảo đáp án của bài thi thất bại!";
        $msg->content = "Lỗi: " . mysql_error();
    }

    return $msg;
}

//hàm thay đổi thuộc tính cuộc thi tiêu điểm
function change_hot($id, $is_hot)
{
    //Cập nhật tất cả các bài thi khác thành không tiêu điểm
    $result = mysql_query("UPDATE exams SET is_hot = 0 ", dbconnect());
    $msg = new Message();
    if ($result) {
        $is_hot = $is_hot == 1 ? 0 : 1;
        $result = mysql_query("UPDATE exams SET is_hot = '" . $is_hot . "' WHERE id= " . $id, dbconnect());

        if ($result && mysql_affected_rows() > 0) {
            $msg->statusCode = 200;
            $msg->icon = "success";
            $msg->title = "Cập nhật trạng thái tiêu điểm của bài thi thành công!";
        } else {
            $msg->statusCode = 500;
            $msg->icon = "error";
            $msg->title = "Cập nhật trạng thái tiêu điểm của bài thi thất bại!";
            $msg->content = "Lỗi: " . mysql_error();
        }
    } else {
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->title = "Cập nhật trạng thái tiêu điểm của các bài thi thất bại!";
        $msg->content = "Lỗi: " . mysql_error();
    }
    return $msg;
}
function countPages($search, $pageSize)
{
    $result = mysql_query("SELECT id
    FROM exams e
    WHERE e.title like '%" . $search . "%' ", dbconnect());
    $count = mysql_num_rows($result);
    $pages = $count % $pageSize == 0 ? $count / $pageSize : floor($count / $pageSize) + 1;
    return $pages;
}
function retrieve($page, $search, $pageSize)
{
    $sql = "SELECT 
        e.id,
        e.thumbnail,
        e.title,
        e.duration,
        e.number_of_questions,
        e.mark_per_question,
        e.times,
        DATE(e.begin) AS begin,DATE(e.end) AS end,
        e.random_questions,
        e.is_hot,
        e.regulation,
        e.random_options
    FROM exams e
    WHERE e.title like '%" . $search . "%'
    OR e.description like '%" . $search . "%'       
    ORDER BY e.is_hot DESC, e.begin DESC";

    // nếu kích thước trang truyền vào không phải là all (tất cả)
    if ($pageSize != "All") {
        $sql .= " LIMIT " . $pageSize . " OFFSET " . ($page - 1) * $pageSize;
    }
    $local_list = mysql_query($sql, dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)) {
        $result[] = $local;
    }
    return $result;
}


function detail($id)
{
    $topic = mysql_query("select * FROM exams WHERE id = " . $id, dbconnect());
    return mysql_fetch_array($topic);
}

function create($title, $thumbnail, $description, $duration, $number_of_questions, $mark_per_question, $times, $begin, $end, $random_options, $is_hot, $regulation, $created_by)
{
    /*
        Nếu cuộc thi được tick vào là cuộc thi tiêu điểm
        => update các cuộc thi còn lại trở thành không
        => Chỉ có 1 cuộc thi là tiêu điểm
    */
    if ($is_hot) {
        $result = mysql_query("UPDATE exams SET is_hot = 0 ", dbconnect());
    }

    $result = mysql_query("INSERT INTO exams(
        title,
        thumbnail,
        description,
        duration,
        number_of_questions,
        mark_per_question,
        times,
        begin,
        end,
        random_options,
        is_hot,
        regulation,
        created_by) 
    VALUES('" . $title . "','" . $thumbnail . "','" . $description . "'," . $duration . "," . $number_of_questions . ",
    " . $mark_per_question . "," . $times . ",'" . $begin . "','" . $end . "'," . $random_options . ",'" . $is_hot . "','" . $regulation . "'," . $created_by . ")", dbconnect());

    $msg = new Message();
    if ($result && mysql_affected_rows() > 0) {
        $chk = setCode(mysql_insert_id());
        if($chk->statusCode !=200){
            return $chk;
        }
        $msg->statusCode = 201;
        $msg->icon = 'success';
        $msg->title = "Tạo mới cuộc thi thành công!";
    } else {
        $msg->icon = 'error';
        $msg->title = 'Tạo cuộc thi thất bại';
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}

function update($id, $title, $thumbnail, $description, $duration, $number_of_questions, $mark_per_question, $begin, $end, $random_options, $is_hot, $regulation, $updated_by)
{
    $result = mysql_query("UPDATE exams 
    SET title='" . $title . "',
        thumbnail = '" . $thumbnail . "',       
        description = '" . $description . "',
        duration = " . $duration . ",
        number_of_questions = " . $number_of_questions . ",
        mark_per_question = " . $mark_per_question . ",
        begin = '" . $begin . "',
        end = '" . $end . "',       
        random_options = " . $random_options . ",
        is_hot = " . $is_hot . ",
        regulation = " . $regulation . ",
        updated_by=" . $updated_by . ",
        updated_at=CURRENT_TIMESTAMP()
    WHERE id =" . $id, dbconnect());
    $msg = new Message();
    if ($result && mysql_affected_rows() > 0) {
        $msg->statusCode = 200;
        $msg->icon = 'success';
        $msg->title = "Cập nhật cuộc thi thành công!";
    } else {
        $msg->icon = 'error';
        $msg->title = 'Cập nhật cuộc thi thất bại';
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}
function delete($id)
{
    $result = mysql_query("delete from exams where id= " . $id, dbconnect());
    $msg = new Message();
    if ($result && mysql_affected_rows() > 0) {
        $msg->statusCode = 200;
        $msg->icon = 'success';
        $msg->title = "Xóa cuộc thi thành công!";
    } else {
        $msg->icon = 'error';
        $msg->title = 'Xóa cuộc thi thất bại';
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}

function setCode($id){
    $idx =  $id<1000000?"0".(string)$id:
            $id<100000?"00".(string)$id:
            $id<10000?"000".(string)$id:
            $id<1000?"0000".(string)$id:
            $id<100?"00000".(string)$id:
            $id<10?"000000".(string)$id:$id;
   
    $exam_code = "EX".date("Y").$idx;

    $result = mysql_query("UPDATE exams 
    SET exam_code='" . $exam_code . "'
    WHERE id =" . $id, dbconnect());
    $msg = new Message();
    if ($result && mysql_affected_rows() > 0) {
        $msg->statusCode = 200;
        $msg->icon = 'success';
        $msg->title = "Cập nhật exam code thành công!";
    } else {
        $msg->icon = 'error';
        $msg->title = 'Cập nhật exam code thất bại';
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}