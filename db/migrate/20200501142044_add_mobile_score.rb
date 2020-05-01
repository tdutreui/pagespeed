class AddMobileScore < ActiveRecord::Migration[6.0]
  def change
    add_column :lighthouse_reports, :score_mobile, :integer
    rename_column :lighthouse_reports, :score, :score_desktop
  end
end
