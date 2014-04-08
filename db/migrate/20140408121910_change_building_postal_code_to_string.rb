class ChangeBuildingPostalCodeToString < ActiveRecord::Migration
  def up
    change_column :buildings, :postal_code, :string, null: false
  end

  def down
    change_column :buildings, :postal_code, :integer, null: false
  end
end
