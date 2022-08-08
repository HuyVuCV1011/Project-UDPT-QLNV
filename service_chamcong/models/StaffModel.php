<?php

use ServiceChamCong\Core\DB;
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
        $sql = "SELECT a.*, b.PB_TEN FROM {$this->getTableName()} a, phong_ban b WHERE a.NV_PhongBan = b.PB_ID";
        $result = mysqli_query($this->con, $sql);
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }

        return ['success' => true, 'data' => $data];
    }
}