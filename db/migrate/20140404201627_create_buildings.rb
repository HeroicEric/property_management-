class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.integer :owner_id
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :postal_code, null: false
      t.string :description

      t.timestamps
    end
    add_index :buildings, :owner_id
  end
end
