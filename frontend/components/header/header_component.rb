# frozen_string_literal: true

module HeaderComponent
  extend ComponentHelper

  def left_links
    items = []
    if current_user.present?
      items << { name: 'My projects', href: projects_path }
      if current_project
        items << { name: "Project #{current_project.display_name}", href: project_path(current_project) }
      end
    end
    items
  end

  def right_links
    items = []
    if current_user.present?
      items << { name: 'Logout', href: destroy_user_session_path, options: { method: :delete } }
    else
      items << { name: 'Sign in', href: new_user_session_path }
      items << { name: 'Register', href: new_user_registration_path }
    end
    items
  end

  def theme
    white_theme_pages = ['home', 'report', 'page']
    "is-blue" unless white_theme_pages.include? current_page
  end
end
