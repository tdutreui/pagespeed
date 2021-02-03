# frozen_string_literal: true

module HeaderComponent
  extend ComponentHelper

  def links
    items = []
    if current_user.present?
      items << {name: 'My projects', href: projects_path} if current_user.projects.count>1
      items << {name: current_project? ? "Project #{current_project.display_name}" : 'My projects', href: projects_menu_path}
      items << {name: 'Logout', href: destroy_user_session_path, options: {method: :delete}}
    else
      items << {name: 'Sign in', href: new_user_session_path}
      items << {name: 'Register', href: new_user_registration_path}
    end
    items
  end

  def projects_menu_path
    if current_project
      project_path(current_project)
    elsif current_user.projects.blank?
      new_project_path
    else
      projects_path
    end
  end

  def theme
    white_theme_pages=['home', 'report', 'page']
    "is-blue" unless white_theme_pages.include? current_page
  end
end
