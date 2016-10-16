/*修改电影*/
function update_movie(movie_id){
    $.ajax({
        type: 'get',
        url: '/admin_movies/get_movie_by_id',
        data: {movie_id: movie_id},
        success: function (data) {
            $('#update_movie_modal').modal('show')
            $('#update_movie_modal').on('shown.bs.modal', function (e) {
                $("#update_movie_id").val(movie_id)
                $('#update_movie_name').val(data['name']);
                $('#update_movie_actors').val(data['actors']);
                $('#update_movie_abstract').val(data['abstract']);
                $('#update_movie_image_url').val(data['image_url']);
                $('#update_movie_show_time').val(data['show_time']);
                $('#update_movie_number').val(data['number']);
                $('#update_movie_sort').val(data['sort']);
                $('#update_movie_grade').val(data['grade']);
            })
        },
        error: function (e) {
            alert('失败')
        }

    })
}

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