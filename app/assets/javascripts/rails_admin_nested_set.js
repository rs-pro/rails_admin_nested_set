//= require jquery
//= require jquery_ujs
//= require jquery.ui.sortable
//= require jquery.mjs.nestedSortable

function rails_admin_nested_set(tree_config) {
    $(function () {
        $('#' + tree_config['id']).nestedSortable({
            disableNesting: 'no-nest',
            forcePlaceholderSize: true,
            handle: 'i.handle',
            helper: 'clone',
            items: 'li',
            maxLevels: tree_config['max_depth'],
            opacity: .6,
            placeholder: 'placeholder',
            tabSize: 25,
            tolerance: 'pointer',
            toleranceElement: '> div',
            update: function (event, ui) {
                $.ajax({
                    type: 'POST',
                    dataType: 'html',
                    url: tree_config['update_url'],
                    data: {
                        id:        ui.item.data('id'),
                        parent_id: ui.item.parent().parent().data('id'),
                        prev_id:   ui.item.prev().data('id'),
                        next_id:   ui.item.next().data('id')
                    },
                    error: function (xhr, status, error) {
                        alert(error);
                        window.location.reload();
                    }
                });
            }
        });
    });
}
