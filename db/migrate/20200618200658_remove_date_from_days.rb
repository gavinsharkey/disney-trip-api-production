class RemoveDateFromDays < ActiveRecord::Migration[6.0]
  def change
    remove_column :days, :date
  end
end
