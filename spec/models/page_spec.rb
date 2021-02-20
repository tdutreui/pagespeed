require 'rails_helper'

RSpec.describe Page, type: :model do
  let( :valid_urls) {['github.com','github.com/','http://github.com','https://github.com','https://github.com/hotwired','github.com/hotwired']}
  let( :invalid_urls) {['github','htp://github.com','https//github.com','ftp://github.com/hotwired','localhost']}
  before do
    stub_pagespeed_api_client
  end
  it "should create a report on page create" do
    p=create(:page)
    expect(p.reports.count).to eq 1
  end

  it "should accept valid urls" do
    p=build(:page)

    assert valid_urls.all?{ |url|
      p.url=url
      p.valid?
    }
  end

  it "should reject invalid urls" do
    p=build(:page)
    invalid_urls.none?{ |url|
      p.url=url
      p.valid?
    }
  end

end
