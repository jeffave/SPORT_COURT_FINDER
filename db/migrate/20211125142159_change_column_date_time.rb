class ChangeColumnDateTime < ActiveRecord::Migration[6.0]
  def change
    change_column :reservations, :date, :datetime
    change_column :reservations, :end_date, :datetime
  end
end
