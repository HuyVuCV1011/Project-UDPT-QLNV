<?php include "./views/admins/includes/header.php" ?>
<h1 class="h3 mb-2 text-gray-800">Yêu cầu tăng ca</h1>
<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-body">
        <button class="btn btn-primary mb-4" data-toggle="modal" data-target="#add-ot" id="button-add-ot"><i class="fa fa-plus" aria-hidden="true"></i></button>
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTables-ot" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Ngày tăng ca</th>
                        <th>Số giờ</th>
                        <th>Lý do tăng ca</th>
                        <th>Lý do từ chối</th>
                        <th>Trạng thái</th>
                        <th id="staff-ot">Người duyệt</th>
                        <th>Chức năng</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php include "./views/admins/includes/footer.php" ?>