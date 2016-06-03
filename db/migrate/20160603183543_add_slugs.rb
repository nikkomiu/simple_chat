class AddSlugs < ActiveRecord::Migration[5.0]
  def change
    add_column :folders, :path, :string
    add_column :teams, :path, :string
    add_column :rooms, :path, :string
  end
end
