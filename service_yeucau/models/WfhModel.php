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

    public function addWfh($id, $startDate, $endDate, $content, $managerId)
    {
        $sql = "INSERT INTO {$this->getTableName()} (TN_IDNV, TN_NGAYBD, TN_NGAYKT, TN_LIDO, TN_IDNGUOIDUYET) VALUES ('{$id}', '{$startDate}', '{$endDate}', '{$content}', '{$managerId}')";
        return mysqli_query($this->con, $sql);
    }

    public function deleteWfh($id)
    {
        $sql = "DELETE FROM {$this->getTableName()} WHERE TN_ID = {$id}";
        return mysqli_query($this->con, $sql);
    }

    public function getWfhById($id)
    {
        $sql = "SELECT * FROM {$this->getTableName()} WHERE TN_ID = {$id}";
        $result = mysqli_query($this->con, $sql);
        return mysqli_fetch_assoc($result);
    }

    public function updateWfh($id, $startDate, $endDate, $content)
    {
        $sql = "UPDATE {$this->getTableName()} 
        SET TN_NGAYBD = '{$startDate}', TN_NGAYKT = '{$endDate}', TN_LIDO = '{$content}'
        WHERE TN_ID = {$id}";
        return mysqli_query($this->con, $sql);
    }

    public function updateWfhStatus($id, $status, $reason)
    {
        if ($status == 1) {
            $sql = "UPDATE {$this->getTableName()} 
            SET TN_DUYET = {$status}
            WHERE TN_ID = {$id}";
        } else {
            $sql = "UPDATE {$this->getTableName()} 
            SET TN_DUYET = {$status}, TN_LIDOTUCHOI = '{$reason}'
            WHERE TN_ID = {$id}";
        }
        return mysqli_query($this->con, $sql);
    }

    public function getWfhByManager($id, $staff)
    {
        if (!is_null($staff)) {
            $staffArr = json_decode($staff);
        }
        $sql = "SELECT * FROM {$this->getTableName()} WHERE TN_IDNGUOIDUYET = '{$id}' ORDER BY TN_ID DESC";
        $result = mysqli_query($this->con, $sql);
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $row['TN_NGAYBD'] = date('d/m/Y', strtotime($row['TN_NGAYBD']));
            $row['TN_NGAYKT'] = date('d/m/Y', strtotime($row['TN_NGAYKT']));
            $row['TN_DUYET'] = $row['TN_DUYET'] == 0 ? 'Chờ duyệt' : ($row['TN_DUYET'] == 1 ? 'Chấp nhận' : 'Từ chối');
            $row['TN_LIDOTUCHOI'] = is_null($row['TN_LIDOTUCHOI']) ? 'N/A' : $row['TN_LIDOTUCHOI'];
            if (isset($staffArr)) {
                foreach ($staffArr as $arr) {
                    $newArr = explode('-', $arr);
                    if ($row['TN_ID'] == $newArr[0]) {
                        $row['TN_IDNV'] = $newArr[1];
                    }
                }
            }
            $data[] = $row;
        }

        return ['data' => $data];
    }
}