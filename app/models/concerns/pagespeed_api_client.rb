module PagespeedApiClient
  extend ActiveSupport::Concern
  require 'google/apis/pagespeedonline_v5'

  def run_pagespeed opts
    ps = Google::Apis::PagespeedonlineV5::PagespeedInsightsService.new
    ps.key=Rails.application.credentials.google[:api_key]
    ps.runpagespeed_pagespeedapi(opts)
  end

end