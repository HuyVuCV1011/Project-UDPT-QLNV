$(document).ready(function() {
    var admin = JSON.parse(localStorage.getItem('admin'));
    $.ajax({
        url: `${window.origin}:81/?url=ot/index/${admin.NV_ID}`,
        type: 'GET',
        success: function(res1) {
            var response1 = JSON.parse(res1);
            if (response1.data.length) {
                $.ajax({
                    url: `${window.origin}${window.location.pathname}?url=staff/show/${response1.data[0].OT_IDNGUOIDUYET}`,
                    type: 'GET',
                    success: function(res2) {
                        var response2 = JSON.parse(res2);
                        $('#dataTables-ot').DataTable({
                            ajax: {
                                'type': 'GET',
                                'data': {
                                    'manager': response2.NV_Ten
                                },
                                'url': `${window.origin}:81/?url=ot/index/${admin.NV_ID}`
                            },
                            columns: [
                                {
                                    data: 'OT_ID',
                                    name: 'OT_ID'
                                },
                                {
                                    data: 'OT_NGAY',
                                    name: 'OT_NGAY'
                                },
                                {
                                    data: 'OT_GIO',
                                    name: 'OT_GIO'
                                },
                                {
                                    data: 'OT_LIDO',
                                    name: 'OT_LIDO'
                                },
                                {
                                    data: 'OT_LIDOTUCHOI',
                                    name: 'OT_LIDOTUCHOI'
                                },
                                {
                                    data: 'OT_DUYET',
                                    name: 'OT_DUYET'
                                },
                                {
                                    data: 'OT_IDNGUOIDUYET',
                                    name: 'OT_IDNGUOIDUYET'
                                }
                            ],
                            "aaSorting": []
                        });
                    }
                });
            } else {
                $('#dataTables-ot').DataTable({
                    ajax: {
                        'type': 'GET',
                        'url': `${window.origin}:81/?url=ot/index/${admin.NV_ID}`
                    },
                    columns: [
                        {
                            data: 'OT_ID',
                            name: 'OT_ID'
                        },
                        {
                            data: 'OT_NGAY',
                            name: 'OT_NGAY'
                        },
                        {
                            data: 'OT_GIO',
                            name: 'OT_GIO'
                        },
                        {
                            data: 'OT_LIDO',
                            name: 'OT_LIDO'
                        },
                        {
                            data: 'OT_LIDOTUCHOI',
                            name: 'OT_LIDOTUCHOI'
                        },
                        {
                            data: 'OT_DUYET',
                            name: 'OT_DUYET'
                        },
                        {
                            data: 'OT_IDNGUOIDUYET',
                            name: 'OT_IDNGUOIDUYET'
                        }
                    ],
                    "aaSorting": []
                });
            }
        }
    });

    $('#button-modal-add-ot').click(function() {
        if ($('#add-ot input[name="date"]').val() == '') {
            swal({ title: 'Ngày tăng ca không được để trống', type: 'error' });
            return false;
        }
        var date = new Date($('#add-ot input[name="date"]').val());
        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();
        var hour = $('#add-ot input[name="hour"]').val();
        var content = $('#add-ot textarea[name="content"]').val();
        var message = '';

        if (hour == '') {
            message = 'Giờ không được để trống';
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
                url: `${window.origin}:81/?url=ot/addOt/${admin.NV_ID}`,
                type: 'POST',
                data: {
                    date: [year, month, day].join('-'),
                    hour: hour,
                    content: content
                },
                success: function(data) {
                    if (data.success) {
                        swal({
                            title: 'Thêm thành công',
                            type: 'success'
                        });
                        $('#add-ot input[name="date"]').val('');
                        $('#add-ot input[name="hour"]').val('');
                        $('#add-ot textarea[name="content"]').val('');
                        $('#add-ot').modal('hide');
                        $('#dataTables-ot').DataTable().ajax.reload();

                    }
                }
            });
        }
    });

    $("#dataTables-ot").on('click', '#button-delete-ot', function() {
        if (!confirm("Bạn có muốn xóa lựa chọn này ?")) {
            return false;
        }

        const id = $(this).data('id');

        $.ajax({
            url: `${window.origin}:81/?url=ot/deleteOt/${id}`,
            type: 'DELETE',
            success: function(response) {
                if (response.success) {
                    swal({
                        title: 'Xóa thành công',
                        type: 'success'
                    });
                    $('#dataTables-ot').DataTable().ajax.reload();
                }
            }
        });
    });

    $("#dataTables-ot").on('click', '#button-edit-ot', function() {
        const id = $(this).data('id');
        $('#edit-ot input[name="date"]').val('');
        $('#edit-ot input[name="hour"]').val('');
        $('#edit-ot textarea[name="content"]').val('');
        $.ajax({
            url: `${window.origin}:81/?url=ot/getOtById/${id}`,
            type: 'GET',
            success: function(response) {
                if (response.success) {
                    $('#edit-ot input[name="id"]').val(response.data.id);
                    $('#edit-ot input[name="date"]').val(response.data.date);
                    $('#edit-ot input[name="hour"]').val(response.data.hour);
                    $('#edit-ot textarea[name="content"]').val(response.data.content);
                }
            }
        });
    });

    $('#button-modal-edit-ot').click(function() {
        var id = $('#edit-ot input[name="id"]').val();
        if ($('#edit-ot input[name="date"]').val() == '') {
            swal({ title: 'Ngày tăng ca không được để trống', type: 'error' });
            return false;
        }
        var date = new Date($('#edit-ot input[name="date"]').val());
        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();
        var hour = $('#edit-ot input[name="hour"]').val();
        var content = $('#edit-ot textarea[name="content"]').val();
        var message = '';

        if (hour == '') {
            message = 'Giờ không được để trống';
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
                url: `${window.origin}:81/?url=ot/updateOt/${id}`,
                type: 'PUT',
                data: {
                    date: [year, month, day].join('-'),
                    hour: hour,
                    content: content
                },
                success: function(response) {
                    if (response.success) {
                        swal({
                            title: 'Cập nhật thành công',
                            type: 'success'
                        });
                        $('#edit-ot').modal('hide');
                        $('#dataTables-ot').DataTable().ajax.reload();
                    }
                }
            });
        }
    });

    $("#dataTables-ot").on('click', '#button-confirm-ot', function() {
        const id = $(this).data('id');
        if (confirm('Bạn có muốn xác nhận yêu cầu này ?') === true) {
            $.ajax({
                url: `${window.origin}:81/?url=ot/updateOtStatus/${id}`,
                type: 'PUT',
                data: {
                    id: id,
                    status: 1
                },
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                    'Authorization': 'Bearer ' + localStorage.getItem('token')
                },
                success: function(response) {
                    if (response.success) {
                        swal({
                            title: 'Cập nhật thành công',
                            type: 'success'
                        });
                        $('#dataTables-ot').DataTable().ajax.reload();
                    }
                }
            });
        }
    });

    $("#dataTables-ot").on('click', '#button-cancel-ot', function() {
        const id = $(this).data('id');
        $('#cancel-ot input[name="id"]').val(id);
    });

    $("#button-modal-cancel-ot").click(function() {
        var id = $('#cancel-ot input[name="id"]').val();
        var reason = $('#cancel-ot textarea[name="reason"]').val();
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
                url: `${window.origin}:81/?url=ot/updateOtStatus/${id}`,
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
                        $('#cancel-ot').modal('hide');
                        $('#dataTables-ot').DataTable().ajax.reload();
                    }
                }
            });
        }
    });
});