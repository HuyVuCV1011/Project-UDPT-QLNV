$(document).ready(function () {
    // Login
    $('#form-login').keypress(function (e) {
        var key = e.which;
        if(key == 13)  // the enter key code
        {
            var username = $("#username").val();
            var password = $("#password").val();
            if (username != "" && password != "") {
                $.ajax({
                    url: `${window.origin}${window.location.pathname}?url=auth/login`,
                    type: 'POST',
                    data: {
                        'username' : username,
                        'password' : password
                    },
                    success: function(res) {
                        var response = JSON.parse(res);
                        if(response.success) {
                            localStorage.setItem('token', response.token);
                            localStorage.setItem('admin', JSON.stringify(response.data));
                            if (response.data.NV_PhongBan == 'pb003') {
                                window.location.href = '?url=staff';
                            } else if (response.data.NV_PhongBan == 'pb001' || response.data.NV_PhongBan == 'pb002') {
                                window.location.href = '?url=ot';
                            }
                        } else {
                            swal({ title: 'Tài khoản / Mật khẩu không đúng', type: 'error' });
                        }
                    }
                });
            } else {
                swal({ title: 'Tài khoản / Mật khẩu không được để trống', type: 'error' });
            }
        }
    });

    $("#btn-login").click(function () {
        var username = $("#username").val();
        var password = $("#password").val();
        if (username != "" && password != "") {
            $.ajax({
                url: `${window.origin}${window.location.pathname}?url=auth/login`,
                type: 'POST',
                data: {
                    'username' : username,
                    'password' : password
                },
                success: function(res) {
                    var response = JSON.parse(res);
                    if(response.success) {
                        localStorage.setItem('token', response.token);
                        localStorage.setItem('admin', JSON.stringify(response.data));
                        if (response.data.NV_PhongBan == 'pb003') {
                            window.location.href = '?url=staff';
                        } else if (response.data.NV_PhongBan == 'pb001' || response.data.NV_PhongBan == 'pb002') {
                            window.location.href = '?url=ot';
                        }
                    } else {
                        swal({ title: 'Tài khoản / Mật khẩu không đúng', type: 'error' });
                    }
                }
            });
        } else {
            swal({ title: 'Tài khoản / Mật khẩu không được để trống', type: 'error' });
        }
    });
});

function logout()
{
    $.ajax({
        url: `${window.origin}${window.location.pathname}?url=auth/logout`,
        type: 'POST',
        headers: {
            'Authorization': 'Bearer ' + localStorage.getItem('token')
        },
        success: function(res) {
            var response = JSON.parse(res);
            if(response.success) {
                localStorage.removeItem('token');
                localStorage.removeItem('admin');
                window.location.href = '/';
            }
        }
    });
}