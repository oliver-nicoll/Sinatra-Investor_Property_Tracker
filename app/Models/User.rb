class User < ActiveRecord::Base
    has_secure_password

    has_many :rentals, dependent: :destroy

    validates :email, uniqueness: true
    
end