module NavigationHelper

  # Good
  def nav_tab(title, url, options = {})
    current_tab = options.delete(:current)
    options[:class] = (current_tab == title) ? 'current' : ''
    content_tag(:li, link_to(title, url), options)
  end

  # good
  def currently_at(tab)
    render partial: "shared/main_nav", locals: { current_tab: tab }
  end

end
