class AddTripToDays < ActiveRecord::Migration[6.0]
  def change
    add_reference :days, :trip
  end
end
