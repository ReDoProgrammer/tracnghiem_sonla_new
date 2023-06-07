<?php
class Profile
{
    public $id;
    public $username;
    public $avatar;
    public $fullname;
    public $phone;
    public $email;
    public $address;
    public $job;
    public $workplace;
    public $role_id;

    // Phương thức __get() để truy cập vào các thuộc tính bị ẩn
    public function __get($name)
    {
        return $this->$name;
    }
}
