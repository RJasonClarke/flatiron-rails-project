class User < ApplicationRecord
    validates :email, presence: true
    validates :password_digest, presence: true

    has_many :lists
    has_many :movies, through: :lists
end
