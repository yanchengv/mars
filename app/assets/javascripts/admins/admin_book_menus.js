// 添加book_menu
function addBookMenu(parent_id,book_id, book_type) {
    $('#add_book_menu_modal').modal('show');
    $('#add_book_menu_parent_id').val(parent_id);
    $('#add_book_menu_book_id').val(book_id);
    $('#add_book_menu_book_type').val(book_type);
}

//    修改book_menu
function updateBookMenu(menu) {
    $('#update_book_menu_modal').modal('show');
    $('#update_book_menu_id').val(menu.id)
    $('#update_book_menu_name').val(menu.name)
    $('#update_book_menu_url').val(menu.url)
    $('#update_book_menu_book_type').val(menu.book_type)
    $('#update_book_menu_is_disabled').val(menu.is_disabled)
    $('#update_book_menu_description').val(menu.description)
    $('#update_book_menu_description').val(menu.sort)
}

//添加book_menu
function deleteBookMenu(book_menu_id,menu_name) {
    $('#delete_book_menu_modal').modal('show');
    $('#delete_book_menu_id').val(book_menu_id)
    $('#book_menu_name_span').html(menu_name)
}