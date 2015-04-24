class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name, null: false
    end
  end
end
