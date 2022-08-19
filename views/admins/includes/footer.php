</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Footer -->
<footer class="sticky-footer bg-white">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright <?= date('Y') ?> - Hệ thống độc quyền của công ty</span>
        </div>
    </div>
</footer>
<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Modals -->
<?php include "./views/admins/modals/logout.php" ?>
<?php include "./views/admins/modals/profile.php" ?>
<?php include "./views/admins/modals/off_add.php" ?>
<?php include "./views/admins/modals/off_edit.php" ?>
<?php include "./views/admins/modals/off_cancel.php" ?>
<?php include "./views/admins/modals/ot_add.php" ?>
<?php include "./views/admins/modals/ot_edit.php" ?>
<?php include "./views/admins/modals/ot_cancel.php" ?>
<?php include "./views/admins/modals/wfh_add.php" ?>
<?php include "./views/admins/modals/wfh_edit.php" ?>
<?php include "./views/admins/modals/wfh_cancel.php" ?>
<?php include "./views/admins/modals/staff_detail.php" ?>
<?php include "./views/admins/modals/article_detail.php" ?>
<!-- Bootstrap core JavaScript-->
<script src="./public/admin/vendor/jquery/jquery.min.js"></script>
<script src="./public/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="./public/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="./public/admin/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="./public/admin/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="./public/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Script -->
<script src="./public/admin/js/auth.js"></script>
<script src="./public/admin/js/staff.js"></script>
<script src="./public/admin/js/browser.js"></script>
<script src="./public/admin/js/ot.js"></script>
<script src="./public/admin/js/wfh.js"></script>
<script src="./public/admin/js/off.js"></script>
<script src="./public/admin/js/article.js"></script>
<script src="./public/admin/js/permission.js"></script>
<script src="./public/admin/js/profile.js"></script>
<script src="./public/admin/js/shift.js"></script>
</body>

</html>