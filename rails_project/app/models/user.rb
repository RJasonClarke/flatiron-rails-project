class User < ApplicationRecord
    validates :email, presence: true

    has_many :lists
    has_many :movies, through: :lists
end
