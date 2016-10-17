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


function pageRefresh(){
    window.location.reload();
}