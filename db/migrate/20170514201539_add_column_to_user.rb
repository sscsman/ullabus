class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :createdclass, :text
    add_column :users, :ratedclass, :text
    add_column :users, :votedclass, :text
    add_column :users, :commentedclass, :text
    add_column :users, :commentedid, :text
    add_column :users, :votedcomid, :text    

  end
end
