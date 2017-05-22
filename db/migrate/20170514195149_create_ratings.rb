class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :courseid , :default => 0
      t.integer :vote , :default => 0
      t.integer :teacher , :default => 0
      t.integer :courserate , :default => 0
      t.integer :easy , :default => 0
      t.integer :attendance , :default => 0
      t.integer :homework , :default => 0
      t.integer :credit , :default => 0
      t.integer :taker , :default => 0

      t.timestamps null: false
    end
  end
end
