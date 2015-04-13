class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :course_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.string :photo
      t.string :outside_links, null: false

      t.timestamps
    end
    add_index :lessons, :title, unique: true
  end
end

