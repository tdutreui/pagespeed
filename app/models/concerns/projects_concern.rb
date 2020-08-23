module ProjectsConcern
  extend ActiveSupport::Concern

def current_project
  if !@current_project && current_user
    @current_project = current_user.projects.find_by(id: session[:current_project_id])
  end
  @current_project
end

def set_current_project(project)
  session[:current_project_id]=project.id
end
end