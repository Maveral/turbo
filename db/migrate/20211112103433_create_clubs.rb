class CreateClubs < ActiveRecord::Migration[6.1]
  def change
    create_table :clubs do |t|
      t.string :name
      t.date :founded
      t.string :address

      t.timestamps
    end
  end
end
