class ApplicationController < ActionController::Base
  require 'google/apis/pagespeedonline_v5'

  def root
    ps=Google::Apis::PagespeedonlineV5::PagespeedInsightsService.new
    r=ps.runpagespeed_pagespeedapi(url: 'https://www.woom.fr')

    render plain: r.to_s
  end
end
