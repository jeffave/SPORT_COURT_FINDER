class CreateCourts < ActiveRecord::Migration[6.0]
  def change
    create_table :courts do |t|
      t.string :name
      t.string :location
      t.string :availability
      t.float :pricing
      t.integer :capacity
      t.references :user, null: false, foreign_key: true
      t.timestamps

    end
  end
end
