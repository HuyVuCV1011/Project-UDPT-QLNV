<?php

use ServiceNhanVien\Core\DB;
/**
 * Class ShiftModel
 */
class ShiftModel extends DB
{
    const TABLE_NAME = 'cham_cong';

    public function getTableName()
    {
        return self::TABLE_NAME;
    }

    public function getList($id)
    {
        $sql = "SELECT * FROM {$this->getTableName()} WHERE CC_IDNV = '{$id}' ORDER BY CC_ID DESC";
        $result = mysqli_query($this->con, $sql);
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $row['HOUR'] = !is_null($row['CC_CHECKIN']) && !is_null($row['CC_CHECKOUT']) ? round(abs(strtotime($row['CC_CHECKOUT']) - strtotime($row['CC_CHECKIN'])) / (60*60), 1) : 'N/A';
            $row['CC_CHECKIN'] = !is_null($row['CC_CHECKIN']) ? date('d/m/Y H:i:s', strtotime($row['CC_CHECKIN'])) : 'N/A';
            $row['CC_CHECKOUT'] = !is_null($row['CC_CHECKOUT']) ? date('d/m/Y H:i:s', strtotime($row['CC_CHECKOUT'])) : 'N/A';
            $data[] = $row;
        }

        return ['data' => $data];
    }

    public function checkIn($id, $date)
    {
        $day = date('Y-m-d');
        $sql = "INSERT INTO {$this->getTableName()} (CC_IDNV, CC_NGAY, CC_CHECKIN) VALUES ('{$id}', '{$day}', '{$date}')";
        mysqli_query($this->con, $sql);
        return mysqli_insert_id($this->con);
    }

    public function checkOut($date, $shiftId)
    {
        $sql = "UPDATE {$this->getTableName()} SET CC_CHECKOUT = '{$date}' WHERE CC_ID = {$shiftId}";
        return mysqli_query($this->con, $sql);
    }

    public function reportShift($id, $startDate, $endDate)
    {
        $sql = "SELECT * FROM {$this->getTableName()} WHERE CC_IDNV = '{$id}' AND (CC_NGAY BETWEEN '{$startDate}' AND '{$endDate}') ORDER BY CC_ID DESC";
        $result = mysqli_query($this->con, $sql);
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $row['HOUR'] = !is_null($row['CC_CHECKIN']) && !is_null($row['CC_CHECKOUT']) ? round(abs(strtotime($row['CC_CHECKOUT']) - strtotime($row['CC_CHECKIN'])) / (60*60), 1) : 'N/A';
            $row['CC_CHECKIN'] = !is_null($row['CC_CHECKIN']) ? date('d/m/Y H:i:s', strtotime($row['CC_CHECKIN'])) : 'N/A';
            $row['CC_CHECKOUT'] = !is_null($row['CC_CHECKOUT']) ? date('d/m/Y H:i:s', strtotime($row['CC_CHECKOUT'])) : 'N/A';
            $data[] = $row;
        }

        return ['data' => $data];
    }

    public function reportHour($id, $month, $year)
    {
        $sql = "SELECT * FROM {$this->getTableName()} WHERE CC_IDNV = '{$id}' AND YEAR(CC_NGAY) = $year AND MONTH(CC_NGAY) = $month ORDER BY CC_ID DESC";
        $result = mysqli_query($this->con, $sql);
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $row['HOUR'] = !is_null($row['CC_CHECKIN']) && !is_null($row['CC_CHECKOUT']) ? round(abs(strtotime($row['CC_CHECKOUT']) - strtotime($row['CC_CHECKIN'])) / (60*60), 1) : 'N/A';
            $row['CC_CHECKIN'] = !is_null($row['CC_CHECKIN']) ? date('d/m/Y H:i:s', strtotime($row['CC_CHECKIN'])) : 'N/A';
            $row['CC_CHECKOUT'] = !is_null($row['CC_CHECKOUT']) ? date('d/m/Y H:i:s', strtotime($row['CC_CHECKOUT'])) : 'N/A';
            $data[] = $row;
        }

        return $data;
    }
}