class AddAddressToCourt < ActiveRecord::Migration[6.0]
  def change
    add_column :courts, :address, :string
  end
end
