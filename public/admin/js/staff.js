$(document).ready(function() {
    $('#dataTables-staff').DataTable({

        ajax: {
            'headers': {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            },
            'url': `${window.origin}${window.location.pathname}?url=staff/index`,
        },
        columns: [{
                data: 'NV_ID',
                name: 'NV_ID'
            },
            {
                data: 'NV_Ten',
                name: 'NV_Ten'
            },
            {
                data: 'NV_GioiTinh',
                name: 'NV_GioiTinh'
            },
            {
                data: 'NV_NSinh',
                name: 'NV_NSinh'
            },
            {
                data: 'NV_SDT',
                name: 'NV_SDT'
            },
            {
                data: 'PB_TEN',
                name: 'PB_TEN'
            },
            {
                data: 'NV_NGAYPHEPCONLAI',
                name: 'NV_NGAYPHEPCONLAI'
            },
            {
                data: "NV_ID",
                render: function(NV_ID) {
                    return `
                        <button class="btn btn-sm btn-primary" data-staff-id="${NV_ID}" id="button-show-staff" data-toggle='modal' data-target='#staff-detail'>
                            <i class="fa fa-eye" aria-hidden="true"></i>
                        </button>
                    `;
                }
            },
        ],
        "aaSorting": []
    });

    $('#dataTables-staff').on('click', '#button-show-staff', function () {
        $('#staffDetailTitle').html('');
        $('#staffDetailContent').html('');
        var html = '';
        var staffId = $(this).data('staff-id');
        $.ajax({
            url: `${window.origin}${window.location.pathname}?url=staff/show/${staffId}`,
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
                $('#staffDetailTitle').html('Nhân viên ' + response.NV_Ten);
                html += `
                    <h3>Chi tiết</h3>
                    <p>Mã nhân viên: ${response.NV_ID}</p>
                    <p>Họ tên: ${response.NV_Ten}</p>
                    <p>Giới tính: ${response.NV_GioiTinh}</p>
                    <p>Ngày sinh: ${birthday}</p>
                    <p>Số điện thoại: ${response.NV_SDT}</p>
                    <p>Phòng ban: ${response.PB_TEN}</p>
                    <p>Số ngày phép: ${response.NV_NGAYPHEPCONLAI}</p>
                `;
                $.ajax({
                    url: `${window.origin}:83/?url=project/getProjectByStaff/${staffId}`,
                    success: function(res1) {
                        var response1 = JSON.parse(res1);
                        var count = 1;
                        html += `<h3>Các dự án đã tham gia</h3>`;
                        for (var x of response1) {
                            var startDate = new Date(x.DA_NGAYBD);
                            var startDay = startDate.getDate();
                            var startMonth = startDate.getMonth() + 1;
                            var startYear = startDate.getFullYear();
                            var endDate = new Date(x.DA_NGAYKT);
                            var endDay = endDate.getDate();
                            var endMonth = endDate.getMonth() + 1;
                            var endYear = endDate.getFullYear();
                            $.ajax({
                                url: `${window.origin}${window.location.pathname}?url=staff/show/${x.DA_IDQUANLY}`,
                                success: function(res2) {
                                    var response2 = JSON.parse(res2);
                                    html += `
                                        <p>Dự án ${count}</p>
                                        <ul>
                                            <li>Mã dự án: ${x.DA_ID}</li>
                                            <li>Tên dự án: ${x.DA_TEN}</li>
                                            <li>Ngày bắt đầu: ${[startDay, startMonth, startYear].join('/')}</li>
                                            <li>Ngày kết thúc: ${[endDay, endMonth, endYear].join('/')}</li>
                                            <li>Quản lý: ${response2.NV_Ten}</li>
                                        </ul>
                                    `;
                                    $('#staffDetailContent').html(html);
                                    count += 1;
                                }
                            });
                        }
                    }
                });
            }
        });
    });
});