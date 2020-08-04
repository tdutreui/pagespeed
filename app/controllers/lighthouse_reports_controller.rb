class LighthouseReportsController < ApplicationController
  before_action :set_lighthouse_report, only: [:show, :destroy,:detail]

  # GET /lighthouse_reports
  # GET /lighthouse_reports.json
  def index
    @lighthouse_reports = LighthouseReport.where(user: current_user)
  end

  def detail
    @detail=@lighthouse_report.report(params[:strategy])['lighthouseResult'].to_json.html_safe
  end

  # GET /lighthouse_reports/1
  # GET /lighthouse_reports/1.json
  def show
  end

  # GET /lighthouse_reports/new
  def new
    @lighthouse_report = LighthouseReport.new
  end


  # POST /lighthouse_reports
  # POST /lighthouse_reports.json
  def create
    @lighthouse_report = LighthouseReport.new(lighthouse_report_params)
    @lighthouse_report.user=current_user

    respond_to do |format|
      if @lighthouse_report.save
        format.html { redirect_to @lighthouse_report, notice: 'Lighthouse report was successfully created.' }
        format.json { render :show, status: :created, location: @lighthouse_report }
      else
        format.html { render :new }
        format.json { render json: @lighthouse_report.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /lighthouse_reports/1
  # DELETE /lighthouse_reports/1.json
  def destroy
    @lighthouse_report.destroy
    respond_to do |format|
      format.html { redirect_to lighthouse_reports_url, notice: 'Lighthouse report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lighthouse_report
      @lighthouse_report = LighthouseReport.find(params[:id] || params[:lighthouse_report_id])
    end

    # Only allow a list of trusted parameters through.
    def lighthouse_report_params
      params.require(:lighthouse_report).permit(:url)
    end
end
