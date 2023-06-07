<?php
class Profile
{
    public $id;
    public $username;
    public $applied_date;
    public $avatar;
    public $fullname;
    public $birthdate;
    public $gender;
    public $phone;
    public $email;
    public $address;
    public $job;
    public $workplace;
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
