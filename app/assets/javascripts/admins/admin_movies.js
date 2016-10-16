<!-- 修改movie_details-->
function update_movie_detail_modal(movie_detail_id) {
    $.ajax({
        type: 'get',
        url: '/admin_movie_details/' + movie_detail_id,
        success: function (data) {
            $('#update_movie_detail_modal').modal('show')
            $('#update_movie_detail_modal').on('shown.bs.modal', function (e) {
                $('#update_movie_detail_id').val(data['id']);
                $('#update_name_input').val(data['name']);
                $('#update_episode_input').val(data['episode']);
                $('#update_url_input').val(data['url']);
                $('#update_url2_input').val(data['url2']);
                $('#update_wangpan_url').val(data['wangpan_url']);
                $('#update_wangpan_password_input').val(data['wangpan_password'])
            })
        },
        error: function (e) {
            alert('失败')
        }

    })
}
;

//    删除movie_details
function delete_movie_detail_confirm(id, name) {
    var r = confirm("确定删除" + name + '?');
    if (r == true) {
        $.ajax({
            type: 'post',
            data: {movie_detail_id: id},
            url: '/admin_movie_details/delete_movie_detail',
            success: function () {
                alert("删除成功")

            },
            error: function () {
                alert('删除失败')
            }

        })
    }
    else {

    }

}