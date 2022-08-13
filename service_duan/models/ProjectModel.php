<?php

use ServiceDuAn\Core\DB;
/**
 * Class ProjectModel
 */
class ProjectModel extends DB
{
    const TABLE_NAME = 'tham_gia_du_an';

    public function getTableName()
    {
        return self::TABLE_NAME;
    }

    public function getProjectByStaff($id)
    {
        $sql = "SELECT * FROM {$this->getTableName()} a, du_an b WHERE b.DA_ID = a.TG_IDDA AND TG_IDNV = '{$id}'";
        $result = mysqli_query($this->con, $sql);
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }

        return $data;
    }
}