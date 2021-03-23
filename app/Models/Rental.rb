class Rental < ActiveRecord::Base
    belongs_to :investor
    
    belongs_to :user

    validates :address, presence: true
end