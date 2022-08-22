$(document).ready(function() {
    //Lấy thông tin admin nếu có
    var admin = JSON.parse(localStorage.getItem('admin'));
    $.ajax({
        url: `${window.origin}:81/?url=wfh/index/${admin.NV_ID}`,
        type: 'GET',
        success: function(res1) {
            var response1 = JSON.parse(res1);
            if (response1.data.length > 0) {
                $.ajax({
                    url: `${window.origin}${window.location.pathname}?url=staff/show/${response1.data[0].TN_IDNGUOIDUYET}`,
                    type: 'GET',
                    success: function(res2) {
                        var response2 = JSON.parse(res2);
                        $('#dataTables-wfh').DataTable({
                            ajax: {
                                'type': 'GET',
                                'data': {
                                    'manager': response2.NV_Ten
                                },
                                'url': `${window.origin}:81/?url=wfh/index/${admin.NV_ID}`
                            },
                            columns: [
                                {
                                    data: 'TN_ID',
                                    name: 'TN_ID'
                                },
                                {
                                    data: 'TN_NGAYBD',
                                    name: 'TN_NGAYBD'
                                },
                                {
                                    data: 'TN_NGAYKT',
                                    name: 'TN_NGAYKT'
                                },
                                {
                                    data: 'TN_LIDO',
                                    name: 'TN_LIDO'
                                },
                                {
                                    data: 'TN_LIDOTUCHOI',
                                    name: 'TN_LIDOTUCHOI'
                                },
                                {
                                    data: 'TN_DUYET',
                                    name: 'TN_DUYET'
                                },
                                {
                                    data: 'TN_IDNGUOIDUYET',
                                    name: 'TN_IDNGUOIDUYET'
                                },
                                {
                                    data: 'TN_ID',
                                    render: function(TN_ID, type, row) {
                                        if (row['TN_DUYET'] == 'Chờ duyệt') {
                                            return `
                                                <button class="btn btn-sm btn-primary" data-id="${TN_ID}" id="button-edit-wfh" data-toggle="modal" data-target="#edit-wfh">
                                                    <i class="fa fa-pen" aria-hidden="true"></i>
                                                </button>
                                                <button class="btn btn-sm btn-danger" data-id="${TN_ID}" id="button-delete-wfh">
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
                });
            } else {
                $('#dataTables-wfh').DataTable({
                    ajax: {
                        'type': 'GET',
                        'url': `${window.origin}:81/?url=wfh/index/${admin.NV_ID}`
                    },
                    columns: [
                        {
                            data: 'TN_ID',
                            name: 'TN_ID'
                        },
                        {
                            data: 'TN_NGAYBD',
                            name: 'TN_NGAYBD'
                        },
                        {
                            data: 'TN_NGAYKT',
                            name: 'TN_NGAYKT'
                        },
                        {
                            data: 'TN_LIDO',
                            name: 'TN_LIDO'
                        },
                        {
                            data: 'TN_LIDOTUCHOI',
                            name: 'TN_LIDOTUCHOI'
                        },
                        {
                            data: 'TN_DUYET',
                            name: 'TN_DUYET'
                        },
                        {
                            data: 'TN_IDNGUOIDUYET',
                            name: 'TN_IDNGUOIDUYET'
                        },
                        {
                            data: 'TN_ID',
                            render: function(TN_ID, type, row) {
                                $('#button-add-wfh').hide();
                                if (row['TN_DUYET'] == 'Chờ duyệt') {
                                    return `
                                    <button class="btn btn-sm btn-success" data-id="${TN_ID}" id="button-confirm-wfh">
                                        <i class="fa fa-check" aria-hidden="true"></i>
                                    </button>
                                    <button class="btn btn-sm btn-danger" data-id="${TN_ID}" id="button-cancel-wfh" data-toggle="modal" data-target="#cancel-wfh">
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
            }
        }
    });

    $('#button-modal-add-wfh').click(function() {
        if ($('#add-wfh input[name="start_date"]').val() == '' || $('#add-wfh input[name="end_date"]').val() == '') {
            swal({ title: 'Ngày bắt đầu và ngày kết thúc không được để trống', type: 'error' });
            return false;
        }
        var startDate = new Date($('#add-wfh input[name="start_date"]').val());
        var endDate = new Date($('#add-wfh input[name="end_date"]').val());
        var startDay = startDate.getDate();
        var startMonth = startDate.getMonth() + 1;
        var startYear = startDate.getFullYear();
        var endDay = endDate.getDate();
        var endMonth = endDate.getMonth() + 1;
        var endYear = endDate.getFullYear();
        var content = $('#add-wfh textarea[name="content"]').val();
        var message = '';

        if ($('#add-wfh input[name="start_date"]').val() > $('#add-wfh input[name="end_date"]').val()) {
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
                url: `${window.origin}${window.location.pathname}?url=staff/getManagerLevel1/${admin.NV_ID}`,
                type: 'GET',
                success: function(res) {
                    var response = JSON.parse(res);
                    $.ajax({
                        url: `${window.origin}:81/?url=wfh/addWfh/${admin.NV_ID}`,
                        type: 'POST',
                        data: {
                            managerId: response.ID_QLI,
                            start_date: [startYear, startMonth, startDay].join('-'),
                            end_date: [endYear, endMonth, endDay].join('-'),
                            content: content
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
                                $('#add-wfh input[name="start_date"]').val('');
                                $('#add-wfh input[name="end_date"]').val('');
                                $('#add-wfh textarea[name="content"]').val('');
                                $('#add-wfh').modal('hide');
                            }
                        }
                    });
                }
            });
        }
    });

    $("#dataTables-wfh").on('click', '#button-delete-wfh', function() {
        if (!confirm("Bạn có muốn xóa lựa chọn này ?")) {
            return false;
        }

        const id = $(this).data('id');

        $.ajax({
            url: `${window.origin}:81/?url=wfh/deleteWfh/${id}`,
            type: 'POST',
            data: {
                id: id
            },
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

    $("#dataTables-wfh").on('click', '#button-edit-wfh', function() {
        const id = $(this).data('id');
        $('#edit-wfh input[name="start_date"]').val('');
        $('#edit-wfh input[name="end_date"]').val('');
        $('#edit-wfh textarea[name="content"]').val('');
        $.ajax({
            url: `${window.origin}:81/?url=wfh/getWfhById/${id}`,
            type: 'GET',
            success: function(res) {
                var response = JSON.parse(res);
                $('#edit-wfh input[name="id"]').val(response.TN_ID);
                $('#edit-wfh input[name="start_date"]').val(response.TN_NGAYBD);
                $('#edit-wfh input[name="end_date"]').val(response.TN_NGAYKT);
                $('#edit-wfh textarea[name="content"]').val(response.TN_LIDO);
            }
        });
    });

    $('#button-modal-edit-wfh').click(function() {
        var id = $('#edit-wfh input[name="id"]').val();
        if ($('#edit-wfh input[name="start_date"]').val() == '' || $('#edit-wfh input[name="end_date"]').val() == '') {
            swal({ title: 'Ngày bắt đầu và ngày kết thúc không được để trống', type: 'error' });
            return false;
        }
        var startDate = new Date($('#edit-wfh input[name="start_date"]').val());
        var endDate = new Date($('#edit-wfh input[name="end_date"]').val());
        var startDay = startDate.getDate();
        var startMonth = startDate.getMonth() + 1;
        var startYear = startDate.getFullYear();
        var endDay = endDate.getDate();
        var endMonth = endDate.getMonth() + 1;
        var endYear = endDate.getFullYear();
        var content = $('#edit-wfh textarea[name="content"]').val();
        var message = '';

        if ($('#edit-wfh input[name="start_date"]').val() > $('#edit-wfh input[name="end_date"]').val()) {
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
                url: `${window.origin}:81/?url=wfh/updateWfh/${id}`,
                type: 'POST',
                data: {
                    id: id,
                    start_date: [startYear, startMonth, startDay].join('-'),
                    end_date: [endYear, endMonth, endDay].join('-'),
                    content: content
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
                        $('#edit-wfh').modal('hide');
                    }
                }
            });
        }
    });

    $("#dataTables-wfh").on('click', '#button-confirm-wfh', function() {
        const id = $(this).data('id');
        if (confirm('Bạn có muốn xác nhận yêu cầu này ?') === true) {
            $.ajax({
                url: `${window.origin}:81/?url=wfh/updateWfhStatus/${id}`,
                type: 'POST',
                data: {
                    status: 1
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

    $("#dataTables-wfh").on('click', '#button-cancel-wfh', function() {
        const id = $(this).data('id');
        $('#cancel-wfh input[name="id"]').val(id);
    });

    $("#button-modal-cancel-wfh").click(function() {
        var id = $('#cancel-wfh input[name="id"]').val();
        var reason = $('#cancel-wfh textarea[name="reason"]').val();
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
                url: `${window.origin}:81/?url=wfh/updateWfhStatus/${id}`,
                type: 'POST',
                data: {
                    reason: reason,
                    status: 2
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
                        $('#cancel-wfh').modal('hide');
                    }
                }
            });
        }
    });
});