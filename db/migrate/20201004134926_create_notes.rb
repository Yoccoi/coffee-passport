class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :name, null: false
      t.float :rating, null: false
      t.text :comment
      t.float :bitter
      t.float :acidity
      t.float :aroma
      t.float :body
      t.date :roast_date
      t.integer :grams
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
