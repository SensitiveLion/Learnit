class CreateLexicons < ActiveRecord::Migration
  def change
    create_table :lexicons do |t|
      t.string :title, null: false
    end
  end
end
