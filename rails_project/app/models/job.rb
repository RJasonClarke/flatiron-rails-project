class Job < ApplicationRecord
    belongs_to :user
    has_many :tools
    has_many :job_tools, through: :tools

    validates :title, presence: true
    
    scope :alpha, -> {order('LOWER(title)')}
end
