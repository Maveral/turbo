class AddLikesCountToRiders < ActiveRecord::Migration[6.1]
  def change
    add_column :riders, :likes_count, :integer, default: 0
  end
end
