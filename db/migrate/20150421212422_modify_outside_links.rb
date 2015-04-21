class ModifyOutsideLinks < ActiveRecord::Migration
  def up
    change_column :lessons, :outside_links, :string, null: :true
  end

  def down
    change_column :lessons, :outside_links, :string, null: :false
  end
end
