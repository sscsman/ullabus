class AddColumnToUser2 < ActiveRecord::Migration
  def change
    add_column :users, :likedclass, :text
    add_column :users, :bycommented, :text
    add_column :courses, :pv, :integer, default: 0
  end
end
