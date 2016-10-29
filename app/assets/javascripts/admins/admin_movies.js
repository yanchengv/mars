//删除movie
function deleteMovie(movieId,movie_name){
    $('#delete_movie_modal').modal('show')
    $('#delete_movie_modal').on('shown.bs.modal', function (e) {
        $("#movie_id_input").val(movieId)
        $("#movie_name_span").html(movie_name)
    })
}


//    删除movie_details
function delete_movie_detail_modal(movie_detail_id, movie_detail_name) {
    $('#delete_movie_detail_modal').modal('show')
    $('#delete_movie_detail_modal').on('shown.bs.modal', function (e) {
        $("#movie_detail_id_input").val(movie_detail_id)
        $("#movie_detail_name_span").html(movie_detail_name)
    })
}

// 修改movie_details
function update_movie_detail_modal(movie_detail){
    console.log(movie_detail)
    $('#update_movie_detail_modal').modal('show')
    $('#update_movie_detail_modal').on('shown.bs.modal', function (e) {
        $("#update_movie_detail_id").val(movie_detail.id)
        $("#update_name_input").val(movie_detail.name)
        $("#update_episode_input").val(movie_detail.episode)
        $("#update_url_input").val(movie_detail.url)
        $("#update_url2_input").val(movie_detail.url2)
        $("#update_wangpan_url").val(movie_detail.wangpan_url)
        $("#update_wangpan_password_input").val(movie_detail.wangpan_password)
    })
}

function pageRefresh(){
    window.location.reload();
}