$('#menu_tree').tree(
    {
        onClick:function(node){
            addPanel(node)

        }
    }
)

function addPanel(node){
    $('#tab-container').tabs('add',{
        title: 'Tab',
        content: '<div style="padding:10px">Content</div>',
        closable: true

    });
}