<?php include "./views/admins/includes/header.php" ?>
<h1 class="h3 mb-2 text-gray-800">Check-in / Check-out</h1>

<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-body">
        <div class="row">
            <div class="col-12" style="font-weight:bold;">
                <p class="text-danger">Lịch làm: 8:00 AM - 16:30 PM từ T2 - T6 hằng tuần (nghỉ trưa từ 12:00 PM - 13:00 PM)</p>
                <p class="text-danger">Lưu ý: nếu như quên "Check in" hoặc "Check out" xin vui lòng liên hệ cho bên nhân sự để có hướng giải quyết</p>
                <p>Hôm nay, 
                    <?php
                        $weekday = date("l");
                        $weekday = strtolower($weekday);
                        switch($weekday) {
                            case 'monday':
                                $weekday = 'Thứ 2';
                                break;
                            case 'tuesday':
                                $weekday = 'Thứ 3';
                                break;
                            case 'wednesday':
                                $weekday = 'Thứ 4';
                                break;
                            case 'thursday':
                                $weekday = 'Thứ 5';
                                break;
                            case 'friday':
                                $weekday = 'Thứ 6';
                                break;
                            case 'saturday':
                                $weekday = 'Thứ 7';
                                break;
                            default:
                                $weekday = 'Chủ nhật';
                                break;
                        }
                        echo $weekday . ' ngày ' . date('d') . ' tháng ' . date('m') . ' năm ' . date('Y');
                    ?>
                </p>
                <p id="clock" onload="currentTime()"></p>
            </div>
            <div class="col-12" align="center">
                <button id="checkinBtn" class="btn btn-primary">Check in</button>
                <button id="checkoutBtn" class="btn btn-primary ml-3">Check out</button>
            </div>
            <div class="table-responsive mt-2">
                <!-- /.col-lg-12 -->
                <table class="table table-bordered" id="dataTables-shift" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Thời gian vào ca</th>
                            <th>Thời gian ra ca</th>
                            <th>Số giờ làm việc</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<?php include "./views/admins/includes/footer.php" ?>