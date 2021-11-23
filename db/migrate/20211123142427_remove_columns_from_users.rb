class RemoveColumnsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :last_name
    remove_column :users, :gender
    remove_column :users, :birthday
    remove_column :users, :phone
    remove_column :users, :languages
  end
end
