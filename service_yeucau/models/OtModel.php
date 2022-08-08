<?php

use ServiceYeuCau\Core\DB;
/**
 * Class OtModel
 */
class OtModel extends DB
{
    const TABLE_NAME = 'yeu_cau_ot';

    public function getTableName()
    {
        return self::TABLE_NAME;
    }

    public function getList()
    {
        $sql = "SELECT * FROM {$this->getTableName()} WHERE OT_IDNV = " . $_GET['id'];
        $result = mysqli_query($this->con, $sql);
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }

        return ['success' => true, 'data' => $data];
    }
}