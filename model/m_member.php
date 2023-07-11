<?php

/**
 * @author ict.sonla.gov.vn
 * @copyright 2012
 */
include_once('classes/m_message.php');
include_once('classes/m_profile.php');
include_once('m_db.php');

function CheckDuplicatePhone($phone, $user_id)
{
    $sql = "SELECT * FROM members WHERE phone = '" . $phone . "' AND id !='" . $user_id . "'";
    $result = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($result) {
        $msg->statusCode = 200;
        $msg->icon = "success";
        $msg->title = "Kiểm tra trùng lặp số điện thoại thành công!";
        $msg->content = mysql_num_rows($result);
    } else {
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->title = "Kiểm tra trùng lặp số điện thoại thất bại!";
        $msg->content = mysql_error();
    }
    return $msg;
}

function CheckDuplicateEmail($email, $user_id)
{
    $sql = "SELECT * FROM members WHERE email = '" . $email . "' AND id !='" . $user_id . "'";
    $result = mysql_query($sql, dbconnect());
    $msg = new Message();
    if ($result) {
        $msg->statusCode = 200;
        $msg->icon = "success";
        $msg->title = "Kiểm tra trùng lặp email thành công!";
        $msg->content = mysql_num_rows($result);
    } else {
        $msg->statusCode = 500;
        $msg->icon = "error";
        $msg->title = "Kiểm tra trùng lặp email thất bại!";
        $msg->content = mysql_error();
    }
    return $msg;
}

function mChangePassword($id,$current_password,$new_password){
    $sql = "SELECT * FROM members WHERE id = '".$id."' AND password = '".MD5($current_password)."'";
    $result = mysql_query($sql,dbconnect());
    $msg = new Message();
    if($result){
        if(mysql_num_rows($result) == 0){
            $msg->statusCode = 403;
            $msg->icon = "error";
            $msg->title = "Bad request!";
            $msg->content = "Mật khẩu hiện tại không chính xác";
        }else{
            $sql = "UPDATE members SET password = '".MD5($new_password)."' WHERE id = '".$id."'";
            $result = mysql_query($sql,dbconnect());
            if($result){
                $msg->title = "Đổi mật khẩu thành công!";
                $msg->statusCode =200;
                $msg->icon ="success";
            }else{
                $msg->icon ="error";
                $msg->title = "Thay đổi mật khẩu thất bại!";
                $msg->statusCode = 500;
                $msg->content = mysql_error();
            }
        }
    }else{
        $msg->icon ="error";
        $msg->title = "Thay đổi mật khẩu thất bại!";
        $msg->statusCode = 500;
        $msg->content = mysql_error();
    }
    return $msg;
}
function mChangeProfile(
    $id,
    $fullname,
    $avatar,
    $birthdate,
    $gender,
    $phone,
    $email,
    $province_code,
    $district_code,
    $ward_code,
    $address,
    $job_id,
    $workplace_id,
    $position,
    $working_unit
) {
    $avatarurl = '';
    $isupload = true;
    $msg = new Message();

    $sql = "SELECT avatar FROM members WHERE id = '" . $id . "'";
    $result = mysql_query($sql, dbconnect());
    if ($result && mysql_num_rows($result) > 0) {
        $m = mysql_fetch_array($result);
        if (strlen($m["avatar"]) > 0) {
            unlink('../../'+$m["avatar"]);
        }

        if (isset($avatar['name'])) {
            $avatardir = 'assets/images/upload/avatar/';
            $storeddir = '../../' . $avatardir;
            $filename = time() . '_' . basename($avatar["name"]);
            $uploadfile = $storeddir . $filename;
            $isupload = move_uploaded_file($avatar['tmp_name'], $uploadfile);
            if ($isupload) {
                $avatarurl = $avatardir . $filename;
            }
        }

        if ($isupload) {
            $sql = "UPDATE members
                SET fullname = '" . $fullname . "',
                    avatar = '" . $avatarurl . "',
                    gender = '" . $gender . "',
                    birthdate = '" . $birthdate . "',
                    phone = '" . $phone . "',
                    email = '" . $email . "',
                    province_code = '" . $province_code . "',
                    district_code = '" . $district_code . "',
                    ward_code = '" . $ward_code . "',
                    address = '" . $address . "',
                    job_id = '" . $job_id . "',
                    workplace_id = '" . $workplace_id . "',
                    position = '" . $position . "',
                    working_unit = '" . $working_unit . "',
                    get_gender = 1,
                    get_birthdate = 1,
                    get_job = 1,
                    get_position = 1,
                    get_workplace = 1,
                    get_working_unit = 1,
                    get_address = 1
                WHERE id = '" . $id . "'
                    ";
            $result = mysql_query($sql, dbconnect());
            $msg = new Message();

            if ($result) {
                $msg->title = "Cập nhật thông tin thành viên thành công. Bạn cần phải đăng nhập lại!";
                $msg->icon = "success";
                $msg->statusCode = 200;
                session_start();
                unset($_SESSION['profile']); 
            } else {
                $msg->title = "Cập nhật thông tin thành viên thất bại!";
                $msg->icon = "error";
                $msg->statusCode = 500;
                $msg->content = mysql_error();
            }
        }
    } else {
        $msg->title = "Không tìm thấy tài khoản phù hợp!";
        $msg->icon = "error";
        $msg->statusCode = 404;
    }


    return $msg;
}

