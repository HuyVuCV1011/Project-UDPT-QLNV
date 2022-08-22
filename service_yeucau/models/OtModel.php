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

    public function addOt($id, $date, $hour, $content, $managerId)
    {
        $sql = "INSERT INTO {$this->getTableName()} (OT_IDNV, OT_NGAY, OT_GIO, OT_LIDO, OT_IDNGUOIDUYET) VALUES ('{$id}', '{$date}', {$hour}, '{$content}', '{$managerId}')";
        return mysqli_query($this->con, $sql);
    }

    public function deleteOt($id)
    {
        $sql = "DELETE FROM {$this->getTableName()} WHERE OT_ID = {$id}";
        return mysqli_query($this->con, $sql);
    }

    public function getOtById($id)
    {
        $sql = "SELECT * FROM {$this->getTableName()} WHERE OT_ID = {$id}";
        $result = mysqli_query($this->con, $sql);
        return mysqli_fetch_assoc($result);
    }

    public function updateOt($id, $date, $hour, $content)
    {
        $sql = "UPDATE {$this->getTableName()} 
        SET OT_NGAY = '{$date}', OT_GIO = {$hour}, OT_LIDO = '{$content}'
        WHERE OT_ID = {$id}";
        return mysqli_query($this->con, $sql);
    }

    public function updateOtStatus($id, $status, $reason)
    {
        if ($status == 1) {
            $sql = "UPDATE {$this->getTableName()} 
            SET OT_DUYET = {$status}
            WHERE OT_ID = {$id}";
        } else {
            $sql = "UPDATE {$this->getTableName()} 
            SET OT_DUYET = {$status}, OT_LIDOTUCHOI = '{$reason}'
            WHERE OT_ID = {$id}";
        }
        return mysqli_query($this->con, $sql);
    }

    public function getOtByManager($id, $staff)
    {
        if (!is_null($staff)) {
            $staffArr = json_decode($staff);
        }
        $sql = "SELECT * FROM {$this->getTableName()} WHERE OT_IDNGUOIDUYET = '{$id}' ORDER BY OT_ID DESC";
        $result = mysqli_query($this->con, $sql);
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $row['OT_NGAY'] = date('d/m/Y', strtotime($row['OT_NGAY']));
            $row['OT_DUYET'] = $row['OT_DUYET'] == 0 ? 'Chờ duyệt' : ($row['OT_DUYET'] == 1 ? 'Chấp nhận' : 'Từ chối');
            $row['OT_LIDOTUCHOI'] = is_null($row['OT_LIDOTUCHOI']) ? 'N/A' : $row['OT_LIDOTUCHOI'];
            if (isset($staffArr)) {
                foreach ($staffArr as $arr) {
                    $newArr = explode('-', $arr);
                    if ($row['OT_ID'] == $newArr[0]) {
                        $row['OT_IDNV'] = $newArr[1];
                    }
                }
            }
            $data[] = $row;
        }

        return ['data' => $data];
    }
}