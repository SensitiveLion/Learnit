class DropSecondBodyFromLessons < ActiveRecord::Migration
  def up
    remove_column :lessons, :second_body
  end

  def down
    add_column :lessons, :second_body, :text
  end
end
