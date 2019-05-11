module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def root_class
    if request.path == root_path
      "active item"
    else
      "item"
    end
  end

  def show_name
    text_field_content(:name, current_user)
  end


  def show_email
    text_field_content(:email, current_user)
  end

  def show_gender
    select_tag_content(current_user)
  end

  private

  def text_field_content(name, value = nil)
    placeholder = {
        name: "E.g Sajjad murtaza",
        email: "sajjadmurtaza.nxb@gmail.com"
    }
    html_params = { placeholder: placeholder[name], required: true }
    value = value ? value.send(name) : nil
    text_field_tag("adult[][#{name}]", value, html_params)
  end

  def select_tag_content(value = nil)
    html_params = { class: "ui fluid dropdown" }
    value = value ? value.gender : nil
    options = options_for_select([%w(Male Male), %w(Female Female)], value)
    select_tag(:gender, options, html_params)
  end
end
