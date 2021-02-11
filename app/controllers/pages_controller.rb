class PagesController < ApplicationController
  before_action :set_page, only: [:show, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @current_page='page'
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  def analyse
    @page = Page.new(page_params)
    @page.project = current_project
    @page.set_valid_url

    existing_page = Page.find_by(project_id: @page.project_id, valid_url: @page.valid_url)
    if existing_page
      existing_page.add_lighthouse_report
      respond_to do |format|
        format.html { redirect_to existing_page }
        format.json { render :show, status: :ok, location: @page }
      end
    else
      respond_to do |format|
        if @page.save
          format.html { redirect_to @page, notice: 'Page was successfully created.' }
          format.json { render :show, status: :created, location: @page }
        else
          format.html { render :home }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    if current_user && @page.user == current_user
      respond_to do |format|
        if @page.update(page_params)
          format.json { render :show, status: :ok, location: @page }
        else
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    else
      render json: { code: 'LOGGED_OUT' }, status: :unprocessable_entity
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def page_params
    params.require(:page).permit(:url,:daily_run, :weekly_run, :send_drop_alert_email)
  end
end
