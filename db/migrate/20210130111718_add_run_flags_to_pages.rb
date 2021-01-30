class AddRunFlagsToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :daily_run, :boolean
    add_column :pages, :weekly_run, :boolean
    add_column :pages, :send_drop_alert_email, :boolean
  end
end
