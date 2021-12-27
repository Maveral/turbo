class AddRiderIdToMechanics < ActiveRecord::Migration[6.1]
  def change
    add_column :mechanics, :rider_id, :integer
    add_index :mechanics, :rider_id
  end
end
