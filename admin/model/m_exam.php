<?php

/**
 * @author ReDo
 * @copyright 2023
 */


include_once('m_db.php');
include('classes/m_message.php');

function delete_result($result_id)
{
    $msg = new Message();
    //B1: kiểm tra tồn tại của kết quả bài thi
    $sql = "SELECT * FROM exam_results WHERE id = '" . $result_id . "'";
    $result = mysql_query($sql, dbconnect());



    if ($result && mysql_num_rows($result) > 0) {
        $fr = mysql_fetch_array($result); //focus row: dòng được chọn


        //B2: Xóa kết quả bài thi được chọn trong 2 bảng: exam_results và exam_result_details
        $sql = "DELETE exam_results, exam_result_details
                FROM exam_results
                LEFT JOIN exam_result_details ON exam_results.id = exam_result_details.exam_result_id
                WHERE exam_results.id = '" . $result_id . "'";

        $result = mysql_query($sql, dbconnect());

        if ($result && mysql_affected_rows() > 0) {
            //B3: Cập nhật lại chỉ số lần thi cho các kết quả khác của bài thi tương ứng
            $sql = "UPDATE exam_results 
                    SET times = times -1    
                    WHERE exam_id = " . $fr['exam_id'] . "
                    AND times > " . $fr['times'];
            $result = mysql_query($sql, dbconnect());

            if ($result) {
                $msg->icon = "success";
                $msg->statusCode = 200;
                $msg->title = "Xóa kết quả bài thi thành công!";
            } else {
                $msg->icon = "error";
                $msg->statusCode = 500;
                $msg->title = "Cập nhật lần thi thất bại";
                $msg->content = mysql_error();
            }
        } else {
            $msg->icon = "error";
            $msg->statusCode = 500;
            $msg->title = "Xóa kết quả bài thi thất bại";
            $msg->content = mysql_error();
        }
    } else {
        $msg->icon = "error";
        $msg->title = "Không tìm thấy kết quả bài thi phù hợp";
        $msg->statusCode = 404;
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
function exResultSummary($result_id, $candidate)
{
    $sql = "SELECT 
            er.id, e.exam_code, e.title, e.duration,e.mark_per_question,
            m.username,m.fullname,m.phone,m.email,m.avatar,er.times,
            COUNT(CASE WHEN erd.question_answer = erd.option_id THEN 1 END) AS correct,
            COUNT(CASE WHEN erd.question_answer != erd.option_id AND erd.option_id !=0 THEN 1 END) AS wrong,
            COUNT(CASE WHEN erd.option_id = 0 THEN 1 END) AS unchoosed,
            COUNT(CASE WHEN erd.option_id !=0 THEN 1 END) AS choosed,
            COUNT( erd.exam_result_id ) AS total_questions,
            er.spent_duration,
            DATE_FORMAT(er.created_at, '%d/%m/%Y %H:%i') AS exam_date
            FROM exams e
            INNER JOIN exam_results er ON er.exam_id = e.id
            INNER JOIN members m ON er.member_id = m.id
            INNER JOIN exam_result_details erd ON erd.exam_result_id = er.id
            WHERE er.member_id = '" . $candidate . "'
            AND er.id = '" . $result_id . "'
            GROUP BY er.id";
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
function History($page, $search, $pageSize, $workplaces, $exams)
{
    $sql = "SELECT m.id AS candidate,er.id AS result_id,m.username,m.fullname,
                CASE 
                    WHEN m.gender = 1 THEN 'Nam'
                    WHEN m.gender = 0 THEN 'Nữ'
                    ELSE 'Khác'
                END AS gender,
                m.get_birthdate,DATE_FORMAT( m.get_birthdate,'%d/%m/%Y') AS birthdate,
                m.phone,m.email,
                m.get_job,j.name AS job,
                m.get_workplace,wp.name AS workplace,
                m.get_position,p.name AS position,
                e.title AS exam,
                er.times,
                (COUNT(CASE WHEN erd.option_id =erd.question_answer THEN 1 END)*e.mark_per_question) AS mark ,
                COUNT(erd.question_id)*e.mark_per_question AS total_marks,
                DATE_FORMAT(er.started_at,'%d/%m/%Y %T') AS exam_date,
                er.spent_duration 
            FROM members m
            LEFT JOIN jobs j ON m.job_id = j.id
            LEFT JOIN workplaces wp ON m.workplace_id = wp.id
            LEFT JOIN positions p ON m.position_id = p.id
            JOIN exam_results er ON er.member_id = m.id
            JOIN exam_result_details erd ON erd.exam_result_id = er.id 
            JOIN exams e ON er.exam_id = e.id 
            WHERE   (m.username LIKE '%" . $search . "%'
                    OR m.fullname LIKE '%" . $search . "%'
                    OR m.phone LIKE '%" . $search . "%'
                    OR m.email LIKE '%" . $search . "%'
                    OR wp.name LIKE '%" . $search . "%'
                    OR j.name LIKE '%" . $search . "%') ";


    if ($workplaces) {
        $sql .= " AND wp.id IN (";
        for ($i = 0; $i < count($workplaces); $i++) {
            $sql .= $i < count($workplaces) - 1 ? $workplaces[$i] . "," : $workplaces[$i];
        }
        $sql .= ")";
    }
    if ($exams) {
        $sql .= " AND e.id IN (";
        for ($i = 0; $i < count($exams); $i++) {
            $sql .= $i < count($exams) - 1 ? $exams[$i] . "," : $exams[$i];
        }
        $sql .= ")";
    }
    $sql .= " GROUP BY m.id,er.id";

    //Tính số trang của kết quả tìm được dựa vào kích thước trang & số dòng của kết quả
    $pages = 1;
    if (strcmp($pageSize, "All")!=0) {
        $result = mysql_query($sql, dbconnect());

        $totalRows = mysql_num_rows($result);
        $pages = $totalRows % $pageSize == 0 ? $totalRows / $pageSize : floor($totalRows / $pageSize) + 1;
        $sql .= " LIMIT " . ($page - 1) * $pageSize . "," . $pageSize . "";
    }


    $result = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($result) {
        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }


        $msg->icon = "success";
        $msg->statusCode = 200;
        $msg->title = "Lấy danh sách lịch sử thi thành công!";
        $msg->content = $arr;
        $msg->pages = $pages;
    } else {
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->title = "Load lịch sử thi thất bại!";
        $msg->content = mysql_error();
    }

    return $msg;
}
function LoadResultByExamsAndWorkplaces($exams, $workplaces, $page, $pageSize, $max)
{

    $sql = "SELECT m.id AS candidate,er.id AS result_id,m.username,m.fullname,
                CASE 
                    WHEN m.gender = 1 THEN 'Nam'
                    WHEN m.gender = 0 THEN 'Nữ'
                    ELSE 'Khác'
                END AS gender,
                m.get_birthdate,DATE_FORMAT( m.get_birthdate,'%d/%m/%Y') AS birthdate,
                m.phone,m.email,
                m.get_job,j.name AS job,
                m.get_workplace,wp.name AS workplace,
                m.get_position,p.name AS position,
                e.title AS exam,
                er.times,
                (COUNT(CASE WHEN erd.option_id =erd.question_answer THEN 1 END)*e.mark_per_question) AS mark ,
                COUNT(erd.question_id)*e.mark_per_question AS total_marks,
                DATE_FORMAT(er.started_at,'%d/%m/%Y %T') AS exam_date,
                er.spent_duration 
            FROM members m
            LEFT JOIN jobs j ON m.job_id = j.id
            LEFT JOIN workplaces wp ON m.workplace_id = wp.id
            LEFT JOIN positions p ON m.position_id = p.id
            JOIN exam_results er ON er.member_id = m.id
            JOIN exam_result_details erd ON erd.exam_result_id = er.id 
            JOIN exams e ON er.exam_id = e.id 
            WHERE 1 = 1";
    if ($workplaces) {
        $sql .= " AND wp.id IN (";
        for ($i = 0; $i < count($workplaces); $i++) {
            $sql .= $i < count($workplaces) - 1 ? $workplaces[$i] . "," : $workplaces[$i];
        }
        $sql .= ")";
    }
    if ($exams) {
        $sql .= " AND e.id IN (";
        for ($i = 0; $i < count($exams); $i++) {
            $sql .= $i < count($exams) - 1 ? $exams[$i] . "," : $exams[$i];
        }
        $sql .= ")";
    }
    if($max == 1){
        $sql.= " GROUP BY m.id,e.id ORDER BY total_marks DESC";
    }else{        
        $sql .= " GROUP BY m.id,er.id";
    }
    

    //Tính số trang của kết quả tìm được dựa vào kích thước trang & số dòng của kết quả
    $pages = 1;
    if (strcmp($pageSize, "All")!=0) {
        $result = mysql_query($sql, dbconnect());

        $totalRows = mysql_num_rows($result);
        $pages = $totalRows % $pageSize == 0 ? $totalRows / $pageSize : floor($totalRows / $pageSize) + 1;
        $sql .= " LIMIT " . ($page - 1) * $pageSize . "," . $pageSize . "";
    }



    $result = mysql_query($sql, dbconnect());

    $msg = new Message();
    if ($result) {
        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }


        $msg->icon = "success";
        $msg->statusCode = 200;
        $msg->title = "Lấy danh sách lịch sử thi thành công!";
        $msg->content = $arr;
        $msg->pages = $pages;
    } else {
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->title = "Load lịch sử thi thất bại!";
        $msg->content = mysql_error();
    }

    return $msg;
}
function all()
{
    $sql = "SELECT id,title FROM exams";
    $result = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($result) {
        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }
        $msg->statusCode = 200;
        $msg->icon = "success";
        $msg->title = "Lấy danh sách cuộc thi thành công!";
        $msg->content = $arr;
    } else {
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->title = "Lấy danh sách cuộc thi thất bại!";
        $msg->content = mysql_error();
    }
    return $msg;
}

//hàm thay đổi thuộc tính đảo đáp án của cuộc thi
function change_random_options($id, $random_options)
{
    //Cập nhật tất cả các bài thi khác thành không tiêu điểm
    $msg = new Message();

    $checked = $random_options == 1 ? 0 : 1;

    $result = mysql_query("UPDATE exams SET random_options = '" . $checked . "' WHERE id= " . $id, dbconnect());

    if ($result && mysql_affected_rows() > 0) {
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
        if ($chk->statusCode != 200) {
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

function setCode($id)
{
    $idx =  $id < 1000000 ? "0" . (string)$id :
        $id < 100000 ? "00" . (string)$id :
        $id < 10000 ? "000" . (string)$id :
        $id < 1000 ? "0000" . (string)$id :
        $id < 100 ? "00000" . (string)$id :
        $id < 10 ? "000000" . (string)$id : $id;

    $exam_code = "EX" . date("Y") . $idx;

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
