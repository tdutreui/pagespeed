module LighthouseReportsSpecHelpers
  def stub_pagespeed_api_client
    response = JSON.parse(File.read('spec/support/stubs/sample_report.json'))
    allow_any_instance_of(PagespeedApiClient).to receive(:run_pagespeed).and_return(response)
  end

  def stub_current_project_with current_project
    allow_any_instance_of(ProjectsConcern).to receive(:current_project).and_return(current_project)
  end
end