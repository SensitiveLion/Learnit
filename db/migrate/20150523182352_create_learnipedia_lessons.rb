class CreateLearnipediaLessons < ActiveRecord::Migration
  def change
    create_table :learnipedia_lessons do |t|
      t.integer :learnipedia_id, null: false
      t.text :body, null: false
    end
  end
end
