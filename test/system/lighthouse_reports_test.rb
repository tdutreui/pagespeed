require "application_system_test_case"

class LighthouseReportsTest < ApplicationSystemTestCase
  setup do
    @lighthouse_report = lighthouse_reports(:one)
  end

  test "visiting the index" do
    visit lighthouse_reports_url
    assert_selector "h1", text: "Lighthouse Reports"
  end

  test "creating a Lighthouse report" do
    visit lighthouse_reports_url
    click_on "New Lighthouse Report"

    fill_in "Create", with: @lighthouse_report.create
    fill_in "Destroy", with: @lighthouse_report.destroy
    fill_in "Index", with: @lighthouse_report.index
    fill_in "New", with: @lighthouse_report.new
    fill_in "Show", with: @lighthouse_report.show
    click_on "Create Lighthouse report"

    assert_text "Lighthouse report was successfully created"
    click_on "Back"
  end

  test "updating a Lighthouse report" do
    visit lighthouse_reports_url
    click_on "Edit", match: :first

    fill_in "Create", with: @lighthouse_report.create
    fill_in "Destroy", with: @lighthouse_report.destroy
    fill_in "Index", with: @lighthouse_report.index
    fill_in "New", with: @lighthouse_report.new
    fill_in "Show", with: @lighthouse_report.show
    click_on "Update Lighthouse report"

    assert_text "Lighthouse report was successfully updated"
    click_on "Back"
  end

  test "destroying a Lighthouse report" do
    visit lighthouse_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lighthouse report was successfully destroyed"
  end
end
