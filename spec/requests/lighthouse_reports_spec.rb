require 'rails_helper'

RSpec.describe "LighthouseReports", type: :request do
  before do
    stub_pagespeed_api_client
  end

  describe "show a report" do
    it "should show a new page report" do
      p=create(:page)
      expect(LighthouseReport.count).to eq 1
      get lighthouse_report_path(p.reports.first)
      expect(response).to have_http_status(200)
    end
  end
end
