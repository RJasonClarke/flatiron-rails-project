class Movie < ApplicationRecord
    belongs_to :list
    belongs_to :user
    has_many :users, through: :lists
end
