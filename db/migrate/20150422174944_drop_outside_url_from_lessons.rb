class DropOutsideUrlFromLessons < ActiveRecord::Migration
  def up
    remove_column :lessons, :outside_links
  end

  def down
    add_column :lessons, :outside_links, :string
  end
end
