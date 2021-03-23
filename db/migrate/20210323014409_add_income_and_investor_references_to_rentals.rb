class AddIncomeAndInvestorReferencesToRentals < ActiveRecord::Migration[6.1]
  def change
    add_reference :rentals, :investor, foreign_key: true
    add_reference :rentals, :income, foreign_key: true
  end
end
