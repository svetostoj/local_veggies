class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.integer :order_id
      t.integer :buyer_id
      t.integer :product_id
      t.string :product
      t.integer :seller_id
      t.decimal :unit_weight
      t.string :unit
      t.decimal :unit_price
      t.decimal :qty
      t.decimal :amount
      t.decimal :total_weight
      t.text :notes

      t.timestamps
    end
  end
end
