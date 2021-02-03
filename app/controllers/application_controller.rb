class ApplicationController < ActionController::Base
  require 'concerns/application_concern'
  include ApplicationConcern
  include ProjectsConcern

  require 'google/apis/pagespeedonline_v5'

  def home

  end



end
