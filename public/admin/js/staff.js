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
            }
        ],
        "aaSorting": []
    });
});