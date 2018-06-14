class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :fullname_company
      t.text :image_data
      t.text :short_bio
      t.string :mobile
      t.string :account_number

      t.timestamps
    end
  end
end
