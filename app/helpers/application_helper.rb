module ApplicationHelper
#  class CodeRayify < Redcarpet::Render::HTML
#    def block_code(code, language)
#      CodeRay.scan(code, language).div(:line_numbers => :table)
#    end
#  end

#  def markdown(text)
#    coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)
#    options = {
#      :fenced_code_blocks => true,
#      :no_intra_emphasis => true,
#      :autolink => true,
#      :strikethrough => true,
#      :lax_html_block => true,
#      :superscript => true
#    }

#    markdown_to_html = Redcarpet::Markdown.new(coderayified, options )
#    markdown_to_html.render(text).html_safe
#  end

  def sortable(column, title = nil)
    if column == "name"
      title = "Name"
    elsif column == "file_size"
      title = "Size"
    else
      title = "Uploaded"
    end
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction, :remote => true}, {:class => css_class}
  end


end
