$(document).ready(function () {
    $('#fullname').text(JSON.parse(localStorage.getItem('admin')).NV_Ten);
    if (JSON.parse(localStorage.getItem('admin')).NV_PhongBan == 'pb003') {
        $("#default-link").attr("href", '?url=staff');
    } else if (JSON.parse(localStorage.getItem('admin')).NV_PhongBan == 'pb001' || JSON.parse(localStorage.getItem('admin')).NV_PhongBan == 'pb002') {
        $("#default-link").attr("href", '?url=shift');
    }
});