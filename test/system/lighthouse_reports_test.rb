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

    click_on "Create Lighthouse report"

    assert_text "Lighthouse report was successfully created"
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
