module RailsAdminNestedSet
  module Helper
    def rails_admin_nested_set(tree, opts= {})
      tree = tree.to_a.sort_by { |m| m.lft }
      roots = tree.select{|elem| elem.parent_id.nil?}
      id = "ns_#{rand(100_000_000..999_999_999)}"
      tree_config = {max_depth: max_depth, update_url: nested_set_path(model_name: @abstract_model)}.to_json
      content_tag(:ol, rails_admin_nested_set_builder(roots, tree), id: id, class: 'dd-list rails_admin_nested_set', 'data-config' => tree_config)
    end

    def g_link(node, fv, on, badge, meth)
      link_to(
        fv.html_safe,
        toggle_path(model_name: @abstract_model, id: node.id, method: meth, on: on.to_s),
        class: 'js-tree-toggle label ' + badge,
      )
    end

    def extra_fields(node)
      "".html_safe
    end

    def rails_admin_nested_set_builder(nodes, tree)
      nodes.map do |node|
        li_classes = 'dd-item dd3-item'

        content_tag :li, class: li_classes, :'data-id' => node.id do
          output = content_tag :div, 'drag', class: 'dd-handle dd3-handle'
          output+= content_tag :div, class: 'dd3-content clearfix' do
            content = ''.html_safe

            toggle_fields.each do |tf|
              if node.respond_to?(tf) && respond_to?(:toggle_path)
                content += case node.enabled
                  when nil
                    g_link(node, '&#x2718;', 0, 'label-danger', tf) + g_link(node, '&#x2713;', 1, 'label-success', tf)
                  when false
                    g_link(node, '&#x2718;', 1, 'label-danger', tf)
                  when true
                    g_link(node, '&#x2713', 0, 'label-success', tf)
                  else
                    %{<span class="label">-</span>}
                end.html_safe
              end
            end

            content += link_to @model_config.with(object: node).object_label, edit_path(@abstract_model, node.id)
            content += extra_fields(node)

            content += content_tag(:div, action_links(node), class: 'pull-right links')

            thumbnail_fields.each do |mth|
              if node.respond_to?(mth)
                img = if paperclip?
                  node.send(mth).url(thumbnail_size)
                elsif carrierwave?
                  node.send(mth, thumbnail_size)
                else
                  nil
                end
                content += image_tag(img, style: "max-height: 40px; max-width: 100px;", class: 'pull-right')
              end
            end
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
    def toggle_fields
      @nested_set_conf.options[:toggle_fields]
    end
    def thumbnail_fields
      @nested_set_conf.options[:thumbnail_fields]
    end
    def paperclip?
      @nested_set_conf.options[:thumbnail_gem] == :paperclip
    end
    def carrierwave?
      @nested_set_conf.options[:thumbnail_gem] == :carrierwave
    end
    def thumbnail_size
      @nested_set_conf.options[:thumbnail_size]
    end

    def action_links(model)
      content_tag :ul, class: 'list-inline actions' do
        menu_for :member, @abstract_model, model, true
      end
    end
  end
end
