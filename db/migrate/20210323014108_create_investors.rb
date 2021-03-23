class CreateInvestors < ActiveRecord::Migration[6.1]
  def change
    create_table :investors do |t|
      t.string :name
      t.integer :buildings_owned
    end
  end
end
