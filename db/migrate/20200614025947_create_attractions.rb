class CreateAttractions < ActiveRecord::Migration[6.0]
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :min_height

      t.timestamps
    end
  end
end
