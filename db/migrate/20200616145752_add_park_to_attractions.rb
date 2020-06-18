class AddParkToAttractions < ActiveRecord::Migration[6.0]
  def change
    add_reference :attractions, :park
  end
end
