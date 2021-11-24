class ChangeColumnDate < ActiveRecord::Migration[6.0]
  def change
    change_column :reservations, :date, "date USING date::date"
  end
end
