module RailsAdminNestedSet
  module Helper
    def rails_admin_nested_set(tree, opts= {})
      tree = tree.to_a.sort_by { |m| m.lft }
      roots = tree.select{|elem| elem.parent_id.nil?}
      id = "ns_#{rand(100_000_000..999_999_999)}"
      content = content_tag(:ol, rails_admin_nested_set_builder(roots, tree), id: id, class: 'dd-list')
      js = "rails_admin_nested_set({id: '#{id}', max_depth: #{max_depth}, update_url: '#{nested_set_path(model_name: @abstract_model)}'});"
      content + content_tag(:script, js.html_safe, type: 'text/javascript')
    end

    def g_link(node, fv, on, badge)
      link_to(
        fv.html_safe,
        toggle_path(model_name: @abstract_model, id: node.id, method: 'enabled', on: on.to_s),
        method: :post,
        class: 'badge ' + badge,
      )
    end

    def rails_admin_nested_set_builder(nodes, tree)
      nodes.map do |node|
        li_classes = 'dd-item dd3-item'

        content_tag :li, class: li_classes, :'data-id' => node.id do
          output = content_tag :div, 'drag', class: 'dd-handle dd3-handle'
          output+= content_tag :div, class: 'dd3-content' do
            content = ''.html_safe

            if node.respond_to?(:enabled) && respond_to?(:toggle_path)
              content += case node.enabled
                when nil
                  g_link(node, '&#x2718;', 0, 'badge-important') + g_link(node, '&#x2713;', 1, 'badge-success')
                when false
                  g_link(node, '&#x2718;', 1, 'badge-important')
                when true
                  g_link(node, '&#x2713', 0, 'badge-success')
                else
                  %{<span class="badge">-</span>}
              end.html_safe
            end

            content += link_to @model_config.with(object: node).object_label, edit_path(@abstract_model, node.id)
            [:cover, :image].each do |mth|
              if node.respond_to?(mth)
                content += image_tag(node.send(mth), style: "max-height: 90px")
              end
            end
            content += content_tag(:div, action_links(node), class: 'pull-right links')
            content
          end

          children = tree.select{|elem| elem.parent_id == node.id}
          output = content_tag(:div, output)
          if children.any?
            output += content_tag(:ol, rails_admin_nested_set_builder(children, tree), class: 'dd-list')
          end

          output
        end
      end.join.html_safe
    end

    def max_depth
      @nested_set_conf.options[:max_depth] || '0'
    end

    def action_links(model)
      content_tag :ul, class: 'inline actions' do
        menu_for :member, @abstract_model, model, true
      end
    end
  end
end
