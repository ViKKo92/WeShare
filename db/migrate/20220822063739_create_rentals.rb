class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.date :start_date
      t.date :end_date
      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status_active, default: false

      t.timestamps
    end
  end
end
