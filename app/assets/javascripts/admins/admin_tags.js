//删除tag
function deleteTag(tagId,tag_name){
    $('#delete_tag_modal').modal('show')
    $('#delete_tag_modal').on('shown.bs.modal', function (e) {
        $("#tag_id_input").val(tagId)
        $("#tag_name_span").html(tag_name)
    })
}