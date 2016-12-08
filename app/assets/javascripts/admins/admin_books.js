// 添加book
function addBook() {
    $('#add_book_modal').modal('show');
}

//    修改book
function updateBook(book) {
    $('#update_book_modal').modal('show');
    $('#update_book_id').val(book.id);
    $('#update_book_name').val(book.name);
    $('#update_book_type').val(book.book_type);
    if (book.is_disabled == true) {
        $('#update_book_is_disabled_true').attr('checked',true)
    } else {
        //$("#update_book_is_disabled_true").removeAttr("checked");
        $('#update_book_is_disabled_false').attr('checked',true)
    }
    $('#update_book_logo').val(book.logo)
    $('#update_book_content').val(book.content)
}

//删除book
function deleteBook(book) {
    $('#delete_book_modal').modal('show');
    $('#delete_book_id').val(book.id)
    $('#book_name_span').html(book.name)
}