class AddPageReferenceToLighthouseReports < ActiveRecord::Migration[6.0]
  def change
    add_reference :lighthouse_reports, :page, foreign_key: true, nil: false
    remove_column :lighthouse_reports, :url, :string
    remove_column :lighthouse_reports, :valid_url, :string
    remove_reference :lighthouse_reports, :user
  end
end
