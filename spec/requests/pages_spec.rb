require 'rails_helper'

RSpec.describe "Pages", type: :request do
  before do
    stub_pagespeed_api_client
  end

  describe "Analyze page" do
    it "should reject invalid urls" do
      post analyse_pages_path, params: { page: { url: "an_invalid_url" } }
      expect(response).not_to have_http_status 200
      expect(Page.count).to eq 0
    end

    it "should create a page with valid url" do
      post analyse_pages_path, params: { page: { url: "https://www.hey.com" } }
      expect(Page.count).to eq 1
      p = Page.first
      expect(response).to redirect_to p.last_report #redirects to report
      expect([p.score_mobile, p.score_desktop].all? { |score| score > 0 }).to eq true
    end

    it "should add a report to an existing page with valid url" do
      2.times do |i|
        post analyse_pages_path, params: { page: { url: "https://www.hey.com" } }
        expect(Page.count).to eq 1
        expect(Page.first.reports.count).to eq i + 1
      end
      p = Page.first
      expect(response).to redirect_to p.last_report #redirects to report
      expect([p.score_mobile, p.score_desktop].all? { |score| score > 0 }).to eq true
    end
  end

  describe "update page" do
    context "logged out" do
      it "should not update page" do
        p = create(:page)
        patch page_path(p), params: { page: { daily_run: 1 } }
        expect(p.reload.daily_run).to be_falsey
        expect(response).to have_http_status :unprocessable_entity
        expect(JSON.parse(response.body)['code']).to eq 'LOGGED_OUT'
      end
    end

    context "logged in" do
      let(:u) { create(:user_with_project) }
      let(:current_project) { u.projects.first }
      let(:page) { create(:page, { project: current_project })}

      before do
        sign_in u
        stub_current_project_with current_project
      end

      it "should update page" do
        expect(page.daily_run).to be_falsey
        patch page_path(page), params: { page: { daily_run: 1 } }, as: :json
        expect(response).to have_http_status :ok
        expect(page.reload.daily_run).to be true
      end
    end

  end

  describe "read pages" do
    let(:page) { create(:page) }

    it "should show a page" do
      get page_path(page)
      expect(response).to have_http_status :ok
    end

    it "should show the page index" do
      get pages_path
      expect(response).to have_http_status :ok
    end
  end

end