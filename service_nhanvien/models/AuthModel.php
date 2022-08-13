<?php

use ServiceNhanVien\Core\DB;
/**
 * Class AuthModel
 */
class AuthModel extends DB
{
    const TABLE_NAME = 'nhan_vien';

    public function getTableName()
    {
        return self::TABLE_NAME;
    }

    public function check($username,$password)
    {
        $sql = "SELECT * FROM {$this->getTableName()}";
        $result = mysqli_query($this->con, $sql);
        if(mysqli_num_rows($result) > 0){
            while($row = mysqli_fetch_assoc($result)){
                if ($row['NV_ID'] == $username && $password == $row['NV_MatKhau']) {
                    $token = openssl_random_pseudo_bytes(16);
                    $token[6] = chr(ord($token[6]) & 0x0f | 0x40); // set version to 0100
                    $token[8] = chr(ord($token[8]) & 0x3f | 0x80); // set bits 6-7 to 10
                    return ['success' => true, 'token' => vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($token), 4)), 'data' => $row];
                }
            }
        }
        return ['success' => false, 'error' => 'Email / Password is not correct'];
    }
}