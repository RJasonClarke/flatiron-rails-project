class User < ApplicationRecord
    has_many :lists
    has_many :movies, through: :lists
end
