module ApplicationHelper
  include ProjectsConcern

  def after_sign_in_path(user)
    if current_project
      project_path(current_project)
    elsif user.projects.blank?
      new_project_path
    else
      projects_path
    end
  end


end
