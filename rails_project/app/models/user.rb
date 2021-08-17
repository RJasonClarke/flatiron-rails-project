class User < ApplicationRecord
    has_secure_password
    has_many :jobs

    validates :email, presence: true
    validates :password, presence: true
end
