class RemoveBirthdayGenderFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :phone
    remove_column :users, :languages
  end
end
