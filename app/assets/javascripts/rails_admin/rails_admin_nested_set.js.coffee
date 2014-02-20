#= require rails_admin/jquery.mjs.nestedSortable

window.rails_admin_nested_set = (tree_config) ->
  show_flash = (data)->
    $flash = $('<div>')
      .addClass('nestable-flash alert')
      .append($('<button>').addClass('close').data('dismiss', 'alert').html('&times;'))
      .append($('<span>').addClass('body').html(data))
    $('#rails_admin_nestable').append($flash)
    $flash.fadeIn(200).delay(2000).fadeOut 200, -> $(this).remove()

  $ ->
    $("#" + tree_config["id"]).nestedSortable
      forcePlaceholderSize: true
      # handle: 'i.dd-handle',
      helper: "clone"
      items: "li"
      maxLevels: tree_config["max_depth"]
      opacity: .6
      placeholder: "dd-placeholder"
      tabSize: 25
      update: (event, ui) ->
        $.ajax
          type: "POST"
          dataType: "html"
          url: tree_config["update_url"]
          data:
            id: ui.item.data("id")
            parent_id: ui.item.parent().parent().data("id")
            prev_id: ui.item.prev().data("id")
            next_id: ui.item.next().data("id")

          error: (xhr, status, error) ->
            show_flash('Nested Set: fatal error')

          success: (data) ->
            show_flash(data)
