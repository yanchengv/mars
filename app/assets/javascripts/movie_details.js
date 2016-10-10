var url;
function addMovieDetail(){
    $('#add_movie_detail_dialog').dialog('open').dialog('center').dialog('setTitle','添加电影');
    $('#save_movie_detail').form('clear');
    url = '/movie_details';
}
function editMovieDetail(){
    var row = $('#movie-detail-list').datagrid('getSelected');
    if (row){
        $('#add_movie_detail_dialog').dialog('open').dialog('center').dialog('setTitle','编辑电影');
        $('#save_movie_detail').form('load',row);
        url = '/movie_details/update?id='+row.id;
    }
}
function saveMovieDetail(){
    $('#save_movie_detail').form('submit',{
        url: url,
        onSubmit: function(){
            return $(this).form('validate');
        },
        success: function(result){
            var result = eval('('+result+')');
            if (result.errorMsg){
                $.messager.show({
                    title: 'Error',
                    msg: result.errorMsg
                });
            } else {
                $('#add_movie_detail_dialog').dialog('close');        // close the dialog
                $('#movie-detail-list').datagrid('reload');    // reload the movie data
            }
        }
    });
}
function destroyMovieDetail(){
    var row = $('#movie-detail-list').datagrid('getSelected');
    if (row){
        $.messager.confirm('Confirm','确定要删除?',function(r){
            if (r){
                $.post('/movies/delete_movie_detail',{id:row.id},function(result){
                    if (result.success){
                        $('#movie-detail-list').datagrid('reload');    // reload the user data
                    } else {
                        $.messager.show({    // show error message
                            title: 'Error',
                            msg: result.errorMsg

                        });
                    }
                },'json');
            }
        });
    }
}

