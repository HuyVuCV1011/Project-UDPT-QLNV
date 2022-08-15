$(document).ready(function () {
    var admin = JSON.parse(localStorage.getItem('admin'));

    $('#dataTables-shift').DataTable({
        ajax: {
            'headers': {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            },
            'type': 'GET',
            'url': `${window.origin}${window.location.pathname}?url=shift/index/${admin.NV_ID}`,
        },
        columns: [{
                data: 'CC_CHECKIN',
                name: 'CC_CHECKIN'
            },
            {
                data: 'CC_CHECKOUT',
                name: 'CC_CHECKOUT'
            },
            {
                data: 'HOUR',
                name: 'HOUR'
            }
        ],
        "aaSorting": []
    });

    $.ajax({
        url: `${window.origin}${window.location.pathname}?url=shift/checkCheckinCheckout/${admin.NV_ID}`,
        type: 'POST',
        headers: {
            'Authorization': 'Bearer ' + localStorage.getItem('token')
        },
        success: function(res) {
            var response = JSON.parse(res);
            if (response.type == 1) {
                $('#checkinBtn').prop("disabled", false);
                $('#checkoutBtn').prop("disabled", true);
            } else if (response.type == 2) {
                $('#checkinBtn').prop("disabled", true);
                $('#checkoutBtn').prop("disabled", false);
                $('#checkoutBtn').attr("data-shift-id", response.data);
            } else {
                $('#checkinBtn').prop("disabled", true);
                $('#checkoutBtn').prop("disabled", true);
            }
        }
    });

    $('#checkinBtn').click(function () {
        $.ajax({
            url: `${window.origin}${window.location.pathname}?url=shift/checkIn/${admin.NV_ID}`,
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            },
            success: function(res) {
                var response = JSON.parse(res);
                swal({
                    title: 'Checkin thành công',
                    type: 'success'
                });
                $('#checkinBtn').prop("disabled", true);
                $('#checkoutBtn').prop("disabled", false);
                $('#checkoutBtn').attr("data-shift-id", response.data);
                $('#dataTables-shift').DataTable().ajax.reload();
            }
        });
    });

    $('#checkoutBtn').click(function () {
        var shift_id = $(this).data('shift-id');
        $.ajax({
            url: `${window.origin}${window.location.pathname}?url=shift/checkOut/${shift_id}`,
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            },
            success: function(res) {
                if (res) {
                    swal({
                        title: 'Checkout thành công',
                        type: 'success'
                    });
                    $('#checkoutBtn').prop("disabled", true);
                    $('#dataTables-shift').DataTable().ajax.reload();
                }
            }
        });
    });

    $('#dataTables-report-shift').hide();

    $('#reportShiftBtn').click(function (){
        if ($('#reportShift input[name="start_date"]').val() == '' || $('#reportShift input[name="end_date"]').val() == '') {
            swal({ title: 'Ngày bắt đầu và ngày kết thúc không được để trống', type: 'error' });
            return false;
        }
        if ($('#reportShift input[name="start_date"]').val() > $('#reportShift input[name="end_date"]').val()) {
            swal({ title: 'Ngày bắt đầu không được lớn hơn ngày kết thúc', type: 'error' });
            return false;
        }
        var startDate = new Date($('#reportShift input[name="start_date"]').val());
        var endDate = new Date($('#reportShift input[name="end_date"]').val());
        var startDay = startDate.getDate();
        var startMonth = startDate.getMonth() + 1;
        var startYear = startDate.getFullYear();
        var endDay = endDate.getDate();
        var endMonth = endDate.getMonth() + 1;
        var endYear = endDate.getFullYear();
        $('#totalHour').hide();
        $.ajax({
            url: `${window.origin}${window.location.pathname}?url=shift/getTotalHour/${admin.NV_ID}`,
            type: 'GET',
            data: {
                start_date: [startYear, startMonth, startDay].join('-'),
                end_date: [endYear, endMonth, endDay].join('-')
            },
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            },
            success: function(res) {
                var response = JSON.parse(res);
                $('#totalHour').show();
                $('#totalHour').html(`Tổng số giờ làm việc từ ngày ${[startDay, startMonth, startYear].join('/')} đến ngày ${[endDay, endMonth, endYear].join('/')}: ${response.data}`);
            }
        });
        $('#dataTables-report-shift').DataTable().destroy();
        $('#dataTables-report-shift').DataTable({
            ajax: {
                'headers': {
                    'Authorization': 'Bearer ' + localStorage.getItem('token')
                },
                'data': {
                    start_date: [startYear, startMonth, startDay].join('-'),
                    end_date: [endYear, endMonth, endDay].join('-')
                },
                'type': 'GET',
                'url': `${window.origin}${window.location.pathname}?url=shift/reportShift/${admin.NV_ID}`,
            },
            columns: [{
                    data: 'CC_CHECKIN',
                    name: 'CC_CHECKIN'
                },
                {
                    data: 'CC_CHECKOUT',
                    name: 'CC_CHECKOUT'
                },
                {
                    data: 'HOUR',
                    name: 'HOUR'
                }
            ],
            "aaSorting": []
        });
        $('#dataTables-report-shift').show();
    });

    $('#reportHourBtn').click(function (){
        var month = $('#reportHour select[name="month"]').val();
        var year = $('#reportHour select[name="year"]').val();
        $('#totalMyHour').hide();
        $('#totalMonthHour').hide();
        $('#result').hide();
        $.ajax({
            url: `${window.origin}${window.location.pathname}?url=shift/reportHour/${admin.NV_ID}`,
            type: 'GET',
            data: {
                month: month,
                year: year
            },
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            },
            success: function(res) {
                var response = JSON.parse(res);
                $('#totalMyHour').show();
                $('#totalMonthHour').show();
                $('#result').show();
                $('#totalMyHour').html(`Tổng số giờ làm việc của bạn tháng ${month}: ${response.data.my_hour}`);
                $('#totalMonthHour').html(`Tổng số giờ làm việc chuẩn của tháng ${month}: ${response.data.month_hour}`);
                if (response.data.my_hour >= response.data.month_hour) {
                    $('#result').html('Đã đủ giờ công');
                } else {
                    $('#result').html(`Chưa đủ giờ công, còn thiếu ${response.data.month_hour - response.data.my_hour} giờ`);
                }
            }
        });
    });
});

function currentTime() {
    let date = new Date(); 
    let hh = date.getHours();
    let mm = date.getMinutes();
    let ss = date.getSeconds();
    let session = "AM";
  
    if(hh === 0){
        hh = 12;
    }
    if(hh > 12){
        hh = hh - 12;
        session = "PM";
     }
  
     hh = (hh < 10) ? "0" + hh : hh;
     mm = (mm < 10) ? "0" + mm : mm;
     ss = (ss < 10) ? "0" + ss : ss;
      
     let time = hh + ":" + mm + ":" + ss + " " + session;
  
    if (document.getElementById("clock")) {
        document.getElementById("clock").innerText = 'Giờ: ' + time; 
    }
    setTimeout(function(){ currentTime() }, 1000);
}
  
currentTime();