require 'rails_helper'

RSpec.describe Project, type: :model do
  before do
    stub_pagespeed_api_client
  end

  let(:project) { create(:project) }

  it "should calculate mean score" do
    def mean arr
      arr.sum(0.0) / arr.size
    end

    create(:page, project: project)
    create(:page2, project: project)

    mobile_mean = mean Page.all.map { |page| page.score_mobile }
    desktop_mean = mean Page.all.map { |page| page.score_desktop }
    expect(project.mean_score_mobile).to eq(mobile_mean)
    expect(project.mean_score_desktop).to eq(desktop_mean)
  end
end
