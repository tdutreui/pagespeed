require 'test_helper'

class LighthouseReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lighthouse_report = lighthouse_reports(:one)
  end

  test "should get index" do
    get lighthouse_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_lighthouse_report_url
    assert_response :success
  end

  test "should create lighthouse_report" do
    assert_difference('LighthouseReport.count') do
      post lighthouse_reports_url, params: { lighthouse_report: { create: @lighthouse_report.create, destroy: @lighthouse_report.destroy, index: @lighthouse_report.index, new: @lighthouse_report.new, show: @lighthouse_report.show } }
    end

    assert_redirected_to lighthouse_report_url(LighthouseReport.last)
  end

  test "should show lighthouse_report" do
    get lighthouse_report_url(@lighthouse_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_lighthouse_report_url(@lighthouse_report)
    assert_response :success
  end

  test "should update lighthouse_report" do
    patch lighthouse_report_url(@lighthouse_report), params: { lighthouse_report: { create: @lighthouse_report.create, destroy: @lighthouse_report.destroy, index: @lighthouse_report.index, new: @lighthouse_report.new, show: @lighthouse_report.show } }
    assert_redirected_to lighthouse_report_url(@lighthouse_report)
  end

  test "should destroy lighthouse_report" do
    assert_difference('LighthouseReport.count', -1) do
      delete lighthouse_report_url(@lighthouse_report)
    end

    assert_redirected_to lighthouse_reports_url
  end
end
