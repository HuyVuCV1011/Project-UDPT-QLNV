<?php

use ServiceYeuCau\Core\DB;
/**
 * Class WfhModel
 */
class WfhModel extends DB
{
    const TABLE_NAME = 'yeu_cau_lam_viec_tai_nha';

    public function getTableName()
    {
        return self::TABLE_NAME;
    }

    public function getWfhByStaff($id, $manager)
    {
        $sql = "SELECT * FROM {$this->getTableName()} WHERE TN_IDNV = '{$id}' ORDER BY TN_ID DESC";
        $result = mysqli_query($this->con, $sql);
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $row['TN_NGAYBD'] = date('d/m/Y', strtotime($row['TN_NGAYBD']));
            $row['TN_NGAYKT'] = date('d/m/Y', strtotime($row['TN_NGAYKT']));
            $row['TN_DUYET'] = $row['TN_DUYET'] == 0 ? 'Chờ duyệt' : ($row['TN_DUYET'] == 1 ? 'Chấp nhận' : 'Từ chối');
            $row['TN_LIDOTUCHOI'] = is_null($row['TN_LIDOTUCHOI']) ? 'N/A' : $row['TN_LIDOTUCHOI'];
            $row['TN_IDNGUOIDUYET'] = is_null($manager) ? $row['TN_IDNGUOIDUYET'] : $manager;
            $data[] = $row;
        }

        return ['data' => $data];
    }

    public function addWfh($id, $startDate, $endDate, $content)
    {

    }

    public function deleteWfh($id)
    {

    }

    public function getWfhById($id)
    {

    }

    public function updateWfh($id, $startDate, $endDate, $content)
    {

    }

    public function updateWfhStatus($id, $status)
    {
        
    }
}