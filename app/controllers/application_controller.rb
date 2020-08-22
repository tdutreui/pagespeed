class ApplicationController < ActionController::Base
  require 'google/apis/pagespeedonline_v5'

  def root
    if current_user
      redirect_to lighthouse_reports_path
    end
  end

  private

  def current_project
    if !@current_project && current_user
      @current_project = current_user.projects.where(id: session[:current_project_id])
    end
    @current_project
  end
end
