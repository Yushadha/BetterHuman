class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :description
      t.integer :ranking

      t.timestamps null: false
    end
  end
end
