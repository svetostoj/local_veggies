class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :seller_id
      t.string :seller
      t.date :order_date
      t.decimal :amount
      t.string :pickup_address
      t.float :latitude_pickup
      t.float :longitude_pickup
      t.string :delivery_address
      t.float :latitude_delivery
      t.float :longitude_delivery
      t.text :notes
      t.integer :status

      t.timestamps
    end
  end
end
