class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.float :longitude
      t.float :latitude
      t.string :street_address
      t.string :city
      t.string :postcode
      t.string :state
      t.string :country_code
      t.integer :address_type

      t.timestamps
    end
  end
end
