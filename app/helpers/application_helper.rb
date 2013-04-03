module ApplicationHelper

  def class_if_current(url, className = "current")
    if current_page? url
      { class: className }
    else
      {}
    end
  end

end
