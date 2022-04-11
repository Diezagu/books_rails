module ApplicationHelper
  def app_form_with(model: nil, scope: nil, url: nil, format: nil, **options, &block)
    options = options.reverse_merge(builder: TwBuilder)
    form_with(model: model, scope: scope, url: url, format: format, **options, &block)
  end
end
