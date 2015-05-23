class CreateLexiconLessons < ActiveRecord::Migration
  def change
    create_table :lexicon_lessons do |t|
    t.integer :lexicon_id, null: false
    t.text :body, null: false
    end
  end
end
