class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :courseid
      t.text :message
      t.integer :year
      t.integer :typos, :default => 0
      t.integer :goods, :default => 0
      t.integer :bads, :default => 0
      t.integer :usersid

      t.timestamps null: false
    end
  end
end
