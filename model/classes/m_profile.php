<?php
class Profile
{
    public $id;
    public $username;
    public $applied_date;
    public $avatar;
    public $fullname;

    public $birthdate;
    public $get_birthdate = 1;

    public $gender;
    public $gender_value =-1;
    public $get_gender = 1;

    public $phone;
    public $email;

    public $address;
    public $province_code = '';
    public $district_code = '';
    public $ward_code = '';
    public $detail = '';
    public $get_address = 1;

    public $job;
    public $job_id = 0;
    public $get_job = 1;

    public $workplace;
    public $workplace_id = 0;
    public $get_workplace = 1;

    public $position = '';
    public $get_position = 1;
    public $position_id = 0;

    public $lasttime_login;
    public $newest_login;
    public $role_id;
    public $current_ip_address;
    public $old_ip_address;

    // Phương thức __get() để truy cập vào các thuộc tính bị ẩn
    public function __get($name)
    {
        return $this->$name;
    }
}
