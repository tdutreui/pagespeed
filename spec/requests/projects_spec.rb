require 'rails_helper'

RSpec.describe "Projects", type: :request do
  let(:user) {create(:user_with_project)}
  let(:project) {user.projects.first}

  before do
    stub_pagespeed_api_client
    create(:page, project: project)
  end



  describe "access restriction" do
    context "logged out" do
      it "should not allow : index" do
        get projects_path
        expect(response).to have_http_status :redirect
      end
      it "should not allow : new" do
        get new_project_path
        expect(response).to have_http_status :redirect
      end
      it "should not allow : create" do
        post projects_path, params: { project: { name: 'test' } }
        expect(response).to have_http_status :redirect
      end
      it "should not allow : show" do
        get project_path(project)
        expect(response).to have_http_status :redirect
      end
      it "should not allow : edit" do
        get edit_project_path(project)
        expect(response).to have_http_status :redirect
      end
      it "should not allow : update" do
        patch project_path(project), params: { project: { name: 'test' } }
        expect(response).to have_http_status :redirect
      end
    end

    context "logged in" do
      before do
        sign_in user
      end
      it "should allow : index" do
        get projects_path
        expect(response).to have_http_status(200)
      end
      it "should allow : new" do
        get new_project_path
        expect(response).to have_http_status(200)
      end
      it "should allow : create" do
        post projects_path, params: { project: { name: 'test' } }
        expect(response).to redirect_to(Project.last)
      end
      it "should allow : show" do
        get project_path(project)
        expect(response).to have_http_status(200)
      end
      it "should allow : edit" do
        get edit_project_path(project)
        expect(response).to have_http_status(200)
      end
      it "should allow : update" do
        patch project_path(project), params: { project: { name: 'test' } }
        expect(response).to redirect_to(project)
      end
    end
  end

end
