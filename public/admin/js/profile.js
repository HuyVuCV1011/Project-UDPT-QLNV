$(document).ready(function() {
    var admin = JSON.parse(localStorage.getItem('admin'));
    $('#profileBtn').click(function () {
        $.ajax({
            url: `${window.origin}${window.location.pathname}?url=staff/profile/${admin.NV_ID}`,
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            },
            success: function(res) {
                var response = JSON.parse(res);
                var date = new Date(response.NV_NSinh);
                var day = date.getDate();
                var month = date.getMonth() + 1;
                var year = date.getFullYear();
                var birthday = [day, month, year].join('/');
                var html = `
                    <p>Mã nhân viên: ${response.NV_ID}</p>
                    <p>Họ tên: ${response.NV_Ten}</p>
                    <p>Giới tính: ${response.NV_GioiTinh}</p>
                    <p>Ngày sinh: ${birthday}</p>
                    <p>Số điện thoại: ${response.NV_SDT}</p>
                    <p>Phòng ban: ${response.PB_TEN}</p>
                    <p>Số ngày phép: ${response.NV_NGAYPHEPCONLAI}</p>
                `;
                $('#profile').html(html);
            }
        });
    });
});