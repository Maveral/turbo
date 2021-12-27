class CreateRiders < ActiveRecord::Migration[6.1]
  def change
    create_table :riders do |t|
      t.string :name
      t.string :surename
      t.datetime :age

      t.timestamps
    end
  end
end
