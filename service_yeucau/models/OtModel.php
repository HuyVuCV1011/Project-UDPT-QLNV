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

    public function getOtByStaff($id, $manager)
    {
        $sql = "SELECT * FROM {$this->getTableName()} WHERE OT_IDNV = '{$id}' ORDER BY OT_ID DESC";
        $result = mysqli_query($this->con, $sql);
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $row['OT_NGAY'] = date('d/m/Y', strtotime($row['OT_NGAY']));
            $row['OT_DUYET'] = $row['OT_DUYET'] == 0 ? 'Chờ duyệt' : ($row['OT_DUYET'] == 1 ? 'Chấp nhận' : 'Từ chối');
            $row['OT_LIDOTUCHOI'] = is_null($row['OT_LIDOTUCHOI']) ? 'N/A' : $row['OT_LIDOTUCHOI'];
            $row['OT_IDNGUOIDUYET'] = is_null($manager) ? $row['OT_IDNGUOIDUYET'] : $manager;
            $data[] = $row;
        }

        return ['data' => $data];
    }

    public function addOt($id, $date, $hour, $content)
    {

    }

    public function deleteOt($id)
    {

    }

    public function getOtById($id)
    {

    }

    public function updateOt($id, $date, $hour, $content)
    {

    }

    public function updateOtStatus($id, $status)
    {
        
    }
}