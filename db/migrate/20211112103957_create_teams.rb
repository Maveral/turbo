class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.integer :rider_id
      t.integer :club_id

      t.timestamps
    end
  end
end
