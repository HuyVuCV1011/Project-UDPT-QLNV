$(document).ready(function() {
    var admin = JSON.parse(localStorage.getItem('admin'));
    $.ajax({
        url: `${window.origin}:81/?url=off/index/${admin.NV_ID}`,
        type: 'GET',
        success: function(res1) {
            var response1 = JSON.parse(res1);
            if (response1.data.length) {
                $.ajax({
                    url: `${window.origin}${window.location.pathname}?url=staff/show/${response1.data[0].NP_IDNGUOIDUYET}`,
                    type: 'GET',
                    success: function(res2) {
                        var response2 = JSON.parse(res2);
                        $('#dataTables-off').DataTable({
                            ajax: {
                                'type': 'GET',
                                'data': {
                                    'manager': response2.NV_Ten
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
                                }
                            ],
                            "aaSorting": []
                        });
                    }
                });
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
                        }
                    ],
                    "aaSorting": []
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
                url: `${window.origin}:81/?url=off/addOff/${admin.NV_ID}`,
                type: 'POST',
                data: {
                    start_date: [startYear, startMonth, startDay].join('-'),
                    end_date: [endYear, endMonth, endDay].join('-'),
                    content: content,
                    day: Math.abs(difference / (1000 * 3600 * 24)),
                    type: type
                },
                success: function(data) {
                    if (data.success) {
                        swal({
                            title: 'Thêm thành công',
                            type: 'success'
                        });
                        $('#add-off input[name="start_date"]').val('');
                        $('#add-off input[name="end_date"]').val('');
                        $('#add-off textarea[name="content"]').val('');
                        $('#add-off').modal('hide');
                        $('#dataTables-off').DataTable().ajax.reload();

                    }
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
            type: 'DELETE',
            success: function(response) {
                if (response.success) {
                    swal({
                        title: 'Xóa thành công',
                        type: 'success'
                    });
                    $('#dataTables-off').DataTable().ajax.reload();
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
            success: function(response) {
                if (response.success) {
                    $('#edit-off input[name="id"]').val(response.data.id);
                    $('#edit-off input[name="start_date"]').val(response.data.start_date);
                    $('#edit-off input[name="end_date"]').val(response.data.end_date);
                    $('#edit-off textarea[name="content"]').val(response.data.content);
                }
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
                url: `${window.origin}:81/?url=off/updateOff/${id}`,
                type: 'PUT',
                data: {
                    start_date: [startYear, startMonth, startDay].join('-'),
                    end_date: [endYear, endMonth, endDay].join('-'),
                    content: content,
                    day: Math.abs(difference / (1000 * 3600 * 24)),
                    type: type
                },
                success: function(response) {
                    if (response.success) {
                        swal({
                            title: 'Cập nhật thành công',
                            type: 'success'
                        });
                        $('#edit-off').modal('hide');
                        $('#dataTables-off').DataTable().ajax.reload();
                    }
                }
            });
        }
    });

    $("#dataTables-off").on('click', '#button-confirm-off', function() {
        const id = $(this).data('id');
        if (confirm('Bạn có muốn xác nhận yêu cầu này ?') === true) {
            $.ajax({
                url: `${window.origin}:81/?url=off/updateOffStatus/${id}`,
                type: 'PUT',
                data: {
                    status: 1
                },
                success: function(response) {
                    if (response.success) {
                        swal({
                            title: 'Cập nhật thành công',
                            type: 'success'
                        });
                        $('#dataTables-off').DataTable().ajax.reload();
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
                type: 'PUT',
                data: {
                    reason: reason,
                    status: 2
                },
                success: function(response) {
                    if (response.success) {
                        swal({
                            title: 'Cập nhật thành công',
                            type: 'success'
                        });
                        $('#cancel-off').modal('hide');
                        $('#dataTables-off').DataTable().ajax.reload();
                    }
                }
            });
        }
    });
});