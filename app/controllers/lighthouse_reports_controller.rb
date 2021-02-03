class LighthouseReportsController < ApplicationController
  before_action :set_report, only: [:show]

  # GET /pages/1
  # GET /pages/1.json
  def show
    @current_page='report'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = LighthouseReport.find(params[:id])
    @page=@report.page
  end

end
