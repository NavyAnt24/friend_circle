class CreateFCircles < ActiveRecord::Migration
  def change
    create_table :f_circles do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end

    add_index :f_circles, :user_id
  end
end
