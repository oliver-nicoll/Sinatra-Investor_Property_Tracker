class CreateIncome < ActiveRecord::Migration[6.1]
  def change
    create_table :incomes do |t|
      t.integer :yearly_income
    end
  end
end
