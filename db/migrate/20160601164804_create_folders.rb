class CreateFolders < ActiveRecord::Migration[5.0]
  def change
    create_table :folders do |t|
      t.string :name
      t.references :parent, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end

    add_index :folders, [:name, :parent_id], unique: true
  end
end
