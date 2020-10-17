class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :shop_name, null: false
      t.date :purchase_date
      t.text :location
      t.references :note, null: false, foreign_key: true
      t.timestamps
    end
  end
end
