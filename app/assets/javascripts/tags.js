var url;
function addTag(){
    $('#add_tag_dialog').dialog('open').dialog('center').dialog('setTitle','添加标签');
    $('#save_tag').form('clear');
    url = '/tags';
}
function editTag(){
    var row = $('#tag-list').datagrid('getSelected');
    if (row){
        $('#add_tag_dialog').dialog('open').dialog('center').dialog('setTitle','编辑标签');
        $('#save_tag').form('load',row);
        url = '/tags/update?id='+row.id;
    }
}
function saveTag(){
    $('#save_tag').form('submit',{
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
                $('#add_tag_dialog').dialog('close');        // close the dialog
                $('#tag-list').datagrid('reload');    // reload the movie data
            }
        }
    });
}
function destroyTag(){
    var row = $('#tag-list').datagrid('getSelected');
    if (row){
        $.messager.confirm('删除标签','确定要删除?',function(r){
            if (r){
                $.post('/tags/delete_tag',{id:row.id},function(result){
                    if (result.success){
                        $('#tag-list').datagrid('reload');    // reload the user data
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

function tagDetails(){
    var row = $('#tag-list').datagrid('getSelected');
    if(row){

    }
}