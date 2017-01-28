module ApplicationHelper
  def resource_error_messages!(resource)
    no_errors = resource.nil? || resource.errors.empty?
    return '' if no_errors

    num_errors = pluralize(resource.errors.full_messages.count, "error") + " stopped us from adding this to the database."
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
      <div class="alert alert-error alert-danger">
        #{ content_tag :p, num_errors }
        #{ button_tag "x", class:"close", data: { dismiss:"alert" } }
        #{ messages }
      </div>
    HTML

    html.html_safe
  end

  def alert_class(key)
    return "success" if key == "notice"
    return "danger" if key == "alert"
    return "danger" if key == "error"
  end
end
