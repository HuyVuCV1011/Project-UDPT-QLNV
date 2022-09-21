$(document).ready(function() {
    var admin = JSON.parse(localStorage.getItem('admin'));
    $.ajax({
        url: `${window.origin}:81/?url=off/index/${admin.NV_ID}`,
        type: 'GET',
        success: function(res1) {
            var response1 = JSON.parse(res1);
            if (response1.data.length) {
                var managers = [];
                var key = 0;
                while (key < response1.data.length) {
                    $.ajax({
                        url: `${window.origin}${window.location.pathname}?url=staff/show/${response1.data[key].NP_IDNGUOIDUYET}`,
                        data: {
                            key: key
                        },
                        type: 'GET',
                        success: function(res2) {
                            var response2 = JSON.parse(res2);
                            managers.push(`${response1.data[response2.key].NP_ID}-${response2.NV_Ten}`);
                            localStorage.setItem('managers', JSON.stringify(managers));
                        }
                    });
                    key+=1;
                }

                setTimeout(function(){
                    var managerNews = localStorage.getItem('managers');
                    $('#dataTables-off').DataTable({
                        ajax: {
                            'type': 'GET',
                            'data': {
                                'manager': managerNews
                            },
                            'url': `${window.origin}:81/?url=off/index/${admin.NV_ID}`
                        },
                        columns: [
                            {
                                data: 'NP_ID',
                                name: 'NP_ID'
                            },
                            {
                                data: 'NP_NGAYBD',
                                name: 'NP_NGAYBD'
                            },
                            {
                                data: 'NP_NGAYKT',
                                name: 'NP_NGAYKT'
                            },
                            {
                                data: 'NP_LOAI',
                                name: 'NP_LOAI'
                            },
                            {
                                data: 'NP_LIDO',
                                name: 'NP_LIDO'
                            },
                            {
                                data: 'NP_COLUONG',
                                name: 'NP_COLUONG'
                            },
                            {
                                data: 'NP_LIDOTUCHOI',
                                name: 'NP_LIDOTUCHOI'
                            },
                            {
                                data: 'NP_DUYET',
                                name: 'NP_DUYET'
                            },
                            {
                                data: 'NP_IDNGUOIDUYET',
                                name: 'NP_IDNGUOIDUYET'
                            },
                            {
                                data: 'NP_ID',
                                render: function(NP_ID, type, row) {
                                    if (row['NP_DUYET'] == 'Chờ duyệt') {
                                        return `
                                            <button class="btn btn-sm btn-primary" data-id="${NP_ID}" id="button-edit-off" data-toggle="modal" data-target="#edit-off">
                                                <i class="fa fa-pen" aria-hidden="true"></i>
                                            </button>
                                            <button class="btn btn-sm btn-danger" data-id="${NP_ID}" id="button-delete-off">
                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                            </button>
                                        `;
                                    } else {
                                        return '';
                                    }
                                }
                            }
                        ],
                        "aaSorting": []
                    });
                },500);
            } else {
                //admin
                $('#staff-off').html('Người làm đơn');
                $('#button-add-off').hide();
                $.ajax({
                    url: `${window.origin}:81/?url=off/getOffByManager/${admin.NV_ID}`,
                    type: 'GET',
                    success: function(res1) {
                        var response1 = JSON.parse(res1);
                        if (response1.data.length) {
                            var staffs = [];
                            var key = 0;
                            while (key < response1.data.length) {
                                $.ajax({
                                    url: `${window.origin}${window.location.pathname}?url=staff/show/${response1.data[key].NP_IDNV}`,
                                    data: {
                                        key: key
                                    },
                                    type: 'GET',
                                    success: function(res2) {
                                        var response2 = JSON.parse(res2);
                                        staffs.push(`${response1.data[response2.key].NP_ID}-${response2.NV_Ten}`);
                                        localStorage.setItem('staffs', JSON.stringify(staffs));
                                    }
                                });
                                key+=1;
                            }
                            setTimeout(function(){
                                var staffNews = localStorage.getItem('staffs');
                                $('#dataTables-off').DataTable({
                                    ajax: {
                                        'type': 'GET',
                                        'data': {
                                            'staff': staffNews
                                        },
                                        'url': `${window.origin}:81/?url=off/getOffByManager/${admin.NV_ID}`
                                    },
                                    columns: [
                                        {
                                            data: 'NP_ID',
                                            name: 'NP_ID'
                                        },
                                        {
                                            data: 'NP_NGAYBD',
                                            name: 'NP_NGAYBD'
                                        },
                                        {
                                            data: 'NP_NGAYKT',
                                            name: 'NP_NGAYKT'
                                        },
                                        {
                                            data: 'NP_LOAI',
                                            name: 'NP_LOAI'
                                        },
                                        {
                                            data: 'NP_LIDO',
                                            name: 'NP_LIDO'
                                        },
                                        {
                                            data: 'NP_COLUONG',
                                            name: 'NP_COLUONG'
                                        },
                                        {
                                            data: 'NP_LIDOTUCHOI',
                                            name: 'NP_LIDOTUCHOI'
                                        },
                                        {
                                            data: 'NP_DUYET',
                                            name: 'NP_DUYET'
                                        },
                                        {
                                            data: 'NP_IDNV',
                                            name: 'NP_IDNGUO'
                                        },
                                        {
                                            data: 'NP_ID',
                                            render: function(NP_ID, type, row) {
                                                if (row['NP_DUYET'] == 'Chờ duyệt') {
                                                    return `
                                                    <button class="btn btn-sm btn-success" data-id="${NP_ID}" id="button-confirm-off">
                                                        <i class="fa fa-check" aria-hidden="true"></i>
                                                    </button>
                                                    <button class="btn btn-sm btn-danger" data-id="${NP_ID}" id="button-cancel-off" data-toggle="modal" data-target="#cancel-off">
                                                        <i class="fa fa-ban" aria-hidden="true"></i>
                                                    </button>
                                                    `;
                                                } else {
                                                    return '';
                                                }
                                            }
                                        }
                                    ],
                                    "aaSorting": []
                                });
                            },500);
                        } else {
                            $('#dataTables-off').DataTable({
                                ajax: {
                                    'type': 'GET',
                                    'url': `${window.origin}:81/?url=off/index/${admin.NV_ID}`
                                },
                                columns: [
                                    {
                                        data: 'NP_ID',
                                        name: 'NP_ID'
                                    },
                                    {
                                        data: 'NP_NGAYBD',
                                        name: 'NP_NGAYBD'
                                    },
                                    {
                                        data: 'NP_NGAYKT',
                                        name: 'NP_NGAYKT'
                                    },
                                    {
                                        data: 'NP_LOAI',
                                        name: 'NP_LOAI'
                                    },
                                    {
                                        data: 'NP_LIDO',
                                        name: 'NP_LIDO'
                                    },
                                    {
                                        data: 'NP_COLUONG',
                                        name: 'NP_COLUONG'
                                    },
                                    {
                                        data: 'NP_LIDOTUCHOI',
                                        name: 'NP_LIDOTUCHOI'
                                    },
                                    {
                                        data: 'NP_DUYET',
                                        name: 'NP_DUYET'
                                    },
                                    {
                                        data: 'NP_IDNGUOIDUYET',
                                        name: 'NP_IDNGUOIDUYET'
                                    },
                                    {
                                        data: 'NP_ID',
                                        render: function(NP_ID, type, row) {
                                            if (row['NP_DUYET'] == 'Chờ duyệt') {
                                                return `
                                                    <button class="btn btn-sm btn-primary" data-id="${NP_ID}" id="button-edit-off" data-toggle="modal" data-target="#edit-off">
                                                        <i class="fa fa-pen" aria-hidden="true"></i>
                                                    </button>
                                                    <button class="btn btn-sm btn-danger" data-id="${NP_ID}" id="button-delete-off">
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                    </button>
                                                `;
                                            } else {
                                                return '';
                                            }
                                        }
                                    }
                                ],
                                "aaSorting": []
                            });
                        }
                    }
                });
            }
        }
    });

    $('#button-modal-add-off').click(function() {
        if ($('#add-off input[name="start_date"]').val() == '' || $('#add-off input[name="end_date"]').val() == '') {
            swal({ title: 'Ngày bắt đầu và ngày kết thúc không được để trống', type: 'error' });
            return false;
        }
        var startDate = new Date($('#add-off input[name="start_date"]').val());
        var endDate = new Date($('#add-off input[name="end_date"]').val());
        var startDay = startDate.getDate();
        var startMonth = startDate.getMonth() + 1;
        var startYear = startDate.getFullYear();
        var endDay = endDate.getDate();
        var endMonth = endDate.getMonth() + 1;
        var endYear = endDate.getFullYear();
        var content = $('#add-off textarea[name="content"]').val();
        var type = $('#add-off select[name="type"]').val();
        var difference = startDate.getTime() - endDate.getTime();
        var day = Math.abs(difference / (1000 * 3600 * 24));
        var message = '';

        if ($('#add-off input[name="start_date"]').val() > $('#add-off input[name="end_date"]').val()) {
            message = 'Ngày bắt đầu không được lớn hơn ngày kết thúc';
        }

        if (content == '') {
            message = 'Lý do không được để trống';
        }

        if (message != '') {
            swal({
                title: message,
                type: 'error'
            });
            return false;
        } else {
            $.ajax({
                url: day <= 3 ? `${window.origin}${window.location.pathname}?url=staff/getManagerLevel1/${admin.NV_ID}` : `${window.origin}${window.location.pathname}?url=staff/getManagerLevel2/${admin.NV_ID}`,
                type: 'GET',
                success: function(res) {
                    var response = JSON.parse(res);
                    $.ajax({
                        url: `${window.origin}:81/?url=off/addOff/${admin.NV_ID}`,
                        type: 'POST',
                        data: {
                            managerId: response.ID_QLI,
                            start_date: [startYear, startMonth, startDay].join('-'),
                            end_date: [endYear, endMonth, endDay].join('-'),
                            content: content,
                            type: type
                        },
                        success: function(response) {
                            if (response) {
                                swal({
                                    title: "Thêm thành công",
                                    type: "success",
                                    showConfirmButton: true
                                }).then(function() {
                                    window.location.href = window.location.href;
                                });
                                $('#add-off input[name="start_date"]').val('');
                                $('#add-off input[name="end_date"]').val('');
                                $('#add-off textarea[name="content"]').val('');
                                $('#add-off').modal('hide');
                            }
                        }
                    });
                }
            });
        }
    });

    $("#dataTables-off").on('click', '#button-delete-off', function() {
        if (!confirm("Bạn có muốn xóa lựa chọn này ?")) {
            return false;
        }

        const id = $(this).data('id');

        $.ajax({
            url: `${window.origin}:81/?url=off/deleteOff/${id}`,
            type: 'POST',
            success: function(response) {
                if (response) {
                    swal({
                        title: "Xóa thành công",
                        type: "success",
                        showConfirmButton: true
                    }).then(function() {
                        window.location.href = window.location.href;
                    });
                }
            }
        });
    });

    $("#dataTables-off").on('click', '#button-edit-off', function() {
        const id = $(this).data('id');
        $('#edit-off input[name="start_date"]').val('');
        $('#edit-off input[name="end_date"]').val('');
        $('#edit-off textarea[name="content"]').val('');
        $.ajax({
            url: `${window.origin}:81/?url=off/getOffById/${id}`,
            type: 'GET',
            success: function(res) {
                var response = JSON.parse(res);
                $('#edit-off input[name="id"]').val(response.NP_ID);
                $('#edit-off input[name="start_date"]').val(response.NP_NGAYBD);
                $('#edit-off input[name="end_date"]').val(response.NP_NGAYKT);
                $('#edit-off textarea[name="content"]').val(response.NP_LIDO);
            }
        });
    });

    $('#button-modal-edit-off').click(function() {
        var id = $('#edit-off input[name="id"]').val();
        if ($('#edit-off input[name="start_date"]').val() == '' || $('#edit-off input[name="end_date"]').val() == '') {
            swal({ title: 'Ngày bắt đầu và ngày kết thúc không được để trống', type: 'error' });
            return false;
        }
        var startDate = new Date($('#edit-off input[name="start_date"]').val());
        var endDate = new Date($('#edit-off input[name="end_date"]').val());
        var startDay = startDate.getDate();
        var startMonth = startDate.getMonth() + 1;
        var startYear = startDate.getFullYear();
        var endDay = endDate.getDate();
        var endMonth = endDate.getMonth() + 1;
        var endYear = endDate.getFullYear();
        var content = $('#edit-off textarea[name="content"]').val();
        var type = $('#edit-off select[name="type"]').val();
        var message = '';
        var difference = startDate.getTime() - endDate.getTime();
        var day = Math.abs(difference / (1000 * 3600 * 24));

        if ($('#edit-off input[name="start_date"]').val() > $('#edit-off input[name="end_date"]').val()) {
            message = 'Ngày bắt đầu không được lớn hơn ngày kết thúc';
        }

        if (content == '') {
            message = 'Lý do không được để trống';
        }


        if (message != '') {
            swal({
                title: message,
                type: 'error'
            });
            return false;
        } else {
            $.ajax({
                url: day <= 3 ? `${window.origin}${window.location.pathname}?url=staff/getManagerLevel1/${admin.NV_ID}` : `${window.origin}${window.location.pathname}?url=staff/getManagerLevel2/${admin.NV_ID}`,
                type: 'GET',
                success: function(res) {
                    var response = JSON.parse(res);
                    $.ajax({
                        url: `${window.origin}:81/?url=off/updateOff/${id}`,
                        type: 'POST',
                        data: {
                            managerId: response.ID_QLI,
                            start_date: [startYear, startMonth, startDay].join('-'),
                            end_date: [endYear, endMonth, endDay].join('-'),
                            content: content,
                            type: type
                        },
                        success: function(response) {
                            if (response) {
                                swal({
                                    title: "Cập nhật thành công",
                                    type: "success",
                                    showConfirmButton: true
                                }).then(function() {
                                    window.location.href = window.location.href;
                                });
                                $('#edit-off').modal('hide');
                            }
                        }
                    });
                }
            });
        }
    });

    $("#dataTables-off").on('click', '#button-confirm-off', function() {
        const id = $(this).data('id');
        if (confirm('Bạn có muốn xác nhận yêu cầu này ?') === true) {
            $.ajax({
                url: `${window.origin}:81/?url=off/updateOffStatus/${id}`,
                type: 'POST',
                data: {
                    status: '1'
                },
                success: function(response) {
                    if (response) {
                        swal({
                            title: "Cập nhật trạng thái thành công",
                            type: "success",
                            showConfirmButton: true
                        }).then(function() {
                            window.location.href = window.location.href;
                        });
                    }
                }
            });
        }
    });

    $("#dataTables-off").on('click', '#button-cancel-off', function() {
        const id = $(this).data('id');
        $('#cancel-off input[name="id"]').val(id);
    });

    $("#button-modal-cancel-off").click(function() {
        var id = $('#cancel-off input[name="id"]').val();
        var reason = $('#cancel-off textarea[name="reason"]').val();
        var message = '';

        if (reason == '') {
            message = 'Lý do không được để trống';
        }

        if (message != '') {
            swal({
                title: message,
                type: 'error'
            });
            return false;
        } else {
            $.ajax({
                url: `${window.origin}:81/?url=off/updateOffStatus/${id}`,
                type: 'POST',
                data: {
                    reason: reason,
                    status: '2'
                },
                success: function(response) {
                    if (response) {
                        swal({
                            title: "Cập nhật trạng thái thành công",
                            type: "success",
                            showConfirmButton: true
                        }).then(function() {
                            window.location.href = window.location.href;
                        });
                        $('#cancel-off').modal('hide');
                    }
                }
            });
        }
    });
});