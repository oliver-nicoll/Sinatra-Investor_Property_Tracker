class CreateRentals < ActiveRecord::Migration[6.1]
  def change
    create_table :rentals do |t|
      t.string :property_type
      t.string :address
      t.string :bedrooms
      t.string :bathrooms
      t.string :lease_length
      t.integer :monthly_rent
      t.boolean :second_floor
      t.boolean :pets_allowed
      t.string :availability
      t.timestamps null: false
    end
  end
end
