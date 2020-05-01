class AddValidUrlToLighthouseReports < ActiveRecord::Migration[6.0]
  def change
    add_column :lighthouse_reports, :valid_url, :string
  end
end
