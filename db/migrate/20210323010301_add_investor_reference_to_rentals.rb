class AddInvestorReferenceToRentals < ActiveRecord::Migration[6.1]
  def change
    add_reference :rentals, :investor, foreign_key: true
  end
end
