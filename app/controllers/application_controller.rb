class ApplicationController < ActionController::Base
  require 'google/apis/pagespeedonline_v5'

  def root
    redirect_to lighthouse_reports_path
  end
end
