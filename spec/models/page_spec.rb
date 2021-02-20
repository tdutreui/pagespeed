require 'rails_helper'

RSpec.describe Page, type: :model do
  let(:valid_urls) { ['github.com', 'github.com/', 'http://github.com', 'https://github.com', 'https://github.com/hotwired', 'github.com/hotwired'] }
  let(:invalid_urls) { ['github', 'htp://github.com', 'https//github.com', 'ftp://github.com/hotwired', 'localhost'] }
  let(:p) { build(:page) }

  before do
    stub_pagespeed_api_client
  end

  it "should create a report on page create" do
    p.save
    expect(p.reports.count).to eq 1
  end

  it "should accept valid urls" do

    assert valid_urls.all? { |url|
      p.url = url
      p.valid?
    }
  end

  it "should reject invalid urls" do
    invalid_urls.none? { |url|
      p.url = url
      p.valid?
    }
  end

  it "should extract domain from valid url on validation" do
    valid_urls.each { |url|
      p.url = url
      p.valid?
      expect(p.domain).to eq 'github.com'
    }
  end

  it "should extract path from valid url on validation" do
    p.valid?
    expect(p.path).to eq ""

    p.url = 'github.com/hotwired'
    p.valid?
    expect(p.path).to eq '/hotwired'
  end

end
