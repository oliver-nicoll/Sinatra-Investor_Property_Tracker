class Investor < ActiveRecord::Base
    has_many :rentals
end