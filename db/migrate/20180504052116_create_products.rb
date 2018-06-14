class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.string :product_type
      t.string :description
      t.decimal :unit_weight
      t.string :unit
      t.decimal :unit_price
      t.decimal :qty_stock
      t.decimal :qty_available
      t.text :image_data
      t.integer :product_type_id

      t.timestamps
    end
  end
end
