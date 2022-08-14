$(document).ready(function () {
    var admin = JSON.parse(localStorage.getItem('admin'));
    if (admin.NV_PhongBan == 'pb001' || admin.NV_PhongBan == 'pb002') {
        $('#staff-menu').hide();
    }
});