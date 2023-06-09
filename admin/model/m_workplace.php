<?php

/**
 * @author ReDo
 * @copyright 2023
 */

include('m_db.php');
include('classes/m_message.php');

function ProvincesWorkplaces($search){
    $sql = "SELECT p.full_name AS province, 
            CONCAT('[', GROUP_CONCAT(CONCAT('{\"id\": ', w.id, ', \"name\": \"', w.name, '\"}')), ']') AS workplaces
            FROM provinces p
            JOIN workplaces w ON p.code = w.province_code
            WHERE w.name like '%" . $search . "%' 
            GROUP BY p.full_name
            LIMIT 10;";

    $result = mysql_query($sql,dbconnect());
    $msg = new Message();
    if($result){
        $arr = array();
        while ($local = mysql_fetch_array($result)) {
            $arr[] = $local;
        }
        $msg->icon = "success";
        $msg->title = "Load đơn vị công tác theo tỉnh thành thành công!";
        $msg->content = $arr;
        $msg->statusCode = 200;
    }else{
        $msg->icon = 500;
        $msg->title = "Load đơn vị công tác theo tỉnh thành thất bại";
        $msg->content = mysql_error();
        $msg->icon ="error";
    }
    return $msg;
}

function countPages($search, $pageSize)
{
    $msg = new Message();

    $result = mysql_query("SELECT id
    FROM topics t
    WHERE t.name like '%" . $search . "%' ", dbconnect());
    if ($result) {
        $count = mysql_num_rows($result);
        $pages = $count % $pageSize == 0 ? $count / $pageSize : floor($count / $pageSize) + 1;

        $msg->title = 'Load số trang thành công!';
        $msg->statusCode = 200;
        $msg->content = $pages;
    } else {
        $msg->title = 'Load số trang thành công!';
        $msg->statusCode = 500;
        $msg->content = "Lỗi: " . mysql_error();
    }
    return $msg;
}
function retrieve($page, $search, $pageSize)
{

    $sql = "SELECT wp.id,wp.name,wp.phone,wp.email,wp.fax,
    CASE
        WHEN LENGTH(wp.address) THEN CONCAT(wp.address,', ',w.name,', ',d.full_name,', ',p.full_name)
        ELSE CONCAT(w.name,', ',d.full_name,', ',p.full_name)
    END as address,
    wp.created_at,m.fullname AS created_by
    FROM workplaces wp      
    INNER JOIN members m ON wp.created_by = m.id
    INNER JOIN provinces p ON wp.province_code = p.code
    INNER JOIN districts d ON wp.district_code = d.code
    INNER JOIN wards w ON wp.ward_code = w.code
    WHERE wp.name like '%" . $search . "%'  
    OR wp.phone like '%" . $search . "%'      
    OR wp.fax like '%" . $search . "%'      
    OR wp.email like '%" . $search . "%'      
    ORDER BY wp.name ";

    // nếu kích thước trang truyền vào không phải là all (tất cả)
    if ($pageSize != "All") {
        $sql .= " LIMIT " . $pageSize . " OFFSET " . ($page - 1) * $pageSize;
    }
    $local_list = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($local_list) {
        $result = array();
        while ($local = mysql_fetch_array($local_list)) {
            $result[] = $local;
        }

        $msg->icon = 'success';
        $msg->title = "Load danh sách đơn vị công tác thành công!";
        $msg->content = $result;
        $msg->statusCode = 200;
    } else {
        $msg->icon = 'error';
        $msg->title = "Load danh sách đơn vị công tác thất bại!";
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
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
    $wp = mysql_query("select *  FROM workplaces  WHERE id = " . $id, dbconnect());
    $msg = new Message();
    $result = mysql_fetch_array($wp);
    if ($wp) {
        $msg->icon = "success";
        $msg->title = "Lấy thông tin chi tiết của đơn vị công tác thành công!";
        $msg->content = $result;
        $msg->statusCode = 200;
    } else {
        $msg->icon = "error";
        $msg->title = "Lấy thông tin chi tiết của đơn vị công tác thất bại!";
        $msg->content = mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}

function create($name, $phone, $email, $province_code, $district_code, $ward_code, $address, $fax, $created_by)
{
    $msg = new Message();
    $result = mysql_query(
        "INSERT INTO 
    workplaces(name,phone,email,province_code,district_code,ward_code,address,fax,created_by) 
    VALUES('" . $name . "','" . $phone . "','" . $email . "','" . $province_code . "','" . $district_code . "','" . $ward_code . "','" . $address . "','" . $fax . "','" . $created_by . "')",
        dbconnect()
    );
    if ($result && mysql_affected_rows() > 0) {
        $msg->icon = "success";
        $msg->title = "Thêm mới đơn vị công tác thành công!";
        $msg->statusCode = 201;
    } else {
        $msg->icon = "error";
        $msg->title = "Thêm mới đơn vị công tác thất bại!";
        $msg->statusCode = 404;
        $msg->content = "Lỗi: " . mysql_error();
    }
    return $msg;
}

function update($id, $name, $phone, $email, $province_code, $district_code, $ward_code, $address, $fax, $updated_by)
{
    $result = mysql_query("UPDATE workplaces 
    SET name='" . $name . "',   
        phone = '" . $phone . "',    
        fax = '" . $fax . "',    
        email = '" . $email . "',    
        province_code = '" . $province_code . "',    
        district_code = '" . $district_code . "',    
        ward_code = '" . $ward_code . "',    
        address = '" . $address . "',    
        updated_by=" . $updated_by . ",
        updated_at=CURRENT_TIMESTAMP()
    WHERE id =" . $id, dbconnect());

    $msg = new Message();
    if ($result && mysql_affected_rows() > 0) {
        $msg->icon = 'success';
        $msg->title = 'Cập nhật đơn vị công tác thành công!';
        $msg->statusCode = 200;
    } else {
        $msg->icon = 'error';
        $msg->title = 'Cập nhật đơn vị công tác thất bại! Lỗi: ';
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}
function delete($id)
{
    $msg = new Message();

    $result = mysql_query("SELECT id FROM members where workplace_id= " . $id, dbconnect());
    $count = mysql_num_rows($result);

    if ($count > 0) {
        $msg->icon = 'error';
        $msg->title = 'Ràng buộc dữ liệu';
        $msg->content = "Không thể xóa đơn vị công tác này khi có " . $count . " câu hỏi tham chiếu tới nó";
        $msg->statusCode = 403;
        return $msg;
    }

    $result = mysql_query("DELETE FROM workplaces WHERE id= " . $id, dbconnect());

    if ($result && mysql_affected_rows() > 0) {
        $msg->icon = 'success';
        $msg->title = 'Xóa đơn vị công tác thành công!';
        $msg->statusCode = 200;
    } else {
        $msg->icon = 'error';
        $msg->title = 'Xóa đơn vị công tác thất bại! Lỗi: ';
        $msg->content = "Lỗi: " . mysql_error();
        $msg->statusCode = 500;
    }
    return $msg;
}
