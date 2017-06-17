class AddLikedbyCourses < ActiveRecord::Migration
  def change
    add_column :courses, :likedby, :text
    add_column :users, :comnotfy, :boolean, default: false
  end
end
