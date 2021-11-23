class ChangeAvailabilityColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :courts, :availability, 'boolean USING CAST(availability AS boolean)'
  end
end
