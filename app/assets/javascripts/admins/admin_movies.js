
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

function pageRefresh(){
    window.location.reload();
}