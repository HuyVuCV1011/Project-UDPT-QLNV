<?php include "./views/admins/includes/header.php" ?>
<h1 class="h3 mb-2 text-gray-800">Yêu cầu nghỉ phép</h1>
<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-body">
        <button class="btn btn-primary mb-4" data-toggle="modal" data-target="#add-off" id="button-add-off"><i class="fa fa-plus" aria-hidden="true"></i></button>
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTables-off" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Ngày bắt đầu</th>
                        <th>Ngày kết thúc</th>
                        <th>Hình thức nghỉ</th>
                        <th>Lý do nghỉ</th>
                        <th>Loại phép</th>
                        <th>Lý do từ chối</th>
                        <th>Trạng thái</th>
                        <th>Người duyệt</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>#</th>
                        <th>Ngày bắt đầu</th>
                        <th>Ngày kết thúc</th>
                        <th>Hình thức nghỉ</th>
                        <th>Lý do nghỉ</th>
                        <th>Loại phép</th>
                        <th>Lý do từ chối</th>
                        <th>Trạng thái</th>
                        <th>Người duyệt</th>
                    </tr>
                </tfoot>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php include "./views/admins/includes/footer.php" ?>