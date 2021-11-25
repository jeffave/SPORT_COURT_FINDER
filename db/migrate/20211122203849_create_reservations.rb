class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, null: false, foreign_key: true
      t.references :court, null: false, foreign_key: true
      t.boolean :accepted
      t.timestamps
    end
  end
end
