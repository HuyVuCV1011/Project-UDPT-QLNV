<?php

use ServiceYeuCau\Core\DB;
/**
 * Class OffModel
 */
class OffModel extends DB
{
    const TABLE_NAME = 'yeu_cau_nghi_phep';

    public function getTableName()
    {
        return self::TABLE_NAME;
    }

    public function getOffByStaff($id, $manager)
    {
        $sql = "SELECT * FROM {$this->getTableName()} WHERE NP_IDNV = '{$id}' ORDER BY NP_ID DESC";
        $result = mysqli_query($this->con, $sql);
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $row['NP_NGAYBD'] = date('d/m/Y', strtotime($row['NP_NGAYBD']));
            $row['NP_NGAYKT'] = date('d/m/Y', strtotime($row['NP_NGAYKT']));
            $row['NP_COLUONG'] = $row['NP_COLUONG'] == 0 ? 'Nghỉ không lương' : 'Nghỉ có lương';
            $row['NP_LOAI'] = $row['NP_LOAI'] == 0 ? 'Nghỉ cả ngày' : ($row['NP_LOAI'] == 1 ? 'Nghỉ buổi sáng' : 'Nghỉ buổi chiều');
            $row['NP_DUYET'] = $row['NP_DUYET'] == 0 ? 'Chờ duyệt' : ($row['NP_DUYET'] == 1 ? 'Chấp nhận' : 'Từ chối');
            $row['NP_LIDOTUCHOI'] = is_null($row['NP_LIDOTUCHOI']) ? 'N/A' : $row['NP_LIDOTUCHOI'];
            $row['NP_IDNGUOIDUYET'] = is_null($manager) ? $row['OT_IDNGUOIDUYET'] : $manager;
            $data[] = $row;
        }

        return ['data' => $data];
    }

    public function addOff($id, $startDate, $endDate, $content, $type)
    {

    }

    public function deleteOff($id)
    {

    }

    public function getOffById($id)
    {

    }

    public function updateOff($id, $startDate, $endDate, $content, $type)
    {

    }

    public function updateOffStatus($id, $status)
    {
        
    }
}