class AddUsersToLighthouseReports < ActiveRecord::Migration[6.0]
  def change
    add_reference :lighthouse_reports, :user, foreign_key: true, index: true
  end
end
