class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :url
      t.string :valid_url
      t.references :project, null: true, foreign_key: true

      t.timestamps
    end
  end
end
