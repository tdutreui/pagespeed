require 'rails_helper'

RSpec.describe "Pages", type: :request do

  describe "Analyze page" do

    before do
      response=JSON.parse(File.read('spec/stubs/sample_report.json'))
      allow_any_instance_of(PagespeedApiClient).to receive(:run_pagespeed).and_return(response)
    end

    it "should reject invalid urls" do
      post analyse_pages_path, params: {page: {url: "an_invalid_url"}}
      expect(response).to have_http_status 500
      expect(Page.count).to eq 0
    end

    it "should create a page with valid url" do
      post analyse_pages_path, params: {page: {url: "https://www.hey.com"}}
      expect(Page.count).to eq 1
      @page=Page.first
      expect(response).to redirect_to @page #redirects to report
      expect([@page.score_mobile,@page.score_desktop].all?{|score| score>0}).to eq true
    end
  end

end