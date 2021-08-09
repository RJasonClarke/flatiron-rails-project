class Job < ApplicationRecord
    belongs_to :user
    has_many :job_tools
    has_many :tools, through: :job_tools
end
