class AddTimeToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :time, :string
  end
end
