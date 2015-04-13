class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :description, null: false
    end
  end
end
