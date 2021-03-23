class AddUserReferencesToRentals < ActiveRecord::Migration[6.1]
  def change
    add_reference :rentals, :user
  end
end