function mDetail($id)
{
    $sql = "SELECT *,  DATE_FORMAT(birthdate,'%d/%m/%Y') as mBirthdate FROM members WHERE id = '" . $id . "'";
    $result = mysql_query($sql, dbconnect());

    $msg = new Message();

    if ($result && mysql_num_rows($result) > 0) {
        $detail = mysql_fetch_array($result);
        $msg->statusCode = 200;
        $msg->icon = "success";
        $msg->title = "Lấy thông tin chi tiết tài khoản thành công!";
        $msg->content = $detail;
    } else {
        $msg->icon = "error";
        $msg->title = "Lấy thông tin tài khoản thất bại";
        $msg->statusCode = 500;
        $msg->content = mysql_error();
    }
    return $msg;
}
function login($username_or_email, $login_password, $ip_address)
{
    $sql = "SELECT * from members WHERE (username ='" . $username_or_email . "' OR email = '" . $username_or_email . "') ";
    $result = mysql_query($sql, dbconnect());
    $count = mysql_num_rows($result);

    $msg = new Message();

    if ($count == 0) {
        $msg->statusCode = 404;
        $msg->content = "Email hoặc tài khoản không tồn tại!";
        $msg->title = "Not found!";
        $msg->icon = "warning";
    } else {
        $sql .= " AND password = '" . MD5($login_password) . "'";
        $result = mysql_query($sql, dbconnect());
        $count = mysql_num_rows($result);
        if ($count == 0) {
            $msg->statusCode = 400;
            $msg->content = "Mật khẩu không chính xác!";
            $msg->title = "Bad request!";
            $msg->icon = "warning";
        } else {

            $m = mysql_fetch_array(mysql_query($sql, dbconnect()));

            if ($m) {


                $sql = "SELECT m.id,
                m.username AS username,
                m.fullname AS fullname,
                DATE_FORMAT(m.birthdate,'%d/%m/%Y') AS birthdate,
                m.get_birthdate,
                CASE
                    WHEN (LENGTH(TRIM(m.address))>0) THEN CONCAT(m.address,', ',w.full_name,', ',d.full_name,', ',p.full_name)
                    ELSE CONCAT(w.full_name,', ',d.full_name,', ',p.full_name)
                END AS address,
                m.get_address,
                m.province_code,m.district_code,m.ward_code,m.address AS detail,

                CASE
                    WHEN m.gender=1 THEN 'Nam'
                    WHEN m.gender=0 THEN 'Nữ'
                    ELSE 'Khác'
                END AS gender,
                m.gender AS gender_value,
                m.get_gender,
                m.phone AS phone,
                m.email AS email,
                m.avatar as avatar,
                DATE_FORMAT( m.applied_date, '%d/%m/%Y %H:%i') AS applied_date,

                m.job_id,
                j.name AS job,
                m.get_job,

                m.workplace_id,
                wp.name AS workplace,     
                m.get_workplace, 

                m.position_id,
                ps.name AS postition,
                m.get_position,

                DATE_FORMAT(m.lasttime_login, '%d/%m/%Y %H:%i') AS lasttime_login,
                m.role_id 
                FROM `members` m 
                LEFT JOIN provinces p on m.province_code = p.code
                LEFT JOIN districts d ON m.district_code = d.code
                LEFT JOIN wards w ON m.ward_code = w.code
                LEFT JOIN jobs j ON m.job_id = j.id
                LEFT JOIN workplaces wp on m.workplace_id = wp.id
                LEFT JOIN positions ps ON m.position_id = ps.id
                WHERE m.id = " . $m['id'];

                $account = mysql_fetch_array(mysql_query($sql, dbconnect()));
                if ($account) {
                    $profile = new Profile();
                    $profile->id = $account['id'];
                    $profile->username = $account['username'];
                    $profile->avatar = $account['avatar'];
                    $profile->fullname = $account['fullname'];

                    $profile->birthdate = $account['birthdate'];
                    $profile->get_birthdate = $account['get_birthdate'];

                    $profile->gender = $account['gender'];
                    $profile->get_gender = $account['gen_gender'];

                    $profile->phone = $account['phone'];
                    $profile->email = $account['email'];

                    $profile->applied_date = $account['applied_date'];

                    $profile->address = $account['address'];
                    $profile->get_address = $account['get_address'];
                    $profile->province_code = $account['province_code'];
                    $profile->district_code = $account['district_code'];
                    $profile->ward_code = $account['ward_code'];
                    $profile->detail = $account['detail'];
                    $profile->get_address = $account['get_address'];

                    $profile->job = $account['job'];
                    $profile->get_job = $account['get_job'];
                    $profile->job_id = $account['job_id'];

                    $profile->workplace = $account['workplace'];
                    $profile->workplace_id = $account['workplace_id'];
                    $profile->get_workplace = $account['get_workplace'];

                    $profile->get_position = $account['get_position'];
                    $profile->position_id = $account['position_id'];
                    $profile->position = $account['position'];


                    $profile->role_id = $account['role_id'];

                    $profile->lasttime_login = $account['lasttime_login'];
                    $profile->newest_login = date('d/m/Y H:i');

                    $profile->current_ip_address = $ip_address;
                    $profile->old_ip_address = $ip_address;

                    // lưu thời điểm đăng nhập & ip address mới
                    $result = mysql_query("UPDATE members
                    SET ip_address='" . $ip_address . "',
                    lasttime_login =  CURRENT_TIMESTAMP()
                    WHERE id=" . $m['id'], dbconnect());

                    // Lưu trữ chuỗi vào session
                    session_start();
                    $_SESSION["profile"] = $profile;


                    $msg->statusCode = 200;
                    $msg->content = "Đăng nhập thành công!";
                    $msg->title = "Successfully!";
                    $msg->icon = "success";
                } else {
                    $msg->statusCode = 500;
                    $msg->content = "Lỗi: " . mysql_error();
                    $msg->title = "Xác thực tài khoản thất bại!";
                    $msg->icon = "error";
                }
            } else {
                $msg->statusCode = 500;
                $msg->content = "Lỗi: " . mysql_error();
                $msg->title = "Xác thực tài khoản thất bại!";
                $msg->icon = "error";
            }
        }
    }

    return $msg;
}

// kiem tra thong tin
function CheckPhoneExist($phone)
{
    $result = mysql_query("select * from members where phone ='" . $phone . "'", dbconnect());
    return mysql_num_rows($result);
}
function CheckUsernameExist($username)
{
    $result = mysql_query("SELECT * from members WHERE username ='" . $username . "'", dbconnect());
    return mysql_num_rows($result);
}
function CheckEmailExists($email)
{
    $result = mysql_query("SELECT * from members WHERE email ='" . $email . "'", dbconnect());
    return mysql_num_rows($result);
}


//insert new member
function Register(
    $fullname,
    $avatar,
    $username,
    $password,
    $email,
    $phone,
    $gender,
    $birthdate,
    $province_code,
    $district_code,
    $ward_code,
    $address,
    $job_id,
    $position,
    $workplace_id,
    $working_unit,
    $cfBirthdate,
    $cfGender,
    $cfAddress,
    $cfJob,
    $cfPosition,
    $cfWorkPlace,
    $cfWorkingUnit
) {
    $avatarurl = '';
    $isupload = true;
    $msg = new Message();

    if (isset($avatar['name'])) {
        $avatardir = 'assets/images/upload/avatar/';
        $storeddir = '../../' . $avatardir;
        $filename = time() . '_' . basename($avatar["name"]);
        $uploadfile = $storeddir . $filename;
        $isupload = move_uploaded_file($avatar['tmp_name'], $uploadfile);
        if ($isupload) {
            $avatarurl = $avatardir . $filename;
        }
    }

    if ($isupload) {
        $sql = "INSERT members 
                SET 
                    fullname = '" . $fullname . "',
                    avatar = '" . $avatarurl . "',
                    username = '" . $username . "',
                    password = '" . MD5($password) . "'
                    ,email = '" . $email . "'
                    ,phone = '" . $phone . "'
                    ";
        if ($cfBirthdate) {
            $sql .= ",birthdate = '" . $birthdate . "'";
        }

        if ($cfGender) {
            $sql .= ",gender = '" . $gender . "'";
        }

        if ($cfAddress) {
            $sql .= ",province_code = '" . $province_code . "',
            district_code = '" . $district_code . "',
            ward_code = '" . $ward_code . "',
            address = '" . $address . "'";
        }
        if ($cfJob) {
            $sql .= ",job_id = '" . $job_id . "'";
        }
        if ($cfPosition) {
            $sql .= ",position = '" . $position . "'";
        }
        if ($cfWorkPlace) {
            $sql .= ",workplace_id = '" . $workplace_id . "'";
        }
        if ($cfWorkingUnit) {
            $sql .= ",working_unit = '" . $working_unit . "'";
        }
        $sql .= ",get_birthdate='" . $cfBirthdate . "'";
        $sql .= ",get_gender='" . $cfGender . "'";
        $sql .= ",get_address='" . $cfAddress . "'";
        $sql .= ",get_job='" . $cfJob . "'";
        $sql .= ",get_position='" . $cfPosition . "'";
        $sql .= ",get_workplace='" . $cfWorkPlace . "'";
        $sql .= ",get_working_unit='" . $cfWorkingUnit . "'";

        $result = mysql_query($sql, dbconnect());


        if ($result && mysql_affected_rows() > 0) {
            $msg->icon = "success";
            $msg->statusCode = 201;
            $msg->title = "Đăng ký thành viên thành công!";
        } else {
            $msg->icon = "error";
            $msg->statusCode = 500;
            $msg->title = "Đăng ký thành viên thất bại!";
            $msg->content = mysql_error();
        }
    } else {
        $msg->icon = "error";
        $msg->statusCode = 500;
        $msg->title = "Upload avatar thất bại. Đăng ký thành viên không thành công!";
        $msg->content = mysql_error();
    }
    return $msg;
}
function getListmember($start, $limit)
{
    $local_list = mysql_query("SELECT * FROM members order by
        id_members desc
        limit " . (int) $start . "," . (int) $limit . "
        ", dbconnect());
    $result = array();
    while ($local = mysql_fetch_array($local_list)) {
        $result[] = $local;
    }
    return $result;
}


function totalmember()
{
    $result = mysql_query("select * from members", dbconnect());
    return mysql_num_rows($result);
}
function getmember($id)
{
    $pro = mysql_query("select * from members

    where id_members = '" . (int) $id . "'", dbconnect());
    return mysql_fetch_array($pro);
}

//cap nhat trong thu muc sua

function editmember($id, $local)
{
    mysql_query(
        "update members set
    email = '" . $local['email'] . "',
    ho_ten = '" . $local['ho_ten'] . "',
    ngay_sinh = '" . $local['ngay_sinh'] . "',
    yahoo = '" . $local['yahoo'] . "',
    web = '" . $local['web'] . "',
    gender = '" . $local['gender'] . "',
    dia_chi = '" . $local['dia_chi'] . "',  
    mobile = '" . $local['mobile'] . "'
    where id_members = '" . (int) $id . "'",
        dbconnect()
    );
}
function editpass($id, $local)
{
    mysql_query(
        "update members set    
    password = '" . $local['password'] . "'
    where id_members = '" . (int) $id . "'",
        dbconnect()
    );
}
//cai ham check mail dau ban//
//cai nay can kiem tra them l� nguoi dang dang nhap, neu so sanh moi mat khau khong thi se khong chinh x�c khi m� trong csdl c� 2 maatk kh?u v� t�nh gioongd nhau
function kiemtramatkhau($pwd, $uid)
{
    $result = mysql_query("select * from members where password ='" . $pwd . "' and id = '" . $uid . "' limit 1 ", dbconnect());
    return mysql_num_rows($result);
}
// lay dia chi ip va thoi gian dang lan dang nhap cuoi
function ip_time($id, $ip)
{
    mysql_query("update members set 
          add_ip = '" . $ip . "',
          time_login = NOW()
          where id_members = '" . (int) $id . "'", dbconnect());
}