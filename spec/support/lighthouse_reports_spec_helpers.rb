module LighthouseReportsSpecHelpers
  def stub_pagespeed_api_client
    response = JSON.parse(File.read('spec/support/stubs/sample_report.json'))
    allow_any_instance_of(PagespeedApiClient).to receive(:run_pagespeed).and_return(response)
  end
end