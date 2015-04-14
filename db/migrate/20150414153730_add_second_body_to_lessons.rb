class AddSecondBodyToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :second_body, :text
  end
end
