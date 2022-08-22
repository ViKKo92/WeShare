class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :item_score
      t.text :item_comment
      t.references :rental, null: false, foreign_key: true

      t.timestamps
    end
  end
end
