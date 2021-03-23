class User < ActiveRecord::Base
    has_secure_password

    has_many :rentals

    validates :name, presence: true
end