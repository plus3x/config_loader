# frozen_string_literal: true

module ApplicationHelper
  def marked_li_with_link_to(name, path, options = {})
    options[:li_options] ||= {}
    options[:link_options] ||= {}
    content_tag :li, { class: ('active' if current_page?(path)) }.merge(options[:li_options]) do
      link_to name, path, options[:link_options]
    end
  end
end
