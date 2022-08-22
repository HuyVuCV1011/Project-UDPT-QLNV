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
        if (!is_null($manager)) {
            $managerArr = json_decode($manager);
        }
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
            if (isset($managerArr)) {
                foreach ($managerArr as $arr) {
                    $newArr = explode('-', $arr);
                    if ($row['NP_ID'] == $newArr[0]) {
                        $row['NP_IDNGUOIDUYET'] = $newArr[1];
                    }
                }
            }
            $data[] = $row;
        }
        return ['data' => $data];
    }

    public function addOff($id, $startDate, $endDate, $content, $type, $managerId)
    {
        $sql = "INSERT INTO {$this->getTableName()} (NP_IDNV, NP_NGAYBD, NP_NGAYKT, NP_LIDO, NP_LOAI, NP_IDNGUOIDUYET) VALUES ('{$id}', '{$startDate}', '{$endDate}', '{$content}', {$type}, '{$managerId}')";
        return mysqli_query($this->con, $sql);
    }

    public function deleteOff($id)
    {
        $sql = "DELETE FROM {$this->getTableName()} WHERE NP_ID = {$id}";
        return mysqli_query($this->con, $sql);
    }

    public function getOffById($id)
    {
        $sql = "SELECT * FROM {$this->getTableName()} WHERE NP_ID = {$id}";
        $result = mysqli_query($this->con, $sql);
        return mysqli_fetch_assoc($result);
    }

    public function updateOff($id, $startDate, $endDate, $content, $type, $managerId)
    {
        $sql = "UPDATE {$this->getTableName()} 
        SET NP_NGAYBD = '{$startDate}', NP_NGAYKT = '{$endDate}', NP_LIDO = '{$content}', NP_LOAI = {$type}, NP_IDNGUOIDUYET = '{$managerId}'
        WHERE NP_ID = {$id}";
        return mysqli_query($this->con, $sql);
    }

    public function updateOffStatus($id, $status, $reason)
    {
        if ($status == 1) {
            $sql = "UPDATE {$this->getTableName()} 
            SET NP_DUYET = {$status}
            WHERE NP_ID = {$id}";
        } else {
            $sql = "UPDATE {$this->getTableName()} 
            SET NP_DUYET = {$status}, NP_LIDOTUCHOI = '{$reason}'
            WHERE NP_ID = {$id}";
        }
        return mysqli_query($this->con, $sql); 
    }

    public function getOffByManager($id, $staff)
    {
        if (!is_null($staff)) {
            $staffArr = json_decode($staff);
        }
        $sql = "SELECT * FROM {$this->getTableName()} WHERE NP_IDNGUOIDUYET = '{$id}' ORDER BY NP_ID DESC";
        $result = mysqli_query($this->con, $sql);
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $row['NP_NGAYBD'] = date('d/m/Y', strtotime($row['NP_NGAYBD']));
            $row['NP_NGAYKT'] = date('d/m/Y', strtotime($row['NP_NGAYKT']));
            $row['NP_COLUONG'] = $row['NP_COLUONG'] == 0 ? 'Nghỉ không lương' : 'Nghỉ có lương';
            $row['NP_LOAI'] = $row['NP_LOAI'] == 0 ? 'Nghỉ cả ngày' : ($row['NP_LOAI'] == 1 ? 'Nghỉ buổi sáng' : 'Nghỉ buổi chiều');
            $row['NP_DUYET'] = $row['NP_DUYET'] == 0 ? 'Chờ duyệt' : ($row['NP_DUYET'] == 1 ? 'Chấp nhận' : 'Từ chối');
            $row['NP_LIDOTUCHOI'] = is_null($row['NP_LIDOTUCHOI']) ? 'N/A' : $row['NP_LIDOTUCHOI'];
            if (isset($staffArr)) {
                foreach ($staffArr as $arr) {
                    $newArr = explode('-', $arr);
                    if ($row['NP_ID'] == $newArr[0]) {
                        $row['NP_IDNV'] = $newArr[1];
                    }
                }
            }
            $data[] = $row;
        }

        return ['data' => $data];
    }
}