function deleteNews(news_id,news_name){
    $('#delete_news_modal').modal('show')
    $('#delete_news_modal').on('shown.bs.modal', function (e) {
        $("#news_id_input").val(news_id)
        $("#news_name_span").html(news_name)
    })
}