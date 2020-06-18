class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :day
      t.references :reservable, polymorphic: true

      t.timestamps
    end
  end
end
