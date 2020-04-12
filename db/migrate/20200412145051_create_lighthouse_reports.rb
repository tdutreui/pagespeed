class CreateLighthouseReports < ActiveRecord::Migration[6.0]
  def change
    create_table :lighthouse_reports do |t|
      t.text :json_report
      t.string :url
      t.timestamps
    end
  end
end
