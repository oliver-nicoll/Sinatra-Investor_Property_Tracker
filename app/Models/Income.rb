class Income < ActiveRecord::Base
    has_many :rentals
    belongs_to :investor
end