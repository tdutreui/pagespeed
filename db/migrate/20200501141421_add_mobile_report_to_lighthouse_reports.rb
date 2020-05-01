class AddMobileReportToLighthouseReports < ActiveRecord::Migration[6.0]
  def change
    rename_column :lighthouse_reports, :json_report, :json_report_desktop
    add_column :lighthouse_reports, :json_report_mobile, :text
  end
end
