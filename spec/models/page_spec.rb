require 'rails_helper'

RSpec.describe Page, type: :model do
  let(:valid_urls) { ['github.com', 'github.com/', 'http://github.com', 'https://github.com', 'https://github.com/hotwired', 'github.com/hotwired'] }
  let(:invalid_urls) { ['github', 'htp://github.com', 'https//github.com', 'ftp://github.com/hotwired', 'localhost'] }
  let(:page) { build(:page) }

  before do
    stub_pagespeed_api_client
  end

  it "should create a report on page create" do
    page.save
    expect(page.reports.count).to eq 1
  end

  it "should accept valid urls" do

    assert valid_urls.all? { |url|
      page.url = url
      page.valid?
    }
  end

  it "should reject invalid urls" do
    invalid_urls.none? { |url|
      page.url = url
      page.valid?
    }
  end

  it "should extract domain from valid url on validation" do
    valid_urls.each { |url|
      page.url = url
      page.valid?
      expect(page.domain).to eq 'github.com'
    }
  end

  it "should extract path from valid url on validation" do
    page.valid?
    expect(page.path).to eq ""

    page.url = 'github.com/hotwired'
    page.valid?
    expect(page.path).to eq '/hotwired'
  end

  it "should return the most recent scores as page scores" do
    page.save #creates a report on create
    reports_count = page.reports.count

    page.add_lighthouse_report
    expect(page.reports.count).to eq(reports_count + 1)

    last_report = page.reports.last
    expect(last_report == LighthouseReport.order(:updated_at).last)
    expect(page.score_mobile == last_report.score_mobile)
    expect(page.score_desktop == last_report.score_desktop)
  end

end
