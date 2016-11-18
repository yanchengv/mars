module ApplicationHelper
  # def markdown(text)
  #   markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,no_intra_emphasis: true,
  #                                      fenced_code_blocks: true,
  #                                      disable_indented_code_blocks: true)
  #   return markdown.render(text).html_safe
  # end


  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div#(:line_numbers => :table)
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true,
                                  hard_wrap: true)
    options = {
        fenced_code_blocks: true,
        no_intra_emphasis: true,
        autolink: true,
        lax_html_blocks: true,
        disable_indented_code_blocks: true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end
end
