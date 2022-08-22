$(document).ready(function() {
    $.ajax({
        url: `${window.origin}:81/?url=article/getArticles`,
        success: function(res) {
            if (res) {
                var response = JSON.parse(res);
                var html = '<h5 class="h3 mb-2 text-gray-800">Hoạt động xã hội</h5><ol>';
                for (var social of response.socials) {
                    html += `
                    <li style='color: #476CD9'>
                        <div>${social.title}</div>
                        <p style='color: #858796'><small>Ngày đăng: <i class="fas fa-fw fa-calendar"></i> ${social.date}</small></p>
                        <p style='text-align: justify;color: #858796'><b>Nội dung:</b> ${social.content}</p>
                    </li>
                    `;
                }
                html += '</ol><h5 class="h3 mb-2 text-gray-800">Tuyển dụng</h5><ol>';
                for (var recruit of response.recruits) {
                    html += `
                    <li style='color: #476CD9'>
                        <div>${recruit.position}</div>
                        <p style='color: #858796'><small>Ngày đăng: <i class="fas fa-fw fa-calendar"></i> ${recruit.date}</small></p>
                        <p style='color: red'>Lương: ${recruit.salary}</p>
                        <p style='color: #858796'><b>Giới thiệu công việc:</b> ${recruit.introduce}</p>
                        <p style='color: #858796'><b>Yêu cầu công việc:</b> ${recruit.skill}</p>
                        <p style='color: #858796'><b>Quyền lợi:</b> ${recruit.benifit}</p>
                    </li>
                    `;
                }
                $('#article-container').html(html);
            }
        }
    });
});