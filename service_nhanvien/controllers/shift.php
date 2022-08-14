<?php

use ServiceNhanVien\Core\Controller;
/**
 * Class Shift
 */
class Shift extends Controller
{
    public function execute()
    {
        $this->view('checkin-checkout', []);
    }

    public function index($id)
    {
        $model = $this->model('ShiftModel');
        $res = $model->getList($id);
        
        echo json_encode($res);
    }

    public function report()
    {
        $this->view('report-checkin-checkout', []);
    }

    public function checkCheckinCheckout($id)
    {
        $checkIn = [];
        $checkOut = [];
        $model = $this->model('ShiftModel');
        $shifts = $model->getList($id);
        foreach ($shifts['data'] as $shift) {
            $checkIn[$shift['CC_ID']] = date('Y-m-d', strtotime(strtr($shift['CC_CHECKIN'], '/', '-')));
            $checkOut[] = date('Y-m-d', strtotime(strtr($shift['CC_CHECKOUT'], '/', '-')));
        }

        if (!in_array(date('Y-m-d'), array_values($checkIn))) {
            echo json_encode(['type' => 1]);
        } else {
            if (!in_array(date('Y-m-d'), array_values($checkOut))) {
                echo json_encode(['type' => 2, 'data' => array_search(date('Y-m-d'), $checkIn)]);
            } else {
                echo json_encode(['type' => 3]);
            }
        }
    }

    public function checkIn($id)
    {
        $date = date('Y-m-d H:i:s');
        $model = $this->model('ShiftModel');
        $ccId = $model->checkIn($id, $date);
        echo json_encode(['data' => $ccId]);
    }

    public function checkOut($shiftId)
    {
        $date = date('Y-m-d H:i:s');
        $model = $this->model('ShiftModel');
        echo $model->checkOut($date, $shiftId);
    }

    public function getTotalHour($id)
    {
        $hour = 0;
        $model = $this->model('ShiftModel');
        $shifts = $model->reportShift($id, $_GET['start_date'], $_GET['end_date']);
        foreach ($shifts['data'] as $shift) {
            $hour += !is_null($shift['CC_CHECKIN']) && !is_null($shift['CC_CHECKOUT']) ? round(abs(strtotime(strtr($shift['CC_CHECKOUT'], '/', '-')) - strtotime(strtr($shift['CC_CHECKIN'], '/', '-'))) / (60*60), 1) : 0;
        }
        echo json_encode(['data' => $hour]);
    }

    public function reportShift($id)
    {
        $model = $this->model('ShiftModel');
        $res = $model->reportShift($id, $_GET['start_date'], $_GET['end_date']);
        
        echo json_encode($res);
    }

    public function reportHour($id)
    {
        $hours = [];
        $hour = 0;
        $model = $this->model('ShiftModel');
        $shifts = $model->reportHour($id, $_GET['month'], $_GET['year']);
        foreach ($shifts as $shift) {
            $hour += !is_null($shift['CC_CHECKIN']) && !is_null($shift['CC_CHECKOUT']) ? round(abs(strtotime(strtr($shift['CC_CHECKOUT'], '/', '-')) - strtotime(strtr($shift['CC_CHECKIN'], '/', '-'))) / (60*60), 1) : 0;
        }
        $hours['my_hour'] = $hour;
        $hours['month_hour'] = $this->countDays($_GET['year'], $_GET['month'], [0,6]) * 8;
        echo json_encode(['data' => $hours]);
    }

    public function countDays($year, $month, $ignore) {
        $count = 0;
        $counter = mktime(0, 0, 0, $month, 1, $year);
        while (date("n", $counter) == $month) {
            if (in_array(date("w", $counter), $ignore) == false) {
                $count++;
            }
            $counter = strtotime("+1 day", $counter);
        }
        return $count;
    }
}