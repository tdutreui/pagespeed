require 'rails_helper'

RSpec.describe LighthouseReport, type: :model do
  before do
    stub_pagespeed_api_client
  end

  let(:page) { create(:page) }
  it "should add a report to newly created pages" do
    expect(page.reports.count).to eq 1
  end

  it "should generate desktop and mobile lighthouse reports on creation" do
    lighthouse_report = create(:lighthouse_report, page: page)
    expect(lighthouse_report.json_report_mobile).to be_truthy
    expect(lighthouse_report.json_report_desktop).to be_truthy
  end

  it "should return reports as a Hash" do
    lighthouse_report = create(:lighthouse_report, page: page)
    expect(lighthouse_report.report('mobile').class).to eq Hash
    expect(lighthouse_report.report('desktop').class).to eq Hash

  end
end
