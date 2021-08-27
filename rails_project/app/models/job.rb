class Job < ApplicationRecord
    belongs_to :user, optional: true
    has_many :tools
    has_many :users, through: :tools

    validates :title, presence: true
    
    scope :alpha, -> {order('LOWER(title)')}
end
