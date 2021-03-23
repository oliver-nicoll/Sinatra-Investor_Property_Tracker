class CreateIncome < ActiveRecord::Migration[6.1]
  def change
    create_table :income do |t|
      t.integer :yearly_income
    end
  end
end