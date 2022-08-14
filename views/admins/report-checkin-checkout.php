<?php include "./views/admins/includes/header.php" ?>
<h1 class="h3 mb-2 text-gray-800">Thống kê số giờ làm việc</h1>

<div class="col-md-12">
    <div class="form-group">
        <div class="row" id="reportShift">
            <div class="col-md-6">
                <label for="start_date">Ngày bắt đầu: <span class="text-danger">*</span></label>
                <input type="date" class="form-control" id="start_date" name="start_date">
            </div>
            <div class="col-md-6">
                <label for="end_date">Ngày kết thúc: <span class="text-danger">*</span></label>
                <input type="date" class="form-control" id="end_date" name="end_date">
            </div>
        </div>
    </div>
    <div class="form-group">
        <button id="reportShiftBtn" class="btn btn-primary">Thống kê</button>
    </div>
    <p class="text-danger" id="totalHour"></p>
    <div class="table-responsive mt-2">
        <!-- /.col-lg-12 -->
        <table class="table table-bordered" id="dataTables-report-shift" width="100%" cellspacing="0">
            <thead>
                <tr>
                    <th>Thời gian vào ca</th>
                    <th>Thời gian ra ca</th>
                    <th>Số giờ làm việc</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>Thời gian vào ca</th>
                    <th>Thời gian ra ca</th>
                    <th>Số giờ làm việc</th>
                </tr>
            </tfoot>
            <tbody>
            </tbody>
        </table>
    </div>
</div>

<h1 class="h3 mb-2 text-gray-800">Kiểm tra đủ giờ hay thiếu giờ</h1>

<div class="col-md-12">
    <div class="form-group">
        <div class="row" id="reportHour">
            <div class="col-md-6">
                <label for="month">Tháng: <span class="text-danger">*</span></label>
                <select id="month" class="form-control" name="month">
                    <?php for ($i = 1; $i <= 12; $i++): ?>
                        <option value="<?= $i ?>"><?= $i ?></option>
                    <?php endfor; ?>
                </select>
            </div>
            <div class="col-md-6">
                <label for="year">Năm: <span class="text-danger">*</span></label>
                <select id="year" class="form-control" name="year">
                    <?php for ($i = 1950; $i <= date('Y'); $i++): ?>
                        <option value="<?= $i ?>"><?= $i ?></option>
                    <?php endfor; ?>
                </select>
            </div>
        </div>
    </div>
    <div class="form-group">
        <button id="reportHourBtn" class="btn btn-primary">Kiểm tra</button>
    </div>
    <p class="text-danger" id="totalMyHour"></p>
    <p class="text-danger" id="totalMonthHour"></p>
    <p class="text-danger" id="result"></p>
</div>
<?php include "./views/admins/includes/footer.php" ?>