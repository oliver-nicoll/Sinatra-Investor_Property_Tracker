class Investor < ActiveRecord::Base
    has_many :rentals
    has_many :incomes, through: :rentals

    validates :name, presence: true
end