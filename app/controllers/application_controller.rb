class ApplicationController < ActionController::Base
  require 'concerns/application_concern'
  include ApplicationConcern
  require 'google/apis/pagespeedonline_v5'

  def root

  end



end
