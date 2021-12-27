class CreateMechanics < ActiveRecord::Migration[6.1]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.string :surname
      t.date :age
      t.integer :experience

      t.timestamps
    end
  end
end
