var url;
function addMovie(){
    $('#add_movie_dialog').dialog('open').dialog('center').dialog('setTitle','添加电影');
    $('#add_movie').form('clear');
    url = '/movies';
}
function editMovie(){
    var row = $('#movie-list').datagrid('getSelected');
    if (row){
        $('#add_movie_dialog').dialog('open').dialog('center').dialog('setTitle','编辑电影');
        $('#save_movie').form('load',row);
        url = '/movies/update?id='+row.id;
    }
}
function saveMovie(){
    $('#save_movie').form('submit',{
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
                $('#add_movie_dialog').dialog('close');        // close the dialog
                $('#movie-list').datagrid('reload');    // reload the movie data
            }
        }
    });
}
function destroyMovie(){
    var row = $('#movie-list').datagrid('getSelected');
    if (row){
        $.messager.confirm('Confirm','确定要删除?',function(r){
            if (r){
                $.post('/movies/delete_movie',{id:row.id},function(result){
                    if (result.success){
                        $('#movie-list').datagrid('reload');    // reload the user data
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