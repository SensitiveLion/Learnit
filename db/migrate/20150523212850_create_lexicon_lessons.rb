class CreateLexiconLessons < ActiveRecord::Migration
  def change
    create_table :lexicon_lessons do |t|
      t.text :body, null: false
    end
  end
end
