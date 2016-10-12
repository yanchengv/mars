var url;
function addMenu(){
    $('#add_menu_dialog').dialog('open').dialog('center').dialog('setTitle','添加菜单');
    $('#save_menu').form('clear');
    url = '/admin_menus';
}
function editMenu(){
    var row = $('#menu-list').datagrid('getSelected');
    if (row){
        $('#add_menu_dialog').dialog('open').dialog('center').dialog('setTitle','编辑菜单');
        $('#save_menu').form('load',row);
        url = '/admin_menus/update?id='+row.id;
    }
}
function saveMenu(){
    $('#save_menu').form('submit',{
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
                $('#add_menu_dialog').dialog('close');        // close the dialog
                $('#menu-list').datagrid('reload');    // reload the movie data
            }
        }
    });
}
function destroyMenu(){
    var row = $('#menu-list').datagrid('getSelected');
    if (row){
        $.messager.confirm('删除菜单','确定要删除?',function(r){
            if (r){
                $.post('/admin_menus/delete_menu',{id:row.id},function(result){
                    if (result.success){
                        $('#menu-list').datagrid('reload');    // reload the user data
                    } else {
                        $.messager.show({    // index error message
                            title: 'Error',
                            msg: result.errorMsg

                        });
                    }
                },'json');
            }
        });
    }
}

function menuDetails(){
    var row = $('#menu-list').datagrid('getSelected');
    if(row){

    }
}