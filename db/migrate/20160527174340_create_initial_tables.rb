class CreateInitialTables < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name, unique: true
      t.text :description

      t.timestamps
    end

    create_table :messages do |t|
      t.text :body
      t.references :room, foreign_key: true

      t.timestamps
    end

    create_table :teams do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    create_table :folders do |t|
      t.string :name
      t.references :parent, index: true
      t.references :team, foreign_key: true

      t.timestamps
    end

    add_reference :rooms, :team, foreign_key: true
    add_reference :rooms, :folder, foreign_key: true

    add_index :folders, [:name, :parent_id], unique: true
  end
end
