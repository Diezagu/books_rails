# frozen_string_literal: true

# See https://api.rubyonrails.org/v6.1.0/classes/ActionView/Helpers/FormBuilder.html
# for future customizations
class TwBuilder < ActionView::Helpers::FormBuilder
  def text_field(method, options = {})
    options = append_html_class(options, 'input')
    super(method, options)
  end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    html_options = append_html_class(html_options, 'select')
    super(method, choices, options, html_options, &block)
  end

  def number_field(method, options = {})
    options = append_html_class(options, 'input')
    super(method, options)
  end

  def submit(value = nil, html = {})
    html = append_html_class(html, 'button')
    super(value, html)
  end

  def label(method, text = nil, options = {})
    options = append_html_class(options, 'label')
    super(method, text, options)
  end

  private

  def append_html_class(html, kind)
    klass = "#{kind} " + html[:class].to_s
    html.merge(class: klass.strip)
  end
end
