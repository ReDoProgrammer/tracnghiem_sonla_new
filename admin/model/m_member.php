<?php
include('m_db.php');
include('classes/m_message.php');
include('classes/m_profile.php');
function login($username, $password)
{
    $sql = "SELECT * from members WHERE username ='" . $username . "' ";
    $result = mysql_query($sql, dbconnect());
    $count = mysql_num_rows($result);

    $msg = new Message();

    if ($count == 0) {
        $msg->statusCode = 404;
        $msg->content = "Tài khoản không tồn tại!";
        $msg->title = "Not found!";
        $msg->icon = "warning";
    } else {
        $sql .= " AND password = '" . MD5($password) . "'";
        $result = mysql_query($sql, dbconnect());
        $count = mysql_num_rows($result);

        if ($count == 0) {
            $msg->statusCode = 400;
            $msg->content = "Mật khẩu không chính xác!";
            $msg->title = "Bad request!";
            $msg->icon = "warning";
        } else {
            $sql .= " AND role_id = 1";
            $result = mysql_query($sql, dbconnect());
            $count = mysql_num_rows($result);

            if ($count == 0) {
                $msg->statusCode = 403;
                $msg->content = "Bạn không có quyền truy cập module này!";
                $msg->title = "Forbidden!";
                $msg->icon = "warning";
            } else {
                $m = mysql_fetch_array(mysql_query($sql, dbconnect()));               
                if ($m) {
                    $sql = "SELECT 
                    m.id as id,
                    m.username AS username,
                    m.fullname AS fullname,
                    DATE_FORMAT(m.birthdate,'%d/%m/%Y') AS birthdate,
                    CASE
                    WHEN (LENGTH(TRIM(m.address))>0) THEN CONCAT(m.address,', ',w.full_name,', ',d.full_name,', ',p.full_name)
                    ELSE CONCAT(w.full_name,', ',d.full_name,', ',p.full_name)
                    END AS address,
                    m.phone AS phone,
                    m.email AS email,
                    m.avatar as avatar,
                    m.role_id
                    FROM `members` m 
                    LEFT JOIN provinces p on m.province_code = p.code
                    LEFT JOIN districts d ON m.district_code = d.code
                    LEFT JOIN wards w ON m.ward_code = w.code
                    LEFT JOIN jobs j ON m.job_id = j.id                    
                    WHERE m.id = " . $m['id'];

                    $account = mysql_fetch_array(mysql_query($sql, dbconnect()));
                    if ($account) {
                        $profile = new Profile();
                        $profile->id = $account['id'];
                        $profile->username = $account['username'];
                        $profile->avatar = $account['avatar'];
                        $profile->fullname = $account['fullname'];
                        $profile->phone = $account['phone'];
                        $profile->email = $account['email'];
                        $profile->address = $account['address'];
                        $profile->job = $account['job'];
                        $profile->workplace = $account['workplace'];
                        $profile->role_id = $account['role_id'];

                        // Lưu trữ chuỗi vào session
                        session_start();
                        $_SESSION["admin"] = $profile;


                        $msg->statusCode = 200;
                        $msg->content = $_SESSION['admin'];
                        $msg->title = "Đăng nhập thành công!";
                        $msg->icon = "success";
                    }
                }
            }
        }
    }
    return $msg;
}
