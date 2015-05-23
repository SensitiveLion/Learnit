class CreateLearnipedias < ActiveRecord::Migration
  def change
    create_table :learnipedias do |t|
      t.string :name, null: false
    end
  end
end
