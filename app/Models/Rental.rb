class Rental < ActiveRecord::Base
    belongs_to :investor
    belongs_to :income
end