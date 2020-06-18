class AddResortToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_reference :restaurants, :resort
  end
end
