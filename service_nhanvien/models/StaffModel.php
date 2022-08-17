<?php

use ServiceNhanVien\Core\DB;
/**
 * Class StaffModel
 */
class StaffModel extends DB
{
    const TABLE_NAME = 'nhan_vien';

    public function getTableName()
    {
        return self::TABLE_NAME;
    }

    public function getList()
    {
        $sql = "SELECT a.*, b.PB_TEN FROM {$this->getTableName()} a, phong_ban b WHERE a.NV_PhongBan = b.PB_ID AND a.NV_PhongBan <> 'pb003'";
        $result = mysqli_query($this->con, $sql);
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $row['NV_NSinh'] = date('d/m/Y', strtotime($row['NV_NSinh']));
            $data[] = $row;
        }

        return ['data' => $data];
    }

    public function getById($id)
    {
        $sql = "SELECT a.*, b.PB_TEN FROM {$this->getTableName()} a, phong_ban b WHERE a.NV_PhongBan = b.PB_ID AND a.NV_ID = '{$id}'";
        return mysqli_fetch_assoc(mysqli_query($this->con, $sql));
    }

    public function getManagerLevel1($id)
    {
        $sql = "SELECT ID_QLI FROM quan_li WHERE ID_NV = '{$id}'";
        return mysqli_fetch_assoc(mysqli_query($this->con, $sql));
    }

    public function getManagerLevel2($id)
    {
        $sql = "SELECT ID_QLI FROM quan_li WHERE ID_NV IN (SELECT ID_QLI FROM quan_li WHERE ID_NV = '{$id}') limit 1";
        return mysqli_fetch_assoc(mysqli_query($this->con, $sql));
    }
}