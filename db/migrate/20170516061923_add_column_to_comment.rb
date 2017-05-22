class AddColumnToComment < ActiveRecord::Migration
  def change
    add_column :comments, :bycommented, :integer, default: 0
  end
end
