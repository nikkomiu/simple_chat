class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name, unique: true
      t.text :description

      t.references :team, foreign_key: true
      t.references :folder, foreign_key: true

      t.timestamps
    end
  end
end
