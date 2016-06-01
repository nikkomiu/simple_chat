class CreateTeamFolders < ActiveRecord::Migration[5.0]
  def change
    create_table :team_folders do |t|
      t.string :name
      t.references :parent, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
